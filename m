Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B211C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E569140BE1;
	Wed,  8 Feb 2023 11:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E569140BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haHrLYgtgWrQ; Wed,  8 Feb 2023 11:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 285EA40BD2;
	Wed,  8 Feb 2023 11:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 285EA40BD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 419151BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B706410DE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B706410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFw2Fj12NmDg for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B8D409E7
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83B8D409E7
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:06:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id fj20so1395152edb.1
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 03:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cHtsT5YchId3Q2OPWdwGlmcO/gAmRaAPGrz7ctNiaLY=;
 b=mRzkxRuhbC8vqKIcgkE+HPJpgZ7fwAWqUMxFZ3YD63ExDIOPu2rosoOHdXRCYygdni
 o+U61WASUbTq2F1M+q7G4wVufyZMFNahjhZG/RXqWjqnTCeZGxWKV2etGttWXjzjm+l1
 4Psotbtm/9u4kQVyUomScIvpkDMp9Qgw29UljpT45/3l9wLiylsdZMCyTxlqCraxacxF
 oWH1yXR8wyIvnrYnAH41KHSpHV4BRbt+O/0HXoAvvYZ+92NhGrcHlzO6q68ZWrTkJ/70
 Eo782feUbMCecIartODYtSwXCJ1hDGdMufjQbIqTMSBBc+/0I9FiFEadlIfLKJGuEZ8l
 KHiA==
X-Gm-Message-State: AO0yUKXaauBqrO9fEScQAfh5UA539AhPw3cQHF9vHDioAQNLpJvBbR13
 1uX0KHYab0STimRYdOJv4l2BVIR/GtqSU73LKi4=
X-Google-Smtp-Source: AK7set8r+R0dVoFNOj4sW3zAy7Ms5yXCcJLFsn9d8vcocYgYVUtMvVf9dOWoZE1ignUz1xyzxLHPVw==
X-Received: by 2002:a50:d6de:0:b0:4aa:b2d3:fa45 with SMTP id
 l30-20020a50d6de000000b004aab2d3fa45mr7282749edj.25.1675854373558; 
 Wed, 08 Feb 2023 03:06:13 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 i3-20020aa7c9c3000000b004a087d1d313sm7577078edt.64.2023.02.08.03.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 03:06:13 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 12:05:51 +0100
Message-Id: <20230208110551.187828-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cHtsT5YchId3Q2OPWdwGlmcO/gAmRaAPGrz7ctNiaLY=;
 b=OEoeFpdzkwwUHxkHcg4o6lGGSjxoy148HO3/9OzJN7tXgZKMScZ/V05av2e3q/Rg+O
 XJtvAAzAeFvTsjKtvhAni64+INY+ZNvrxLjpBxLzpvEFDeQuJyjMd/H+XjqVx+FhlBjg
 Im06S41ClLGLMugwFck5CbhZWEAX+C5NLh5jXkYHJwMAcl2k5FXI03pxMcjw4qHTWWRl
 wSx/KwFXxWIrBzZvJ8B0zLR7utoMU9g1OvWpItQHdttlbGLC22XBdqdOQ1B7kD9btWtB
 f/pHP82fxQPVVZf3IeBV+v97oqIhK8S71NyAitdlFSJlNS/6oCgiyWDFyhooL9pxs/Wo
 5zlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=OEoeFpdz
Subject: [Buildroot] [PATCH 1/1] package/rust: fix boostrap build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The update to v1.67.0 of rust broke the boostrap build. This patch
applies an upstream patch to fix this:
https://github.com/rust-lang/rust/commit/3fe64ebbce21e79adb64099984e96dfb79bdd0f9

Fixes:
http://autobuild.buildroot.org/results/214/214fcbb3458893784b7f85b60f7ee1edb428c77f/build-end.log

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
I previously just tested TestRustBin since TestRust takes forever. This
time I ran TestRust and it builds fine :)
---
 ...-unsoundness-in-bootstrap-cache-code.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
