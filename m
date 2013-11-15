From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 15 Nov 2013 15:40:19 +0100
Subject: [Buildroot] [PATCH v9 5/8] glibc: add support for top-level
	parallel make
In-Reply-To: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
References: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1384526422-30142-6-git-send-email-fabio.porcedda@gmail.com>
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
index 460d2c1..0226d05 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -130,3 +130,6 @@ $(eval $(autotools-package))
 
 # Before (e)glibc is built, we must have the second stage cross-compiler
 $(GLIBC_TARGET_BUILD): | host-gcc-intermediate
+
+# The glic-install-target use files from glibc-install-staging
+$(GLIBC_TARGET_INSTALL_TARGET): $(GLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.4.2
