From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Thu, 15 Nov 2018 18:45:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: Fix
 show-build-order stdout pollution
Message-ID: <20181115154542.29277-1-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commands like  "make show-build-order" or "make <package>-show-build-order" show
the build order and then print "make[1]: Nothing to be done for 'show-build-order'" to
stdout. It pollutes output. Technically this message is true but it's not true for user
because he gets an information.

The <package>-show-build-order targets use $(info) for package name printing.
The make utility doesn't consider the internal directive as a command so it
think that it's "Nothing to be done". The patch adds the empty command to
<package>-show-build-order to inform make utility that taget makes some real
actions.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f34f46afc8..74f3c55394 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -819,6 +819,7 @@ $(1)-show-recursive-rdepends:
 
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	$$(info $(1))
+	@:
 
 $(1)-graph-depends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--direct)
-- 
2.17.1
