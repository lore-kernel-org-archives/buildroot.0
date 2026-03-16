Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DC4F53D96
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535F88318C;
	Mon, 16 Mar 2026 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgKhzZEt_ykQ; Mon, 16 Mar 2026 20:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98BEE82864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694654;
	bh=FiyxqGaTdQPENCqeqfCpZ+LVKAw/Zr4rkrARGeaOT4M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f2ifgUvpoVeUUbeIG5rp9oYw0x1elucU4584PaIUJkVv2BY9uw+whPQQjGcxGnmb5
	 6WKv8y3drFRLdCG3PW9Y/kUuwVUqlLNJgjNzlOZF72J3VtyjxiK61VSZIO7+HoYa1s
	 7OwXJjIk6ye+gHDtgSq0cG3H7orFZJwHasERs91sgMfrEM09MTE8hRGgL67AdOLQ7+
	 PikYikHpcDN/UIZ4huCNldxazzckKB/VnEPLhizjY8RAmYmyb+h7HvnYUrc7xIJ3cx
	 oeNcDmnYE4YEE0wtA/zSHouohFsJD77XRAM2zUL5qZPV9OpSrDEmsGge7jXjGM4WpE
	 8QpARTIgRLmjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BEE82864;
	Mon, 16 Mar 2026 20:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A76493BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D11382864
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVYzyQ2rkcVv for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EF4082835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF4082835
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EF4082835
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:57:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6B53AB0054C;
 Mon, 16 Mar 2026 21:57:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 21:57:26 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 21:57:26 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260316170246.2414661-2-vincent.stehle@arm.com>
References: <20260316170246.2414661-1-vincent.stehle@arm.com>
 <20260316170246.2414661-2-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <b230c70fe4092304e2c85d9f75e990bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773694648;
 bh=hwSe2Zd0+YnkQdYvmvXt37QHZm/VdoPDtuYhur/nbGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S2DIRFIVosgl08pZhO1rzh5K5ROLp8hy+81bdnZUe3XAea6MrswQbHGGd9D8GhB69
 Q7DgIDOmvtNMuSPCuxWP7PpthUnyxYFRNoBkFvN01F5SMYKky1ka9yGCbmVWYOtUsB
 4NtYeA1jky7xhRWfWljZQ3Vjg5qHOVO0HQ/v3MQLQjajQaXX+L40mnlfYtp2x6+JIX
 5IF6xggbIeYrlCuoFhZLQexorx7Ra3sBR/ONidZIF1/9cuCsPqJcp90DLZl+WkbvpG
 pUEAelGY+tfwQiJ4a0X6BoqQEuB34WVCZ2XNTDv37+mC/apc5+1PqkvKZuGlzycV0G
 /Cpvbp3aQhrNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S2DIRFIV
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: bump test_atf u-boot
 to fix the build
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

T24gMTYvMDMvMjAyNiAxODowMiwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFB5dGhvbiBzZXR1
cHRvb2xzIGhhcyByZW1vdmVkIHRoZSBvYnNvbGV0ZSBwa2dfcmVzb3VyY2VzIHB5dGhvbiBtb2R1
bGUgCj4gaW4KPiB2ODIuMC4wLiBUaGlzIG1vZHVsZSBpcyB1c2VkIGJ5IHRoZSBiaW5tYW4gY29t
bWFuZCBpbiBVLUJvb3QgdW50aWwKPiB2MjAyNS4xMC4KPiBTaW5jZSB0aGUgcHl0aG9uLXNldHVw
dG9vbHMgcGFja2FnZSBoYXMgYmVlbiB1cGRhdGVkIHRvIHY4Mi4wLjAgaW4KPiBCdWlsZHJvb3Qs
IHRoZSBweXRob24gdGVzdCB0ZXN0cy5ib290LnRlc3RfYXRmLlRlc3RBVEZBbGx3aW5uZXIgKHVz
aW5nCj4gVS1Cb290IHYyMDIzLjEwIGFuZCBiaW5tYW4pIGZhaWxzIHRvIGJ1aWxkIHdpdGggdGhl
IGZvbGxvd2luZyBlcnJvciAKPiBbMV06Cj4gCj4gICBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBt
b2R1bGUgbmFtZWQgJ3BrZ19yZXNvdXJjZXMnCj4gCj4gVXBkYXRlIHRlc3RfYXRmIHRvIHVzZSBh
IG1vcmUgcmVjZW50IFUtQm9vdCB2MjAyNi4wMSAoYW5kIGFkZCB0aGUKPiBkZXBlbmRlbmN5IG9u
IEdOVSBUTFMpLCB0byBmaXggdGhlIGJ1aWxkLgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTM1MDA5NDYzMzcgWzFdCj4gRml4ZXM6
IDUxMzY1ZmYwNjM3OSAoInBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHM6IGJ1bXAgdG8gdmVyc2lv
biAKPiA4Mi4wLjAiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5z
dGVobGVAYXJtLmNvbT4KPiBDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+Cj4gQ2M6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpTZXJpZXMgYXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KRm9yIGluZm8sIEkgdXBkYXRlIHRoZSBjb21wdWxhYiBjdXN0
b20gdWJvb3QuaGFzaCBmaWxlLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC9mZTQ5YmY5NDUxYjUxMmIzYzJkNmM0NDFiMTZlYzBhODdlYTU0
OTU5CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
