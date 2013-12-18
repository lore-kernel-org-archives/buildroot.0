From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Dec 2013 11:36:43 +0100
Subject: [Buildroot] [PATCH v10 4/8] uclibc: add support for top-level
	parallel make
In-Reply-To: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1387363007-19846-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng
on the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

The uclibc-install-target depends on uclibc-install-staging so add a
rule for it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uclibc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 56761f6..e74ec64 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -551,3 +551,6 @@ $(eval $(generic-package))
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
+
+# The uclibc-install-target use files from uclibc-install-staging
+$(UCLIBC_TARGET_INSTALL_TARGET): $(UCLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.5
