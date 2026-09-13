Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F49C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5D380A82;
	Sun, 13 Sep 2026 19:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jikawLmVsens; Sun, 13 Sep 2026 19:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BCE7A80D01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328063;
	b=g3verc8mKvahw4k9kTpmOCIyGPkpRuGKRZ6H1ffj+sNCEdVlecoy8A1+4/SshdUjHiBo
	 OfJXFURWr642N1SG0IGqMDvNQQ3o88xI23mz2oh0Hyy66UQ2+NiWPr+dM4Nx7yww/imfm
	 LfxXkXz8mthxne/IUBFK+xAnJn75mSABt3QObBhaxzxjn73/0BnVSG384ymdC2arrFI0i
	 OcN93iPpc8j1+DzPqWJ0xFGGI2JSsdglF3ghswN3Nhr0j0kmu4CqQd1ze/ByJM7hdyBs8
	 XsThHMJhSQ977lNcvDOR7ruRB1FAnIrYA53LxH2kUnm0uY2w28XDNhkJo3bN/E05qLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cLpPkgXvvcEyU5XrEUQ+eT8oxuTTCEveGLu6QBubOJ0=;
	b=TJRAzN6xXMdbn0aUlcA/w27lcOXN6kJKXz+duF/+HgZlIKXZPigwHupDWOXhg3dC9r+J
	 JR5DJSOz1nRhUPIRC+SQmfUQoXFiXh14M1lQi+yXZd0DVzw/5mwvEKud6KLx3WJySUWz5
	 bKBEamrAx5/B/11ViYwXRoLj0LG6L3SvuyB7tYYZlUopV+Qaqkhs1elqJUi+xw3uwZ3IS
	 +YEZu4sPttUtItYg9woXvbPZ6JTd5X0CwbyLOk5dIt5yQhmSVW9YdEI7E9sdfo9SG5awR
	 vDSv9l2A8lOzoVT5OvyhrKhTxcJuVvJ92vsmQqfu4qa/ZSMAriZKg5nsqCrsR3X/8XA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328063;
	bh=cLpPkgXvvcEyU5XrEUQ+eT8oxuTTCEveGLu6QBubOJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L0Nri/uNRXva3dawjJUaP+r+ae2RWZWBMzJvUnxpbVJjWRz0xvGSRnRSSopl4srUO
	 rXnCjNCwZVdyGkmaLi4s4OkhNU0BrIkJgbAVP+NkDOuA1IzpiQ1w3FHug3H8JfVdsc
	 SirNujPJlNg65LbFqyPdcNxBlXi8YVHbg1b2J3zqNpTSmcGLEtzQ5fsxh2unanGIPa
	 fVfF8335PgZHxf24Ea/06VEjdXMBUH0i3rdcsyy/KkmZ1+E0OCetvg0z5kTYGvQyql
	 Sv0zuN4I1wIP0Lt0XoLaqBmZWHMxyBvGR+dYS0LmCRYR8pmjPIc7ugBk9RqK7WfaTH
	 Ki29gtskZhzIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE7A80D01;
	Sun, 13 Sep 2026 19:34:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 592F6465
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38BC3405AB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlpUwDl8DgIF for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75DEC405A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=bkGlpO6RfhQm4Q3LRH30B6d7fSi/lKFXtnPK55AE44A0dXKCKLN2jnd6nVZNpYzd0dL3
 KwhfJ0pVk4kLd8eCE4mALQOmYx3bMW3s+pCwIcEDCf0inGqXuebpRh2zN8OnWR+0uRIp5
 E1NKYxxMEnBcsxPWhmtWK3dCCqpHUhbmRWohHBNBIYiuV0vmqbCGZXngKM8RNJS/j3UF9
 9QiSXEDWxhx/i2p/13C7Y8Wa8wtUnKj+LpQefqFBFsHa0aqSi/IuOb8wgatwUjL+GX0l0
 lcN2X0tNKgJ3pyftOrfXoO6WeO+0e4rFF09CG+P8pPuVgQlBsWrySya7uwCAvJU6beg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jvfQ9QKRAdFADvbRl9+s/AV6LRcXt3PkFK/gw8m83og=;
 b=HLhYpy129FWpKLqdFoEuUmDRfPXM7gOADrYSzt8dgqTg1wJ8tI4BdxfBfdPLNTxhD3o7
 AXA/BF1rTfxSnmp6NJDCdh1VB29TxP357S9IxCzSDxK0KBn7qdd+g0uy+oGRZ9phgI/bX
 UMPjuYC056yTbcufCVEctYlCLNaJXuaI2CWDh47vsr8cS+ENEw+GCRC4e2ytC7xJFivMU
 xQXRtVbcPt0ozK1XF1dgGK440XEihbsWCtoOdhPPRLkt+iwa6/rkNXh+2IBsQ1+1spJe5
 NRElnby79p0J2jqkvfjM69kWEtLBeOZwfkkxloRVj4MtkBvMgFGsTG8I2lA4gRdOYtA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75DEC405A7
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BD7B95C6F; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7fe354adadac3d2425fbe59da0744f1e4103726
X-Git-Newrev: ef92929504e842a1798128988eeb4d959a1a8931
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.6BD7B95C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkit: fix kernel headers
 dependency due to seccomp select
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef92929504e842a1798128988eeb4d959a1a8931
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3a4c3ed792..cfb05fd0d3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -87,7 +87,7 @@ config BR2_PACKAGE_WEBKITGTK_WAYLAND
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -95,9 +95,9 @@ config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk access, and Web content rendering.
 
-comment "sandboxing support needs a toolchain w/ headers >= 3.12"
+comment "sandboxing support needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
