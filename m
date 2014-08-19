From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Aug 2014 19:21:15 +0200
Subject: [Buildroot] [PATCH] package/infra: fix downloading versions with a
	slash
Message-ID: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since cset 54456cc (infra: consistently use double dollar signs...), it
is no longer possible to download versions with a slash in it, because
the _DL_VERSION variable is second-expanded, but the _VERSION variable
is immediately-expanded to have '/' substitued with '_'.

So, _DL_VERSION is only expanded at the time it is evaluated, and by
that time, we've lost the slashes in _VERSION.

Make the _DL_VERSION variables immediately-evaluated.

Fixes:
    https://bugs.busybox.net/show_bug.cgi?id=7328

Reported-by:  Vincent Stehl? <vincent.stehle@freescale.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc:  Vincent Stehl? <vincent.stehle@freescale.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fb4b849..d04fd36 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -318,14 +318,14 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 # version control system branch or tag, for example remotes/origin/1_10_stable.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_DL_VERSION = $$($(3)_VERSION)
+  $(2)_DL_VERSION := $$($(3)_VERSION)
   $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
  else
   $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
-  $(2)_DL_VERSION = $$($(2)_VERSION)
+  $(2)_DL_VERSION := $$($(2)_VERSION)
   $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
 endif
 
-- 
1.9.1
