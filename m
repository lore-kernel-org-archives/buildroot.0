From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:21:09 +0100
Subject: [Buildroot] [git commit] support/dependencies: add check for c++
 multilib
Message-ID: <20180206162120.BE64888508@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27d22296927d7e4ec0965f2bdaa272b1e8ea15e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages build C++ 32bits host-tools and need the g++-multilib to
be installed on the build machine. As example, qt5webengine builds a C++
host-tool when target is 32bits.

Add the check for g++-multilib to the dependencies script; and update
the Dockerfile to install g++-multilib package.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 8 ++++++++
 support/docker/Dockerfile            | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a195c62c8c..1804e85508 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -249,6 +249,14 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 		echo "For other distributions, refer to their documentation."
 		exit 1
 	fi
+
+	if ! echo "int main(void) {}" | g++ -m32 -x c++ - -o /dev/null 2>/dev/null; then
+		echo
+		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
+		echo "If you're running a Debian/Ubuntu distribution, install the g++-multilib package."
+		echo "For other distributions, refer to their documentation."
+		exit 1
+	fi
 fi
 
 # Check that the Perl installation is complete enough for Buildroot.
diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 474e073c61..ce3fdd9cc2 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -22,7 +22,7 @@ COPY apt-sources.list /etc/apt/sources.list
 RUN dpkg --add-architecture i386 && \
     apt-get update -y && \
     apt-get install -y --no-install-recommends \
-        build-essential cmake libc6:i386 gcc-multilib \
+        build-essential cmake libc6:i386 g++-multilib \
         bc ca-certificates file locales rsync \
         cvs bzr git mercurial subversion wget \
         cpio unzip \
