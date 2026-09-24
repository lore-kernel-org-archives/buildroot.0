Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A70BC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7669F811E9;
	Thu, 24 Sep 2026 18:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zafPrX13MAk; Thu, 24 Sep 2026 18:29:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6109B811EA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790274556;
	b=k82TrHuLPEeIPysPzijOQMxJaBeVVzpfwDeSUOyukFUB1X4nR2Tfp6T3VTEq+deXQVYy
	 GLkr7ALv6vaednh+yxIvifAOXtgR9ZHvPhJYAyl6evEh60klyEfdAQAgmXIe5jvGP4CyD
	 keoc48hamOt+8rowgfO4vqxfxa5Lh59ReoaUC2lvvS94hmA1Zoa1BQj2PJ0vXhxE4OHj/
	 a5fPRz7NwrvGivBvEGgUemFTHfXqDmYVaNeou8Mw16xkMhCPBFm8nKVAyrZh5BBPoYYsn
	 aXes70PeNtFoarE+LljkRLHGCZ6IYPRUBldbcROEqC24c8eDBU+cq9vSh6Bk8gKJZYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790274556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=83wNe3B6wMLFknbkC1pesJzI79ihmJqJyS8kHn3AKXA=;
	b=Jl0u0ln0tBB5Y179Aq7EkIT4XLsvxDe13QuOiC+pzs/lkVUd7mw/QjUal2F5wU/oHz+l
	 kStMV4vYIPcSA7QDiGroJN8VDmwH6sGszF3qIRGMLGEdNVRch7IegTXTdME6xNMCOp8y1
	 LyMpqdAOVBzdRlZLOIPfnJogHlICFcDhN1hL3hVWKKybUzdnra/yf7EJwJ8OjLtHDQTn0
	 TYZL958Ls2yW2+ZhPiNOBXcVUf8w9v3UoklfNWo094Eqo7surhCBx8+TjgckyH7A8HAut
	 JBBXpwaaa5WbtUt97st94c0kN5kHYzYwoHq3uWO5tFm1dMt9YX3SF6mwki4N0sZ+4rw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790274556;
	bh=83wNe3B6wMLFknbkC1pesJzI79ihmJqJyS8kHn3AKXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NF2yO0JbjHFB5yinM3QQssb3MFcWVy5V/CBror3PeVFlDz3tGnjJISJ6sXTo+wvOd
	 3yBoSxYoydpb5W5wml1Mr9laAyoai6mrlHeQHc+Cfi7pKO/x12KsVS/LaNKfspeNv5
	 F+QFIe1l9uo0vHPt/pM5ZFXHewQSa0QgRojhwe0bDn9LNFiCfsdmuT5MN0hDZQzXu7
	 PcrI+r09uFqlVGs9U6rDJr2bqlEdYM9pPzHOHGyaPBWhn9Or/IxKPCQjqFK202MvpG
	 njW2IvXkElGDQs2l7tOejD3546QR8cVswU9WUBvmftgD8me/Jhz+tVhzcz/uioPnj3
	 8s9rCwUrX+lSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6109B811EA;
	Thu, 24 Sep 2026 18:29:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE68332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2A71811EC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIdSDv-CE7cF for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 926C1811E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790274553;
 b=ojM44BfhIEBx3l+uxKKB5YGFUcJbvuyHcip2WSL5cDCz8OpmaXwTZfSebXH1uAsWxxm9
 iF1Zl/uwR0pjRFP2xVfD789TSVY7dKpIEUETEOeAfB65ZpAS9+KxrO70+RxhTPR6XKAsB
 lP6sBqa0vN1y9k5Pwjk1jdIOctsqPVueHLbe8V9I6Tx4Vaupy1k4+N0PIEHv1Uce84EhH
 sPpMgu6+xTBCxuxK0gZfH+Kbkf7JhIUfzeEhp1zqpHzwW8DkFMywb/Z+4VkS3xWQN2XuZ
 LXYdkcjxf7ZnE6FI6bWO2nw+DfqfI9W2+eWWs4KjBY7R6niP8BCwrh/XR70cW2zwouQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790274553;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BUHNjFOWVpXVsjCwyu1jKZWfq6hlPACaUjOt8llhJz0=;
 b=Rr0SUN9SAkwLWjW/4ITrok2SBc+5Th6TslKmPBiQ3ln20S5epSoj3yYagjrbfxr9WwHc
 pTKk54sQulClw7P6FygFBbj4SEhuu8QpJ14Mw1dHoyt+VcEoDSquOAUyrt7Iw6jaMRoPF
 V0erS+avdeYBcI87LAVNDnobl2xjZDfPF4QRjvsb5XHto6PldHfZh8ciIrSgAde1vhie1
 YQyj2fI9QANC3tvmyB/680pohp/wFG0IS6syQDyBeI+5OHsgpH6Ybb/McmbCcchG77cQL
 OmUGoEj96qWBWgtR7oVTXPN9LL2O0a6h0Sh4uok7U5ADKHax4Fc7vhulJuwmTylPB9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 926C1811E9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 296A69837E; Thu, 24 Sep 2026 18:28:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Sep 2026 19:23:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4919a5fecfd64d8ea05a0f7fa1f5e1dd9f0aeb1a
X-Git-Newrev: 08b06173bd3c95f0fa532b38533e10e558eec602
X-Patchwork-Hint: ignore
Message-Id: <20260924182803.296A69837E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: fix build with
 pango >= 1.58.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08b06173bd3c95f0fa532b38533e10e558eec602
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit c3aa6774563d20901fd1370f51ef105180665b54 bumped pango
to 1.58.0 causing a build error with flutter-engine

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:9:1:
 error: redefinition of 'glib_autoptr_clear_PangoContext'
    9 | G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:60:3:
 error: 'cleanup' argument is not a function
   60 |   g_autoptr(PangoContext) context = get_pango_context(self);

with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_LIBGTK3=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0005-Fix-building-on-Pango-1.58.0.patch        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
new file mode 100644
index 0000000000..9bb475187b
--- /dev/null
+++ b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
@@ -0,0 +1,33 @@
+From f1c316430713ae7d526f8abc1621b09958aef281 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 21 Sep 2026 22:06:06 +0200
+Subject: [PATCH] Fix building on Pango 1.58.0
+
+This version added the autoptr macros which we no longer need to define.
+
+Upstream: https://github.com/flutter/flutter/pull/193119
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../flutter/shell/platform/linux/fl_accessible_text_field.cc  | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+index e99b123bbfd..f7955a32f07 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+@@ -6,7 +6,11 @@
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_standard_message_codec.h"
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_value.h"
+ 
++// PangoContext g_autoptr macro weren't added until 1.58.0. Add them manually.
++// https://gitlab.gnome.org/GNOME/pango/-/commit/223b147
++#if !PANGO_VERSION_CHECK(1, 58, 0)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
++#endif
+ // PangoLayout g_autoptr macro weren't added until 1.49.4. Add them manually.
+ // https://gitlab.gnome.org/GNOME/pango/-/commit/0b84e14
+ #if !PANGO_VERSION_CHECK(1, 49, 4)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
