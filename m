From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Sep 2015 00:00:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: fix musl
 compilation issue
In-Reply-To: <1441203317-10180-1-git-send-email-brendanheading@gmail.com>
References: <1441203317-10180-1-git-send-email-brendanheading@gmail.com>
Message-ID: <55E77193.3060202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-09-15 16:15, Brendan Heading wrote:
> http://autobuild.buildroot.net/results/4e4/4e4cea0234e6abf5882296abd5ceeda6ccab89b0/
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> 
> ---
> Note, this is a small patch against a three year old version of the
> upstream package - the upstream is being actively maintained but it looks
> like a bit of effort to move to the latest version at this stage.

 The current version is in bluez5_utils. It had to be a separate package because
the API has changed from bluez4 to bluez5, so it must be possible to select one
or the other. So this comment is not really relevant. The bluez5_utils package
builds fine under musl BTW.

 Of course, because bluez4 predates musl, there is really no reason to try to
build bluez4 with musl, so an equally acceptable option would be to make it
depend on !MUSL. However, I think the patch is sufficiently light to be
acceptable. IMHO, the argument "we prefer not to carry patches that will not
make it into upstream" doesn't apply for frozen packages, because then there is
no maintainance effort for the patches (since there is no version bumping).

 Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (with MUSL and uClibc toolchain)

 Regards,
 Arnout


> ---
>  .../0003-fix-compilation-issues-with-musl.patch    | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
> 
> diff --git a/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch b/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
> new file mode 100644
> index 0000000..d8b48ea
> --- /dev/null
> +++ b/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
> @@ -0,0 +1,61 @@
> +From 8aa6aa4ba2d9d00c91e36e146895af20cbc00d17 Mon Sep 17 00:00:00 2001
> +From: Brendan Heading <brendanheading@gmail.com>
> +Date: Wed, 2 Sep 2015 12:10:58 +0100
> +Subject: [PATCH 1/1] fix compilation issues with musl.
> +
> +- sys/time.h needed for struct timeval
> +- unistd.h should not be included due to clash with encrypt(3)
> +- sys/types.h needed for mode_t
> +
> +Note that this version of bluez is 3 years old. Recent fixes have gone
> +into the upstream to address musl compatibility issues, but the upstream
> +has changed so much that it makes little sense to try to backport these.
> +This patch is really a stopgap until we move to the latest upstream.
> +
> +Upstream-Status: not needed
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +---
> + compat/bnep.c  | 1 +
> + compat/dund.c  | 1 -
> + src/textfile.h | 1 +
> + 3 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/compat/bnep.c b/compat/bnep.c
> +index 281350b..49226c1 100644
> +--- a/compat/bnep.c
> ++++ b/compat/bnep.c
> +@@ -32,6 +32,7 @@
> + #include <stdlib.h>
> + #include <sys/socket.h>
> + #include <sys/ioctl.h>
> ++#include <sys/time.h>
> + 
> + #include <bluetooth/bluetooth.h>
> + #include <bluetooth/bnep.h>
> +diff --git a/compat/dund.c b/compat/dund.c
> +index af1b536..c2f085f 100644
> +--- a/compat/dund.c
> ++++ b/compat/dund.c
> +@@ -29,7 +29,6 @@
> + #include <stdio.h>
> + #include <errno.h>
> + #include <fcntl.h>
> +-#include <unistd.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <syslog.h>
> +diff --git a/src/textfile.h b/src/textfile.h
> +index dc5fc2b..0148b30 100644
> +--- a/src/textfile.h
> ++++ b/src/textfile.h
> +@@ -24,6 +24,7 @@
> + #ifndef __TEXTFILE_H
> + #define __TEXTFILE_H
> + 
> ++#include <sys/types.h>
> + int create_dirs(const char *filename, const mode_t mode);
> + int create_file(const char *filename, const mode_t mode);
> + int create_name(char *buf, size_t size, const char *path,
> +-- 
> +2.4.3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
