From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:01:10 +0200
Subject: [Buildroot] [git commit] dependencies: Reject gcj in
	BR2_NEEDS_HOST_JAVA check
Message-ID: <20140817190117.B49239D396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fa43f911be83555df8789e4739816e762e1ff26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xbmc uses the Groovy java package to generate API code, for details see
http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works

Groovy itself is broken when used with gcj:
http://jira.codehaus.org/browse/GROOVY-3701

Xbmc recommends to use another java package instead, like openjdk:
http://forum.xbmc.org/showthread.php?tid=199742

Until we come up with a host package to provide a java setup and
in order to make autobuilder happy let??s reject gcj when we check
for a java installation on the host.

Currently Xbmc is the only package using BR2_NEEDS_HOST_JAVA
so changing the behaviour of dependencies.sh has no side effects.

Fixes
http://autobuild.buildroot.net/results/213/213d7454a1dc68cfb8f4c8d9508f52ebf8e58e33/
http://autobuild.buildroot.net/results/639/639cda872cf36c122cbd6139dd76f6b51ac1864e/
http://autobuild.buildroot.net/results/c9e/c9eb12c95b2939c64590692a82af8d84bbd90956/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 88e5ad2..a9c5b31 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -189,6 +189,13 @@ fi
 
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
+	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
+	if [ ! -z "$JAVA_GCJ" ] ; then
+		echo
+		echo "$JAVA_GCJ is not sufficient to compile your package selection."
+		echo "Please install an OpenJDK/IcedTea/Oracle Java."
+		exit 1 ;
+	fi
 fi
 
 if grep -q ^BR2_NEEDS_HOST_JAVAC=y $BR2_CONFIG ; then
