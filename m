From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:27:02 +0200
Subject: [Buildroot] [git commit] package/libopenssl: fix target
 architecture for MIPS64n32
Message-ID: <20200620193433.495A282E00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42718e13d26c507930019c0dc46da6bcd9d7e719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1ebb35ee5fb7bd5e6278a84ac2c18aa0a38056fb changed the libopenssl
target architecture to 'linux-generic64' for 64-bit archs based on
BR2_ARCH_IS_64. However, MIPS64n32 has BR2_ARCH_IS_64 set, but is a 32-bit
ABI. On such board, libopenssl needs to be configured with linux-generic32
to function properly.

One symptom of this problem is that ssh-keygen hangs on key generation,
waiting for more random bits. See [1] for the discussion with openssl
upstream.

Thanks to Ronny Meeus for investigating the issue and kudos to the openssl
community for their responsive and helpful interaction!

Reported-by: Ronny Meeus <ronny.meeus@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

[1] https://mta.openssl.org/pipermail/openssl-users/2020-June/012565.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 881518d1cb..8909e36b9e 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
-	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64
+	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64 && !BR2_MIPS_NABI32
 	default "linux-generic32 no-asm"
 
 config BR2_PACKAGE_LIBOPENSSL_BIN
