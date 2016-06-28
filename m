From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 28 Jun 2016 13:18:17 +0200
Subject: [Buildroot] [PATCH 1/1] efivar: force shared libgcc for Nios II
Message-ID: <20160628111817.1237-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efivar for Nios II also has to be linked with shared libgcc to avoid an
error due to FDE encoding in static libgcc when linking libefiboot.so.

Fixes:
http://autobuild.buildroot.net/results/0c9/0c90e3e7ad41d21dd832f6f266af35fc19185170/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/efivar/efivar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index de48bc9..ac51097 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -21,9 +21,9 @@ EFIVAR_MAKE_OPTS = \
 	BINTARGETS=efivar \
 	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
 
-# Explicitly linking with shared libgcc is required on MicroBlaze,
+# Explicitly linking with shared libgcc is required on MicroBlaze and Nios II,
 # otherwise it fails due to FDE encoding in static libgcc.
-ifeq ($(BR2_microblaze),y)
+ifeq ($(filter y,$(BR2_microblaze) $(BR2_nios2)),y)
 EFIVAR_MAKE_OPTS += SOFLAGS="-shared -shared-libgcc"
 endif
 
-- 
2.9.0
