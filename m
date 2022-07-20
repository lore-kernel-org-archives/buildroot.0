Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48BCC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587EE60E39;
	Wed, 20 Jul 2022 11:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587EE60E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdieocXBmBj8; Wed, 20 Jul 2022 11:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B9D60BE1;
	Wed, 20 Jul 2022 11:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B9D60BE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7B941BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90FC860BE1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FC860BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBcGpGi98J3Z for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:47:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAD7F60A8C
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD7F60A8C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C031C83FBA; Wed, 20 Jul 2022 11:33:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 13:46:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a81caea821199a2932f82ad24b1ee93c577a0477
X-Git-Newrev: 5a73e4cca998d2e456c13b7bc85e2e7499f81ed5
X-Patchwork-Hint: ignore
Message-Id: <20220720113355.C031C83FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: fix build with gcc < 7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a73e4cca998d2e456c13b7bc85e2e7499f81ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc < 7 raised since bump to
version 4.4.0 in commit e186b4d89dcd3eb9fae557959181d7176e7c873c:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-verify.cc:27:
../src/hb-cplusplus.hh:170:13: error: specialization of 'template<class _Tp> struct std::hash' in different namespace [-fpermissive]
 struct std::hash<hb::shared_ptr<T>>
             ^

Fixes:
 - http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-cplusplus-Fix-build-on-GCC-7.patch        | 50 +++++++++++++++++++
 .../harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch    | 56 ++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
new file mode 100644
index 0000000000..de2955d8b5
--- /dev/null
+++ b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
@@ -0,0 +1,50 @@
+From 7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927 Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Wed, 6 Jul 2022 12:58:15 +0200
+Subject: [PATCH] [cplusplus] Fix build on GCC < 7
+
+[Retrieved from:
+https://github.com/harfbuzz/harfbuzz/commit/7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/hb-cplusplus.hh | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/hb-cplusplus.hh b/src/hb-cplusplus.hh
+index 86d0452080..f06a32d912 100644
+--- a/src/hb-cplusplus.hh
++++ b/src/hb-cplusplus.hh
+@@ -166,8 +166,14 @@ HB_DEFINE_VTABLE (unicode_funcs);
+ 
+ } // namespace hb
+ 
++/* Workaround for GCC < 7, see:
++ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56480
++ * https://stackoverflow.com/a/25594741 */
++namespace std {
++
++
+ template<typename T>
+-struct std::hash<hb::shared_ptr<T>>
++struct hash<hb::shared_ptr<T>>
+ {
+     std::size_t operator()(const hb::shared_ptr<T>& v) const noexcept
+     {
+@@ -177,7 +183,7 @@ struct std::hash<hb::shared_ptr<T>>
+ };
+ 
+ template<typename T>
+-struct std::hash<hb::unique_ptr<T>>
++struct hash<hb::unique_ptr<T>>
+ {
+     std::size_t operator()(const hb::unique_ptr<T>& v) const noexcept
+     {
+@@ -187,6 +193,8 @@ struct std::hash<hb::unique_ptr<T>>
+ };
+ 
+ 
++} // namespace std
++
+ #endif /* __cplusplus */
+ 
+ #endif /* HB_CPLUSPLUS_HH */
diff --git a/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
new file mode 100644
index 0000000000..d3355443b7
--- /dev/null
+++ b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
@@ -0,0 +1,56 @@
+From 79eb0f74860fb6309e3162b4f17f98481c05a318 Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Wed, 6 Jul 2022 13:29:55 +0200
+Subject: [PATCH] [GSUB] Fix build on GCC < 7
+
+[Retrieved (and backported) from:
+https://github.com/harfbuzz/harfbuzz/commit/79eb0f74860fb6309e3162b4f17f98481c05a318]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/OT/Layout/GSUB/GSUB.hh     | 5 +++--
+ src/hb-ot-layout-gsub-table.hh | 8 ++++----
+ 2 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/OT/Layout/GSUB/GSUB.hh b/src/OT/Layout/GSUB/GSUB.hh
+index 372862e2bb..750dca1da3 100644
+--- a/src/OT/Layout/GSUB/GSUB.hh
++++ b/src/OT/Layout/GSUB/GSUB.hh
+@@ -5,9 +5,10 @@
+ #include "Common.hh"
+ #include "SubstLookup.hh"
+ 
+-using OT::Layout::GSUB::SubstLookup;
+-
+ namespace OT {
++
++using Layout::GSUB::SubstLookup;
++
+ namespace Layout {
+ 
+ /*
+diff --git a/src/hb-ot-layout-gsub-table.hh b/src/hb-ot-layout-gsub-table.hh
+index 1eca613b6a..50301ff1d9 100644
+--- a/src/hb-ot-layout-gsub-table.hh
++++ b/src/hb-ot-layout-gsub-table.hh
+@@ -32,9 +32,8 @@
+ #include "OT/Layout/GSUB/GSUB.hh"
+ 
+ namespace OT {
+-
+-using Layout::GSUB::SubstLookup;
+-using Layout::GSUB::ExtensionSubst;
++namespace Layout {
++namespace GSUB {
+ 
+ // TODO(garretrieger): Move into the new layout directory.
+ /* Out-of-class implementation for methods recursing */
+@@ -82,7 +81,8 @@ inline bool SubstLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_app
+ }
+ #endif
+ 
+-
++} /* namespace GSUB */
++} /* namespace Layout */
+ } /* namespace OT */
+ 
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
