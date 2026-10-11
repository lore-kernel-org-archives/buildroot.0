Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA47CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97EA6406F4;
	Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJY-ZiWqmsVM; Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C9EBB406E1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914146;
	b=nDxNomEaHOeZOeZuc0AEI5JWgk+wph/VMJlkrSbM//NUjd15GH7C1e5kZ2OszFOESj67
	 gKwx+z/7sYzTeddnfNJSYwO/TW899y2gvHwYUNz/Nu+t+O9U5/HewD7ZeFZ8vu2IAXT+i
	 p3XfjFADx4ztnsVVwbkG5HGPhLh+pLR9CY4PX2EumadNBsVitOYzdwHtLZ6xk0aQGEnNe
	 D6E02AiwiSW6h96S4fNLbc5wLCM3bTS22+Tx99ZA2HW0ujx/PQiWYnQhJeOLBRx0BEcIm
	 p07Q+VtKZhq2eMy2bcCIHdMRFFtdGJOWnq0ACDS1qkqLOM/VNOselDBPphoSHmUBBpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F+f86ktH+u2eXjkoPjSFlRnkfcPJojlQJ2lkyLOOJzs=;
	b=rYGImbI0UDafLVOCRm+TJvMS7P1uLekY7uHknJD312Eg4am8oi1qcSNMMm6H86ub5mI9
	 CWtgflUDzxP0F5ccH9WxIhKCcmEF77Ycq0ZB+NmyeXFMh79CPLl2IpgIC8pKTo9j4TXBS
	 69bruDGi5RKf6SAyq5QqvaU4n+crq8hmCxT6a7OWXWd8DT+5QjrvlwapG+/13LyLCpuGa
	 /6m7Mc19CURxQH+RFH81GYlHDUGilvd+iGaa1CJBuTu4bWmZPXTg8vBkls1EVdGTP1b3j
	 UjDEO4Douo3tXpJMWisKI9m6Q4rWXJyemPaUWPLmFqC0e/LVSeukOKAC08y5IMsyuIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914146;
	bh=F+f86ktH+u2eXjkoPjSFlRnkfcPJojlQJ2lkyLOOJzs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=We90+KuqkYSM/2g2h+xyJTZeNDHB5FRalp9ob9WELjyNL+I9NgTzK57JMh5n9t8SH
	 jJMvZUr6PUColy5m9TzgBatuTxpMlLVlxjzWcK85xW/cw7x9aZ+nF6YS+VZVyJfgKd
	 t4MTYCR0pw18rniRrnhenXgHYuy88pyGUoFiLhLPn8PtdvNNoa0BJsdI9k+iYDBwfJ
	 ZCxmh78HiHqoTaHR1+zipsJmio3aIrca7SoIfn02C8JcNgwIgSHQ6SKhXl+wl/dv5P
	 WTxEs8/nvolE/hkEngDrcxZTkjoTbsrIO5kWQtMKWHDK6iR7+vx5ggoElLsy+8fGxu
	 UrKu+is2FSF2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EBB406E1;
	Tue, 13 Oct 2026 17:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA7451399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB57980AE6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w60vzx_q_PO8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7B9980AC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914144;
 b=C8pYyXZGwiavdv3vy+sTvj4LmYXHlmtXbPMd2MtAtXt9EUEEZo16SZkXJnEkQdNx+ALS
 6TvCTx0EeUKiIP1n3MmSF4NE7Dq8clIc6tUl2KNXmc2+cP/7YNIfeErNc5xEZp9dOFRcf
 Lli9CvN+9gwgkkcDV0y+cyQisvYsE0mRKwI+LXy8bfQq9HUzpXxJLkJOb9SHCOKAW72AV
 X64euQfiuCkfBJy5R8vDGr7a1fbSlplYODXPRiUD7JD/Q8/eAXv00zG0k3Vmsr9cvhNmj
 +RnE+c8aTzMV18aD0px9WOdfB1LEqXgpVmYFSXLcFtryGTBsc6J2AGht94N7kyy3HJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914144;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:X-TUID:
 X-Last-TLS-Session-Version:X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=Fj9xdfk+Nl6nraH2K6vPNWp+ynDah+WbRSq9BXNe2v4=;
 b=djDRSrKGX2DCHn64qEuDv8IEZUrnt9TTzu+BCJaPIV6qL86LDhq5idROKMLpOxPWJilH
 DYRQ+YVdMfdHleMaZ96qerUdIJLT5iEAQ4gLKZ3EQ+AVe2Q8Z2PpvBpiqCVx5BuHnd93o
 uE+/maosBPQOCujQtz33RVJr4QEdnM+wx1JUVhfRZYtugGTO7q1jWMvyhnGlJ3zPqvu/2
 bSri/U6nUmpH+rQFc+CeO1tDkXnIk8Cl6Sm73h1FNCChKDFeKeVAzKbUUoYivfl9GgXuN
 nGK1uddSjJqW3asZeWpZAC30O0GBFECIAPInkw+hmeVdxvU6NqYd7fhvs7uIvP+t/sQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=blOShejl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7B9980AC4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E35CD4E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7E7660362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 4361811D718C2; Tue, 13 Oct 2026 19:50:52 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:47:13 +0200
To: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Cc: buildroot@buildroot.org
Message-ID: <asuTRQvSTomLmvaK@windsurf>
References: <asY_S8f-M6os1idu@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asY_S8f-M6os1idu@zenon.in.qult.net>
X-TUID: 0qRphAgSyq7A
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 4361811D718C2
X-Spamd-Result: default: False [0.58 / 30.00]; DATE_IN_PAST(1.00)[52];
 BAYES_HAM(-0.82)[78.88%]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH] binutils: install libsframe to target
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBPY3QgMDcsIDIwMjYgYXQgMDI6NDc6MzRQTSArMDIwMCwgSWduYWN5IEdhd8SZZHpr
aSB3cm90ZToKPiBGcm9tIGJpbnV0aWxzIDIuNDAsIGxpYmJmZCBkZXBlbmRzIG9uIGxpYnNmcmFt
ZS4gIFdpdGhvdXQgdGhlIGxhdHRlciwKPiBleGVjdXRhYmxlcyBsaW5rZWQgYWdhaW5zdCBsaWJi
ZmQsIHN1Y2ggYXMgYnBmdG9vbCwgY2Fubm90IHJ1bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ25h
Y3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CgpU
aGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IHRoZXJlIHdhcyBhIG11Y2ggZWFybGllciBwYXRjaCBk
b2luZyB0aGUKc2FtZSB0aGluZywgcGVuZGluZyBmb3IgcXVpdGUgc29tZSB0aW1lLiBTbyBJJ3Zl
IGFwcGxpZWQgdGhpcyBwcmV2aW91cwpwYXRjaCBpbnN0ZWFkLgoKVGhhbmtzIGEgbG90IQoKVGhv
bWFzIFBldGF6em9uaQotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
