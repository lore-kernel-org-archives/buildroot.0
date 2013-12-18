From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Dec 2013 11:36:44 +0100
Subject: [Buildroot] [PATCH v10 5/8] glibc: add support for top-level
	parallel make
In-Reply-To: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1387363007-19846-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng
on the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

The glibc-install-target depends on glibc-install-staging so add a
rule for it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/glibc/glibc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3013df3..621ce5f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -142,3 +142,6 @@ $(eval $(autotools-package))
 
 # Before (e)glibc is built, we must have the second stage cross-compiler
 $(GLIBC_TARGET_BUILD): | host-gcc-intermediate
+
+# The glic-install-target use files from glibc-install-staging
+$(GLIBC_TARGET_INSTALL_TARGET): $(GLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.5
