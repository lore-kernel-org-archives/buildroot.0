Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFBACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D46612D0;
	Fri, 16 Oct 2026 13:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7LxKUfEko32; Fri, 16 Oct 2026 13:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BFEE612E1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156383;
	b=N74yf29bOsM5GkqoQaLJGmdz/H6XQRaGLNvdbCgkbEzW28CFJxRt+yKVTGK8VgTJCqEh
	 mauPApF4zccoinImjtg6K7lNCb1dWGvaHxSL4lxmBrcfdZvIMGMyDhkUAcmMMH8J2YzgK
	 0yGQt3MEB6xonWzEGORfRukx/sRzznANttaXJNQCKxGFf8hwsL39nayucOMF25ldBSOAu
	 Xxm+oMDD/f3qekf32o28lyOJaYrBhqcYaGwqhX/3t/OtOujKkF9lt6VPbGpKwCIsMxUdZ
	 6HLVAVq3uwa6tm8IW4vcirBUJILZP9asARM0/uEZGZ+qtzpxfhzdP1xgUWXkiSpjIlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tk0QFJhHMw12hFvG+FcF66HxuOQukQsyFC6EMVrh6iw=;
	b=gfXg/h3+dXgH4HFjVcQIZ0jbJZuqs8+I7D76XvIrsvzMgebFpNoJR6/Dn2zhcAV4J5S8
	 NYg6c98afIcnQkpsPA1WWf245tJ4rBLaejcSc0gjmvpwqnIboh3zNI2k+ROh+XSxfKiZV
	 gxY8/8WtxReMAo/GrzsOI4gFNw+/ZbQxHeWWan733szMahnjqCR1kqJSRAEVVPv0ONo83
	 y/x5q74zOornlKmNLmL5A8X4Cd01nfmay8YyemP9T0jNa1PCzBW/KmuoEw0EMDJAdYl6H
	 VZxnF9zC3QWEQoJWusJ0myGO/YfFxJcKC8KD0YyBG89x8MyfWMgTarp/lYFquBAPENw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156383;
	bh=tk0QFJhHMw12hFvG+FcF66HxuOQukQsyFC6EMVrh6iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FlImLL79PCX6ylfHr+v7ys0HYUcz2iB698MrvcADnqHNMULIRJ+GEjaWBpbcjSk5c
	 bKFzR6Gga3cWO25TC14TI+PON1PfaQvCTtkrbkJs4RC+pA9cVfuH63oc8WOy2WKVjy
	 7EfEYGCwMSelpZXiyGNSWLKk8XKvAi9bMuV8ReTvwiswFJUfXPdbsSS+Apny4QyDPw
	 wnvcFs+es1c+3VkX+MIw1C0d2d4C+iHA6Vary6JvBs0q7b9jzHfORWxLmpzKpXfOWN
	 SmNNT4SZISJ1h9WYhu5gD3CP2RtGJeaAOsFWjkb1J1xP5VefUTKK3PRo1GlBBKhFuK
	 Kg5/aMONfM9Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFEE612E1;
	Fri, 16 Oct 2026 13:13:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF7B4769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF2D860AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 750RkaJ9ytg7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E105B60F38
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=mNx5nIfcfSip9jQyJ/7A5vtMD++k6Pm75YRDcpF/MV8ZuBn0iJ01UjrViZsvIyUCe1Nm
 Yy447dUBotK6p/ErzYg3dW2xPJuRE5Acd082Okqa+brWMQinUjJiBjgOlPiz8epDYKWSr
 nfY+4dod19fVgIB8/KcYB4u9v0t6+ciEBdK1e7Bu1h2qrLPSGC4UynHUaSZke10LPoWDv
 zumFknaS0b7odJeyeOyVlSmWsej9DNFFEeBlVxLeUSs0FLWQ4Lb6nnEflewuMstfMStxr
 tNCFRmMy9YFs47uiDH7pA+GkKLvA1Hk5VYhJMs8V5GW24dJgUwVmVI5e76kKbdR9lQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QuQ5k+LQAK0wXfEKZcacsY6GVuG9wFqtL0NdDPQhDPU=;
 b=eyxTz9t/iig1aoOAa95wh6jaEIU44toEEac/JvuKaLel/KTd/hecqWgSHFkSmDZwyKxe
 Ho1K3sUEQGx+84VfvOTqz+ODKj95YCZO59+mx51UI/MXK8QWIBdGLdr4eUaY+NZD+gWtH
 NmVJpWSk8QZP/lLcoaz1XmoG6WAE0MtonV0ZXPPLVcT4o4KvaYMh12JY9PxhH5ZYAe1pt
 zYSTRxYGazPEWvptWqIhd6a8IyRUWNrX08jJIwtjpKt3Xf5kUWPzoRGt3WP2ku1smOV+B
 0w2rxTtZLU3I9p8hKiDielAX/3yLPmjXopmTE5ZKkWk6ZMP03JzQfYhDJsASTUXMeew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E105B60F38
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0FA1960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:11 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d4da32b15c5f59daba74bdf04bd8815dcdc6e0c2
X-Git-Newrev: 4ff6a490e320834f474b5acfcd53e902d37415b5
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.D0FA1960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-generic.mk:
 drop PKGDIR variable for {, actual-}source step
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6263319104735087092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6263319104735087092==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ff6a490e320834f474b5acfcd53e902d37415b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This was added in commit 2d4fd5d358 ("pkg-infra: also set PKGDIR for the
download step") for the DOWNLOAD macro, which was reworked in commit
155f752d8a ("core/download: do not hard-code the path to the package hash
file") to instead use <FOO>_HASH_FILE, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f454580f0f5f591f9a9edfdefb5c7ef4b0aa28db)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c69bc96237..4e2ce2e7a0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1087,9 +1087,7 @@ $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
-$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 

--===============6263319104735087092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6263319104735087092==--
