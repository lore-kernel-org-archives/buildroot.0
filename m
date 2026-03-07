Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB6CF55104
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6DEB41BB1;
	Sat,  7 Mar 2026 21:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C729dzietpSQ; Sat,  7 Mar 2026 21:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11DE41BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772920291;
	bh=0ZFa6YDJti6ISQnbG9fVp1q+WfI3YHLzYaHPY8x0iZg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RFJ6YMIW2dVGlFBTPpLO/Q5RuZi7F5CAM16Hn9IWwbMJAefRl9ljk1dTvFnb2ZVCy
	 Q1/jzRDxXmEOB8EeKnWJzsXpnDPc9IeodInqAHdyHnrLKSLzRTKK+Es73d0gacswEJ
	 LA3Ez/7za7bNuzX51G7f+v/rnweSaPcCgFmk+21WiWsOzqiJrcfdjTGIKwRbaRT44X
	 5Qw/8PFcQMOK3zNRuJaBuhn/fi23VP+CuNZpl9mCje9ksd2ztiZuPPVkLTfVD00A5A
	 UTkkpGTYizl6BflKew5xQupkPI7ulVJgjW6XIvHav19IzjcXy/qDtO+bIre7hoUYb+
	 CWjwAd6dS1KAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11DE41BDC;
	Sat,  7 Mar 2026 21:51:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1602B223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 076D283CDA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZQKjKkN7BQ4 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55BAB83CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55BAB83CD0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55BAB83CD0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7829919F5A5;
 Sat,  7 Mar 2026 22:51:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 22:51:26 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 22:51:26 +0100
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: buildroot@buildroot.org
In-Reply-To: <20260225124352.503896-1-jonhenrik@qbee.io>
References: <20260225124352.503896-1-jonhenrik@qbee.io>
User-Agent: Webmail Free/1.6.13
Message-ID: <c67cac43ed87f628d22567213eb1bd74@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772920287;
 bh=B3Pxhq9xOXUt08A1c4Q0bHrxI/MsgVeWDdnt+1Rl9oE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cXbJllS+IYL2KWctajSH0CSUJRCMVw0JZhF6hGO8tYQDOfnSgPzNUwGkjaJ+DSoiS
 o4qmRV/JIydMPAtZMJsEfMHJ6tpd8VA6kmcWBbypP61sRbMlch6RMHEOnrjqL1hLnX
 rsxOyT1bJrlIe0jg1x5nhfZBfsdx0zVEa7L8TmD8+a1vE230Pfy0q+T47CcEIbVZ63
 lwSk3xT2Lh9EDXkgP6M3OQmnrvY0q7viwzw7TNJvhQ7A9W2noFB8jMjVjAk1nMg2AU
 LdlA9XkBWXl+04538/3DXJkjQAvanjEYwyd6i0kSTEPWheukaM60H2MpQSh+Bw673k
 Ho3D0c49JvCNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cXbJllS+
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2026.10
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

T24gMjUvMDIvMjAyNiAxMzo0MywgSm9uIEhlbnJpayBCasO4cm5zdGFkIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtA
cWJlZS5pbz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
