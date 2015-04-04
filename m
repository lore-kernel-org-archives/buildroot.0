From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:02:46 +0200
Subject: [Buildroot] [git commit] toolchain/external: do not accept
	distro-class toolchains
Message-ID: <20150404150257.E747E80720@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=defb9658935357aca034276df4e78ac9b12c38ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Distro toolchains, i.ie. toolchains coing with distributions, will
almost invariably be unsuitable for use with Buildroot:
  - they are mostly non-relocatable;
  - their sysroot is tainted with a lot of extra libraries.

Especially, the toolchains coming with Ubuntu (really, all the Debian
familly of distros) are configured with --sysroot=/ which makes them
non-relocatable, and they already contain quite some libraries that
conflict (in any combination of version, API or ABI) with what Buildroot
wants to build (i.e. extra libraries, some not even present in
Buildroot...) but also their mere preence when Buildroot does not expect
them to be already built (so that a package would enable features when
it should not).

So, try to detect those toolchains and black-list them; inform the user
that the toolchain is unusable for the reasons mentioned above.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 50446ce..257fab2 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -357,6 +357,14 @@ check_unusable_toolchain = \
 		echo "them unsuitable as external toolchains for build systems" ; \
 		echo "such as Buildroot." ; \
 		exit 1 ; \
+	fi; \
+	with_sysroot=`$${__CROSS_CC} -v 2>&1 |sed -r -e '/.* --with-sysroot=([^[:space:]]+)[[:space:]].*/!d; s//\1/'`; \
+	if test "$${with_sysroot}"  = "/" ; then \
+		echo "Distribution toolchains are unsuitable for use by Buildroot," ; \
+		echo "as they were configured in a way that makes them non-relocatable,"; \
+		echo "and contain a lot of pre-built libraries that would conflict with"; \
+		echo "the ones Buildroot wants to build."; \
+		exit 1; \
 	fi
 
 #
