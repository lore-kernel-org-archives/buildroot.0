From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:42:42 +0200
Subject: [Buildroot] [git commit branch/next] package/xerces: add enable
 network option
Message-ID: <20200521132701.A589591B48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=850d9cbafca35530b479458aa48bb750e4d3c8df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to add the option to compile xerces with network
enabled by default so it can be unselected to compile
without network support.

When network support is enabled the Network Accessor feature
will decode schema urls and if they don't appear as localhost
or local files, it will open a stream (socket) session with
the remote server. In an embedded setting having the option to
disable this allows:
 * cleaner audit logging
 * smaller security attack surface
 * less library dependencies
 * no behind the scenes failed session attempts

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xerces/Config.in | 10 ++++++++++
 package/xerces/xerces.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 2edc4346b5..a9b102bd5e 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -6,5 +6,15 @@ config BR2_PACKAGE_XERCES
 
 	  http://xerces.apache.org/xerces-c/
 
+if BR2_PACKAGE_XERCES
+
+config BR2_PACKAGE_XERCES_ENABLE_NETWORK
+	bool "Enable network support"
+	default y
+	help
+	  Enable network support in xerces
+
+endif
+
 comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index c75a8b0d35..ae42b1e62f 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -31,12 +31,16 @@ XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_XERCES_ENABLE_NETWORK),y)
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 XERCES_CONF_OPTS += -Dnetwork-accessor=curl
 XERCES_DEPENDENCIES += libcurl
 else
 XERCES_CONF_OPTS += -Dnetwork-accessor=socket
 endif
+else
+XERCES_CONF_OPTS += -Dnetwork=OFF
+endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XERCES_CONF_OPTS += -Dthreads=ON
