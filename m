Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62695CA5FC1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8AD8115E;
	Wed, 30 Sep 2026 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8v7cf_1pz4l; Wed, 30 Sep 2026 19:37:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 381A281124
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790797042;
	b=DDlBLnbWYZ2igFAz/7p8t91KHrRKJKJnL2RgL05O3UDUc3TLkzXNaauxBQeLrWOK4smI
	 FtiOQFFCEC22MzoEZ/eJjo4n6/dOu1zy+Cpd+FNikMCl0nLaPOTWba/2jID8uWstQLt/6
	 ZOX3+lFiHiZZaFGzLy6F65mCb7OxFSqLDXCD7ucdq+RtRgBMfNGJMl9/bcdNuV5QnhSl/
	 BFuLGe8PvjFxcbqxZ8aZty5oROvZBkc/jy5lwYQJ2mX4EVSqtm64B6go32i+rnugr4rZ9
	 EJwILVOZUc6ZFriXojESuDXfPxmEjqPY72bzDtRVPsQTr0GGzK9Eo7hsIUjlV+TRxEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790797042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sp6d8JgkOan+aOjAN3pR51JliMficvb3zsg8gDLjrio=;
	b=sZo9zgiik8w2ObAcbE+Y6zKc4BEc0if6L+A6ZxL0V99pMWtb5Tmax7oxGCZJzQFzFi4m
	 zevYJNM/eD3n//Vu12+rMt04oz9AAcDFY3tOv2OuDsS+SQbm2K2+B9zMt7AgbICb8gySa
	 o9Kec1Kq797AK9sDsQiLlebYrd33lhfzAyGu9NJ/fYmPpX6KdKKPK+U15qElgHVc4zY3b
	 nrurnQZDEJMkiZmLdww5/9TMLH/fuwLVh1ueMy/kNBMBb3/OW53c1f7t4CQCYsJmdTuBa
	 eMFeqkQEd6gyIkHx1/w9POuSm2MgVxqipty7tOQ7YtdSj8aWygmro0DrnsUqnr7ZVRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790797042;
	bh=sp6d8JgkOan+aOjAN3pR51JliMficvb3zsg8gDLjrio=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lBxRzNO/Y/cOK+EXSMNdV7zqkOKdB3IwDE3Gq0E+TyP8s3uYuzDAY1LNxdIzvYc1i
	 0DB+W3QICgBnRfYNqNzdLYDes+7Lj30oJxfjoNVr0+4MyPT3oHbMWKi4SJK3mUuQ8b
	 NU1YyhD0xk9CpLgEPosbXRDEJbgRHi7A0qhOv+3Rh3oPmQ/lH18bEstQmqaFxFYfJZ
	 SdnSHof7rVB5SaY71tTLf/AQsi0wkjVKbb68r6zK1UT1goTSmmHc/Qfde74Jnc2n98
	 dgD66KoUJskrAt6JtK7TlL203iHeQ3W3Gnem7ibgdV2iJTWrvI3VHL5TD63TE/s4+b
	 Km1SG35wTsJ9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381A281124;
	Wed, 30 Sep 2026 19:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D08324E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F02A40462
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-Xfi2g-cmU3 for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:37:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 995AC40341
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790797039;
 b=R+Cgd09ZSy+e7kJog4VvJJrp5wcX0C0yf8YdVn4qcKiABHRz0/ml56s7OvY/1RmkUt7E
 wW8wtgESllRGLB65VjpTTALkZbwIKioq9lFm3baYgidYK+0mMUe+XmFpHvLerNy/mccU1
 ej3uamaeQwRKGemFEuTVYLduCjLtWor11a3c8cXcttuzw/Q8BRHkuWaJF6NES4k1miqj4
 Z9vtK+fO5TEZnbYWO3LFg2T0n4tqNDjiZeHyR39H0xsx97zYoorIvrp9q5GOpmeX697rW
 IKnTnTbbCvx1I/yrKlHbxU5hKgr4UxMrJ3WLt+ETQaDoE+S/veIoroREYjzb3FCYsog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790797039;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=CwCphGI9uOup7ncvEgUfzB0SLbS7HxSkhsoityf+qNA=;
 b=DRAlAobrRUA+MNVKkL6k3H/it0vi4IKUGhCRz6kPV9ci6Do0aCn+TOmuWTfaiZ2eYWNo
 T5x7MCWnmh+1t9ESe5+27sYB+wOJ37KFw92ArfQiFx60UwMbqlqSMgPlGSW/1w8M1nXRe
 k/Cdrb9ZH2oHPTwHgp+3jdRBQdPjCESV1cpyZon/gtTnX+X1Xm2dJ8Lrtr88oDdfUbNTV
 iniyN+gukwlM/8I0R/c3IILu5QcKkjq2lj1MMkgFqIshBXxxnAMZ4h33VGi517DU9aYIh
 a3KrIkseaCnAbK3mgcBww8+O148IEFDt6AlsB+oQ/o6ahSHCUfDaKoV9f22RbR3Kk1w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AVEE8BxT; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 995AC40341
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:37:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EE24613F89C;
 Wed, 30 Sep 2026 21:37:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Sep 2026 21:37:14 +0200
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 21:37:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260929175300.1838821-1-bernd@kuhls.net>
References: <20260929175300.1838821-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <d4d73690df414245a1e9802c5e0e9376@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.5
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

On 29/09/2026 19:53, Bernd Kuhls wrote:
> https://github.com/openssl/openssl/releases/tag/openssl-3.6.5
> 
> This release incorporates the following bug fixes and mitigations:
> 
> Fixed DTLS retransmissions of handshake messages from a stale buffer 
> offset.
> (CVE-2026-84782)
> 
> Fixed excessive memory allocation in relative CRLDP processing.
> (CVE-2026-35189)
> 
> Fixed QUIC unvalidated amplification credit may be over-accounted.
> (CVE-2026-35191)
> 
> Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
> (CVE-2026-42772)
> 
> Fixed a timing side-channel in scalar multiplication for mon-NIST EC 
> curves.
> (CVE-2026-54872)
> 
> Fixed QUIC STREAM fragment metadata DoS.
> (CVE-2026-54873)
> 
> Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
> (CVE-2026-54875)
> 
> Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
> (CVE-2026-72897)
> 
> Fixed QUIC connection-level flow control was not enforced for streams.
> (CVE-2026-75804)
> 
> Fixed a NULL pointer dereference in CMP client revocation response 
> handling.
> (CVE-2026-75805)
> 
> Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing 
> DoS.
> (CVE-2026-75806)
> 
> Fixed a timing side-channel in SM2 signature generation.
> (CVE-2026-77696)
> 
> Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
> implementation.
> (CVE-2026-84784)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
