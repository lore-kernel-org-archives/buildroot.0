From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 29 Nov 2017 12:10:24 -0500
Subject: [Buildroot] [PATCH 1/1] support/dependencies: add check for c++
 multilib
Message-ID: <20171129171024.26931-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages build C++ 32bits host-tools and need the g++-multilib to
be installed on the build machine. As example, qt5webengine builds a C++
host-tool when target is 32bits.

Add the check for g++-multilib to the dependencies script; and update
the Dockerfile to install g++-multilib package.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

There are two solutions to solve this issue:

The first one consists in checking for g++-multilib when the config
option BR2_HOSTARCH_NEEDS_IA32_COMPILER is set; even if it is not
required. The implementation is simple (see patch below).

The second solution consists in creating a new config option for
packages that needs g++-multilib to be installed. As example:
BR2_HOSTARCH_NEEDS_IA32_CXX_COMPILER is a good candidate. [For a matter
of consistency, I would also rename BR2_HOSTARCH_NEEDS_COMPILER into
BR2_HOSTARCH_NEEDS_IA32_C_COMPILER (adding C_); but I do not want to do
that to not break existing configurations that are no in-tree].

Which solution do you prefer?

 support/dependencies/dependencies.sh | 8 ++++++++
 support/docker/Dockerfile            | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a195c62c8c..f75ffb96c1 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -249,6 +249,14 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 		echo "For other distributions, refer to their documentation."
 		exit 1
 	fi
+
+	if ! echo "int main(void) {}" | gcc -m32 -x cpp - -o /dev/null 2>/dev/null; then
+		echo
+		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
+		echo "If you're running a Debian/Ubuntu distribution, install the g++-multilib package."
+		echo "For other distributions, refer to their documentation."
+		exit 1
+	fi
 fi
 
 # Check that the Perl installation is complete enough for Buildroot.
diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d45b23dc23..e975e66eb2 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -15,7 +15,7 @@ RUN dpkg --add-architecture i386
 # The container has no package lists, so need to update first
 RUN apt-get update -y -qq
 RUN apt-get install -y -qq --no-install-recommends \
-    build-essential cmake libc6:i386 gcc-multilib \
+    build-essential cmake libc6:i386 g++-multilib \
     bc ca-certificates file locales rsync \
     cvs bzr git mercurial subversion wget \
     cpio unzip \
-- 
2.15.0
