From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:11:54 +0200
Subject: [Buildroot] [PATCH 3/3] disko-demos: new package
In-Reply-To: <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <98bbd6aa00cc55c26b47e07333f98464df89bae0.1311138690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/disko-demos/Config.in           |    8 +++
 .../disko-demos-1.8.0-fix-install-paths.patch      |   61 ++++++++++++++++++++
 package/multimedia/disko-demos/disko-demos.mk      |   27 +++++++++
 4 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/disko-demos/Config.in
 create mode 100644 package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch
 create mode 100644 package/multimedia/disko-demos/disko-demos.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 74885bd..05ca8a3 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -3,6 +3,7 @@ source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/disko/Config.in"
+source "package/multimedia/disko-demos/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/disko-demos/Config.in b/package/multimedia/disko-demos/Config.in
new file mode 100644
index 0000000..b488fa2
--- /dev/null
+++ b/package/multimedia/disko-demos/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DISKO_DEMOS
+	bool "disko-demos"
+	depends on BR2_PACKAGE_DISKO
+	help
+	  This is a demonstration application for the Disko multimedia
+	  application framework.
+
+	  http://www.diskohq.com/
diff --git a/package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch b/package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch
new file mode 100644
index 0000000..3469365
--- /dev/null
+++ b/package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch
@@ -0,0 +1,61 @@
+Allow proper configuration of /etc directory
+
+The disko-demos SConstruct build script forced to install
+configuration files into <prefix>/etc, which means /usr/etc. This
+patch adds a sysconfdir argument, which allows to specify a different
+directory for configuration files.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: disko-demos_1.8.0/SConstruct
+===================================================================
+--- disko-demos_1.8.0.orig/SConstruct	2011-07-16 17:36:38.136817482 +0200
++++ disko-demos_1.8.0/SConstruct	2011-07-16 17:56:55.266816863 +0200
+@@ -3,6 +3,7 @@
+ opts = Variables('disko-demos.conf')
+ opts.AddVariables(
+ PathVariable('prefix',  'Installation directory', '/tmp/disko-demos', PathVariable.PathIsDirCreate),
++PathVariable('sysconfdir', 'Configuration directory', 'none', PathVariable.PathIsDirCreate),
+ PathVariable('destdir', 'Installation directory for cross-compile', 'none', PathVariable.PathAccept))
+ 
+ env = Environment(ENV = os.environ)
+@@ -27,6 +28,11 @@
+ 
+ env['CCFLAGS'].extend(['-I./inc'])
+ 
++if env['sysconfdir'] != 'none':
++	isysconfdir = env['sysconfdir'] + "/"
++else:
++	isysconfdir = env['prefix'] + "/etc/"
++
+ # Here are our installation paths:
+ if os.environ.has_key('DESTDIR'):
+ 	env['destdir'] = os.environ['DESTDIR']
+@@ -34,6 +40,7 @@
+ 	idir_prefix = env['destdir']
+ 	if env['prefix'] != 'none':
+ 		idir_prefix += ('/' + env['prefix'])
++	isysconfdir = env['destdir'] + isysconfdir
+ else:
+ 	idir_prefix = env['prefix']
+ 
+@@ -72,14 +79,15 @@
+ 	
+ env = conf.Finish()
+ 
+-demo = env.Program('bin/demo', Glob('src/*.cpp'))
++demo = env.Program('bin/disko-demo', Glob('src/*.cpp'))
+ 
+-install = env.Alias('install', [idir_prefix])
++env.Alias('install', idir_prefix)
++env.Alias('install', isysconfdir)
+ 
+ env.Install(idir_prefix + '/bin', demo)
+ 
+ etc = Glob(os.getcwd() + '/etc/*')
+-env.Install(idir_prefix + '/etc', etc)
++env.Install(isysconfdir, etc)
+ 
+ share = Glob(os.getcwd() + '/share/*')
+-env.Install(idir_prefix + '/share/', share)
++env.Install(idir_prefix + '/share/disko-demo/', share)
diff --git a/package/multimedia/disko-demos/disko-demos.mk b/package/multimedia/disko-demos/disko-demos.mk
new file mode 100644
index 0000000..5a7cd70
--- /dev/null
+++ b/package/multimedia/disko-demos/disko-demos.mk
@@ -0,0 +1,27 @@
+
+DISKO_DEMOS_VERSION = 1.8.0
+DISKO_DEMOS_SOURCE = disko-demos_$(DISKO_DEMOS_VERSION).tar.gz
+DISKO_DEMOS_SITE = http://www.diskohq.com/repository/sources/
+
+DISKO_DEMOS_DEPENDENCIES = disko
+
+DISKO_DEMOS_SCONS_ENV = 	 \
+	$(TARGET_CONFIGURE_OPTS)
+
+DISKO_DEMOS_SCONS_OPTS =	\
+	prefix=/usr		\
+	sysconfdir=/etc		\
+	cross=True
+
+define DISKO_DEMOS_BUILD_CMDS
+	(cd $(@D); $(DISKO_DEMOS_SCONS_ENV) scons $(DISKO_DEMOS_SCONS_OPTS))
+endef
+
+define DISKO_DEMOS_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(DISKO_DEMOS_SCONS_ENV) scons $(DISKO_DEMOS_SCONS_OPTS) \
+		destdir=$(TARGET_DIR) install)
+endef
+
+
+$(eval $(call GENTARGETS,package/multimedia,disko-demos))
-- 
1.7.4.1
