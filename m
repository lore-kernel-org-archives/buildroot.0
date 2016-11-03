From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 3 Nov 2016 02:55:17 +0100
Subject: [Buildroot] [PATCH 2/2] core: remove redundant "override O := $(O)"
In-Reply-To: <20161103015517.15943-1-arnout@mind.be>
References: <20161103015517.15943-1-arnout@mind.be>
Message-ID: <20161103015517.15943-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The top-level Makefile contains an "override O := $(O)" statement that
is purportedly required to make sure the O flag doesn't leak into the
environment of sub-makes. However, since commit 173135d, there is
already an "override O := ..." a few lines down. Therefore, the first
override is redundant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I haven't been able to reproduce the issue mentioned in the comment
(tested by printing the value of $(O) in a dummy package) with make 4.1.
I therefore removed the comment completely.
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
-- 
2.9.3
