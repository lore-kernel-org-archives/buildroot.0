From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:48:56 +0200
Subject: [Buildroot] [git commit] Makefile: reset LD and AR environment
	variables
Message-ID: <20160415074906.E1B3281DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=376737d99dfe7ff0347dcc278e16001573314aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The goal is to fix the compilation of perf (from linux) when LD or AR
variables are inherited from the environment.
After the linux upstream commits 5ef7bbb09f7b ("perf tools: Allow to
specify custom linker command") and 3c71ba3f80bb ("perf tools: Really allow
to specify custom CC, AR or LD") CC, AR, and LD variables are not overridden
if they are inherited.

In case of a cross compilation, it results in an inconsistent state: CC is
overridden but not LD and AR.

Linux-patch: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5ef7bbb09f7b
Linux-patch: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3c71ba3f80bb

Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index ea8b1e4..55735ea 100644
--- a/Makefile
+++ b/Makefile
@@ -343,6 +343,8 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 unexport CROSS_COMPILE
 unexport ARCH
 unexport CC
+unexport LD
+unexport AR
 unexport CXX
 unexport CPP
 unexport RANLIB
