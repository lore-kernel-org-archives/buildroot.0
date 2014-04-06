From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Apr 2014 14:15:45 +0200
Subject: [Buildroot] [PATCH] eudev: Drop patch
 eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13
In-Reply-To: <1396705135-4669-1-git-send-email-pmeerw@pmeerw.net>
References: <1396705135-4669-1-git-send-email-pmeerw@pmeerw.net>
Message-ID: <20140406121545.GA3136@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-04-05 15:38 +0200, Peter Meerwald spake thusly:
> added by commit 221fd0cd, which basically removes #include <fcntl.h> from a
> couple of files; it leads to
> 
>   CC       accelerometer.o
> accelerometer.c: In function ?test_orientation?:
> accelerometer.c:203:9: warning: implicit declaration of function ?open?
> [-Wimplicit-function-declaration]
>          fd = open(devpath, O_RDONLY|O_CLOEXEC);
>          ^
> accelerometer.c:203:28: error: ?O_RDONLY? undeclared (first use in this function)
>          fd = open(devpath, O_RDONLY|O_CLOEXEC);
>                             ^
> accelerometer.c:203:37: error: ?O_CLOEXEC? undeclared (first use
> in this function)
> 
> the prototype for open() is supposed to be in fnctl.h, hence the #include is
> needed

I can confirm this fixes the issue whith my glibc-based toolchain, for
an ARM platform.

I'll build up a uClibc-based system shortly to see if it is also working
on uClibc. Until then, I'm not adding an official tested-by tag.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...e-87-fails-to-build-on-linux-headers-3.13.patch | 85 ----------------------
>  1 file changed, 85 deletions(-)
>  delete mode 100644 package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
> 
> diff --git a/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch b/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
> deleted file mode 100644
> index 80f7aa8..0000000
> --- a/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From c5a77c7d10bafac25deca8e3c36946df0dc43071 Mon Sep 17 00:00:00 2001
> -From: "Anthony G. Basile" <blueness@gentoo.org>
> -Date: Sat, 15 Mar 2014 08:16:41 -0400
> -Subject: [PATCH] Fix issue #87: fails to build on linux headers 3.13
> -
> -Commit 80b10107cb added #include <linux/fcntl.h> in
> -src/accelerometer and friends for builds on uclibc.
> -This only works with glibc and musl systems with
> -linux headers 3.9 but fails with linux headers 3.13.
> -
> -We keep <linux/fcntl.h> but drop <fcntl.h>.
> -
> -Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> -Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
> ----
> - src/accelerometer/accelerometer.c |    1 -
> - src/ata_id/ata_id.c               |    1 -
> - src/collect/collect.c             |    1 -
> - src/mtd_probe/mtd_probe.c         |    1 -
> - src/scsi_id/scsi_serial.c         |    1 -
> - 5 files changed, 5 deletions(-)
> -
> -diff --git a/src/accelerometer/accelerometer.c b/src/accelerometer/accelerometer.c
> -index f65631a..386775b 100644
> ---- a/src/accelerometer/accelerometer.c
> -+++ b/src/accelerometer/accelerometer.c
> -@@ -50,7 +50,6 @@
> - #include <math.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> --#include <fcntl.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> - #include <getopt.h>
> -diff --git a/src/ata_id/ata_id.c b/src/ata_id/ata_id.c
> -index a25c713..500669c 100644
> ---- a/src/ata_id/ata_id.c
> -+++ b/src/ata_id/ata_id.c
> -@@ -23,7 +23,6 @@
> - #include <stdlib.h>
> - #include <stdint.h>
> - #include <unistd.h>
> --#include <fcntl.h>
> - #include <ctype.h>
> - #include <string.h>
> - #include <errno.h>
> -diff --git a/src/collect/collect.c b/src/collect/collect.c
> -index fbaf87f..7fefc62 100644
> ---- a/src/collect/collect.c
> -+++ b/src/collect/collect.c
> -@@ -24,7 +24,6 @@
> - #include <stddef.h>
> - #include <unistd.h>
> - #include <signal.h>
> --#include <fcntl.h>
> - #include <errno.h>
> - #include <string.h>
> - #include <getopt.h>
> -diff --git a/src/mtd_probe/mtd_probe.c b/src/mtd_probe/mtd_probe.c
> -index e604a72..bab2e8e 100644
> ---- a/src/mtd_probe/mtd_probe.c
> -+++ b/src/mtd_probe/mtd_probe.c
> -@@ -22,7 +22,6 @@
> - #include <mtd/mtd-user.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> --#include <fcntl.h>
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <linux/fcntl.h>
> -diff --git a/src/scsi_id/scsi_serial.c b/src/scsi_id/scsi_serial.c
> -index b60b154..7c5f7a3 100644
> ---- a/src/scsi_id/scsi_serial.c
> -+++ b/src/scsi_id/scsi_serial.c
> -@@ -23,7 +23,6 @@
> - #include <stdio.h>
> - #include <errno.h>
> - #include <string.h>
> --#include <fcntl.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> - #include <syslog.h>
> ---
> -1.7.9.5
> -
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
