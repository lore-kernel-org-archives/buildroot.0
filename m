From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 19 Dec 2017 13:45:44 -0500
Subject: [Buildroot] [PATCH v2 1/1] erlang: remove non-SMP build option
Message-ID: <1513709144-12840-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The non-SMP scheduler was deprecated with the Erlang/OTP 20.0 release and
slated for removal with the next major Erlang release. Since the non-SMP
scheduler isn't even built anymore, this option no longer has the
intended effect of saving space or compile time. The SMP scheduler
supports both SMP and non-SMP processors, so removing the option will
not break any platforms.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Added text to Config.in.legacy to explain the removal of the option
    (suggested by Yann - I added to Config.in.legacy after thinking about
     it, since anyone who previously selected this option may be surprised
     to see the SMP scheduler in their process list.)

 Config.in.legacy         | 10 ++++++++++
 package/erlang/Config.in | 10 ----------
 package/erlang/erlang.mk |  4 ----
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index decbace..1607df6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,6 +153,16 @@ config BR2_PACKAGE_GNUPG2_GPGV2
 	  The gpgv2 executable is now named gpgv. The config option
 	  has been renamed accordingly.

+config BR2_PACKAGE_ERLANG_SMP
+	bool "erlang smp option removed"
+	select BR2_LEGACY
+	help
+	  This option used to disable Erlang's SMP scheduler to save
+	  space. Since Erlang 20.0 deprecated the non-SMP scheduler and
+	  no longer builds it, it is no longer relevant. See the Erlang
+	  20.0 release notes for more information. Note that the SMP
+	  scheduler runs on both SMP and non-SMP CPUs.
+
 ###############################################################################
 comment "Legacy options removed in 2017.11"

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 1cd93ca..96af551 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -27,16 +27,6 @@ config BR2_PACKAGE_ERLANG

 if BR2_PACKAGE_ERLANG

-config BR2_PACKAGE_ERLANG_SMP
-	bool "enable SMP support"
-	help
-	  Erlang provides both a UP and an SMP emulator. The UP
-	  emulator is always built, and this option enables
-	  compilation of the SMP emulator. The choice of which
-	  emulator to use is made at runtime. If you do not need SMP
-	  support, turning this option off reduces compile time and
-	  the size of the Erlang installation.
-
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
 	help
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 733c1d5..5705b98 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -74,10 +74,6 @@ ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
 endif

-ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
-ERLANG_CONF_OPTS += --disable-smp-support
-endif
-
 # Remove source, example, gs and wx files from staging and target.
 ERLANG_REMOVE_PACKAGES = gs wx

--
2.7.4
