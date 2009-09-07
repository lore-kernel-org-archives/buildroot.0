From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Sep 2009 00:09:51 +0200
Subject: [Buildroot] [PATCH 3/5] By default,
	put the output in an output/ directory
In-Reply-To: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c27ac42abbb6951472debf9feceb523f37119bef.1252361088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of putting all the build-related stuff as a mess in the
Buildroot sources, group them in an output/ directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 61c2b80..1fe9351 100644
--- a/Makefile
+++ b/Makefile
@@ -217,8 +217,6 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # Buildroot supports building out of tree similarly to the Linux kernel.
 # To use, add O= to the make command line (make O=/tmp/build)
-BASE_DIR:=$(shell pwd)
-ifdef O
 ifeq ("$(origin O)", "command line")
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
@@ -228,7 +226,8 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # forwards command line variable definitions those packages get very
 # confused. Fix this by telling make to not do so
 MAKEOVERRIDES =
-endif
+else
+BASE_DIR := $(shell mkdir -p output && cd output && pwd)
 endif
 
 TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
-- 
1.6.0.4
