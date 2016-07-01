From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:19:27 +0200
Subject: [Buildroot] [git commit] efivar: force shared libgcc for Nios II
Message-ID: <20160701141936.2901182161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf4e05832dbc1e87b06f4f39628c30dd9734f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efivar for Nios II also has to be linked with shared libgcc to avoid an
error due to FDE encoding in static libgcc when linking libefiboot.so.

Fixes:
http://autobuild.buildroot.net/results/0c9/0c90e3e7ad41d21dd832f6f266af35fc19185170/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efivar/efivar.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index de48bc9..cb5f7b6 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -21,9 +21,9 @@ EFIVAR_MAKE_OPTS = \
 	BINTARGETS=efivar \
 	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
 
-# Explicitly linking with shared libgcc is required on MicroBlaze,
-# otherwise it fails due to FDE encoding in static libgcc.
-ifeq ($(BR2_microblaze),y)
+# Explicitly linking with shared libgcc is required on MicroBlaze and
+# Nios II, otherwise it fails due to FDE encoding in static libgcc.
+ifeq ($(BR2_microblaze)$(BR2_nios2),y)
 EFIVAR_MAKE_OPTS += SOFLAGS="-shared -shared-libgcc"
 endif
 
