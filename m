From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:25 +0200
Subject: [Buildroot] [PATCH 11/35] pkg-generic: implement <pkg>-all-{source,
	legal-info, external-deps} targets
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to implement the global 'make source', 'make legal-info' and
'make external-deps' using the package infrastructure logic, this
commit introduces a set of per-package targets that allow to
recursively run the source/legal-info/external-deps actions on the
dependencies of a given package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 08e4cad..ba24591 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -587,6 +587,12 @@ $(1)-graph-depends: graph-depends-requirements
 			|tee $$(O)/graphs/$$(@).dot \
 			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)
 
+$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
+
+$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
+
+$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
+
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-reinstall:
-- 
2.1.0
