Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E17CD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 20:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D924E4EDE2;
	Thu,  4 Jun 2026 20:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi7324Pw62jO; Thu,  4 Jun 2026 20:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBD84EDD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780604264;
	bh=e/TC1CmTyXhq0IKE8sINJqqDYeWCGIuXfbniJnhmLQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VxEON5cl4Gw+CMF4Uca3LMoegfSJuJZCpM4JR8qfwD3+4tR41JYsJCUnh9SBl1xlA
	 9WBVwK3n9LgtLUPCcZZMIT/sWoUP3LJqGYMxUifp4zEe45gxH9g4dLajdOSlUvUPF9
	 rpY7Sdl6wurtFaQ/T69RPtbwXaTNnLSC6zrbaRccclvMlMH4gW4p2vyDYhmqIURFN6
	 9n7tDUb/9+iTxyzu6l0B1iovIcSkvhDkirD5sZghi0biV+DW0AY05+76VqbZqqOQXc
	 5WJYi9hbG+rBH6EDfRNmZoaaf1eL25kJOiWPDvnjAl00sKDBg1ixpplco6c7mJOL+y
	 YPDAzLpj3wqfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBD84EDD9;
	Thu,  4 Jun 2026 20:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 669C4192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57CE7428C8
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQN6VWtl2mhf for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 20:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E86B0428C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86B0428C7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E86B0428C7
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C97E819F58A;
 Thu,  4 Jun 2026 22:17:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Jun 2026 22:17:37 +0200
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 22:17:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260604185341.2155576-1-bernd@kuhls.net>
References: <20260604185341.2155576-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <42617a8f67805f8673f4ec6ce4e5160a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780604258;
 bh=QgPzu16MuRvuOmCU//slyMlYYozoKrYyFePF5zGlUcM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bAYXeKE8A2xgggK/ogJ7WxKIlpLbWOgP2Ba/1cqjfjX76Qd8pFLRhIDtJWmwTEx/D
 tOgogYqGTJtWk0iU4gbq6knhtgPfDIyw/s72pFrLvjj8BMr0iE2Iq7iOXW/eAm66PB
 LMqTyDAn7tOxXd36oF+N3BFX66pc40mS0Fc+9tL23qGlInpCOJ3SfVN+q1oTwkC/3F
 Fr318obdBxaZ0by5lVi0fdIrC6GjfsoWMtrnNvTOLeTsrMLuAxad37mJDWzN3tQgkL
 ETJGXV3Qhx86FGBKCRc/QVLv9t1McgyEj6HjwA4wOBsrOCQuVEUWUKrIYBAY7ug8KK
 8a6EPB72gpIVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bAYXeKE8
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump version
 to 1.1.1
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

T24gMDQvMDYvMjAyNiAyMDo1MywgQmVybmQgS3VobHMgd3JvdGU6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL3N0cnVrdHVyYWcvbGliZGUyNjUvcmVsZWFzZXMvdGFnL3YxLjEuMQo+IAo+IEZpeGVzIHRo
ZSBmb2xsb3dpbmcgc2VjdXJpdHkgcHJvYmxlbXM6Cj4gCj4gQ1ZFIFRCRCAoR0hTQS1jY2Z3LTI5
eDctcnJ4MykKPiAtIFBpeGVsIGFjY2Vzc29yIHNpZ25lZCBpbnRlZ2VyIG92ZXJmbG93IGNhdXNl
cyBoZWFwIE9PQiByZWFkL3dyaXRlCj4gCj4gQ1ZFIFRCRCAoR0hTQS1qMnFxLXgyeHEtZzl3cikK
PiAtIFNBTyBzZXF1ZW50aWFsIGZpbHRlciBoZWFwIGJ1ZmZlciBvdmVyZmxvdyB2aWEgc2lnbmVk
IGludGVnZXIgCj4gb3ZlcmZsb3cKPiAKPiBUaGlzIHZlcnNpb24gYnVtcCBpbmNsdWRlcyB1cHN0
cmVhbSBjb21taXQKPiBodHRwczovL2dpdGh1Yi5jb20vc3RydWt0dXJhZy9saWJkZTI2NS9jb21t
aXQvOWRlZDM3YmRhNGU5ZmJjMjU3MGMwYmQ3MTBlZTQwNzYzNmJjNGYzNAo+IHdoaWNoIHVzZXMg
Y29uc3RleHByKCkgYW5kIGNhdXNlcyBhIGJ1aWxkIGVycm9yIGNhdWdodCBieSB0aGUgR2l0bGFi
Cj4gcGlwZWxpbmVzIHdpdGggdGhlIGdjYy02LWJhc2VkIGJvb3RsaW4tYWFyY2g2NC1nbGliYy1v
bGQgZGVmY29uZmlnOgo+IAo+IC9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9i
b290bGluLWFhcmNoNjQtZ2xpYmMtb2xkL2J1aWxkL2xpYmRlMjY1LTEuMS4xL2xpYmRlMjY1L2Rl
YmxvY2suY2M6NTk0OjE0Ogo+ICBlcnJvcjogZXhwZWN0ZWQg4oCYKOKAmSBiZWZvcmUg4oCYY29u
c3RleHBy4oCZCj4gICAgICAgICAgICBpZiBjb25zdGV4cHIgKHNpemVvZihwaXhlbF90KT09MSkg
ewo+IAo+IFRoZXJlZm9yZSB3ZSBuZWVkIHRvIHJhaXNlIHRoZSBtaW5pbXVtIGdjYyB2ZXJzaW9u
IGFjY29yZGluZyB0bwo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvcHJvamVjdHMvY3h4LXN0YXR1cy5o
dG1sI2N4eDE3IHRvIGdjYyA3Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
