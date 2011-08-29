From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 29 Aug 2011 17:56:44 +0200
Subject: [Buildroot] [PATCH 2/2] Fix regression in Python build on 64 bits
	system.
Message-ID: <1314633404-27073-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 009d8fceab4db7815502e4b0565fe0ef531d512c introduced
--enable-shared --disable-static options for the host autotools packages,
ultimately causing a regression on the host-python build, leading to
a number of critical modules not being built on the target python on
64 bits system. Introduce a quick fix for the release and before a deeper
fix.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python/python.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index c2839b7..724fd1a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -37,6 +37,19 @@ HOST_PYTHON_MAKE_ENV = \
 
 HOST_PYTHON_AUTORECONF = YES
 
+define HOST_PYTHON_CONFIGURE_CMDS
+	(cd $(@D) && rm -rf config.cache; \
+	        $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+                $(HOST_PYTHON_CONF_ENV) \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		$(HOST_PYTHON_CONF_OPT) \
+	)
+endef
+
 PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat
-- 
1.7.4.1
