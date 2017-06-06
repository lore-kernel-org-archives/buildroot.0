From: Tobias.Blass at rohde-schwarz.com <Tobias.Blass@rohde-schwarz.com>
Date: Tue, 6 Jun 2017 16:29:11 +0200
Subject: [Buildroot] [PATCH 1/1] Botan: Disable AltiVec if the CPU does not
	support it
Message-ID: <OF7D9B9E03.15B7CCDF-ONC1258137.004F93F6-C1258137.004F9406@rohde-schwarz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Botan compiles all PowerPC code with AltiVec support and only determines 
at runtime
whether the CPU even supports it. If the target CPU uses the older SPE 
extensions, though,
this is too late; since SPE and AltiVec are incompatible, gcc aborts the 
compilation.
This patch explicitly disables AltiVec support unless 
BR2_POWERPC_CPU_HAS_ALTIVEC is defined

Signed-off-by: Tobias Blass <tobias.blass@rohde-schwarz.com>
---
 package/botan/botan.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 2f24151..e42bb61 100644
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
--
1.8.3.1
