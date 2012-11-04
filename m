From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 12:07:12 +0100
Subject: [Buildroot] [git commit] cups: fix libdir handling
Message-ID: <20121104110820.6199B9997D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7655b95e27c3eebf7456a726e48b7e5448692b31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cups uses /usr/lib64 if the HOST has it, no matter if it is cross compiling
for a 32bit arch, breaking the build for stuff looking in /usr/lib.

The fix of commit edd2716c didn't work, it would just force /usr/lib64 if
the target is 64 bit.  Instead, force installation in /usr/lib regardless
of the host.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 226a832..3eb83ea 100644
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
