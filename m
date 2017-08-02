From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:49:00 +0200
Subject: [Buildroot] [git commit] systemd: bump version to 234
Message-ID: <20170802200519.BBCEA81EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=333dccb14472d67fc42f2fa01fe21808bd53f1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
- Removed the following patches due to being merged upstream:
    - resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
    - resolved-simplify-alloc-size-calculation.patch
    - resolved-do-not-allocate-packets-with-minimum-size.patch
- Updated the following patches to work with 234:
    - fix-getty-unit.patch
    - build-check-for-ln-relative.patch
    - fix-am-path-libgcrypt-no-found.patch
- Updated ordering of remaining patches.
- Reformatted remaining patches as git style patches.
- Updated Upstream-Status comment in "build-check-for-ln-relative.patch" to
  "Denied [No desire to support building on old distributions]"

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Marcus Hoffmann <m.hoffmann@caretelsol.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/0001-fix-getty-unit.patch          | 48 ++++++++++++++++++++
 ...-of-null-pointer-p-question-dereferencing.patch | 28 ------------
 ...atch => 0002-build-check-for-ln-relative.patch} | 24 +++++-----
 ...-resolved-simplify-alloc-size-calculation.patch | 51 ----------------------
 ...h => 0003-fix-am-path-libgcrypt-no-found.patch} | 24 +++++++---
 ...do-not-allocate-packets-with-minimum-size.patch | 48 --------------------
 package/systemd/0004-fix-getty-unit.patch          | 30 -------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 9 files changed, 82 insertions(+), 175 deletions(-)

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
new file mode 100644
index 0000000..8b50353
--- /dev/null
+++ b/package/systemd/0001-fix-getty-unit.patch
@@ -0,0 +1,48 @@
+From 7deb6387aeb07fa4300fa3cf9d6c039dabd120d7 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Mon, 31 Jul 2017 10:08:46 -0400
+Subject: [PATCH] fix-getty-unit
+
+Prefer getty to agetty in console setup systemd units
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[Adam: Refresh for 234]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ units/getty at .service.m4        | 5 +----
+ units/serial-getty at .service.m4 | 2 +-
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
+index 2a84061..7ad588f 100644
+--- a/units/getty at .service.m4
++++ b/units/getty at .service.m4
+@@ -33,10 +33,7 @@ ConditionPathExists=/dev/tty0
+ 
+ [Service]
+ # the VT is cleared by TTYVTDisallocate
+-# The '-o' option value tells agetty to replace 'login' arguments with an
+-# option to preserve environment (-p), followed by '--' for safety, and then
+-# the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
+diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
+index b7caeaf..c663612 100644
+--- a/units/serial-getty at .service.m4
++++ b/units/serial-getty at .service.m4
+@@ -31,7 +31,7 @@ Before=rescue.service
+ # The '-o' option value tells agetty to replace 'login' arguments with an
+ # option to preserve environment (-p), followed by '--' for safety, and then
+ # the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --keep-baud 115200,38400,9600 %I $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ UtmpIdentifier=%I
+-- 
+2.13.3
+
diff --git a/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch b/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
deleted file mode 100644
index 81cecef..0000000
--- a/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a924f43f30f9c4acaf70618dd2a055f8b0f166be Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Wed, 24 May 2017 08:56:48 +0300
-Subject: [PATCH] resolved: bugfix of null pointer p->question dereferencing
- (#6020)
-
-See https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1621396
-
-[Upstream commit: https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/resolve/resolved-dns-packet.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
-index 652970284e..240ee448f4 100644
---- a/src/resolve/resolved-dns-packet.c
-+++ b/src/resolve/resolved-dns-packet.c
-@@ -2269,6 +2269,9 @@ int dns_packet_is_reply_for(DnsPacket *p, const DnsResourceKey *key) {
-         if (r < 0)
-                 return r;
- 
-+        if (!p->question)
-+                return 0;
-+
-         if (p->question->n_keys != 1)
-                 return 0;
- 
diff --git a/package/systemd/0005-build-check-for-ln-relative.patch b/package/systemd/0002-build-check-for-ln-relative.patch
similarity index 83%
rename from package/systemd/0005-build-check-for-ln-relative.patch
rename to package/systemd/0002-build-check-for-ln-relative.patch
index 1547f62..817ce50 100644
--- a/package/systemd/0005-build-check-for-ln-relative.patch
+++ b/package/systemd/0002-build-check-for-ln-relative.patch
@@ -1,6 +1,6 @@
-From c78fa2b40cb8b810d06ef225e30f12a7ed44ffa2 Mon Sep 17 00:00:00 2001
+From b60e16cc2ef8c9b4c05c4348a980d3312f2e1cb4 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 1 Apr 2017 11:26:29 +0200
+Date: Fri, 28 Jul 2017 07:04:07 -0400
 Subject: [PATCH] build: check for ln --relative
 
 ln --relative is recent enough that not all distributions support it.
@@ -16,20 +16,22 @@ We introduce this as a macro that expands to a single command. To avoid
 complexity in the macro, we expect paths to be passed whitout the
 leading DESTDIR.
 
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Adam: Refresh for 234]
+Signed-off-by: Adam Duskett  <aduskett@gmail.com>
 ---
-Upstream status: submitted, disputed:
+Upstream-Status: Denied [No desire to support building on old distributions]
     https://github.com/systemd/systemd/pull/5682
 
----
  Makefile.am  | 25 ++++++++++++++++++++++---
  configure.ac |  5 ++++-
  2 files changed, 26 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 1cc657a..ec503f2 100644
+index c16e622..bed097f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -300,6 +300,24 @@ install-busnames-target-wants-hook:
+@@ -305,6 +305,24 @@ install-busnames-target-wants-hook:
  	what="$(BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(systemunitdir) && $(add-wants)
  	what="$(USER_BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(userunitdir) && $(add-wants)
  
@@ -54,7 +56,7 @@ index 1cc657a..ec503f2 100644
  define add-wants
  	[ -z "$$what" ] || ( \
  	  dir=$(DESTDIR)$$dir/$$wants.wants && \
-@@ -313,8 +331,9 @@ install-directories-hook:
+@@ -318,8 +336,9 @@ install-directories-hook:
  	$(MKDIR_P) $(addprefix $(DESTDIR),$(INSTALL_DIRS))
  
  install-environment-conf-hook: install-directories-hook
@@ -66,7 +68,7 @@ index 1cc657a..ec503f2 100644
  
  install-aliases-hook:
  	set -- $(SYSTEM_UNIT_ALIASES) && \
-@@ -337,7 +356,7 @@ define install-relative-aliases
+@@ -342,7 +361,7 @@ define install-relative-aliases
  	while [ -n "$$1" ]; do \
  		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
  		rm -f $(DESTDIR)$$dir/$$2 && \
@@ -76,10 +78,10 @@ index 1cc657a..ec503f2 100644
  	done
  endef
 diff --git a/configure.ac b/configure.ac
-index cf37ca6..d586fc4 100644
+index c7537aa..9354441 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -108,7 +108,10 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+@@ -109,7 +109,10 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
  AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
  AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
  
@@ -92,5 +94,5 @@ index cf37ca6..d586fc4 100644
  M4_DEFINES=
  
 -- 
-2.9.3
+2.13.3
 
diff --git a/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch b/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
deleted file mode 100644
index 5fab905..0000000
--- a/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From db848813bae4d28c524b3b6a7dad135e426659ce Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 18 Jun 2017 16:07:57 -0400
-Subject: [PATCH] resolved: simplify alloc size calculation
-
-The allocation size was calculated in a complicated way, and for values
-close to the page size we would actually allocate less than requested.
-
-Reported by Chris Coulson <chris.coulson@canonical.com>.
-
-CVE-2017-9445
-
-[Upstream commit: https://github.com/systemd/systemd/commit/db848813bae4d28c524b3b6a7dad135e426659ce]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/resolve/resolved-dns-packet.c | 8 +-------
- src/resolve/resolved-dns-packet.h | 2 --
- 2 files changed, 1 insertion(+), 9 deletions(-)
-
-diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
-index 240ee448f4..821b66e266 100644
---- a/src/resolve/resolved-dns-packet.c
-+++ b/src/resolve/resolved-dns-packet.c
-@@ -47,13 +47,7 @@ int dns_packet_new(DnsPacket **ret, DnsProtocol protocol, size_t mtu) {
- 
-         assert(ret);
- 
--        if (mtu <= UDP_PACKET_HEADER_SIZE)
--                a = DNS_PACKET_SIZE_START;
--        else
--                a = mtu - UDP_PACKET_HEADER_SIZE;
--
--        if (a < DNS_PACKET_HEADER_SIZE)
--                a = DNS_PACKET_HEADER_SIZE;
-+        a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
- 
-         /* round up to next page size */
-         a = PAGE_ALIGN(ALIGN(sizeof(DnsPacket)) + a) - ALIGN(sizeof(DnsPacket));
-diff --git a/src/resolve/resolved-dns-packet.h b/src/resolve/resolved-dns-packet.h
-index 2c92392e4d..3abcaf8cf3 100644
---- a/src/resolve/resolved-dns-packet.h
-+++ b/src/resolve/resolved-dns-packet.h
-@@ -66,8 +66,6 @@ struct DnsPacketHeader {
- /* With EDNS0 we can use larger packets, default to 4096, which is what is commonly used */
- #define DNS_PACKET_UNICAST_SIZE_LARGE_MAX 4096
- 
--#define DNS_PACKET_SIZE_START 512
--
- struct DnsPacket {
-         int n_ref;
-         DnsProtocol protocol;
diff --git a/package/systemd/0006-fix-am-path-libgcrypt-no-found.patch b/package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
similarity index 90%
rename from package/systemd/0006-fix-am-path-libgcrypt-no-found.patch
rename to package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
index 2287ac5..1861a42 100644
--- a/package/systemd/0006-fix-am-path-libgcrypt-no-found.patch
+++ b/package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
@@ -1,4 +1,7 @@
-Fix AM_PATH_LIBGCRYPT not found
+From cb47c1da9c4a8f69662f9c17497aeeb8a922d41a Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Fri, 28 Jul 2017 07:13:51 -0400
+Subject: [PATCH] Fix AM_PATH_LIBGCRYPT not found
 
 This patch installs a copy of libgcrypt.m4 from the libgcrypt source tarball
 to systemd m4 directory.
@@ -15,10 +18,18 @@ machine or adding libgcrypt as a build dependency to systemd is not
 acceptable, the required file is added to the m4 directory.
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Index: systemd-213/m4/libgcrypt.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ systemd-213/m4/libgcrypt.m4	2014-06-11 10:41:11.749305509 +0200
+[Adam: Refresh for 234]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ m4/libgcrypt.m4 | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 123 insertions(+)
+ create mode 100644 m4/libgcrypt.m4
+
+diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
+new file mode 100644
+index 0000000..831dc0c
+--- /dev/null
++++ b/m4/libgcrypt.m4
 @@ -0,0 +1,123 @@
 +dnl Autoconf macros for libgcrypt
 +dnl       Copyright (C) 2002, 2004 Free Software Foundation, Inc.
@@ -143,3 +154,6 @@ Index: systemd-213/m4/libgcrypt.m4
 +  AC_SUBST(LIBGCRYPT_CFLAGS)
 +  AC_SUBST(LIBGCRYPT_LIBS)
 +])
+-- 
+2.13.3
+
diff --git a/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch b/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
deleted file mode 100644
index 7509113..0000000
--- a/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 88795538726a5bbfd9efc13d441cb05e1d7fc139 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 27 Jun 2017 14:20:00 -0400
-Subject: [PATCH] resolved: do not allocate packets with minimum size
-
-dns_packet_new() is sometimes called with mtu == 0, and in that case we should
-allocate more than the absolute minimum (which is the dns packet header size),
-otherwise we have to resize immediately again after appending the first data to
-the packet.
-
-This partially reverts the previous commit.
-
-[Upstream commit: https://github.com/systemd/systemd/commit/88795538726a5bbfd9efc13d441cb05e1d7fc139]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/resolve/resolved-dns-packet.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
-index 821b66e266..d1f0f760a4 100644
---- a/src/resolve/resolved-dns-packet.c
-+++ b/src/resolve/resolved-dns-packet.c
-@@ -28,6 +28,9 @@
- 
- #define EDNS0_OPT_DO (1<<15)
- 
-+#define DNS_PACKET_SIZE_START 512
-+assert_cc(DNS_PACKET_SIZE_START > UDP_PACKET_HEADER_SIZE)
-+
- typedef struct DnsPacketRewinder {
-         DnsPacket *packet;
-         size_t saved_rindex;
-@@ -47,7 +50,14 @@ int dns_packet_new(DnsPacket **ret, DnsProtocol protocol, size_t mtu) {
- 
-         assert(ret);
- 
--        a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
-+        /* When dns_packet_new() is called with mtu == 0, allocate more than the
-+         * absolute minimum (which is the dns packet header size), to avoid
-+         * resizing immediately again after appending the first data to the packet.
-+         */
-+        if (mtu < UDP_PACKET_HEADER_SIZE)
-+                a = DNS_PACKET_SIZE_START;
-+        else
-+                a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
- 
-         /* round up to next page size */
-         a = PAGE_ALIGN(ALIGN(sizeof(DnsPacket)) + a) - ALIGN(sizeof(DnsPacket));
diff --git a/package/systemd/0004-fix-getty-unit.patch b/package/systemd/0004-fix-getty-unit.patch
deleted file mode 100644
index 8ec3bcf..0000000
--- a/package/systemd/0004-fix-getty-unit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Prefer getty to agetty in console setup systemd units
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
-
-diff -aburN systemd-212.orig/units/getty at .service.m4 systemd-212/units/getty at .service.m4
---- systemd-212.orig/units/getty at .service.m4	2014-01-28 11:08:51.000000000 +0100
-+++ systemd-212/units/getty at .service.m4	2014-03-26 11:06:27.000000000 +0100
-@@ -27,7 +27,7 @@
- 
- [Service]
- # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Type=idle
- Restart=always
- RestartSec=0
-diff -aburN systemd-212.orig/units/serial-getty at .service.m4 systemd-212/units/serial-getty at .service.m4
---- systemd-212.orig/units/serial-getty at .service.m4	2014-03-13 18:47:24.000000000 +0100
-+++ systemd-212/units/serial-getty at .service.m4	2014-03-26 11:07:01.000000000 +0100
-@@ -22,7 +22,7 @@
- IgnoreOnIsolate=yes
- 
- [Service]
--ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Type=idle
- Restart=always
- RestartSec=0
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 17f4c0f..9a1f926 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083  systemd-233.tar.gz
+sha256 da3e69d10aa1c983d33833372ad4929037b411ac421fb085c8cee79ae1d80b6a  systemd-234.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2f6ca11..9f286fd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 233
+SYSTEMD_VERSION = 234
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
