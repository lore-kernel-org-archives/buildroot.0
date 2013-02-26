From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 26 Feb 2013 09:16:09 +0000
Subject: [Buildroot] [PATCH] gpsd: bump version to 3.8
Message-ID: <1361870169-27227-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Version 3.8 of gpsd has been released, which includes some patches sent
upstream by Thomas Petazzoni. This patch bumps the gpsd package version, and
removes the upstreamed patches.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../gpsd-01-sconstruct-python-2.5-compat.patch     |   79 --------------------
 ...sconstruct-python-2.5-compat-distro-check.patch |   27 -------
 .../gpsd-05-fix-leapsecond-script-python2.5.patch  |   71 ------------------
 package/gpsd/gpsd.mk                               |    3 +-
 4 files changed, 2 insertions(+), 178 deletions(-)
 delete mode 100644 package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
 delete mode 100644 package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
 delete mode 100644 package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch

diff --git a/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch b/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
deleted file mode 100644
index 4306af2..0000000
--- a/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Remove all the with ... as foo constructs
-
-Those constructs have been introduced in Python 2.6, and some of our
-autobuilders still use Python 2.5, so replace them with constructs
-that are compatible with Python 2.5.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/SConstruct
-===================================================================
---- a/SConstruct
-+++ b/SConstruct
-@@ -366,8 +366,8 @@
- 
- def CheckXsltproc(context):
-     context.Message('Checking that xsltproc can make man pages... ')
--    with open("xmltest.xml", "w") as ofp:
--        ofp.write('''
-+    ofp = open("xmltest.xml", "w")
-+    ofp.write('''
-        <refentry id="foo.1">
-       <refmeta>
-         <refentrytitle>foo</refentrytitle>
-@@ -380,6 +380,7 @@
-       </refnamediv>
-     </refentry>
- ''')
-+    ofp.close()
-     probe = "xsltproc --nonet --noout '%s' xmltest.xml" % (docbook_man_uri,)
-     ret = context.TryAction(probe)[0]
-     os.remove("xmltest.xml")
-@@ -1042,8 +1043,9 @@
- # build timebase.h
- def timebase_h(target, source, env):
-     from leapsecond import make_leapsecond_include
--    with open(target[0].abspath, 'w') as f:
--        f.write(make_leapsecond_include(source[0].abspath))
-+    f = open(target[0].abspath, 'w')
-+    f.write(make_leapsecond_include(source[0].abspath))
-+    f.close()
- env.Command(target="timebase.h", source="leapseconds.cache",
-             action=timebase_h)
- 
-@@ -1116,15 +1118,17 @@
-         ('@DEVMAIL@',    devmail),
-         ('@LIBGPSVERSION@', libgps_version),
-         )
--    with open(str(source[0])) as sfp:
--        content = sfp.read()
-+    sfp = open(str(source[0]))
-+    content = sfp.read()
-+    sfp.close()
-     for (s, t) in substmap:
-         content = content.replace(s, t)
-     m = re.search("@[A-Z]+@", content)
-     if m and m.group(0) not in map(lambda x: x[0], substmap):
-         print >>sys.stderr, "Unknown subst token %s in %s." % (m.group(0), sfp.name)
--    with open(str(target[0]), "w") as tfp:
--        tfp.write(content)
-+    tfp = open(str(target[0]), "w")
-+    tfp.write(content)
-+    tfp.close()
- 
- templated = glob.glob("*.in") + glob.glob("*/*.in") + glob.glob("*/*/*.in")
- 
-@@ -1560,9 +1564,10 @@
- def validation_list(target, source, env):
-     for page in glob.glob("www/*.html"):
-         if not '-head' in page:
--            with open(page) as fp:
--                if "Valid HTML" in fp.read():
--                    print os.path.join(website, os.path.basename(page))
-+            fp = open(page)
-+            if "Valid HTML" in fp.read():
-+                print os.path.join(website, os.path.basename(page))
-+            fp.close()
- Utility("validation-list", [www], validation_list)
- 
- # How to update the website
diff --git a/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch b/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
deleted file mode 100644
index 767a450..0000000
--- a/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-The platform.linux_distribution method was introduced in Python 2.6. Some
-of the Buildroot autobuilders still use Python 2.5, which is causing build
-failures such as the following.
-
-  http://autobuild.buildroot.net/results/045f1f69bac170d8e75cb4952a2e5b4e85a677b8/build-end.log
-
-This patch removes the linux distribution check from the gpsd SConstruct file.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-diff -Nurp a/SConstruct b/SConstruct
---- a/SConstruct	2012-07-30 07:57:16.515688546 +0100
-+++ b/SConstruct	2012-07-30 08:00:30.135679914 +0100
-@@ -80,14 +80,6 @@ systemd = os.path.exists("/usr/share/sys
- 
- # Set distribution-specific defaults here
- imloads = True
--if sys.platform.startswith('linux'):
--    (distro, version, cutename) = platform.linux_distribution()
--    if distro == 'Fedora':
--        if int(version) >= 13:
--            # See https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking
--            imloads = False
--    elif os.path.exists("/etc/arch-release"):
--        imloads = False
- 
- # Does our platform has a working memory-barrier instruction?
- # The shared-memory export won't be reliable without it.
diff --git a/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch b/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch
deleted file mode 100644
index 8866b81..0000000
--- a/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-the json module was added with python2.6, so a regular python 2.5
-machine will lack this module and won't probably have the simplejson
-module imported by the leapsecond.py script.
-
-Since the only function used is the isotime function, which is
-self-contained and quite trivial, only copy this function into the
-leapsecond script to avoid the import of the gps.misc module, which
-needs simplejson.
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- leapsecond.py |   27 ++++++++++++++++++++++++---
- 1 file changed, 24 insertions(+), 3 deletions(-)
-
-diff --git a/leapsecond.py b/leapsecond.py
-index 2059f6c..cdacdb4 100755
---- a/leapsecond.py
-+++ b/leapsecond.py
-@@ -24,7 +24,6 @@
- # BSD terms apply: see the file COPYING in the distribution root for details.
- #
- import os, urllib, re, random, time, calendar, math, sys
--import gps.misc
- 
- __locations = [
-     (
-@@ -48,6 +47,28 @@ __locations = [
- # between times it might change, in seconds since Unix epoch GMT.
- __cachepath = "/var/run/leapsecond"
- 
-+def isotime(s):
-+    "Convert timestamps in ISO8661 format to and from Unix time."
-+    if type(s) == type(1):
-+        return time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(s))
-+    elif type(s) == type(1.0):
-+        date = int(s)
-+        msec = s - date
-+        date = time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(s))
-+        return date + "." + repr(msec)[3:]
-+    elif type(s) == type("") or type(s) == type(u""):
-+        if s[-1] == "Z":
-+            s = s[:-1]
-+        if "." in s:
-+            (date, msec) = s.split(".")
-+        else:
-+            date = s
-+            msec = "0"
-+        # Note: no leap-second correction!
-+        return calendar.timegm(time.strptime(date, "%Y-%m-%dT%H:%M:%S")) + float("0." + msec)
-+    else:
-+        raise TypeError
-+
- def retrieve():
-     "Retrieve current leap-second from Web sources."
-     random.shuffle(__locations)	# To spread the load
-@@ -261,10 +282,10 @@ if __name__ == '__main__':
-             print unix_to_rfc822(float(val))
-             raise SystemExit, 0
-         elif (switch == '-I'):  # Compute Unix time from ISO8601 date
--            print gps.misc.isotime(val)
-+            print isotime(val)
-             raise SystemExit, 0
-         elif (switch == '-O'):  # Compute ISO8601 date from Unix time
--            print gps.misc.isotime(float(val))
-+            print isotime(float(val))
-             raise SystemExit, 0
- 
-         print "Current leap second:", retrieve()
--- 
-1.7.9.5
-
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index e472044..ccf99ca 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -3,7 +3,8 @@
 # gpsd
 #
 #############################################################
-GPSD_VERSION = 3.7
+
+GPSD_VERSION = 3.8
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
-- 
1.7.10.4
