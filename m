Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2442C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADA46070F;
	Wed,  2 Sep 2026 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4Qo-aLgdLFS; Wed,  2 Sep 2026 20:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 68292607F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788382366;
	b=eHFbGAc8FRa6pWdMf2Ad3Xv6dRYPSahQNBSYHgIVmkmInanNH+NMm8heMnRdjfIJsMw4
	 QXO/UKIkyXdElqWfuovB2QFt9knfHbxUKxeuC2rGAPvQtfmDeDiHcaEvRSP+WXUp3tpEW
	 knyNbkSvEJuoLXFqTktZPgFzVeSmcFxsKKPcxsjKwqL4vzImUveCFnNrMFEZ3vtQTF3r2
	 dRzGTRBnqsQIpfVMEpXTF1WP2zo7XujtOH88yKzhRNAM38cu/6fGRR56UUsKUZCm9gett
	 jGwPL9UvxBFERJ2iwPu/J3Ku2zKOx2YU5+WJnrWGlHh1qGeivX0NznxvmGC/Iq9VhDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788382366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RgfsvDo87DLaPgcyHGq4+ehLcGRgGgf3d58ChCWcF6A=;
	b=qQZTWxU5tdQiqqnu06vnRbD3AtzQ70APYKF+MVwP2t/WtPpPRENUgq4XwfoRz9KPUPsG
	 LDdQz2PRV2bV067nIqPChn1l1Mh5mebRrBaqan33E+zXmgeWb+GzSOpVjqK9s5H4gbl6L
	 IWjnNW7Vuo1mAyaK0gM6Fha+Iu+wpRF2aTvggurE7ULxxFVUQbRH0A/i+aRRlUlsdr6N+
	 ssVT6RFeHlvWVvTHYrcBkftSdslepKB9Tt+p9naDWaBy3rFgB/6Xp0yr6/nzMltvzlwbN
	 xObQ4bReNiNYU5lS0abQxu/JC/QTZq+1DmgGBEZcFLqEG8WgyWNKiBaAzY3PhNW8l3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788382366;
	bh=RgfsvDo87DLaPgcyHGq4+ehLcGRgGgf3d58ChCWcF6A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=H96D1hvCMErhGiMUEZ80DM91NAUzzW4KunQ/hIq8oCQtxKz0os/FTJgBqZzCuC5ll
	 HBpWGD32P5nCZ05CI8Vag71vYuxAiQQxub+HDH3n8NKbTVoJiw2S2U1IclbQcke9uf
	 JSiAtJCsVjlWxMcL8IgbG74lNOPhhgYLTvfxiCajZfUXOJG0kF87DA8YBD95QQpr3m
	 z7UYzjQP7PlR35CAiHOEMa9aXE6SUUAU6OWkocaB/8nxUacdK0pZDTz4BuV+eOPPc2
	 CCCm7HKSOJIPtsxYm67mwx0ouvZnoHQfG31+QgJlgTsbvisGhilE5425KBJ0iwCNV6
	 DUGVjruSYQzcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68292607F5;
	Wed,  2 Sep 2026 20:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B77334
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F5628096A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Zfaahum6ZRj for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6F7AB80969
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788382365;
 b=Fv5+BkyKKJVFQ/Ux8dvManB8ke0XEZFUpa8FZCvqOZLh8AE8CwloAHqSB21lfpgVqPXs
 w8pTdH0dxQs4MYvr6hlZhPIIsGfVVtbVCCwau7B8hb9r99SNmjpQY5BuGEcEtCu8m1+wE
 R+slhhkHrA1KzyD8WjQ5i2bghcKqiYW0pR8pIuZkhAzkBzv3U9xEKtdeSxJFqM9a5O61D
 NF9iu4ItgvAke2fAjRhByDrJzX0kPJHSFCBPn6IL/xsEmp03Ow1G8GSt0B1lFQvOasi6I
 Qpu4r5LZXilmgd+Pet0l2cXK+E91Jc4jJqr43yBIKGMprx2HP0p4PSb6geVGoHZp0ZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788382365;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=xuZsDJ+K+xrJoILVm5COPWFKV0/QMD7a/JDIEC3eKvk=;
 b=tO5IjM6kHA7GTiOOmhXNmOUoH5maTdm5q/o4+5Y9oRec72bf4apE1iec9yQrOX9N/gQc
 OwCyeD61pgOvf3Ys4TyMXYEEjXf+EgvaiM3aKMNn2SFVYvq088TR2OfycSKyQ8ahCatmR
 7odCz/0dgxkKwztW58aFRQT495SjjcUQhoWPOqm3GkWIQA1sHmhfMY5rCSEFmm6dlV1d7
 ByxiAKo+EWkv4d6Q8vgJ06WJ2bAZ3Rd16HFHUXIKnX4h71KdmR5XKokZa2yGfdhLOeaL0
 r6KNg3zZ24QGtp7E4nL0LdaC7mdgPvU3FF6qTjbw0DWGXgowG4xe7LJd++kAbdO46eg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Spa7e2NK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F7AB80969
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:52:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so2033005e9.1
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 13:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788382362; x=1788987162;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=xuZsDJ+K+xrJoILVm5COPWFKV0/QMD7a/JDIEC3eKvk=;
 b=oIcet5aWGZMlJj5g7Pjofu4JUW+Q65AC5Vf3fyk7ay6h0E1tCXoQMBVV5ycbRCP/QL
 Yas8kbBQ+hgytZF0RRhZ/uMbLwQnsfo/8cyECBIALrXrBdAWuUkX3R2RyQveC2rUxCpQ
 XiRQz0xYgUO3MNd1ZluX/4NqI/laKkhnJuaNgRFK27G2I/U0xrHghBfn1jJVy7Xbql+A
 UKS1fpRq8TxaqYlQqsXhgsGHt3tn/pqDxWFBvVOsvyENl9i0TmCn6kpsAl1ll+Q+SGQR
 IQkvoypAIuDp0dT5sTjPWWMptB+uNzzI3TpR2It0w0zmKwnD2JKMpXGHr5kTF+0fTz0n
 Qefg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxfBlJQLss+qgvucJb8IeVyCCW+H6ycdBxyHJypHPmskvRCW7IvC/yyjZZJD55Jo0JYpiB+0rLcrDE=@buildroot.org
X-Gm-Message-State: AFuF++muL3uhkRTwzd7aqnKt4oZODFiyrxMg5Wcc2hluYHaEh6Vh1hTr
 l0xtk/NuZ2nfmQWicE97KymdT6aKqPosm55qEPJlUk1qDCDHIz2zMYqpFfgxARpgk/o=
X-Gm-Gg: AYBFou27EuBgeB5bO3sffyX7DACXMsVqc0iJ4J8ODLqfUDGK8GDQz1HUXgXkDRznKmU
 QxQLx1i4C63b/tEB7KCxY36eV4IYJbAYOATOCx9DV/ZwHModJxMU916Sea6vaYzVP0izv11qccF
 4I8BIKlnYQkUuJjBM3z5T8V0ola7KhkXdPC/Dw9efyPVDu10MqxwU8dRzBUAPRkhwAqDE8qHGP+
 1khyBsivYrq16gfvi2/6GztrP0g0iX6KwW8jQrD3o2kB14tjR5cH/GUEJB5XcWXMaR1YJtDmbml
 JJrIwBiB4zv4s50QwUzNwGPPQGFop6ynKGMnGJgC6TM4vPuEP0sJwa2jDaURr8GvZDxRfSK1XMm
 Kycr3g34QQJ4SARcfobHWKRukeQk6MoIym2P7gpkUoH3mAppHBqxJJPa6kvvZdzlgY6F16W1fvZ
 fDHW1iORZbSQ6Bn8hi/nuMG20WxPW0zSpYtbW0MBP+SzDSpxG8Y4uEiUe5OhsRBGI7n3k/Zf2H+
 HlQnwmC88VrdpdPWc1yv2ccQxiyC7z5T3h+Sv/kqpF9fz8XTei4Vjejt+dvxGlpCAHm/+17fIzQ
 dg2DQSRs34daG8NhNRQ6V/qjGGY=
X-Received: by 2002:a05:600c:4745:b0:49c:ced9:ab7f with SMTP id
 5b1f17b1804b1-49cee5f0dc7mr32710225e9.8.1788382361631; 
 Wed, 02 Sep 2026 13:52:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5dea34sm17827255e9.10.2026.09.02.13.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 13:52:41 -0700 (PDT)
Message-ID: <e5b5fa6f-59ab-4458-91bc-77f658779c58@smile.fr>
Date: Wed, 2 Sep 2026 22:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20260901145225.579733-1-alexander.sverdlin@gmail.com>
Content-Language: fr
In-Reply-To: <20260901145225.579733-1-alexander.sverdlin@gmail.com>
Subject: Re: [Buildroot] [PATCH] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLCBBbGwsCgpMZSAwMS8wOS8yMDI2IMOgIDE2OjUyLCBBbGV4YW5kZXIg
U3ZlcmRsaW4gYSDDqWNyaXTCoDoKPiBTaW5jZSBVLUJvb3QgMjAyNC4wNywgYm9hcmRzIHdpdGgg
Q09ORklHX09GX1VQU1RSRUFNIGJ1aWxkIHRoZWlyIGRldmljZQo+IHRyZWVzIGZyb20gZHRzL3Vw
c3RyZWFtL3NyYy88YXJjaD4vPHZlbmRvcj4vIGluc3RlYWQgb2YgYXJjaC88YXJjaD4vZHRzLywK
PiBzbyB0aGUgZmlsZXMgY29waWVkIGJ5IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0RUU19QQVRI
IHdlcmUgaWdub3JlZCBhbmQKPiB0aGUgYnVpbGQgZmFpbGVkIHdpdGggIk5vIHJ1bGUgdG8gbWFr
ZSB0YXJnZXQiLgo+IAo+IERlcml2ZSB0aGUgZGVzdGluYXRpb24gZnJvbSB0aGUgVS1Cb290IGNv
bmZpZ3VyYXRpb24sIGluY2x1ZGluZyB0aGUgdmVuZG9yCj4gc3ViLWRpcmVjdG9yeSB0YWtlbiBm
cm9tIENPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFLiBUaGF0IHRyZWUga2VlcHMgdGhlCj4gTGlu
dXggYXJjaGl0ZWN0dXJlIG5hbWluZywgc28gYWFyY2g2NCBoYXMgdG8gYmUgbWFwcGVkIGJhY2sg
ZnJvbQo+IFVCT09UX0FSQ0ggKCJhcm0iKSB0byAiYXJtNjQiLgoKVHJ1ZSwgYnV0IHdoYXQgaWYg
VUJPT1RfSU5TVEFMTF9DVVNUT01fRFRTIGNvbnRhaW5zIGJvdGggPGN1c3RvbT4tdS1ib290LmR0
c2kKKHRoYXQgbmVlZCB0byBiZSBjb3BpZWQgdG8gImFyY2gvJChVQk9PVF9BUkNIKS9kdHMpIGFu
ZCA8Y3VzdG9tPi5kdHMgKHRoYXQgbmVlZAp0byBiZSBjb3BpZWQgdG8gImR0cy91cHN0cmVhbS9z
cmMvPGFyY2g+Lzx2ZW5kb3I+IikgYmVjYXVzZSB0aGUga2VybmVsCmRldmljZXRyZWUgZm9yIHRo
ZSBjdXN0b20gYm9hcmQgbmVlZHMgdHdlYWtzIGZvciBVLUJvb3Q/CgpBbHNvLCB5b3UgbWF5IHdh
bnQgdG8gdXBkYXRlIHRoZSBoZWxwIHRleHQgb2YgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fRFRT
X1BBVEgKb3B0aW9uIGFib3V0IHRoaXMgbmV3IGJlaGF2aW9yIGZvciB1Ym9vdCA+PSAyMDI0LjA3
LgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2
ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+IC0tLQo+ICBib290L3Vib290
L3Vib290Lm1rIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91
Ym9vdC91Ym9vdC5tayBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiBpbmRleCA1YjNmNDZhYzc0Li4w
NjQxN2RhMDZmIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiArKysgYi9ib290
L3Vib290L3Vib290Lm1rCj4gQEAgLTQyNiwxMCArNDI2LDI2IEBAIGVuZGlmICMgQlIyX1RBUkdF
VF9VQk9PVF9CVUlMRF9TWVNURU1fTEVHQUNZCj4gIAo+ICBVQk9PVF9DVVNUT01fRFRTX1BBVEgg
PSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fRFRTX1BBVEgpKQo+ICAK
PiArIyBXaXRoIENPTkZJR19PRl9VUFNUUkVBTSB0aGUgZGV2aWNlIHRyZWVzIGFyZSBidWlsdCBm
cm9tIGR0cy91cHN0cmVhbS9zcmMvCj4gKyMgaW5zdGVhZCBvZiBhcmNoLzxhcmNoPi9kdHMvLCBp
biB0aGUgdmVuZG9yIHN1Yi1kaXJlY3RvcnkgZW5jb2RlZCBpbiB0aGUKPiArIyBkZXZpY2UgdHJl
ZSBuYW1lLiBUaGF0IHRyZWUga2VlcHMgdGhlIExpbnV4IGFyY2hpdGVjdHVyZSBuYW1pbmcsIHNv
IGFhcmNoNjQKPiArIyBoYXMgdG8gYmUgbWFwcGVkIGJhY2sgZnJvbSBVQk9PVF9BUkNIICgiYXJt
IikgdG8gImFybTY0Ii4KPiArZGVmaW5lIFVCT09UX0lOU1RBTExfQ1VTVE9NX0RUUwo+ICsJZHRz
X2Rpcj0iYXJjaC8kKFVCT09UX0FSQ0gpL2R0cyI7IFwKPiArCWlmIGdyZXAgLXEgIl5DT05GSUdf
T0ZfVVBTVFJFQU09eSIgJChARCkvLmNvbmZpZzsgdGhlbiBcCj4gKwkJaWYgZ3JlcCAtcSAiXkNP
TkZJR19BUk02ND15IiAkKEBEKS8uY29uZmlnOyB0aGVuIFwKPiArCQkJZHRzX2Rpcj0iZHRzL3Vw
c3RyZWFtL3NyYy9hcm02NCI7IFwKPiArCQllbHNlIFwKPiArCQkJZHRzX2Rpcj0iZHRzL3Vwc3Ry
ZWFtL3NyYy8kKFVCT09UX0FSQ0gpIjsgXAo+ICsJCWZpOyBcCj4gKwkJZHQ9JCQoc2VkIC1uICdz
L15DT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRT0iXCguKlwpIiQkL1wxL3AnICQoQEQpLy5jb25m
aWcpOyBcCj4gKwkJY2FzZSAiJCRkdCIgaW4gKi8qKSBkdHNfZGlyPSIkJGR0c19kaXIvJCR7ZHQl
Lyp9Ijs7IGVzYWM7IFwKPiArCWZpOyBcCj4gKwljcCAtZiAkKFVCT09UX0NVU1RPTV9EVFNfUEFU
SCkgJChARCkvJCRkdHNfZGlyLwo+ICtlbmRlZgo+ICsKPiAgZGVmaW5lIFVCT09UX0JVSUxEX0NN
RFMKPiAtCSQoaWYgJChVQk9PVF9DVVNUT01fRFRTX1BBVEgpLAo+IC0JCWNwIC1mICQoVUJPT1Rf
Q1VTVE9NX0RUU19QQVRIKSAkKEBEKS9hcmNoLyQoVUJPT1RfQVJDSCkvZHRzLwo+IC0JKQo+ICsJ
JChpZiAkKFVCT09UX0NVU1RPTV9EVFNfUEFUSCksJChVQk9PVF9JTlNUQUxMX0NVU1RPTV9EVFMp
KQo+ICAJJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPiAgCQlQS0dfQ09ORklHPSIkKFBLR19D
T05GSUdfSE9TVF9CSU5BUlkpIiBcCj4gIAkJUEtHX0NPTkZJR19TWVNST09UX0RJUj0iLyIgXAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
