From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 16:14:55 +0100
Subject: [Buildroot] [PATCH 1/2 v3] toolchain/external: do not accept
	distro-class toolchains
In-Reply-To: <cover.1426604262.git.yann.morin.1998@free.fr>
References: <cover.1426604262.git.yann.morin.1998@free.fr>
Message-ID: <ce03f650233efff77aabd4450a9e4b458f7108ea.1426604262.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2:
  - update the comment to specify both non-relocatable and polution
    (Thomas and Arnout)
---
 toolchain/helpers.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..3afb6d6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -347,6 +347,14 @@ check_unusable_toolchain = \
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
-- 
1.9.1
