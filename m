From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:40:06 +0100
Subject: [Buildroot] [PATCH 2/3] at: uses fork(), so requires MMU
In-Reply-To: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a5c2e3051cefa333cfec4e51d47d24b134a66e1.1332171599.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
1.7.4.1
