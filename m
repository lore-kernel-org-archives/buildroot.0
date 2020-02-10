From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 10 Feb 2020 16:55:48 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/pkg-meson: use host-pkg-config
 to find host libraries.
In-Reply-To: <20200210155548.31928-1-nicolas.cavallari@green-communications.fr>
References: <20200210155548.31928-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20200210155548.31928-2-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

meson makes a distinction between 'native' (i.e. host) dependencies
and 'host' (i.e. target) dependencies and can use a different pkg-config
binary for each case.

Currently, pkg-meson only pass the target pkg-config and meson
automatically guesses the host pkg-config by searching PATH, which finds
host/bin/pkg-config, which is the target pkg-config wrapper script.

As a result, meson uses the target pkg-config to find host dependencies,
with possibly incorrect results.

This patch causes meson to use host/bin/host-pkg-config directly to find
host dependencies, using the apparently recommended method[1] of
specifing the PKG_CONFIG environment variable.

[1] https://github.com/mesonbuild/meson/issues/1849

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
--

I tested that the following packages still compile:
- libglib2
- gst1-plugins-bad
- gst1-plugins-base
- gst1-plugins-good
- gst1-plugins-ugly
- gstreamer1
- libdrm
- mesa3d
---
 package/pkg-meson.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 642b715938..09687cc960 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -81,7 +81,8 @@ define $(2)_CONFIGURE_CMDS
 	    ) \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
-	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
+	PATH=$$(BR_PATH) PKG_CONFIG=$$(HOST_PKG_CONFIG_HOST_BINARY) \
+	$$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
-- 
2.25.0
