From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:28:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] grub2: force
	-fno-stack-protector in CFLAGS
Message-ID: <20170906112608.A5BB682145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9064cb3b1d16cb299db656ef6807dc88cf1bc90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

grub2 fails to configure when BR2_SSP_ALL is enabled, with the following
configure error:

  checking whether -fno-asynchronous-unwind-tables works... yes
  checking whether -fno-unwind-tables works... yes
  checking for target linking format... unknown
  configure: error: no suitable link format found

This can be worked around by enforcing -fno-stack-protector in the
package CFLAGS in a way that overrides the SSP flag, as is already done
for the valgrind package.

Fixes bug #10261.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reported-by: Dr I J Ormshaw <ian_ormshaw@waters.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2a27294e9ade6130a12ced9a1f152c51431a870e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc4e51e..373bce1 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -53,7 +53,7 @@ GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CPP="$(HOSTCC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector" \
 	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 	NM="$(TARGET_NM)" \
