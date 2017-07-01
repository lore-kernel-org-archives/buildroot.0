From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:26:06 +0200
Subject: [Buildroot] [git commit] Makefile: don't run "menuconfig"
	automatically
Message-ID: <20170701082313.B938781E7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3493069f28368739a7ccf670bd2eecbb2524d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since forever, we run 'menuconfig' automatically on an unconfigured
tree. However, this does not help users that much:
- If they read the documentation, they should already know to run
  make menuconfig first.
- If they haven't read the documentation, dropping them in menuconfig
  isn't very helpful.
- It's a likely that the user didn't intend to be in an unconfigured
  tree (e.g. wrong O= specified), so starting menuconfig (and polluting
  this wrong O= directory) is not very helpful.
- It's possible that the user really doesn't want menuconfig, but
  instead needs xconfig, or some defconfig, or ...

So, instead of trying to guess what the user needs, print an error and
let the user decide what to do next.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 470aa83..8111582 100644
--- a/Makefile
+++ b/Makefile
@@ -811,13 +811,12 @@ check-dependencies:
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
-all: menuconfig
-
 # Some subdirectories are also package names. To avoid that "make linux"
 # on an unconfigured tree produces "Nothing to be done", add an explicit
 # rule for it.
+# Also for 'all' we error out and ask the user to configure first.
 .PHONY: linux toolchain
-linux toolchain:
+linux toolchain all:
 	$(error Please configure Buildroot first (e.g. "make menuconfig"))
 	@exit 1
 
