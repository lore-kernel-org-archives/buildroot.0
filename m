Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DFECC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 08:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791B480F8C;
	Thu, 15 Oct 2026 08:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dm_Jz-DvWZSL; Thu, 15 Oct 2026 08:01:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1A0080FC6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792051304;
	b=Zs0Oepx0w8u0P9WF1S3prVnMAfXI7232QiaIEot9rUnkDLcobqtEpAsZHdbE02Eje3hi
	 KRyQAqCyCjbztxHBVPapoKUWPIJrXDIEguC0NwkusNSBgA/v+CNus6HM4/Gq1rdoPIxXd
	 DGnrkz6ZIV1rGYkh3ttn1gXSLlx4MkH8qtTXj9o79eqBdcyqaTeeHcn/jXjxeJ9GllARS
	 FiGmDHtoRHJkroZFpgA0kQoHSBbfQFeHV8FpNzPD183gnYtlwkNtM1jVESOL6dcBXWlep
	 g8s5+mJRw+PFsGr29pelNAkUqq2gRTCW99u35h4pvEGv/xXvxC4OTnNHcdlQ+1Jy77g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792051304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=ES0WCEEQrowxIp0ReeUqwkuCvKLJ9tjvStLL0k1oCzU=;
	b=QdNT+A0Wxpth8vPgc9+dSydE3nI8gd+Ei6hmfCu6N3YbtJqJsUtINZDWF4lWG+HojVU5
	 rT6EbfSgNGLsNygh/yuNIOiTphksZhNW1Zf4rptq/nd4Nc/MNPPNu4cj4gPlr8fAmwH4r
	 A0Dw0iT7UsjavXXiJqAtsOnjnuSy8bRL5GfQtQcOEvb/lNFhUZKijjvFDHqm47YFIMxf7
	 jncaBkS5SWG1aYCmLLMJeEtyyZIW6H4vL2ywWYtFEOYipoU0tXZV2GSjBCIZC7Yzm3851
	 VT8JepzFI8BZI7F5szihb5sm2eU78sieqrtAlwkSuS7Mp3y8jrbg3oopihtju2v93vA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792051304;
	bh=ES0WCEEQrowxIp0ReeUqwkuCvKLJ9tjvStLL0k1oCzU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIvTnJt3w2kek8ez9tUu2jIzvh4KKEhXOo258IgUVna0tskncEeYvU3qwyvsKqbZN
	 NyXJQCcoKDD9/JPQxxuOqVcUEbIDDd+9agz6cLqsqWVgw/nVFZLlJO6ZpJuefnkQBu
	 n6LK6KFHrd6xWrvraJ+Yb5AVoF4+cxKher/5YvNfqMOKmVce457HTVRcPA2B55rNC0
	 P7WqqXqvwrP9IoEQGzz5q/bOEGbS/bcz8PkHdJvjleupDRHQdTGt040lg7y3Reezuy
	 m7IrvyB70bw4JvebQomNrnsQZaO4U1mG4Ki1TKEau63JiKfCwQJ+y4c7sZEmVcE5xq
	 akV7UFDZxTAqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A0080FC6;
	Thu, 15 Oct 2026 08:01:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF6D255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EC14407F3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBVdyeD0IVBk for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 08:01:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF692407E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792051302;
 b=SJUptqz25S+7PIYBDFz3iVKtDJ9ZlI8d8dm8AILjEh9C0hoFIASas/YecL28qLFh2mzO
 7b9hgeLB9YaWDygoTpqjT011RQRaln79rQhm7alEt5p0QJEwJIENOTJKnjLqgOEq+fPs1
 STV0OX4LYuWkYKRS5Di889G0CU8oixLL7xpcvkaJai/IjCVHkJsFYbJWtxfjzwCCi6Xf0
 Fdx2lOsnYZN+J56mUVYxtFInaGoppzTp4j3pYA9KynxI4ZxJmtvrGSuCSyY87hxUR06RA
 L0kJ0NUO289PUzMZEMgm7B9o9LynDQv+FtXHEaHhhaQZNJCStntulDU7U8de1mn7PMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792051302;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=aYp1lPiLDTlCgsWKLc1dq+VQlYIZiWAv4IIl3fV+D34=;
 b=oDt9DQHK68OnCBYcTFsbmAvvsXBcV+PxK76oX6/ZUYIa9umk0+kBA5aiILxjT/mFlG3z
 9SO7tAY85UVbxJTA5O3WEH2lqX0RbONV8fxf+qAcDcwe1zQgSC7LZ6gtTdtwH/IaGzGLC
 56b7vj7sf/HPGoHUwb8kWSgC2JNkYdkf6md6awkKUR+D9QzXko3X1R50xsGL4x/8WjMLk
 bOf/oIxRslPXNKcBVXFd/lJF6bexlPl56dB4aUFkHqWoPWwiGsTaZKS2TbC1ZTySCV225
 X/0urDo7sqolUcfSS9E/mCLyGLpjD/2zL5IQPo0VjgqO8MINjaZS1+0mO8q6NS9JInA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="U8mIc6/p"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF692407E7
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:01:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7AFF64E41246;
 Thu, 15 Oct 2026 08:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E68160360;
 Thu, 15 Oct 2026 08:01:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F7E010328B9A; 
 Thu, 15 Oct 2026 10:01:31 +0200 (CEST)
Message-ID: <aa41196d-699f-4757-abed-d076f61c843b@bootlin.com>
Date: Thu, 15 Oct 2026 10:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fengwei Tan <tfx2001@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, buildroot@buildroot.org
References: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>
 <SY8P300MB004194BE85005EF52E4398F2B59F2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <SY8P300MB004194BE85005EF52E4398F2B59F2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] packages/linux-tools: perf: explicitily
 disable rust
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmVuZ3dlaQoKT24gMTAvMTIvMjYgNjoxNiBQTSwgRmVuZ3dlaSBUYW4gd3JvdGU6Cj4gSGkg
QmFzdGllbiwKPiAKPiDlnKggMjAyNi8xMC8xMiAyMjo0MiwgQmFzdGllbiBDdXJ1dGNoZXQg5YaZ
6YGTOgo+PiBTaW5jZSBrZXJuZWwgdjcuMCwgcGVyZiB1c2VzIGBydXN0YyAtLXZlcnNpb25gIHRv
IGtub3cgd2hldGhlciBvciBub3QKPj4gcnVzdCBpcyBhdmFpbGFibGUuIElmIHJ1c3QgaXMgaW5z
dGFsbGVkIG9uIHRoZSBob3N0LCB0aGlzIGBydXN0Ywo+PiAtLXZlcnNpb25gIHdvcmtzIGZpbmUg
YnV0IHRoZW4gdGhlIHBlcmYgYnVpbGQgZmFpbHMgd2l0aCBmb2xsb3dpbmcgZXJyb3IKPj4gKG9u
IGFhcmNoNjQpIGlmIHRoZSBob3N0LXJ1c3QgaXNuJ3Qgc2VsZWN0ZWQ6Cj4+Cj4+IHJ1c3RjICAv
aG9tZS9iYXN0aWVuL2VtYmVkZGVkLWxpbnV4LWlteDkzLWZyZG0tbGFicy9pbnRlZ3JhdGlvbi9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2xpbnV4LTcuMS4zL3Rvb2xzL3BlcmYvdGVzdHMvd29ya2xv
YWRzL2NvZGVfd2l0aF90eXBlLmEKPj4gZXJyb3JbRTA0NjNdOiBjYW4ndCBmaW5kIGNyYXRlIGZv
ciBgc3RkYAo+PiAgICB8Cj4+ICAgID0gbm90ZTogdGhlIGBhYXJjaDY0LXVua25vd24tbGludXgt
Z251YCB0YXJnZXQgbWF5IG5vdCBiZSBpbnN0YWxsZWQKPj4gICAgPSBoZWxwOiBjb25zaWRlciBk
b3dubG9hZGluZyB0aGUgdGFyZ2V0IHdpdGggYHJ1c3R1cCB0YXJnZXQgYWRkIGFhcmNoNjQtdW5r
bm93bi1saW51eC1nbnVgCj4+Cj4+IGVycm9yOiBhYm9ydGluZyBkdWUgdG8gMSBwcmV2aW91cyBl
cnJvcgo+Pgo+PiBJbiBwZXJmLCBydXN0IGlzIG9ubHkgdXNlZCBieSBvbmUgZmlsZSBvZiB0aGUg
dGVzdCBzdWl0ZQo+PiAodG9vbHMvcGVyZi90ZXN0cy93b3JrbG9hZHMvY29kZV93aXRoX3R5cGUu
cnMpIHNvIHdlIGNhbiBzYWZlbHkgZGlzYWJsZQo+PiBpdC4KPj4KPj4gQWx3YXlzIHVzZSB0aGUg
Tk9fUlVTVCBmbGFnIHRvIGJ1aWxkIHBlcmYuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhc3RpZW4g
Q3VydXRjaGV0IDxiYXN0aWVuLmN1cnV0Y2hldEBib290bGluLmNvbT4KPiAKPiBJIGNvdWxkbid0
IGZpbmQgdGhpcyBwYXRjaCBvbiBlaXRoZXIgbG9yZS5rZXJuZWwub3JnIG9yCj4gcGF0Y2h3b3Jr
LmJ1aWxkcm9vdC5vcmcsIHRob3VnaC4KPiAKPiBQZXJoYXBzIHlvdSBjb3VsZCB0cnkgcmVzZW5k
aW5nIGl0Pwo+IApUaGFua3MgZm9yIHRlbGxpbmcgbWUsIG15IG1haWwgc3VwcGxpZXIgaGFkIGFu
IGlzc3VlIG9uIHR1ZXNkYXkuIEkganVzdCAKcmVzZW50IGl0LgoKCkJlc3QgcmVnYXJkcywKQmFz
dGllbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
