From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 Jan 2014 11:06:04 +0100
Subject: [Buildroot] [PATCH v11 4/8] uclibc: add support for top-level
	parallel make
In-Reply-To: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1389348368-2509-5-git-send-email-fabio.porcedda@gmail.com>
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
index 902c0a2..e26fb0f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -554,3 +554,6 @@ $(eval $(generic-package))
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
+
+# The uclibc-install-target use files from uclibc-install-staging
+$(UCLIBC_TARGET_INSTALL_TARGET): $(UCLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.5.2
