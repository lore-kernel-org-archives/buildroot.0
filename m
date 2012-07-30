From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 30 Jul 2012 08:08:21 +0100
Subject: [Buildroot] [PATCH] gpsd: fix Python 2.5 build failure
Message-ID: <1343632101-7179-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The platform.linux_distribution method was introduced in Python 2.6. Some
of the Buildroot autobuilders still use Python 2.5, which is causing build
failures such as the following.

  http://autobuild.buildroot.net/results/045f1f69bac170d8e75cb4952a2e5b4e85a677b8/build-end.log

This patch removes the linux distribution check from the gpsd SConstruct file.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...sconstruct-python-2.5-compat-distro-check.patch |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch

diff --git a/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch b/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
new file mode 100644
index 0000000..767a450
--- /dev/null
+++ b/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
@@ -0,0 +1,27 @@
+The platform.linux_distribution method was introduced in Python 2.6. Some
+of the Buildroot autobuilders still use Python 2.5, which is causing build
+failures such as the following.
+
+  http://autobuild.buildroot.net/results/045f1f69bac170d8e75cb4952a2e5b4e85a677b8/build-end.log
+
+This patch removes the linux distribution check from the gpsd SConstruct file.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/SConstruct b/SConstruct
+--- a/SConstruct	2012-07-30 07:57:16.515688546 +0100
++++ b/SConstruct	2012-07-30 08:00:30.135679914 +0100
+@@ -80,14 +80,6 @@ systemd = os.path.exists("/usr/share/sys
+ 
+ # Set distribution-specific defaults here
+ imloads = True
+-if sys.platform.startswith('linux'):
+-    (distro, version, cutename) = platform.linux_distribution()
+-    if distro == 'Fedora':
+-        if int(version) >= 13:
+-            # See https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking
+-            imloads = False
+-    elif os.path.exists("/etc/arch-release"):
+-        imloads = False
+ 
+ # Does our platform has a working memory-barrier instruction?
+ # The shared-memory export won't be reliable without it.
-- 
1.7.9.5
