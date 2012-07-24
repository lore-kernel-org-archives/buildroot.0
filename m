From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 22:00:59 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: fix build issues
Message-ID: <20120802195300.7A1FA96CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f52727e22d2b7e20cb5771ef8961d37ff2a25937
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The first patch gpsd-01-sconstruct-python-2.5-compat.patch is aimed at
fixing Python 2.5 compatibility issues such as:

 http://autobuild.buildroot.org/results/844a7f8698567688eba094f64dd2bf5157efd994/build-end.log

The second patch gpsd-02-sconstruct-ncurses-config-path.patch
implements a proper mechanism to specify the path to
ncurse5-config. It obsoletes the previous
gpsd-fix-acs_map-compile-errors patch, and solves build problems such
as:

 http://autobuild.buildroot.org/results/92ae3d53e8aa68d8b1a2eccad68c98f577cb6437/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Simon Dawson <spdawson@gmail.com>
---
 .../gpsd-01-sconstruct-python-2.5-compat.patch     |   79 ++++++++++++++++++++
 .../gpsd-02-sconstruct-ncurses-config-path.patch   |   44 +++++++++++
 package/gpsd/gpsd-fix-acs_map-compile-errors.patch |   29 -------
 package/gpsd/gpsd.mk                               |    1 +
 4 files changed, 124 insertions(+), 29 deletions(-)

diff --git a/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch b/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
new file mode 100644
index 0000000..4306af2
--- /dev/null
+++ b/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
@@ -0,0 +1,79 @@
+Remove all the with ... as foo constructs
+
+Those constructs have been introduced in Python 2.6, and some of our
+autobuilders still use Python 2.5, so replace them with constructs
+that are compatible with Python 2.5.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/SConstruct
+===================================================================
+--- a/SConstruct
++++ b/SConstruct
+@@ -366,8 +366,8 @@
+ 
+ def CheckXsltproc(context):
+     context.Message('Checking that xsltproc can make man pages... ')
+-    with open("xmltest.xml", "w") as ofp:
+-        ofp.write('''
++    ofp = open("xmltest.xml", "w")
++    ofp.write('''
+        <refentry id="foo.1">
+       <refmeta>
+         <refentrytitle>foo</refentrytitle>
+@@ -380,6 +380,7 @@
+       </refnamediv>
+     </refentry>
+ ''')
++    ofp.close()
+     probe = "xsltproc --nonet --noout '%s' xmltest.xml" % (docbook_man_uri,)
+     ret = context.TryAction(probe)[0]
+     os.remove("xmltest.xml")
+@@ -1042,8 +1043,9 @@
+ # build timebase.h
+ def timebase_h(target, source, env):
+     from leapsecond import make_leapsecond_include
+-    with open(target[0].abspath, 'w') as f:
+-        f.write(make_leapsecond_include(source[0].abspath))
++    f = open(target[0].abspath, 'w')
++    f.write(make_leapsecond_include(source[0].abspath))
++    f.close()
+ env.Command(target="timebase.h", source="leapseconds.cache",
+             action=timebase_h)
+ 
+@@ -1116,15 +1118,17 @@
+         ('@DEVMAIL@',    devmail),
+         ('@LIBGPSVERSION@', libgps_version),
+         )
+-    with open(str(source[0])) as sfp:
+-        content = sfp.read()
++    sfp = open(str(source[0]))
++    content = sfp.read()
++    sfp.close()
+     for (s, t) in substmap:
+         content = content.replace(s, t)
+     m = re.search("@[A-Z]+@", content)
+     if m and m.group(0) not in map(lambda x: x[0], substmap):
+         print >>sys.stderr, "Unknown subst token %s in %s." % (m.group(0), sfp.name)
+-    with open(str(target[0]), "w") as tfp:
+-        tfp.write(content)
++    tfp = open(str(target[0]), "w")
++    tfp.write(content)
++    tfp.close()
+ 
+ templated = glob.glob("*.in") + glob.glob("*/*.in") + glob.glob("*/*/*.in")
+ 
+@@ -1560,9 +1564,10 @@
+ def validation_list(target, source, env):
+     for page in glob.glob("www/*.html"):
+         if not '-head' in page:
+-            with open(page) as fp:
+-                if "Valid HTML" in fp.read():
+-                    print os.path.join(website, os.path.basename(page))
++            fp = open(page)
++            if "Valid HTML" in fp.read():
++                print os.path.join(website, os.path.basename(page))
++            fp.close()
+ Utility("validation-list", [www], validation_list)
+ 
+ # How to update the website
diff --git a/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch b/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch
new file mode 100644
index 0000000..5c440bf
--- /dev/null
+++ b/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch
@@ -0,0 +1,44 @@
+Add option to specify the path to ncurses5-config
+
+By default, gpsd's SConstruct looks in the PATH to find
+ncurses5-config, which means that it finds our HOST_DIR
+ncurses5-config. We add an option that allows to specify a custom path
+to the ncurses5-config script.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/SConstruct
+===================================================================
+--- a/SConstruct
++++ b/SConstruct
+@@ -172,6 +172,7 @@
+     ("fixed_stop_bits",     0,             "fixed serial port stop bits"),
+     ("target",              "",            "cross-development target"),
+     ("sysroot",             "",            "cross-development system root"),
++    ("ncurses_config",      "",            "ncurses5-config path"),
+     )
+ for (name, default, help) in nonboolopts:
+     opts.Add(name, help, default)
+@@ -447,6 +448,11 @@
+ else:
+     pkg_config = lambda pkg: ['!%s --cflags --libs --static %s' %(env['PKG_CONFIG'], pkg, )]
+ 
++if env['ncurses_config']:
++    ncurses_config = env['ncurses_config']
++else:
++    ncurses_config = "ncurses5-config"
++
+ # The actual distinction here is whether the platform has ncurses in the
+ # base system or not. If it does, pkg-config is not likely to tell us
+ # anything useful. FreeBSD does, Linux doesn't. Most likely other BSDs
+@@ -455,8 +461,8 @@
+ if env['ncurses']:
+     if config.CheckPKG('ncurses'):
+         ncurseslibs = pkg_config('ncurses')
+-    elif config.CheckExecutable('ncurses5-config --version', 'ncurses5-config'):
+-        ncurseslibs = ['!ncurses5-config --libs --cflags']
++    elif config.CheckExecutable('%s --version' % ncurses_config, 'ncurses5-config'):
++        ncurseslibs = ['!%s --libs --cflags' % ncurses_config]
+     elif sys.platform.startswith('freebsd'):
+         ncurseslibs= [ '-lncurses' ]
+     elif sys.platform.startswith('openbsd'):
diff --git a/package/gpsd/gpsd-fix-acs_map-compile-errors.patch b/package/gpsd/gpsd-fix-acs_map-compile-errors.patch
deleted file mode 100644
index 14d9287..0000000
--- a/package/gpsd/gpsd-fix-acs_map-compile-errors.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Hack gpsd to prevent undefined references to acs_map from ncurses.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-diff -Nurp a/gpsmon.c b/gpsmon.c
---- a/gpsmon.c	2012-05-18 09:45:37.000000000 +0100
-+++ b/gpsmon.c	2012-06-07 12:41:31.257807969 +0100
-@@ -24,6 +24,9 @@
- #include <unistd.h>
- #endif /* S_SPLINT_S */
- 
-+/* Ugly hack to prevent undefined reference to acs_map */
-+unsigned long acs_map[128];
-+
- #include "gpsd_config.h"
- #ifdef HAVE_BLUEZ
- #include <bluetooth/bluetooth.h>
-diff -Nurp a/monitor_nmea.c b/monitor_nmea.c
---- a/monitor_nmea.c	2011-11-22 08:49:33.000000000 +0000
-+++ b/monitor_nmea.c	2012-06-07 12:41:37.081807709 +0100
-@@ -15,6 +15,9 @@
- #include <unistd.h>
- #endif /* S_SPLINT_S */
- 
-+/* Ugly hack to prevent undefined reference to acs_map */
-+unsigned long acs_map[128];
-+
- #include "gpsd.h"
- #include "gpsmon.h"
- #include "gpsdclient.h"
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index dd15386..7d1dbcd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -23,6 +23,7 @@ GPSD_SCONS_OPTS = \
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	GPSD_DEPENDENCIES += ncurses
+	GPSD_SCONS_OPTS += ncurses_config=$(STAGING_DIR)/usr/bin/ncurses5-config
 else
 	GPSD_SCONS_OPTS += ncurses=no
 endif
