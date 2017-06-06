From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 22:28:16 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] botan: disable AltiVec if
	the CPU does not support it
Message-ID: <20170606202824.981AF81D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14f06ff260986ae4f878c517fa8f84efe9c9aaeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Botan compiles all PowerPC code with AltiVec support and only determines
at runtime whether the CPU even supports it. If the target CPU uses the
older SPE extensions, though, this is too late; since SPE and AltiVec
are incompatible, gcc aborts the compilation. This patch explicitly
disables AltiVec support unless BR2_POWERPC_CPU_HAS_ALTIVEC is defined

Signed-off-by: Tobias Blass <tobias.blass@rohde-schwarz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e654839f9e2cc6d2780916d0288941cb3d4555dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7694b8d..c098b57 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -43,6 +43,12 @@ BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
 endif
 
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+BOTAN_CONF_OPTS += --enable-altivec
+else
+BOTAN_CONF_OPTS += --disable-altivec
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
