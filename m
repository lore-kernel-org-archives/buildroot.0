From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:48:47 +0100
Subject: [Buildroot] [git commit] core: remove redundant "override O := $(O)"
Message-ID: <20161103204902.965E481972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2048e22fa1fe2d5ff654e0fb6a17042254efc2a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The top-level Makefile contains an "override O := $(O)" statement that
is purportedly required to make sure the O flag doesn't leak into the
environment of sub-makes. However, since commit 173135d, there is
already an "override O := ..." a few lines down. Therefore, the first
override is redundant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Makefile b/Makefile
index 4b494a3..cb030d4 100644
--- a/Makefile
+++ b/Makefile
@@ -34,13 +34,6 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 # build by preventing it from being forwarded to sub-make calls.
 ifneq ("$(origin O)", "command line")
 O := $(CURDIR)/output
-else
-# Strangely enough O is still passed to submakes with MAKEOVERRIDES
-# (with make 3.81 atleast), the only thing that changes is the output
-# of the origin function (command line -> environment).
-# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
-# To really make O go away, we have to override it.
-override O := $(O)
 endif
 
 # Check if the current Buildroot execution meets all the pre-requisites.
