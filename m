Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508E8FD9E14
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B16A181215;
	Thu, 26 Feb 2026 21:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OX6HLwYCVQ3h; Thu, 26 Feb 2026 21:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895EB81211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772142390;
	bh=r2sPDGAcwdWQncl53BJuYVUGvPn/n5WqYgVErqVX5ng=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yo+4aFxRVnwO8bcZdJ3w2nWX8yR7M5gYnYaSghz+PacsRgmml8eCo32nFAeA4pQGH
	 rVX211DJ383YxcjNoIgNvFSJrSnGMwod2l6F/n1vh8DnKlnw2js1sxn4eWO2DtL5Qi
	 taMsNw8IQsrkAn0I26Ofcppk7d30VJSOJi6+juoZgrF6Ig0Q/P70vw83vHnlfPGtiz
	 6+oKeQDmmWJg3Y6YKobReQMYzJ86U+fbFl261pjwx3xAzFtQcOVBHGDoH6rOQwyHnL
	 6azcS96YeQ7i9P2TJNPJjmohrs8mUINoxguJNrYIkQ+XlzCdb1Xclg8ge75Fb2OA4n
	 RFJJ9ZX8TwiRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895EB81211;
	Thu, 26 Feb 2026 21:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEBA7204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0447400AC
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIQ5sHILUB1N for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 21:46:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4365402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4365402E8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4365402E8
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 957FF13F89A;
 Thu, 26 Feb 2026 22:46:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Feb 2026 22:46:24 +0100
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 22:46:24 +0100
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260225143226.1028442-2-salvador.joseluis@gmail.com>
References: <20260225143226.1028442-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <ac738f79af01370a681cf15329d5df17@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772142385;
 bh=8jkth3dGGOQN212MsX8u+D5dXmxog1XkukP+ZYf8pwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UPYJ3wgOZ1TTwlHX0lmerXby+b1ogMyNbyNtnCDuGUZb6P9h7OhKbk4ocZM/Gq3uW
 TGtjtmPEqM81QtyPp6pSaIG5dltcb9oilAiZXamtKYTE35ZN2L4Wfaplx391c9rmkl
 36JiZMPnIW/qAvyySheaOgKuIrtzfJ1k7XhfJIZczyMfRzw+ilRaUncaTItp3Kaatg
 GhjQjg6PXNK4lJz8Jx+uBmSN7wqBMa8MhFIrMo1nutezRjsDN6m+IyVvbTBghTOpuU
 RfAjvArLXqeBO+p56ymYiuBknQLAIwkkesJNiEIe4qi4TQwSbYoD+Mprz10dVbH1br
 4M+6YR9cBY2TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UPYJ3wgO
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.1
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

T24gMjUvMDIvMjAyNiAxNTozMiwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IEZv
ciByZWxlYXNlIG5vdGUsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjQuMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBuZXh0LCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
