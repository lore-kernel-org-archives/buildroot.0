From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:16:51 +0100
Subject: [Buildroot] [git commit] ntp: does not work with libressl
Message-ID: <20180108081841.763DE83BEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=522111f81c7d535f4f362ad4a15d141d0eb39ec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #10556

The --with-crypto handling in ntp only works with libopenssl, not with
libressl, where it ends up with compilation issues like:

ntp_control.c:(.text+0x64): undefined reference to `EVP_MD_CTX_new'
ntp_control.c:(.text+0x10c): undefined reference to `EVP_MD_CTX_free'
libntpd.a(ntp_crypto.o): In function `bighash':
ntp_crypto.c:(.text+0x2e8): undefined reference to `EVP_MD_CTX_new'
ntp_crypto.c:(.text+0x328): undefined reference to `EVP_MD_CTX_free'
libntpd.a(ntp_crypto.o): In function `crypto_verify':
ntp_crypto.c:(.text+0x6cc): undefined reference to `EVP_MD_CTX_new'
ntp_crypto.c:(.text+0x710): undefined reference to `EVP_MD_CTX_free'
ntp_crypto.c:(.text+0x72c): undefined reference to `EVP_MD_CTX_free'

So ensure we only pass --with-crypto when libopenssl is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 05619ae..74cf546 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -23,7 +23,7 @@ NTP_CONF_OPTS = \
 # 0003-ntpq-fpic.patch
 NTP_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 NTP_CONF_OPTS += --with-crypto
 NTP_DEPENDENCIES += openssl
 else
