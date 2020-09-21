From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2020 23:07:17 +0200
Subject: [Buildroot] [PATCH 2020.02.x 1/1] package/systemd: bump version
 to 244.5
In-Reply-To: <20200921205048.155865-1-brandon.maier@rockwellcollins.com>
References: <20200921205048.155865-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200921210717.GL2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

Peter: good for 2020.02.x.

On 2020-09-21 15:50 -0500, Brandon Maier spake thusly:
> Tag 244.5 includes our patches, so drop them.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...-Fix-build-with-libmicrohttpd-0.9.71.patch | 71 -------------------
>  ...add-missing-header-for-GRND_NONBLOCK.patch | 39 ----------
>  ...twork-generator-allow-empty-hostname.patch | 44 ------------
>  ...0004-makefs-strdup-arguments-to-mkfs.patch | 48 -------------
>  package/systemd/systemd.hash                  |  2 +-
>  package/systemd/systemd.mk                    |  2 +-
>  6 files changed, 2 insertions(+), 204 deletions(-)
>  delete mode 100644 package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
>  delete mode 100644 package/systemd/0002-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
>  delete mode 100644 package/systemd/0003-network-generator-allow-empty-hostname.patch
>  delete mode 100644 package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> 
> diff --git a/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch b/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
> deleted file mode 100644
> index 7c1cfe939b..0000000000
> --- a/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From d17eabb1052e7c8c432331a7a782845e36164f01 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> -Date: Tue, 30 Jun 2020 09:56:10 +0200
> -Subject: [PATCH] =?UTF-8?q?Fix=20build=20with=20=C2=B5httpd=200.9.71?=
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The return type of callbacks was changed from int to an enum.
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[downloaded from upstream commit
> - https://github.com/systemd/systemd/commit/d17eabb1052e7c8c432331a7a782845e36164f01]
> ----
> - src/journal-remote/journal-gatewayd.c    | 4 ++--
> - src/journal-remote/journal-remote-main.c | 2 +-
> - src/journal-remote/microhttpd-util.h     | 6 ++++++
> - 3 files changed, 9 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/journal-remote/journal-gatewayd.c b/src/journal-remote/journal-gatewayd.c
> -index 5177e0d1577..3ab7c98b0b5 100644
> ---- a/src/journal-remote/journal-gatewayd.c
> -+++ b/src/journal-remote/journal-gatewayd.c
> -@@ -349,7 +349,7 @@ static int request_parse_range(
> -         return 0;
> - }
> - 
> --static int request_parse_arguments_iterator(
> -+static mhd_result request_parse_arguments_iterator(
> -                 void *cls,
> -                 enum MHD_ValueKind kind,
> -                 const char *key,
> -@@ -796,7 +796,7 @@ static int request_handler_machine(
> -         return MHD_queue_response(connection, MHD_HTTP_OK, response);
> - }
> - 
> --static int request_handler(
> -+static mhd_result request_handler(
> -                 void *cls,
> -                 struct MHD_Connection *connection,
> -                 const char *url,
> -diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
> -index 69a111afead..f82d188a8c6 100644
> ---- a/src/journal-remote/journal-remote-main.c
> -+++ b/src/journal-remote/journal-remote-main.c
> -@@ -253,7 +253,7 @@ static int process_http_upload(
> -         return mhd_respond(connection, MHD_HTTP_ACCEPTED, "OK.");
> - };
> - 
> --static int request_handler(
> -+static mhd_result request_handler(
> -                 void *cls,
> -                 struct MHD_Connection *connection,
> -                 const char *url,
> -diff --git a/src/journal-remote/microhttpd-util.h b/src/journal-remote/microhttpd-util.h
> -index d90c6bbd4f1..4ca9a5c4f16 100644
> ---- a/src/journal-remote/microhttpd-util.h
> -+++ b/src/journal-remote/microhttpd-util.h
> -@@ -47,6 +47,12 @@
> - #  define MHD_create_response_from_fd_at_offset64 MHD_create_response_from_fd_at_offset
> - #endif
> - 
> -+#if MHD_VERSION >= 0x00097002
> -+#  define mhd_result enum MHD_Result
> -+#else
> -+#  define mhd_result int
> -+#endif
> -+
> - void microhttpd_logger(void *arg, const char *fmt, va_list ap) _printf_(2, 0);
> - 
> - /* respond_oom() must be usable with return, hence this form. */
> diff --git a/package/systemd/0002-random-seed-add-missing-header-for-GRND_NONBLOCK.patch b/package/systemd/0002-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
> deleted file mode 100644
> index e74df10e9d..0000000000
> --- a/package/systemd/0002-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 806e2011a0ea684b10a07b74c4ee0f817437e8c6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Sun, 1 Mar 2020 15:19:01 +0100
> -Subject: [PATCH] random-seed: add missing header for GRND_NONBLOCK
> -
> -GRND_NONBLOCK has been introduced with the 3.17 kernel version [1]
> -while adding getrandom(2) system call.
> -
> -The header missing_random.h is needed for random-seed.c when building
> -with old toolchain, such Sourcery CodeBench ARM 2014.05.
> -
> -Fixes:
> -https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917
> -
> -[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c6e9d6f38894798696f23c8084ca7edbf16ee895
> -
> -Upstream status:
> -https://github.com/systemd/systemd/pull/14988
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - src/random-seed/random-seed.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/random-seed/random-seed.c b/src/random-seed/random-seed.c
> -index 2fcbcb281a..596bff98f1 100644
> ---- a/src/random-seed/random-seed.c
> -+++ b/src/random-seed/random-seed.c
> -@@ -19,6 +19,7 @@
> - #include "io-util.h"
> - #include "log.h"
> - #include "main-func.h"
> -+#include "missing_random.h"
> - #include "missing_syscall.h"
> - #include "mkdir.h"
> - #include "parse-util.h"
> --- 
> -2.24.1
> -
> diff --git a/package/systemd/0003-network-generator-allow-empty-hostname.patch b/package/systemd/0003-network-generator-allow-empty-hostname.patch
> deleted file mode 100644
> index 8d1f3aa86f..0000000000
> --- a/package/systemd/0003-network-generator-allow-empty-hostname.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db Mon Sep 17 00:00:00 2001
> -From: Yu Watanabe <watanabe.yu+github@gmail.com>
> -Date: Thu, 12 Dec 2019 19:01:21 +0900
> -Subject: [PATCH 1/1] network-generator: allow empty hostname
> -
> -Fixes #14319.
> -
> -[Brandon: backport from https://github.com/systemd/systemd/commit/21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db]
> -Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ----
> - src/network/generator/network-generator.c | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
> -index 81afa95307..bed1e42697 100644
> ---- a/src/network/generator/network-generator.c
> -+++ b/src/network/generator/network-generator.c
> -@@ -574,7 +574,7 @@ static int parse_netmask_or_prefixlen(int family, const char **value, unsigned c
> - 
> - static int parse_cmdline_ip_address(Context *context, int family, const char *value) {
> -         union in_addr_union addr = {}, peer = {}, gateway = {};
> --        const char *hostname, *ifname, *dhcp_type, *dns, *p;
> -+        const char *hostname = NULL, *ifname, *dhcp_type, *dns, *p;
> -         unsigned char prefixlen;
> -         int r;
> - 
> -@@ -599,9 +599,11 @@ static int parse_cmdline_ip_address(Context *context, int family, const char *va
> -         if (!p)
> -                 return -EINVAL;
> - 
> --        hostname = strndupa(value, p - value);
> --        if (!hostname_is_valid(hostname, false))
> --                return -EINVAL;
> -+        if (p != value) {
> -+                hostname = strndupa(value, p - value);
> -+                if (!hostname_is_valid(hostname, false))
> -+                        return -EINVAL;
> -+        }
> - 
> -         value = p + 1;
> - 
> --- 
> -2.23.0
> -
> diff --git a/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch b/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> deleted file mode 100644
> index 140d741f63..0000000000
> --- a/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From c315b79fb43a4d921a533ba0c2cb303324887993 Mon Sep 17 00:00:00 2001
> -From: Oliver Giles <ohw.giles@gmail.com>
> -Date: Thu, 13 Feb 2020 08:55:57 +0200
> -Subject: [PATCH] makefs: strdup arguments to mkfs
> -
> -Don't pass values from argv[] directly to child process forked using
> -safe_fork, because it clears argv[]. strdup them first.
> -
> -[Brandon: backport from https://github.com/systemd/systemd/commit/c315b79fb43a4d921a533ba0c2cb303324887993]
> -Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ----
> - src/partition/makefs.c | 13 +++++++++----
> - 1 file changed, 9 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/partition/makefs.c b/src/partition/makefs.c
> -index 951989cbb6..d73d67c4e8 100644
> ---- a/src/partition/makefs.c
> -+++ b/src/partition/makefs.c
> -@@ -41,8 +41,7 @@ static int makefs(const char *type, const char *device) {
> - }
> - 
> - static int run(int argc, char *argv[]) {
> --        const char *device, *type;
> --        _cleanup_free_ char *detected = NULL;
> -+        _cleanup_free_ char *device = NULL, *type = NULL, *detected = NULL;
> -         struct stat st;
> -         int r;
> - 
> -@@ -52,8 +51,14 @@ static int run(int argc, char *argv[]) {
> -                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
> -                                        "This program expects two arguments.");
> - 
> --        type = argv[1];
> --        device = argv[2];
> -+        /* type and device must be copied because makefs calls safe_fork, which clears argv[] */
> -+        type = strdup(argv[1]);
> -+        if (!type)
> -+                return -ENOMEM;
> -+
> -+        device = strdup(argv[2]);
> -+        if (!device)
> -+                return -ENOMEM;
> - 
> -         if (stat(device, &st) < 0)
> -                 return log_error_errno(errno, "Failed to stat \"%s\": %m", device);
> --- 
> -2.23.0
> -
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3f6f4b4db6..db8f0193bb 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256	6f01276f45369d56ea5ced713e63a22acbb9142862eb719246a77a4b3f5699ee	systemd-244.4.tar.gz
> +sha256	d526f217450f98c695d0a20285436e48f1f1b3f31fe76aa4d6211ec60fee33c4	systemd-244.5.tar.gz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
>  sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e0a4679955..c01e8c9a3e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 244.4
> +SYSTEMD_VERSION = 244.5
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
