From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Nov 2017 21:04:14 +0100
Subject: [Buildroot] [PATCH] prosody: build with -fPIC
Message-ID: <20171106200414.5268-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The prosody configure script defines CFLAGS as -fPIC -Wall, but
because we pass our own CFLAGS, the -fPIC goes away, causing a build
failure when building shared libraries on x86-64:

/home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-amd-linux-gnu/6.2.0/../../../../x86_64-amd-linux-gnu/bin/ld: encodings.o: relocation R_X86_64_32 against `.rodata' can not be used when making a shared object; recompile with -fPIC

So let's pass this -fPIC flag explicitly in CFLAGS. We don't bother
passing it conditionally !BR2_STATIC_LIBS because other packages (e.g
lua) also pass -fPIC unconditionally.

Fixes:

  http://autobuild.buildroot.net/results/7f0eb285b75cdeacb21a1f9a9f64d2f0cbbf1d59/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/prosody/prosody.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index b98748e3b6..d19653503d 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -21,7 +21,7 @@ endif
 PROSODY_CONF_OPTS = \
 	--with-lua=$(STAGING_DIR)/usr \
 	--c-compiler=$(TARGET_CC) \
-	--cflags="$(TARGET_CFLAGS)" \
+	--cflags="$(TARGET_CFLAGS) -fPIC" \
 	--linker=$(TARGET_CC) \
 	--ldflags="$(TARGET_LDFLAGS) -shared" \
 	--sysconfdir=/etc/prosody \
-- 
2.13.6
