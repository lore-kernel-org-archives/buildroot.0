From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 16:53:27 +0100
Subject: [Buildroot] [PATCH 2/3] Restore cgiFormFileGetTempfileName and
 make creation permissions more secure
In-Reply-To: <1421953904-9156-2-git-send-email-codehero@gmail.com>
References: <20150117192144.GA2827@tarshish>
 <1421953904-9156-1-git-send-email-codehero@gmail.com>
 <1421953904-9156-2-git-send-email-codehero@gmail.com>
Message-ID: <20150125155327.GC3937@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2015-01-22 14:11 -0500, David Bender spake thusly:
> 
> Signed-off-by: David Bender <codehero@gmail.com>
> ---
>  package/cgic/cgic-0001-file_enhancements.patch |   81 ++++++++++++++++++++++++
>  1 files changed, 81 insertions(+), 0 deletions(-)
>  create mode 100644 package/cgic/cgic-0001-file_enhancements.patch
> 
> diff --git a/package/cgic/cgic-0001-file_enhancements.patch b/package/cgic/cgic-0001-file_enhancements.patch

While fixing the eye-candy in this new cgic package, I stumbled on this
patch you are adding.

First and foremost, you forgot to add a dewscription for this patch, and
you SoB-line.

Without a description, it is not easy to see what this patch does. After
some digging around, I realised it does two things:
  - fix the creation of temporary files (good)
  - adds a new feature (bad)

Thus, it should have been two separate patches.

cgiFormFileGetTempfileName() is a function that is not called anywhere
in the cgic code, and so I conclude it is only exported as an entrypoint
in the generated library. This is thus a new feature.

We usually refuse to cary feature-patches in Buildroot, unles there is a
very good reason to do so. Since you mention that this is "restoring"
it, do you mean it was present in a previous version and got dropped,
and legacy code might use that function? In this case, it might be OK to
re-add it...

Anyway, I've split this in two.

Regards,
Yann E. MORIN.

> new file mode 100644
> index 0000000..f09a73f
> --- /dev/null
> +++ b/package/cgic/cgic-0001-file_enhancements.patch
> @@ -0,0 +1,81 @@
> +diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
> +--- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
> ++++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
> +@@ -22,6 +22,8 @@
> + #define CGICDEBUGEND
> + #endif /* CGICDEBUG */
> + 
> ++#define _GNU_SOURCE
> ++
> + #include <stdio.h>
> + #include <string.h>
> + #include <ctype.h>
> +@@ -34,11 +36,11 @@
> + #include <io.h>
> + 
> + /* cgic 2.01 */
> +-#include <fcntl.h>
> + 
> + #else
> + #include <unistd.h>
> + #endif /* WIN32 */
> ++#include <fcntl.h>
> + #include "cgic.h"
> + 
> + #define cgiStrEq(a, b) (!strcmp((a), (b)))
> +@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
> + 		window between the file's creation and the
> + 		chmod call (glibc 2.0.6 and lower might
> + 		otherwise have allowed this). */
> ++	mode_t umode;
> + 	int outfd; 
> ++	umode = umask(0600);
> + 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
> +-	outfd = mkstemp(tfileName);
> ++	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
> ++	umask(umode);
> + 	if (outfd == -1) {
> + 		return cgiParseIO;
> + 	}
> +-	close(outfd);
> +-	/* Fix the permissions */
> +-	if (chmod(tfileName, 0600) != 0) {
> +-		unlink(tfileName);
> ++
> ++	if (close(outfd)) {
> + 		return cgiParseIO;
> + 	}
> + #else
> +@@ -1275,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
> + 	}
> + }
> + 
> ++const char* cgiFormFileGetTempfileName(
> ++	char* name)
> ++{
> ++	cgiFormEntry *e;
> ++	e = cgiFormEntryFindFirst(name);
> ++	if (!e) {
> ++		return NULL;
> ++	} else if (!strlen(e->tfileName)) {
> ++		return NULL;
> ++	} else {
> ++		return e->tfileName;
> ++	}
> ++}
> ++
> + cgiFormResultType cgiFormFileSize(
> + 	char *name, int *sizeP)
> + {
> +diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
> +--- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
> ++++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
> +@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
> + 	char *name, char **valuesText, int valuesTotal, 
> + 	int *result, int defaultV);	
> + 
> ++extern const char* cgiFormFileGetTempfileName(char* name);
> ++
> + /* The paths returned by this function are the original names of files
> + 	as reported by the uploading web browser and shoult NOT be
> + 	blindly assumed to be "safe" names for server-side use! */
> -- 
> 1.7.8.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
