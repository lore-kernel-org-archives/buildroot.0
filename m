From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 Apr 2020 00:15:49 +0200
Subject: [Buildroot] [PATCH] package/python-requests: backport from upstream
Message-ID: <20200407221549.681860-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by the dockerCompose runtime test, there
is a runtime issue due to python-requests package
that restrict the dependency to all known version
at the time of the release:

The python-requests is limited to python-idna < 2.9 but
since the version bump [1] the DockerCompose test is broken.

pkg_resources.ContextualVersionConflict: (idna 2.9 (/usr/lib/python3.8/site-packages), Requirement.parse('idna<2.9,>=2.5'), {'requests'})

Upstream again the idna maximum version [2], backport
this patch.

[1] 237d31bf5289a46583aa4bbc1fb7ed008b798de5
[2] https://github.com/psf/requests/commit/c46f55bd48dabc02f033d252f8c64e2011f37361

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144417

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ncies-to-major-instead-of-minor-5342.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch

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
-- 
2.25.2
