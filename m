From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:33:06 +0100
Subject: [Buildroot] [git commit] package/python-mwclient: require
 pytest-runner only when necessary
Message-ID: <20171201205337.5C4887FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c33c9ca62a1d34c59538b77e88d9e5f130527971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/09c/09c0e590448f1fc069d1d00564c202d2b009d59a/
http://autobuild.buildroot.net/results/79e/79ef04d2e8c91231028e23f4bb35df685efa55ca/
http://autobuild.buildroot.net/results/7a4/7a4a4aecbe6dd315062bafe97b291645d3d6ced1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...require-pytest-runner-only-when-necessary.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch b/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch
new file mode 100644
index 0000000..124236c
--- /dev/null
+++ b/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch
@@ -0,0 +1,43 @@
+From a6ff9745f56b776f244c2c412685f5c10ff0f09d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 24 Nov 2017 20:44:53 +0100
+Subject: [PATCH] setup.py: require pytest-runner only when necessary
+
+This optimizes setup.py for cases when pytest-runner is not needed,
+using the approach that is suggested upstream:
+
+https://pypi.python.org/pypi/pytest-runner#conditional-requirement
+
+Patch sent upstream: https://github.com/mwclient/mwclient/pull/180
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ setup.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index a32cbde..660d93b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -8,6 +8,9 @@ from setuptools import setup
+ here = os.path.abspath(os.path.dirname(__file__))
+ README = open(os.path.join(here, 'README.rst')).read()
+ 
++needs_pytest = set(['pytest', 'test', 'ptr']).intersection(sys.argv)
++pytest_runner = ['pytest-runner'] if needs_pytest else []
++
+ setup(name='mwclient',
+       version='0.8.6',  # Use bumpversion to update
+       description='MediaWiki API client',
+@@ -27,7 +30,7 @@ setup(name='mwclient',
+       license='MIT',
+       packages=['mwclient'],
+       install_requires=['requests_oauthlib', 'six'],
+-      setup_requires=['pytest-runner'],
++      setup_requires=pytest_runner,
+       tests_require=['pytest', 'pytest-pep8', 'pytest-cache', 'pytest-cov',
+                      'responses>=0.3.0', 'responses!=0.6.0', 'mock'],
+       zip_safe=True
+-- 
+2.11.0
+
