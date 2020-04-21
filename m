From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 21 Apr 2020 13:55:02 -0700
Subject: [Buildroot] [PATCH v4 1/3] package/libtextstyle: new package
Message-ID: <20200421205504.3061551-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

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
---
Changes v2 -> v3:
  - Add a much more comprehensive change log (Yann)

Changes v3 -> v4:
  - Remove the target variant (Thomas)

 DEVELOPERS                             |  1 +
 package/libtextstyle/libtextstyle.hash |  6 ++++++
 package/libtextstyle/libtextstyle.mk   | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libtextstyle/libtextstyle.hash
 create mode 100644 package/libtextstyle/libtextstyle.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c57bc1c5c9..03ea2d39f2 100644
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
index 0000000000..aeefc28e9b
--- /dev/null
+++ b/package/libtextstyle/libtextstyle.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libtextstyle
+#
+################################################################################
+
+LIBTEXTSTYLE_VERSION = 0.20.1
+LIBTEXTSTYLE_SITE = $(BR2_GNU_MIRROR)/gettext
+LIBTEXTSTYLE_SOURCE = gettext-$(LIBTEXTSTYLE_VERSION).tar.xz
+LIBTEXTSTYLE_INSTALL_STAGING = YES
+LIBTEXTSTYLE_LICENSE = GPL-3.0+
+LIBTEXTSTYLE_LICENSE_FILES = COPYING
+HOST_LIBTEXTSTYLE_SUBDIR = libtextstyle
+
+# gettext-tools require libtextstyle.m4
+define HOST_LIBTEXTSTYLE_INSTALL_M4
+	$(INSTALL) -D -m 0755 $(@D)/libtextstyle/m4/libtextstyle.m4 $(ACLOCAL_HOST_DIR)/libtextstyle.m4
+endef
+HOST_LIBTEXTSTYLE_POST_INSTALL_HOOKS += HOST_LIBTEXTSTYLE_INSTALL_M4
+
+$(eval $(host-autotools-package))
-- 
2.25.3
