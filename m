From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 16:43:40 +0100
Subject: [Buildroot] [git commit] at: uses fork(), so requires MMU
Message-ID: <20120319154430.30F49953F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c45d64a678fe541ff959d3a64ba8478eba041237
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following problem:

atd.o: In function `run_file':
atd.c:(.text+0x35c): undefined reference to `fork'
atd.c:(.text+0x75c): undefined reference to `fork'
daemon.o: In function `daemon_setup':
daemon.c:(.text+0x4bc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [atd] Error 1
make[1]: Leaving directory `/home/test/test/output/build/at-3.1.12'
make: *** [/home/test/test/output/build/at-3.1.12/.stamp_built] Error 2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/at/Config.in b/package/at/Config.in
index a5d5ef8..d4ddcb2 100644
--- a/package/at/Config.in
+++ b/package/at/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AT
 	bool "at"
+	depends on BR2_USE_MMU
 	help
 	 At and batch read shell commands from standard input and
 	 store them as jobs to be scheduled for execution in the
