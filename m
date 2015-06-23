From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Jun 2015 09:48:26 +0200
Subject: [Buildroot] [PATCH 1/1] pinentry: add patch to fix ncursesw
 include path
In-Reply-To: <1434961679-15594-1-git-send-email-imrehg@gmail.com>
References: <1434961679-15594-1-git-send-email-imrehg@gmail.com>
Message-ID: <55890F4A.8050902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 10:28, Gergely Imreh wrote:
> Upstream pinentry seems to assume a fixed include path for ncursesw,
> while still using pkg-config to check what that path should be.
> This results in detecting the library during config failing to include
> it correctly during build.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/d8d/d8d33efd16cc94dc9d9d4b2d7615a0abb5752ee4/
>   http://autobuild.buildroot.org/results/c48/c4805785077e955c61f246d0e4d8416d8dbd10b1/
>   http://autobuild.buildroot.org/results/144/14483d35ab5009e854c7ce86e26942fdefd5c1f0
> and bunch of others.
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Please also submit the patch upstream, so hopefully we can drop the patch in
the future. Or they may have an explanation why they need this, in which case it
may be necessary to modify the patch.


 Regards,
 Arnout

> ---
> Feedback's very welcome, as I haven't had a patch yet, that itself
> includes a patch. Modeled this on some other commits/patches I've
> found here.
> ---
>  ...1-remove-hard-wired-ncursesw-include-path.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
> 
> diff --git a/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch b/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
> new file mode 100644
> index 0000000..c9903c4
> --- /dev/null
> +++ b/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
> @@ -0,0 +1,32 @@
> +From cf84bf3ef505059d42184b22cf38f89336bec43d Mon Sep 17 00:00:00 2001
> +From: Gergely Imreh <imrehg@gmail.com>
> +Date: Mon, 22 Jun 2015 07:51:17 +0000
> +Subject: [PATCH 1/1] remove hard-wired ncursesw include path
> +
> +Don't assume that the ncursesw headers are in ../usr/include/ncursesw/..,
> +and pkg-config finds the correct include path anyways.
> +
> +Signed-off-by: Gergely Imreh <imrehg@gmail.com>
> +---
> + pinentry/pinentry-curses.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/pinentry/pinentry-curses.c b/pinentry/pinentry-curses.c
> +index 235435a..bdcd0f4 100644
> +--- a/pinentry/pinentry-curses.c
> ++++ b/pinentry/pinentry-curses.c
> +@@ -22,11 +22,7 @@
> + #include <config.h>
> + #endif
> + #include <assert.h>
> +-#ifdef HAVE_NCURSESW
> +-#include <ncursesw/curses.h>
> +-#else
> + #include <curses.h>
> +-#endif
> + #include <signal.h>
> + #include <fcntl.h>
> + #include <unistd.h>
> +-- 
> +1.9.1
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
