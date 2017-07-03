From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Mon,  3 Jul 2017 22:09:23 +0200
Subject: [Buildroot] [PATCH v3] pixz: new package
In-Reply-To: <25d817cb-a478-40fc-e6b8-8ce92c1086a5@mind.be>
References: <25d817cb-a478-40fc-e6b8-8ce92c1086a5@mind.be>
Message-ID: <20170703200923.895-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

Add a package for pixz (pronounced pixie), a parallel, indexing version of
xz.

See https://github.com/vasi/pixz

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---


Hi Arnout,

Here is the patch with the host package removal.

I agree that if we do not plan to use pixz as a host package right now it
is cleaner not to add the host package lines. And I think this is no big
deal anyway as this is straightforward to add later if needed.

Also I wanted to ask you if you are ok that I update the DEVELOPERS file in
this same patch, please? Romain suggested for uftrace that I rather
separate it. This is up to you really; do you want a v4 with the DEVELOPERS
change moved out of the way?

Thank you for your review.

Best regards,

Vincent.

Changes since v2:
-----------------
- Remove the two lines of host package

Changes since v1:
-----------------
- Select libarchive and depend on wchar, as suggested by Arnout
- Rework comment on conf_env, as suggested by Arnout

- Make pixz a host package, too. This to prepare making it a selectable
  alternative to host-xz, as suggested by Arnout

- Change my e-mail address in DEVELOPERS


 DEVELOPERS             |  3 ++-
 package/Config.in      |  1 +
 package/pixz/Config.in | 13 +++++++++++++
 package/pixz/pixz.hash |  2 ++
 package/pixz/pixz.mk   | 19 +++++++++++++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/pixz/Config.in
 create mode 100644 package/pixz/pixz.hash
 create mode 100644 package/pixz/pixz.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d121bd816..9f07259b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1716,9 +1716,10 @@ F:	package/openmpi/
 F:	package/pinentry/
 F:	package/trinity/
 
-N:	Vincent Stehl? <vincent.stehle@intel.com>
+N:	Vincent Stehl? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
+F:	package/pixz/
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
diff --git a/package/Config.in b/package/Config.in
index 355aa5201..302bb30b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -64,6 +64,7 @@ menu "Compressors and decompressors"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
+	source "package/pixz/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
diff --git a/package/pixz/Config.in b/package/pixz/Config.in
new file mode 100644
index 000000000..f7ca01572
--- /dev/null
+++ b/package/pixz/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PIXZ
+	bool "pixz"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # libarchive
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_XZ
+	help
+	  Pixz (pronounced pixie) is a parallel, indexing version of xz.
+
+	  https://github.com/vasi/pixz
+
+comment "pixz needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/pixz/pixz.hash b/package/pixz/pixz.hash
new file mode 100644
index 000000000..3089bcd90
--- /dev/null
+++ b/package/pixz/pixz.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8 pixz-1.0.6.tar.xz
diff --git a/package/pixz/pixz.mk b/package/pixz/pixz.mk
new file mode 100644
index 000000000..8d80f7861
--- /dev/null
+++ b/package/pixz/pixz.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# pixz
+#
+################################################################################
+
+PIXZ_VERSION = 1.0.6
+PIXZ_SITE = https://github.com/vasi/pixz/releases/download/v$(PIXZ_VERSION)
+PIXZ_SOURCE = pixz-$(PIXZ_VERSION).tar.xz
+PIXZ_DEPENDENCIES = host-pkgconf libarchive xz
+PIXZ_LICENSE = BSD-2-Clause
+PIXZ_LICENSE_FILES = LICENSE
+
+# pixz.1 is actually present, but AC_CHECK_FILE doesn't detect it when
+# cross-compiling, which causes configure to try to regenerate it. So give it a
+# hint to say that it actually is present.
+PIXZ_CONF_ENV = ac_cv_file_src_pixz_1=yes
+
+$(eval $(autotools-package))
-- 
2.11.0
