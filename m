From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:19:36 +0200
Subject: [Buildroot] [git commit] toolchain: allow PIC/PIE without RELRO
Message-ID: <20190803211932.3926183EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814f6e19e72ec7124dddb91d065d427daf2bd42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
we added the PIC/PIE flags, but based on the RELRO_FULL condition.

It is however totally possible to do a PIC/PIE executable without
RELRO_FULL, as it is also valid to do a PIC/PIE build with RELRO_PARTIAL.

Add a new option that now governs the PIC/PIE flags.

Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
Decoupling can come later from an interested party.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                      | 8 ++++++++
 toolchain/toolchain-wrapper.c  | 2 +-
 toolchain/toolchain-wrapper.mk | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 80f4eda705..21d1de2ff1 100644
--- a/Config.in
+++ b/Config.in
@@ -712,6 +712,13 @@ endmenu
 
 comment "Security Hardening Options"
 
+config BR2_PIC_PIE
+	bool "Build code with PIC/PIE"
+	depends on BR2_SHARED_LIBS
+	help
+	  Generate Position-Independent Code (PIC) and link
+	  Position-Independent Executables (PIE).
+
 choice
 	bool "Stack Smashing Protection"
 	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
@@ -794,6 +801,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	select BR2_PIC_PIE
 	help
 	  This option includes the partial configuration, but also marks
 	  the GOT as read-only at the cost of initialization time during
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c73a0cc079..7a4b9c4007 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -367,7 +367,7 @@ int main(int argc, char **argv)
 		*cur++ = "-Wno-builtin-macro-redefined";
 	}
 
-#ifdef BR2_RELRO_FULL
+#ifdef BR2_PIC_PIE
 	/* Patterned after Fedora/Gentoo hardening approaches.
 	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
 	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8f872506ec..970bde76a0 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -49,6 +49,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_PIC_PIE
+endif
+
 ifeq ($(BR2_RELRO_PARTIAL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_PARTIAL
 else ifeq ($(BR2_RELRO_FULL),y)
