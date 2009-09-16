From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2009 23:07:43 +0200
Subject: [Buildroot] [PATCH 3/6] By default,
	put the output in an output/ directory
In-Reply-To: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1253135266-26880-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of putting all the build-related stuff as a mess in the
Buildroot sources, group them in an output/ directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index cfa5778..8b07786 100644
--- a/Makefile
+++ b/Makefile
@@ -217,21 +217,18 @@ ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-# Buildroot supports building out of tree similarly to the Linux kernel.
-# To use, add O= to the make command line (make O=/tmp/build)
-BASE_DIR:=$(shell pwd)
-ifdef O
-ifeq ("$(origin O)", "command line")
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
-$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
-
+ifneq ("$(origin O)", "command line")
+O:=output
+else
 # other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. Busybox does). As make automatically
 # forwards command line variable definitions those packages get very
 # confused. Fix this by telling make to not do so
 MAKEOVERRIDES =
 endif
-endif
+
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
+$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
 TOPDIR_SUFFIX:=_$(call qstrip,$(BR2_TOPDIR_SUFFIX))
-- 
1.6.0.4
