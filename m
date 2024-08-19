Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A186EC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBE680D5C;
	Mon, 19 Aug 2024 11:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3oj6GRKHfxI; Mon, 19 Aug 2024 11:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F4E80DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F4E80DF3;
	Mon, 19 Aug 2024 11:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDCF1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC3B403F5
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqb2UbgkhNxr for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA57D403FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA57D403FB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA57D403FB
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:06:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18DD71C0002;
 Mon, 19 Aug 2024 11:06:04 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:06:04 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240819130604.642b2e40@windsurf>
In-Reply-To: <20240818203134.1512793-3-geomatsi@gmail.com>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
 <20240818203134.1512793-3-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbbe4JM04k6Y5STl2liMV1abajD+vFPqSUPuDtWlUEA=;
 b=K6eeOV8Dp7TF1EWJ8LyzFwOzjWiH7aYItI+VzCd0atAsNOQBhtktAy3X/SK3aBL81VakeJ
 IPxgtA6wxDUI9rvw3xW6FqOABG7Ui50GWyOOnbQdIDCxc0w4NfS2XQmfTtXcCrqjkGVHEG
 o8Qn6lbc++IPRYaGvxyEyUcRmUJcNPuUlUNz8lwckp9G/3ipaJsK1WI19qjjqNaWJGmprH
 0kRfZosxm83aqV4+Ja30XLuwWJwCnrMT2bcgnFq3PZDML0RJTeMogO2NOf2a35nXWxPHdr
 fbb0ECPXuhuFtk3g1L4L6Y4cmrch/FE1N2vmr/cal5VPHY4ZOG5EO9fAey1AAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K6eeOV8D
Subject: Re: [Buildroot] [PATCH 2/2] package/wpa_supplicant: revert upstream
 commit to fix brcmfmac
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Aug 2024 23:31:30 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Revert the upstream wpa_supplicant commit 41638606054 ("Mark
> authorization completed on driver indication during 4-way HS offload").
> That commit breaks WPA2-PSK and WPA3-SAE for brcfmac driver in upstream
> Linux kernels. For details refer to the hostapd mailing list discussion
> and redhat bugzilla:
> - http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
> - https://bugzilla.redhat.com/show_bug.cgi?id=2302577
> 
> Alternative option would be to disable offload in brcmfmac driver
> adding "brcmfmac.feature_disable=0x82000" to Linux command line.
> 
> Final decision is not yet agreed upon on the hostapd mailing list,
> but reporter and maintainer are inclined to revert the patch. So this
> change adds revert to Buildroot to improve user experience for such
> boards as Orange Pi Zero Plus2, BananaPro, and others. Later on the
> patch will be updated according to hostapd upstream changes.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  ...orization-completed-on-driver-indica.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
