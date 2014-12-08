From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:32:21 +0100
Subject: [Buildroot] [git commit] support/scripts/dependencies.sh: improve
	g++ test to avoid misleading output
Message-ID: <20141208213302.91AF180148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1607dc7dfc2c5397ff6b67ebd18d25c6184f650
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When g++ is not installed, a misleading error message turns up because
of a bad combination of an unquoted shell variable and control flow.

 ~/buildroot$ make
 You may have to install 'g++' on your build machine
 /home/testuser/buildroot/support/dependencies/dependencies.sh: 136: [: -lt: unexpected operator

[Thomas:
  - fixed commit log, as per the suggestion of Yann E. Morin.
  - don't change existing empty new lines, suggested by Yann.
  - use positive logic in the newly added test, suggested by Yann.]

Signed-off-by: Jens Stimpfle <debian@jstimpfle.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index af5ce0e..44e212d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -133,7 +133,9 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 		echo
 		echo "You may have to install 'g++' on your build machine"
 	fi
+fi
 
+if [ -n "$CXXCOMPILER_VERSION" ] ; then
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
