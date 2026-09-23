Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED39C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F14640E96;
	Thu, 24 Sep 2026 18:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-zNp_1c8LjD; Thu, 24 Sep 2026 18:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4739440E9E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276277;
	b=B4sRs1CXNNwpIwajW+ukXwkuF0ewjclmaDxEcxZxhKjdt7DohowU2m5MQKhtkI70d07Q
	 9S9akFODDWb7kty8aus1hn9dkeyyVjZfLfZfkInNIet4y/ZvLOCkE1Y3gxM1/XsAbYMY6
	 rDsiVyuymOFFT6IK0fM1kTU94VaXzcYzVQaNsrrXr5DGhKGEwV3VsSrEyOopZc7UhqaML
	 2SxylXFdm9879i/XnAz7GMgNKd0TaKuny0ESrvXuvJMOXAVlDeclfepHEnCjFM+4f1ATz
	 Y9domcnZzMUYiSRQTSSAXD3i+x8LzMG67B/XtCH7B82OExTsmILoll5loC5PeMrWixA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tyxvL30yk8FRprcrzhQW3sc1ASJuM3iqsWf2wUAZWjU=;
	b=BukwocVycu3lQCgy5h9hrIGgdnb3YlZZYwugqN72hpu6e3XaK3/OIp5E46QcgNv/uCco
	 0J0DOA0v+FwhI7uHjk7E/Me588lI7bNIMHjize+KyjmxQZ7+4Gl94Mv1Q9DA2VRDWkBPE
	 1E2aW7abCDA4EFBCmph3DOx9szrlTtWwCM48WxmdjruVrBLyLAjtuS+ZiWfPdZfxo0qxE
	 wtkem9P6w+/wLXSPq3t4P15m6eS8dtIE+8tNFps2ksnWhd4S+LUAp44rgtJ89zhWkOMzG
	 s2Fq9wopu9dvruZAyoO3AZnl797G8CVV4bSlOrbIJwDWLNgpGcDaW5jW1502E5Hoykw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276277;
	bh=tyxvL30yk8FRprcrzhQW3sc1ASJuM3iqsWf2wUAZWjU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xtg6+hQt68pa+YLW/x19Yvx358nkPfr1eG+HziJG/xR8kGe0XUBfOI2NJuiPumGWB
	 wYxZVHIpj4uTghoa7vhrcDm+JZr+vHlHoxzSkg+G/mY/b5L8VwDvZXRfHTLmIAFUjK
	 62oxzCqFnpMh6Su/xTI8VH3uRiJkyNoa9SIScuZ68wXe4WJiQFS7CTmX7/XMdo7TXN
	 IPuQFXK5EieJ2dbJqaIp+QfzjvOkr4EcSUwOnqXjytCfM5uQJRxz9F8cdOXvaYMm1a
	 Rm6pBe9BD+nD0/K+ypNNlkHRRGd/yLY711+2tjhK7Tp8Pn6lBzGF0nQ0tIYVT7dYLQ
	 i2O56dOUjso+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4739440E9E;
	Thu, 24 Sep 2026 18:57:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C53B2328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B726040ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXZS9TT_VTXE for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C219940AD6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=G6w7QDEbk1xRLk35w8vSb3y30p71RJp0/TdWwJaP9R7t54c1ogvsWRC9WUwZ3kXPZ8LJ
 olnrvLfiE0ps/jlJ5PrpGqOxq/L7o4vdRw9P5h6/OmGS/PPTCqK1SkQIxpJnKihoXHfkN
 ZWM5CbAz2D6+/KU7zcCu/9mUNv8uR0iowPulEydd/wvqA4mcsFNOWU9t78+s65GhdF5Vp
 jgtlKNdLpCnOZBOzStu8nwXEkyz+n0b33xP5PD/OIUj3m+F3rGLdByYDo8eUXg6nZ2ywZ
 TXzWhCl/AIvFRH0imQy5cAjBsz/8bmdEkQuAHnlyVBXZLZ0qLcXgMBC5mksBKrRTKtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3y0DklKofawMuXXfDi2hkqS/90kZo+ifamCp0ozuiik=;
 b=n9E3U6ghhhdzTNItGCwSNcEzyvv7Y1/IBqy5v6ZMwYqldJFqKuI6NKfogmeZ7AfT4Mpt
 bORQ+UxR2XF0ia6EdRKIVaDdraNdemWPPt/0d+mCIr28x1GMw9ynZ8BBXwj5+CUhD1OZl
 y05prt4WWmuDqiNSjC/5gM0b5wiE0qv4CMCnlih0mPjL+P2UyZXEuOspFmaLM6G/F8/4i
 SWA3ZXbOUt24d5D6CcLQ17TbcrSoQroogtTs0zCj1thbTKEpXCUyE+DUJOI87yHPzp1ZL
 zFVCz1/JNkxevZXrzmQ9ejYnKcU32o6v6Hu7WfDYTGkjVNLG3UW8CkkgpAbL5Clib2A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C219940AD6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65FBA96FF8; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: da49ef039c95bb76664d464c687d69abdf0af406
X-Git-Newrev: 9e5e9a7c5dc5e066c7781698a57f9431696f9ace
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.65FBA96FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/rpi-rgb-led-matrix: propagate ffmpeg dependency
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
Content-Type: multipart/mixed; boundary="===============3146528538851894887=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3146528538851894887==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e5e9a7c5dc5e066c7781698a57f9431696f9ace
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0fbbe6b681281d1c2dbc300d336a79a5c69406c1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index 5088af3bf1..8bf9a81908 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER
 	bool "Build video-viewer"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help

--===============3146528538851894887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3146528538851894887==--
