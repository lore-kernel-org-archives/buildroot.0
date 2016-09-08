From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 19:46:36 +0200
Subject: [Buildroot] [git commit] wireshark: bump version to 2.2.0
Message-ID: <20160908174926.D5D38822D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeaf66fc7a2be26bbc8bcb8a0c0243677bbcd3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Adapt current patch for 2.2.0.

- Adapt gtk configure options for 2.2.0:
  - Instead of --enable-gtk3 or --enable-gtk2, now it uses
    --enable-gtk=[no/2/3/yes].

- Remove non-existing configure options:
  - --enable-usr-local: removed by
    https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commit;h=125989780ba8e658ad0d1f1c71ec01e6d36a2266

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-do-not-assume-broken-inet_pton-in-case-.patch} | 21 ++++++++++++---------
 package/wireshark/wireshark.hash                    |  4 ++--
 package/wireshark/wireshark.mk                      |  9 ++++-----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch b/package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch
similarity index 53%
rename from package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch
rename to package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch
index 4d1f680..1e44ad0 100644
--- a/package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch
+++ b/package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch
@@ -1,32 +1,35 @@
-From a0657feeb2b349ffda895a53e36ea5c992d871cf Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 31 Oct 2015 22:38:48 +0100
-Subject: [PATCH] configure: do not assume broken inet_pton in case of cross
+From 25d313275e87dc236e86c0e713cad08ea64253f8 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 8 Sep 2016 10:58:34 +0100
+Subject: [PATCH] configure.ac: do not assume broken inet_pton in case of cross
  compiling
 
 Patch configure.ac to not assume broken inet_pton in case of cross
 compiling.
 
+[Vincent: adapt the patch for 2.2.0]
+
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aec0548..d640e0c 100644
+index c43e366..9672831 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2646,8 +2646,8 @@ int main()
+@@ -2373,8 +2373,8 @@ int main()
  #endif
  }], [AC_MSG_RESULT(ok);
  have_inet_pton=yes], [AC_MSG_RESULT(broken);
--have_inet_pton=no], [AC_MSG_RESULT(cross compiling, assume it is broken);
+-have_inet_pton=no], [AC_MSG_RESULT([cross compiling, assume it is broken]);
 -have_inet_pton=no])],
 +have_inet_pton=no], [AC_MSG_RESULT([cross compiling, assume it is broken... not here]);
 +have_inet_pton=yes])],
  have_inet_pton=no)
  if test "$have_inet_pton" = no; then
-   INET_PTON_LO="inet_pton.lo"
+   AC_LIBOBJ(inet_pton)
 -- 
-2.1.4
+2.7.3
 
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index fe4070b..73e57cd 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.5.txt
-sha256 0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b  wireshark-2.0.5.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.0.txt
+sha256 a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104  wireshark-2.2.0.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 42a5e74..aa0c6d0 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.5
+WIRESHARK_VERSION = 2.2.0
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -20,7 +20,6 @@ WIRESHARK_AUTORECONF = YES
 # Work around it by pointing includedir at staging
 WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
-	--disable-usr-local \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-lua=no \
@@ -29,13 +28,13 @@ WIRESHARK_CONF_OPTS = \
 
 # wireshark GUI options
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-WIRESHARK_CONF_OPTS += --with-gtk3=yes
+WIRESHARK_CONF_OPTS += --with-gtk=3
 WIRESHARK_DEPENDENCIES += libgtk3
 else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-WIRESHARK_CONF_OPTS += --with-gtk2=yes
+WIRESHARK_CONF_OPTS += --with-gtk=2
 WIRESHARK_DEPENDECIES += libgtk2
 else
-WIRESHARK_CONF_OPTS += --with-gtk3=no --with-gtk2=no
+WIRESHARK_CONF_OPTS += --with-gtk=no
 endif
 
 # Qt4 needs accessibility, we don't support it
