From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 13:22:55 +0100
Subject: [Buildroot] [git commit] dependencies.sh: Check for a host python
 version >= 2.7
Message-ID: <20190204122342.33B6F83848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6809f38351425bd3c407a54e19cf4facdab7db60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Peter: only look at major.minor to handle x.y.z with z < 10]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 58c34d880f..826874baa2 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -181,6 +181,14 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+# Check that the python version is at least 2.7
+PYTHON_VERSION=$(python -V 2>&1 |awk '{ split($2, v, "."); print v[1] v[2] }')
+if [ $PYTHON_VERSION -lt 27 ]; then
+	echo
+	echo "You have '$(python -V 2>&1)' installed.  Python >= 2.7 is required"
+	exit 1;
+fi
+
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
 		echo
