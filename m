From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 21:48:00 +0200
Subject: [Buildroot] [PATCH 1/1] sed: fix compilation with external
	toolchains
In-Reply-To: <cover.1249415132.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249415132.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6ce736a58c8973ceba56bc95f11118b7c1351f11.1249415132.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since CC is already passed in TARGET_CONFIGURE_OPTS at ./configure
time, there's no point in overriding it with a wrong value at
compilation time. This breaks external toolchain builds since
CC=$(TARGET_CC) is wrong because it excludes the mandatory --sysroot
option.

Fixes bug #525

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES            |    1 +
 package/sed/sed.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0c1f667..36b9b45 100644
--- a/CHANGES
+++ b/CHANGES
@@ -77,6 +77,7 @@
 	#497: OpenSSL RSA key generation hangs on x86_64
 	#509: Bump sqlite package to 3.6.16
 	#523: pciutils broken with external toolchain
+	#525: sed broken with external toolchain
 	#533: Update gamin to 0.1.10 to fix compilation
 
 2009.05, Released June 1st, 2009:
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 9caefed..07f4b32 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -135,7 +135,7 @@ $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
 	touch $@
 
 $(SED_DIR2)/$(SED_BINARY): $(SED_DIR2)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(SED_DIR2)
+	$(MAKE) -C $(SED_DIR2)
 
 # This stuff is needed to work around GNU make deficiencies
 sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
-- 
1.6.0.4
