From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Dec 2009 22:58:49 +0100
Subject: [Buildroot] [git commit master] Makefile: fix build if CDPATH is
	set in environment
Message-ID: <20091213220341.E01AD762DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7a501e13ccf76814743ea7a5b46606762505c34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Bj?rn Forsman <bjorn.forsman@gmail.com>.

If CDPATH is set in the environment, cd <dir> will print the absolute path
of <dir>, causing various trouble (The most critical being BASE_DIR ending
up as <path> <path> which breaks basically everything).

Fix it by clearing CDPATH. Notice that export doesn't affect the environment
of $(shell ..) calls, so explicitly throw away any output from cd in the
BASE_DIR shell call.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index bf04773..5b71051 100644
--- a/Makefile
+++ b/Makefile
@@ -232,7 +232,12 @@ else
 MAKEOVERRIDES =
 endif
 
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
+# bash prints the name of the directory on 'cd <dir>' if CDPATH is
+# set, so unset it here to not cause problems. Notice that the export
+# line doesn't affect the environment of $(shell ..) calls, so
+# explictly throw away any output from 'cd' here.
+export CDPATH:=
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
-- 
1.6.3.3
