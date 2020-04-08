From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:25:40 +0200
Subject: [Buildroot] [git commit] package/python-requests: relax version
 dependency on python-idna
Message-ID: <20200408201805.CF4448E0E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=000d21c2b63bfda8c66edfd9a742a7b847c8b1a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dockerCompose runtime test currently fails with:

pkg_resources.ContextualVersionConflict: (idna 2.9 (/usr/lib/python3.8/site-packages), Requirement.parse('idna<2.9,>=2.5'), {'requests'})

This is due to the fact that the python-requests module has a strict
version dependency on the python-idna module: 'idna>=2.5,<2.9'.

Since Buildroot commit 237d31bf5289a46583aa4bbc1fb7ed008b798de5, we're
using python-idna in version 2.9, which no longer matches the version
dependency expressed by python-requests, causing the failure.

Upstream has addressed this issue in commit
https://github.com/psf/requests/commit/c46f55bd48dabc02f033d252f8c64e2011f37361,
which relaxes the version requirement.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144417

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pendencies-to-major-instead-of-minor-5342.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch b/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch
new file mode 100644
index 0000000000..b113c928d4
--- /dev/null
+++ b/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch
@@ -0,0 +1,40 @@
+From 9e9141ed638c3163c7fbf1a1f3a9b9f5a80bdf4f Mon Sep 17 00:00:00 2001
+From: Chris Withers <chris@withers.org>
+Date: Tue, 18 Feb 2020 14:58:27 +0000
+Subject: [PATCH] Limit dependencies to major instead of minor (#5342)
+
+(cherry picked from commit c46f55bd48dabc02f033d252f8c64e2011f37361)
+
+[Romain backport from upstream to 2.22.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 3dce2965..f0bfebcc 100755
+--- a/setup.py
++++ b/setup.py
+@@ -42,8 +42,8 @@ if sys.argv[-1] == 'publish':
+ packages = ['requests']
+ 
+ requires = [
+-    'chardet>=3.0.2,<3.1.0',
+-    'idna>=2.5,<2.9',
++    'chardet>=3.0.2,<4',
++    'idna>=2.5,<3',
+     'urllib3>=1.21.1,<1.26,!=1.25.0,!=1.25.1',
+     'certifi>=2017.4.17'
+ 
+@@ -101,7 +101,7 @@ setup(
+     cmdclass={'test': PyTest},
+     tests_require=test_requirements,
+     extras_require={
+-        'security': ['pyOpenSSL >= 0.14', 'cryptography>=1.3.4', 'idna>=2.0.0'],
++        'security': ['pyOpenSSL >= 0.14', 'cryptography>=1.3.4'],
+         'socks': ['PySocks>=1.5.6, !=1.5.7'],
+         'socks:sys_platform == "win32" and python_version == "2.7"': ['win_inet_pton'],
+     },
+-- 
+2.25.2
+
