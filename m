From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 22:19:17 +0200
Subject: [Buildroot] [PATCH] Makefile: unconfigured "make toolchain" should
	run menuconfig
In-Reply-To: <7ef9622f-7355-c639-b704-ed7dace1e273@mind.be>
References: <7ef9622f-7355-c639-b704-ed7dace1e273@mind.be>
Message-ID: <20170615201917.16464-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

The obvious solution would be to make linux and toolchain PHONY targets
when .config doesn't exist. However, that actually does the reverse,
because then a rule _does_ exist for them and since they don't have
dependencies, make will consider them to be ready.

Instead, we define linux and toolchain as targets and make them depend
on menuconfig. The behaviour is still different from other packages,
but at least it is less confusing.

[1] https://stackoverflow.com/questions/44521150

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 88d98e0405..f1ae9b0c17 100644
--- a/Makefile
+++ b/Makefile
@@ -813,6 +813,11 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
+# Some subdirectories are also package names. To avoid that "make linux"
+# on an unconfigured tree produces "Nothing to be done", add an explicit
+# rule for it.
+linux toolchain: menuconfig
+
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # configuration
-- 
2.11.0
