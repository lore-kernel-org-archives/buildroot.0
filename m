From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 17:34:34 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: call MESSAGE when saving
	package legal-info
Message-ID: <20170703161020.2E3D97F8BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f49392349f7cf202d13941f7f3b56622a34453a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the per-package legal-info is mostly silent, but we're soon
to add a check for the hashes of the license files.

In that case, and when there is a hash mis-match, we want a user to know
what package had a changed license file.

So, we add a call to MESSAGE to display the package we're currently
saving the legal-info of, like so:

    >>> busybox 1.26.2 Collecting legal info

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f474704..22330ed 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -835,7 +835,9 @@ endif
 endif
 
 # legal-info: produce legally relevant info.
+$(1)-legal-info: PKG=$(2)
 $(1)-legal-info:
+	@$$(call MESSAGE,"Collecting legal info")
 # Packages without a source are assumed to be part of Buildroot, skip them.
 	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
