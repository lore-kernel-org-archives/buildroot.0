Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C6D3B996
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D3784851;
	Tue,  9 Dec 2025 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jJSSnemSdgR; Tue,  9 Dec 2025 21:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E03284821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765314735;
	bh=vt1Ut58oVZ9KOU5iVK63I223+3+W6g59lhFCxxY7upg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y17LMO95VTaE0vmnV/wBTP53jSmMLSqEiQXX6cXsgQRyAx6i/SHEbhRZ/Cj8m/qD9
	 F0lKmRD12n3yRHjyEjIV0UTWmEGPjn+taYhyvEb3QIPEWTbedEUE0Ik4Dv3TT6Ob0+
	 4NYniy4WSoBz6iySMEOTFOrm084Z9GoD/zDROnUJsHWsJCvKiuEu6Fj1oqALUANJQI
	 gPWSOVFK+1OA8kU0aWf7WEGMeie+Vbst5LBErbtIogh/Fu0+lI6dX03mKIm+medKhe
	 O0bG1cpI7vcPmsxBhMlEZjXBZXdaUzdUFji5a1wRBoCuK0KwxCSHWalxscKZQ9vKWh
	 1xydtFcU5yn5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E03284821;
	Tue,  9 Dec 2025 21:12:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C90237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B12C40A50
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuH8cubH---k for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 21:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 519284050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 519284050C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 519284050C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:12:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9F7F413F86E;
 Tue,  9 Dec 2025 22:12:08 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 22:12:08 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 22:12:08 +0100
To: Preyas <preyas17@zohomail.in>
Cc: buildroot@buildroot.org
In-Reply-To: <20251209154834.5946-1-preyas17@zohomail.in>
References: <20251209154834.5946-1-preyas17@zohomail.in>
User-Agent: Webmail Free/1.6.11
Message-ID: <eb30a6d7b219c731bce91abe54533304@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765314729;
 bh=1GyJqjjdgmUFQXL2HPHXMvAG9PSuAz/32pM9hJLo7Fw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C4GKdJlshHK2gcuxVYDBPgYjumxKWrsKoUtKhhhbtiHxC9YfPo1vtoZHh2cBXOpQw
 qQY7jV61TtVnfDkdpzWMUAdFY6+7SBQBjaS/p3MFndabC7Y3UFD1DxvGLY4uxiyrb8
 QX9m4X2oOjtBtavlg12Slo49gBCmUst/1b1KiIDzeT9ydTe9bs3JxePhWa9H+WpfW0
 uoUJpXLk/q/uTadQpTHtcSWTY8OPLf8qpb2JHDSG0+pMZkBd0AlMP3PAJigHGW17vB
 myu1RYcH1Bmuj4bnrKG7x+Qvt0KQECpGMVL19bdRpWypen/HkwyakIII37QlpaQEt+
 6bEqiRo5yYFmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C4GKdJls
Subject: Re: [Buildroot] [PATCH 1/2] libseccomp: bump to 2.6.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Preyas,

On 09/12/2025 16:48, Preyas via buildroot wrote:
> Update to latest stable release. Refresh sha256 from upstream 
> PGP-signed checksums. No packaging changes required.
> 
> Signed-off-by: Preyas <preyas17@zohomail.in>

I applied this patch on the branch next.
I also enabled the LoongArch64 support, and added a link
to the change log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4f9600c2f97039b4ad6eb66087a7654805536a76

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
