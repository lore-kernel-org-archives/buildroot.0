From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 16 Dec 2018 18:27:33 -0500
Subject: [Buildroot] [PATCH v3 1/2] dependencies.sh: Check for a host python
 version >= 2.7
Message-ID: <20181216232734.100068-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Older distributions such as CentOS6 come with python2.6, which causes build
failures in packages such as host-libglib2 because they require python2.7 and
above.

host-libglib2 will produce the error message:
/bin/sh: python2.7: command not found

Python2.7 is a hard-coded value in configure.ac. If one changes the value to
just "python," the following stack trace is produced:

Traceback (most recent call last):
  File "./gdbus-2.0/codegen/gdbus-codegen.in", line 55, in <module>
    self.outfile.write(LICENSE_STR.format(config.VERSION))
ValueError    : sys.exit(codegen_main.codegen_main())
zero length field name in format

Instead of supporting an ancient version of Python that had its support ended
in October os 2013, it would be more pragmatic only to support Python2.7 and
above.

Luckily; CentOS6 has the centos-release-scl repository, which allows users to
install python2.7, and Debian 8 comes with Python2.7 already, making this patch
relatively low impact.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Updated version requirement in prerequisite.txt

Changes v2 -> v3:
  - Added more precise language to the commit message.
  - Added an example stack trace and error caused by python2.6 and
    host-libglib2.

 support/dependencies/dependencies.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 58c34d880f..d0b6bdc23a 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -181,6 +181,14 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+# Check that the python version is at least 2.7
+PYTHON_VERSION=$(python -V 2>&1 |awk '{print $2}')
+if [ $(echo $PYTHON_VERSION |sed -e 's/\.//g') -lt 2700 ]; then
+	echo
+	echo "You have python '$PYTHON_VERSION' installed.  Python >= 2.7 is required"
+	exit 1;
+fi
+
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
 		echo
-- 
2.19.2
