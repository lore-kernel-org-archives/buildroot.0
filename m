From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:56:26 +0200
Subject: [Buildroot] [git commit] package/pkg-meson.mk: fix setting host C++
 compiler
Message-ID: <20210328203147.2BF018648F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00d41f58ebb286d88914eb3d3501ebf9e4a86b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f4a61d1ae23ec7729af3a8a165bbee45b6b9ef75 introduced CC_FOR_BUILD and
CXX_FOR_BUILD to avoid detecting ccache.

Both values are set to `HOSTCC`. This causes issues where C++ files are
compiled with the C compiler without passing the `stdc++` flag to the
linker, too.

Therefore, switch to pass the C++ compiler to CXX_FOR_BUILD.

Correctly fixes:
http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a

Commit 9783c04aaf5e4fc94099772f1dc699a974ee6538 proposed a fix which in
fact is a workaround to get Meson to pass the `stdc++` flag to the C
linker.

A fellow-up commit will revert this commit, as it is no longer
needed.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index aafb441fae..a57820d4d2 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -83,7 +83,7 @@ define $(2)_CONFIGURE_CMDS
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
-	CXX_FOR_BUILD="$$(HOSTCC)" \
+	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
 	$$(MESON) \
 		--prefix=/usr \
