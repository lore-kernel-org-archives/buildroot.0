From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2012 23:52:32 +0200
Subject: [Buildroot] [PATCH] cups: fix libdir handling
Message-ID: <1341957152-19061-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cups uses /usr/lib64 if the HOST has it, no matter if it is cross compiling
for a 32bit arch, breaking the build for stuff looking in /usr/lib.

The fix of commit edd2716c didn't work, it would just force /usr/lib64 if
the target is 64 bit.  Instead, force installation in /usr/lib regardless
of the host.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/cups/cups.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 6d906ec..1f88cff 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -14,7 +14,7 @@ CUPS_CONF_OPT = --without-perl \
 		--without-java \
 		--disable-gnutls \
 		--disable-gssapi \
-		--libdir=/usr/$(if $(BR2_ARCH_IS_64),lib64,lib)
+		--libdir=/usr/lib
 
 CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
 		    $(if $(BR2_PACKAGE_LIBPNG),libpng) \
-- 
tg: (b8b57bb..) t/cups-64 (depends on: master)
