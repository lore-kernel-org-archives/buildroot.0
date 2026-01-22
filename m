Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA9D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA68982316;
	Thu, 22 Jan 2026 19:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMtQEr_8ARsS; Thu, 22 Jan 2026 19:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5711C8230C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110845;
	bh=l+QwF9rtW0Cl2Xaiil/68gW2CP+LWQwl60+7e8vu2i0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GYQwRciJE3SzDZ79Nxo9CywJwNs6D3GhbHs7wrABBocIaqBeFq+XtdKK4snmEIAf4
	 bGdwRiCunFVFSKckaD5kObpDtndQp6bxfsFkm3FN54w9DeIiTXma1jOdzrmMIlg7kO
	 48CMhcQcWvfnA+DTulmE+AU88SNZ9IwurxnFfDqlD5iKuNyHm7RmwqLH/EVjidaKqe
	 sgR6C17dum0A1PEYjPXoYfwbeWJ5MHTW3haELpRd6vRTlV8fnXtRv+oOc/+axHC5X3
	 vufu+R5O+x4nEYFQbbj7QawYaa9gxuls55vIz0lLCGqoJx9XHvbM8Qo/lEtk0jcmVF
	 gHoLIWt891rRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5711C8230C;
	Thu, 22 Jan 2026 19:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2599E122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1709E60730
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okemSXGN7sMy for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23B886070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B886070A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B886070A
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1D22FB0054E;
 Thu, 22 Jan 2026 20:40:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:40:39 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:40:39 +0100
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260115150328.713835-1-raphael.melotte@mind.be>
References: <20260115150328.713835-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <1eb489bd95b6306bb073bf4958e75b5b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769110841;
 bh=j7XBeB7lya0vO2tAzCBzh5NkXNSIrVHBGIO0SxBjbj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bEO8GAnmFIvnAQUk1HEvgd0N1U1iVIVZtnpVIipdAhoG9odexyawZgbsx0GKzc2qR
 FveuaGbs5XFzXbNUAuT3Kz9XEuGZGP5rujz90xbS8k/X128h8TDNh8/vEc6W1/DSOb
 XmpP1xzyOcDXEChOrTwNefV8E6tM+ZTWiKWy5fxV6z7TNLalXN/1RMPvdPXyBz944W
 URkVndUFhD0Jdu1IJS9kw1Xx1fsaeOe0uUWZWaJ0Fw4MQnrgDF2phuWdpPyv5KF9FH
 rwo6glooKE37GExU/R6U7gUUfev3lDbRs5wa1HLKMzduk0OEITEOf7wd/1/ivHE0WE
 IsUENcJkQyPtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bEO8GAnm
Subject: Re: [Buildroot] [PATCH 1/1] package/libpagekite: bump to version
 0.91.251215
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTUvMDEvMjAyNiAxNjowMywgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBodHRwczovL2dpdGh1Yi5jb20vcGFnZWtpdGUvbGlicGFnZWtpdGUvY29tcGFyZS92MC45
MS4yMDExMTAuLi52MC45MS4yNTEyMTUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6ls
b3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
