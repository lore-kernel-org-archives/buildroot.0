From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:10:22 +0200
Subject: [Buildroot] [git commit] Makefile: unconfigured "make toolchain"
	should run report error
Message-ID: <20170701080729.3835F81932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=503439f99a8b1a7f762ed184082b0c97800ffae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Alessandro Power on StackOverflow [1], the behaviour
of "make toolchain" in an unconfigured tree is misleading.

When .config doesn't exist, we don't read in the package .mk files, so
"make <package>" doesn't work:

    $ make busybox
    make: *** No rule to make target 'busybox'.  Stop.

However, for "linux" and "toolchain", the corresponding file (or
actually directory) already exists. So instead, we get:

    $ make linux
    make: Nothing to be done for 'linux'.

This is confusing, because it looks as if the build succeeded.

The obvious solution is to make linux and toolchain PHONY targets when
.config doesn't exist. However, that actually does the reverse, because
then a rule _does_ exist for them and since they don't have
dependencies, make will consider them to be ready.

Therefore, we also have to provide an explicit rule for them, and
explicitly error out. Thise behaviour is still different from other
packages, but at least it is much less confusing.

[1] https://stackoverflow.com/questions/44521150

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 88d98e0..470aa83 100644
--- a/Makefile
+++ b/Makefile
@@ -813,6 +813,14 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
+# Some subdirectories are also package names. To avoid that "make linux"
+# on an unconfigured tree produces "Nothing to be done", add an explicit
+# rule for it.
+.PHONY: linux toolchain
+linux toolchain:
+	$(error Please configure Buildroot first (e.g. "make menuconfig"))
+	@exit 1
+
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # configuration
