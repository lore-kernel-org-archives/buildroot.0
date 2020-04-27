From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:38:55 +0200
Subject: [Buildroot] [git commit] package/libtextstyle: new package
Message-ID: <20200427212503.9416888F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b8eb87abee5832254f9e9ec06cef44f7dbe284f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library provides an easy way to add styling to programs that produce
output to a console or terminal emulator window.

libtextstyle is for you if your application produces text that is more readable
when it is accompanied with styling information, such as color, font
attributes (weight, posture), or underlining.

Our gettext-gnu package currently has HOST_GETTEXT_GNU_SUBDIR = gettext-tools
so we only configure and build the gettext-tools sub-directory. Version 0.20.1
of gettext-gnu now requires libtextstyle, which the subdirectory gettext-tools
does not provide.

We have three options:

1) Add hooks to configure and build libtextstyle as a pre-configure hook in
gettext-gnu, and install it in a pre-install hook.

2) Revert to building the whole of gettext.

3) Add a separate package for libtextstyle.

Here are the results of a test with BR2_JLEVEL=4:
- Only gettext-tools:      38.86s user 22.13s system 124% CPU 49.035 total
- gettext + libtextstyle:  40.78s user 14.57s system 146% CPU 37.817 total
- All of gettext:          203.18s user 122.87s system 161% CPU 3:22.39 total

As seen above, compiling the entire gettext package takes 5x longer than
building libtextstyle and gettext separately!

As such, the best option is option 3, as the time increase to build
libtextstyle is negligible.

Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7

            br-arm-full [1/6]: OK
 br-arm-cortex-a9-glibc [2/6]: OK
  br-arm-cortex-m4-full [3/6]: OK
         br-x86-64-musl [4/6]: OK
     br-arm-full-static [5/6]: OK
           sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/libtextstyle/libtextstyle.hash |  6 ++++++
 package/libtextstyle/libtextstyle.mk   | 24 ++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 34e19b451e..fd584bb6e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -48,6 +48,7 @@ F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
+F:	package/libtextstyle/
 F:	package/libwebsockets/
 F:	package/mender-grubenv/
 F:	package/nginx-naxsi/
diff --git a/package/libtextstyle/libtextstyle.hash b/package/libtextstyle/libtextstyle.hash
new file mode 100644
index 0000000000..5c5aee85bf
--- /dev/null
+++ b/package/libtextstyle/libtextstyle.hash
@@ -0,0 +1,6 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
+sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+
+# Locally calculated
+sha256  53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/libtextstyle/libtextstyle.mk b/package/libtextstyle/libtextstyle.mk
new file mode 100644
index 0000000000..a5afad04b3
--- /dev/null
+++ b/package/libtextstyle/libtextstyle.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libtextstyle
+#
+################################################################################
+
+# Please keep in sync with package/gettext-gnu/gettext-gnu.mk
+LIBTEXTSTYLE_VERSION = 0.20.1
+LIBTEXTSTYLE_SITE = $(BR2_GNU_MIRROR)/gettext
+LIBTEXTSTYLE_SOURCE = gettext-$(LIBTEXTSTYLE_VERSION).tar.xz
+LIBTEXTSTYLE_INSTALL_STAGING = YES
+LIBTEXTSTYLE_LICENSE = GPL-3.0+
+LIBTEXTSTYLE_LICENSE_FILES = COPYING
+HOST_LIBTEXTSTYLE_DL_SUBDIR = gettext-gnu
+HOST_LIBTEXTSTYLE_SUBDIR = libtextstyle
+
+# gettext-tools require libtextstyle.m4
+define HOST_LIBTEXTSTYLE_INSTALL_M4
+	$(INSTALL) -D -m 0755 $(@D)/libtextstyle/m4/libtextstyle.m4 \
+		$(ACLOCAL_HOST_DIR)/libtextstyle.m4
+endef
+HOST_LIBTEXTSTYLE_POST_INSTALL_HOOKS += HOST_LIBTEXTSTYLE_INSTALL_M4
+
+$(eval $(host-autotools-package))
