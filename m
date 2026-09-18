Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70726C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE1640B0C;
	Fri, 18 Sep 2026 07:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vs3ppNsxxNz; Fri, 18 Sep 2026 07:56:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1437740B0D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789718197;
	b=WqyF94jXScE2KFmFhcyjgKnJbuhgjwDCxyEhTReMpCuvcKBZUdKMD6Ba/u+rurOBVkW5
	 1c6eChK8DEPnyAmQHZP9h2Y+tROsRxH0zm/L5s0t+3gHr60zGQGJbek02fL4hkeTKz+/b
	 BLT7+mmvQ0ijJTaZEwn5R7oPEj/fyAoOlLE8tQj7GZmnufI7N9FsvnWgypn0P03RlNqqN
	 FU8f1+PHx2Ne6qPpJI4q+ZWc6aNHj70g6nNeqH8UBVjkZIrct6+bOyljNkSXySsXpU4uc
	 p+GgJFB65axNOSbTCpO3qH+5SLt3oQch0AQr0FwFQfry53XJ3DZ/FAnlfHcwKxMfiQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789718197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aLfimvudA9WTBVAMOmPZ4DMAvA5Ong3zxY8Q+xqzki0=;
	b=alGJaO7FH4TOnbEU/plyDS0f+xqg9YVExRZ//lhKIb7QfMaGWX//YWwFzC5yAQz4xsbm
	 k+EEK+xgJ87m+8frmo1PiYlJVr2AE9yW/6nMymqkAPFbOnA4mzH1wxOqx88aOn6ugcoPL
	 7XBMc8eFaPPdKZFifuw8rITVuWgyD9lkTEBDe8Xrj2eRh2KOPvbCnjZ9cAt1zKJbanGtJ
	 MaIy2Mp4ZPaTJrVqnzWfTaGDkDho3CzOcVG/oE7aETdwkAvxMFDPp8z16267hF7359pBo
	 ydB/vC/2CGUFYObFT7EWfBEP4TbOvor+wViqDLNXRrPbIQEkeuHPVl3GO9KmVsCMzeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789718197;
	bh=aLfimvudA9WTBVAMOmPZ4DMAvA5Ong3zxY8Q+xqzki0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qkF+eStD1bPc/4he+ScPp01Do48E0Swm0NGva2Z+eWZxzSc46ORj2PooUj35sEmmH
	 lt/x15pvwp5YbJCmV8nA+fkXbUx5Fdj8EOxgd419jQkJJbcVSR2vFJicXyXNSAfTE2
	 XPO8cJLCEJxXFrXXGD5InWGdj7gfTq79rpFQDzrbLyDH6yVg3ZxvkwtYmtLIoGGd0X
	 HJZzT+3puevm8cfMA6apqmG3hbQNz0fgokFPZQJuYCDNWtByyJoTpHcfL7kJBgjVlM
	 TwvHK29FR3D6X6EpzJlSItY/G1nCQbHuvIC8KbnGnYHjHcuM55jJ0cfbrrZLK9QwfZ
	 ZQXvroUgRaLOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1437740B0D;
	Fri, 18 Sep 2026 07:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09651352
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3945404DA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36OcgADo6y3J for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:56:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 30CF94044A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789718195;
 b=YKikMUzOB5m40mrhS9N52xlUwMUnKZkYEe68XiGVZriDOgOfZOCCkfxdrP60QkRvNogp
 vSFwq5Yq3LATQOA3yuxwJqyZz5rMiaq9Y+QLpRXb3wu5LqrF4ybruk8b1QkISEWWChbKT
 z4dso+YrgPTKTuu8+z+5lc5zeFj66i6RBLVWnVk0YjtUnic2/WdO7b0LIEAiUhl4f5+VB
 CnTqP0Kv7QiKWcccKeC3FAk1q22tqnE7Yo5s3XA8WNrSSRmZuAuyjkwDtdUDyiJAlzrSM
 7UAUvq6y8YwKzuoRamcpoSLXwrXxfRzWYjq38BeFbCzb1KFyJr2lzr8IZhSj2Laqurg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789718195;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zKuUgKM1FmQqzydB5aikKvhS7V/0ebDzxUr1Se+iV0E=;
 b=fSF+WCDSGIQgH0lGX/ROIvakGNGf6zYYMY+yIoxSp617/WSQ1MhijHdeBSaB0S3o/eEd
 UiWBtHXij7/RVA0+XX/A+nB2qkb+wqyUrpAfAz+R1FUY5SNKCXifiGI1Coz8xnDVyAdB5
 tnZxzfOLnp9ZkUo2UIwBP6WiDJx6mNm8+bPthc0037qnrPuK6BJZUI92gXfL7n0g1HeAH
 5O3ctO7N4vFg8mCnq1SCSzwLzYL0SLcdogl668IK1YRcak5GbCBImjYoXm1AXXna8TAK4
 7sFPbtc1Pwwg3Z05rx19I6yNXw/83B1RsF7YNb45qA45s3IzlL5zepVsi4GB0yEG5jw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30CF94044A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:56:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7B9A96B66; Fri, 18 Sep 2026 07:55:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 09:37:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4c13e96cfb60959d25b92ec0348f508c7d0349a
X-Git-Newrev: 35fdb4161039bbe4b8ed0c6e304767d7e1367004
X-Patchwork-Hint: ignore
Message-Id: <20260918075527.E7B9A96B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: fix build with weston 16.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35fdb4161039bbe4b8ed0c6e304767d7e1367004
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit c5c0a76751a7e9ba1a8816da68218db9e1379eb9 bumped weston
to 16.0.0 causing a configure error with cog:

Run-time dependency libweston-15-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-14-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-13-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-12-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-11-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-10-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-9-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-8-protocols found: NO  (tried pkg-config)

output/build/cog-0.18.5/platform/wayland/meson.build:67:8: ERROR:
 Problem encountered: No usable weston-protocols dependency found

This error was not yet found by the autobuilders and is solved by adding
a patch James Hilliard sent upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Add-support-for-weston-16-protocols.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/cog/0002-Add-support-for-weston-16-protocols.patch b/package/cog/0002-Add-support-for-weston-16-protocols.patch
new file mode 100644
index 0000000000..1ba9f4dc6a
--- /dev/null
+++ b/package/cog/0002-Add-support-for-weston-16-protocols.patch
@@ -0,0 +1,32 @@
+From 7be8cae20d50d1d991bf5a0ad0155e0f784b0b60 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 1 Oct 2024 10:24:56 -0600
+Subject: [PATCH] Add support for weston 16 protocols
+
+Weston 15 was released recently and the weston development branch is
+now using libweston-16-protocols.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+
+Upstream: https://github.com/Igalia/cog/pull/789
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ platform/wayland/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index dad47a6..3ecf9d8 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
+ 
+ if wayland_platform_weston_protocols.length() > 0
+     foreach weston_dep_name : [
++            'libweston-16-protocols',
+             'libweston-15-protocols',
+             'libweston-14-protocols',
+             'libweston-13-protocols',
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
