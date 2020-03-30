From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 30 Mar 2020 16:46:12 -0700
Subject: [Buildroot] [PATCH 1/5] package/nftables: check for python
Message-ID: <20200330234616.1665466-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If python or python3 is selected, nftables should depend on the package
and set the --enable-python option, otherwise set --disable-python

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/nftables/nftables.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 11ef6844ce..210e950c11 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -27,6 +27,13 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+NFTABLES_CONF_OPTS += --enable-python
+NFTABLES_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+else
+NFTABLES_CONF_OPTS += --disable-python
+endif
+
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
-- 
2.25.1
