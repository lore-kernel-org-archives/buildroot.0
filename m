Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2BCC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394EC403A7;
	Wed,  8 Feb 2023 14:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394EC403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23GotFrQ3M10; Wed,  8 Feb 2023 14:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79724404EE;
	Wed,  8 Feb 2023 14:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79724404EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2261BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD16980C1C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD16980C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDjG9WCa_g2K for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D568481FE4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D568481FE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C272E846F1; Wed,  8 Feb 2023 14:48:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:34:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b021bc1d77ce485ac46114482024d12339d6b5b
X-Git-Newrev: 7df32882203fdd525156ddb785d171b193e5b282
X-Patchwork-Hint: ignore
Message-Id: <20230208144829.C272E846F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: fix bootstrap build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7df32882203fdd525156ddb785d171b193e5b282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update to v1.67.0 of rust broke the bootstrap build. This patch
applies an upstream patch to fix this:
https://github.com/rust-lang/rust/commit/3fe64ebbce21e79adb64099984e96dfb79bdd0f9

Fixes:
http://autobuild.buildroot.org/results/214/214fcbb3458893784b7f85b60f7ee1edb428c77f/build-end.log

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-fix-unsoundness-in-bootstrap-cache-code.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch b/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch
new file mode 100644
index 0000000000..3eae34642f
--- /dev/null
+++ b/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch
@@ -0,0 +1,43 @@
+From 6bf37780ed49846c78d6707355f1cf44790c4301 Mon Sep 17 00:00:00 2001
+From: Michael Goulet <michael@errs.io>
+Date: Mon, 12 Dec 2022 18:29:33 +0000
+Subject: [PATCH] =?UTF-8?q?=F0=9F=9A=A8=20fix=20unsoundness=20in=20bootstr?=
+ =?UTF-8?q?ap=20cache=20code?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 3fe64ebbce21e79adb64099984e96dfb79bdd0f9)
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ src/bootstrap/cache.rs | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bootstrap/cache.rs b/src/bootstrap/cache.rs
+index be5c9bb0788..05f25af68ea 100644
+--- a/src/bootstrap/cache.rs
++++ b/src/bootstrap/cache.rs
+@@ -89,16 +89,16 @@ fn hash<H: Hasher>(&self, state: &mut H) {
+ 
+ impl<T: Internable + Deref> Deref for Interned<T> {
+     type Target = T::Target;
+-    fn deref(&self) -> &'static Self::Target {
++    fn deref(&self) -> &Self::Target {
+         let l = T::intern_cache().lock().unwrap();
+-        unsafe { mem::transmute::<&Self::Target, &'static Self::Target>(l.get(*self)) }
++        unsafe { mem::transmute::<&Self::Target, &Self::Target>(l.get(*self)) }
+     }
+ }
+ 
+ impl<T: Internable + AsRef<U>, U: ?Sized> AsRef<U> for Interned<T> {
+-    fn as_ref(&self) -> &'static U {
++    fn as_ref(&self) -> &U {
+         let l = T::intern_cache().lock().unwrap();
+-        unsafe { mem::transmute::<&U, &'static U>(l.get(*self).as_ref()) }
++        unsafe { mem::transmute::<&U, &U>(l.get(*self).as_ref()) }
+     }
+ }
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
