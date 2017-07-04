From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:47 +0200
Subject: [Buildroot] [PATCH 007/100] gettext: force build libintl if needed
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-8-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces a hidden option
BR2_PACKAGE_GETTEXT_PROVIDES_INTL that is used by gettext.mk to force
the build of libintl if the toolchain doesn't provide a full gettext
implementation.

For now, this hidden option is not selected by anything, but a
follow-up commit will introduce BR2_ENABLE_NLS, which will make use of
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gettext/Config.in  | 8 ++++++++
 package/gettext/gettext.mk | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 7871a48..18bfda6 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -12,6 +12,14 @@ config BR2_PACKAGE_GETTEXT
 
 	  http://www.gnu.org/software/gettext/
 
+if BR2_PACKAGE_GETTEXT
+
+config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
+	bool
+	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
+
+endif
+
 comment "gettext needs a toolchain w/ wchar"
 	depends on BR2_NEEDS_GETTEXT
 	depends on !BR2_USE_WCHAR
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 498dfab..454ad29 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -39,6 +39,14 @@ HOST_GETTEXT_CONF_OPTS = \
 	--disable-relocatable \
 	--without-emacs
 
+# Force the build of libintl, even if the C library provides a stub
+# gettext implementation
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+GETTEXT_CONF_OPTS += --with-included-gettext
+else
+GETTEXT_CONF_OPTS += --without-included-gettext
+endif
+
 # For the target version, we only need the runtime, and for the host
 # version, we only need the tools.
 GETTEXT_SUBDIR = gettext-runtime
-- 
2.9.4
