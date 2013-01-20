From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:14 +0100
Subject: [Buildroot] [RFC v1 05/14] autotools infrastructure: do the
	autoreconf as a post patch step
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing the autoreconf step as a pre-configure hook doesn't work
properly, because the source directory is read-only during the
configure step. And in fact, the autoreconf process modifies the
source code, so it is quite logical to do it as part of the patching
process rather than the configuration process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index bd87253..ec394fd 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -214,7 +214,7 @@ $(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),
 
 
 ifeq ($$($(2)_AUTORECONF),YES)
-$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
+$(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
-- 
1.7.9.5
