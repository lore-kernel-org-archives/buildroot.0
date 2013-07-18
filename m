From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 18 Jul 2013 11:12:26 +0200
Subject: [Buildroot] [PATCH v2 3/3] package: fix generic patch target for
	top-level parallel make
In-Reply-To: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1374138746-23279-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must don't depend in a rule
on the order of evaluation of the prerequisites, so instead of reling on
the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

Add a rule to specify that the $(2)_TARGET_PATCH target depends
on $(2)_TARGET_EXTRACT target.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f29ea99..bd03575 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -389,7 +389,8 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(1)-configure:		$(1)-patch $(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+$$($(2)_TARGET_PATCH):		$$($(2)_TARGET_EXTRACT)
+$(1)-patch:			$$($(2)_TARGET_PATCH)
 
 $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 $(1)-extract:			$$($(2)_TARGET_EXTRACT)
-- 
1.8.1.4
