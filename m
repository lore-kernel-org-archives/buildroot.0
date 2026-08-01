Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C4CC55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 19:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1264067C;
	Sat,  1 Aug 2026 19:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjAs_PoVlLmq; Sat,  1 Aug 2026 19:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F4240676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785614281;
	bh=5vvDu48LKMdomfKkWFF6xHM34ZdpoTDL/sRfINOfdMQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGMr1M/giip94l8F8EgTq0fje865B9MiYenpKPuIT3QNHzZcxa+EPnEcJkcxLAUeW
	 ggsVa+E3PklC3wDGkrkUT0g8n/zclRK/eeTSJV1f0DPXUqYXKN4tyDJnOcNW6npMGG
	 RHn5TVMN0/QbvR1Wzg/jYOQcTEpMKVKu7DGs3DTHdTtTHAJg8JXps/Wd7JdWzqXKeh
	 pusJLWBkRIVzASWgd10GUm0RyO+/tUfiguvhAXy9DrWLtafNmuMsRV6x3diiq3HsvC
	 lvGjhoRVUbvLJA10nstpknc+1sNqWyXg0I5gsMBabwZQtMqyFATYPc9vrKRrKTJDZD
	 dl1jatdhqKCtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F4240676;
	Sat,  1 Aug 2026 19:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C84AFE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 19:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5AB60719
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 19:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvbtN7eOIC4z for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 19:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94052606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94052606F7
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94052606F7
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 19:57:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5b2b92065ffso2014600e87.1
 for <buildroot@buildroot.org>; Sat, 01 Aug 2026 12:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785614274; cv=none;
 d=google.com; s=arc-20260327;
 b=jTYmqD6CFT9NuExkC4cwgLuZ4z94NoVR5dO090jD0r+XHR15VM0bB7C29M1LF/BQEc
 Ht6YWX3+Btp1RJIqjZCKdNHG/WpmXDDSejt6oSrar5jBkIERM1iLCiPJw0DRRox6JcQ4
 dcUCz2tQ3XRQ6u/Aomm5EPfboj+10YeBTN+m267pn/owpUOcEF+CgM+T5OLdqZFdVqGk
 pJobe4LslVLpejf3Y9OFbKgzJjfGXugyt+j3tr02Qa2MFCZE4S4/K4C18n2ESw5rfos+
 YJdA/O25QLjCquq/aDXos7ZYs7bz9i22vP7t1GDyOVM17s2C7X582jXve2T5KCl/Rkau
 I3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vkj+6WkQXeXL3cdpC6yNHXMDfFq09JKtRCdl681oRfc=;
 fh=oO+F4eqxj15DoelcLs8CjB4MGEbTqsPZoc0sWOOoCMQ=;
 b=fGmngF/ZYiw0jTLWL++UzjqjDoQd8ggvjh/m1KXKtuv6mqEXAPCxkncFzrbBUXlUQ0
 MAEOqN7AYRlYt0STXpjvnyEQPqQvBJy+bhMMbtee1MVrfudhs5hEbUViG5sG2goCVDEK
 s+r5RYm4M03OlHTjpFmSLjCiuFy38fVDEmRwLiFcNnLWJ4CkayQ+I0izdcg+njUTWlWf
 t8C5aa0jBoBhNBJAXkv2Z4qs9Iwwe6rVA+Zx5sK5ETVCSrxNU30pPh9gO3zPPw/lbTsg
 551VAQps2OhClVHnYlf0ivBqO+ZpugzcVJTDVCKARNt0WpljCCXXOJ/kP4EUtSshcutN
 Sc9w==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785614274; x=1786219074;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vkj+6WkQXeXL3cdpC6yNHXMDfFq09JKtRCdl681oRfc=;
 b=OXTvhinGdwuyHE4ezz5HP895Nw01c3WSOghwZKlmjK8MOzDl7a9X9cd3MTuCQ+9G5Q
 xoI7QCGCMU+pVz96TmPJ7hcy+wZK3jdgBy/JPUjU0+bcoMbxLSRcCbcGAEPwpzXJdtrM
 Vs5j286K9ukzcn8TXhjUzoZ7zwR3tNxwKKltTV8o9Aybn5FWP0y0RogGpCw5YGB1kK2n
 BzGw/igCrT3QQzyQxqOWJnxP6TyIGr/4AqmMW4nyHTh8DTAeTppT8X7t29QK6d6Wr1W0
 UVEfv8rLPbLD+wAaPAalOvSgPEDiqJaEu1uwKw4CDkr4ZOBlMSeMRlV/6s2vXmxlQoC6
 FiNw==
X-Gm-Message-State: AOJu0YxbPkhPcLSNVedb3Pc78ahZG0ntc9DhcxgJUTG8QfxVpafbAouK
 dnnPWCPu7BWg3L9suLerFFtx0NBZ2Azug6Utsx4BvK2RhuTH3U7c7XVIta542gfIo1gL3ga9NwJ
 5F8QnVAgatJpOQY8HkmszsPc/G8owBs0=
X-Gm-Gg: AR+sD13d/gVvLsX3hM25Eo7U6LPoO4QLT/Viyply+j3j3+uKLRwd1Gw5nUDyoIJPHDg
 gM888SP2BsXM686c4DCteHrsxia9CjVKFkzGTY1euTL8zGrZebF0OauV0ELOLd1+g6/99Ly0Ekn
 kFkgYflV/TVOLb31XIgndS8Kru/DaxTTwFcMjLMxcCMOlD1o+3lCnpxtuZHDm1ndn2ED+XTdA3q
 ZgU5oHuK0DMyNeEukq4sq7MoMY/2EY+1688CX+r+L5+oHL6hb9pKdYkrgnlAnxfX37ARDdFGmJP
 Lm4Naki0sY0CMOFxBvQ9ryT7ziF8jcTdQb6aXwrm1xi2KcQ7XtEnhl4=
X-Received: by 2002:ac2:4143:0:b0:5b2:a225:bc67 with SMTP id
 2adb3069b0e04-5b2e4f4028amr578433e87.29.1785614273730; Sat, 01 Aug 2026
 12:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260703023758.3883041-1-matt@thewebers.ws>
 <CAAHg4Zg8g5sxprMwQnUYpnApD18k8SrqBhuBzfk=6qhEospE=w@mail.gmail.com>
In-Reply-To: <CAAHg4Zg8g5sxprMwQnUYpnApD18k8SrqBhuBzfk=6qhEospE=w@mail.gmail.com>
From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 1 Aug 2026 14:57:40 -0500
X-Gm-Features: AUfX_mxh003i3842XWzpIqf4HqW64IExX7JRR66I9Ha0othzxvNeZWAv9JYBZJE
Message-ID: <CAFt09wMb3eOkZruyPZJr-t9xjpxqCBOEOVga5y0kvuqykrFuoA@mail.gmail.com>
To: j@j-ernberg.se
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>, Julien Olivain <ju.o@free.fr>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 John Ernberg <john.ernberg@actia.se>, 
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20251104.gappssmtp.com; s=20251104; t=1785614274; x=1786219074;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vkj+6WkQXeXL3cdpC6yNHXMDfFq09JKtRCdl681oRfc=;
 b=AEGvW4aAhbcf1+G8C3ECNvvqs93Wzl+oiIY5pWvzwLEvsCZv5IADQiC7p7vUyrafEo
 9m/YoF6C+Asy+1dU60RxTW9rAg32t7jXvMGLRPWD+Xaib1vf0/KrbQivPVZMGdTpHyVE
 TpZC5cgKsQeGVd1EgX/gD60o5oQsK56E9AVGGwf0q91GB40aS0Bcm7Jcdp+oSk/N0jq9
 5+DLk5C0Yc8sjt2wUvoeKnET1QpohVkFYuwUr55ljSgpkJ6s3PmBaW05BiV5s0iYXXie
 wAmUvHZmoYzZQeviGOQhmPq3jqTqd8ODNby+WZrb2taBphu9WIblCaZlaYpvlamRjBpj
 XRrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=thewebers.ws
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20251104.gappssmtp.com
 header.i=@thewebers-ws.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=AEGvW4aA
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9obiwKCk9uIFRodSwgSnVsIDksIDIwMjYgYXQgNTowNOKAr0FNIEpvaG4gRXJuYmVyZyA8akBq
LWVybmJlcmcuc2U+IHdyb3RlOgo+Cj4gSGkgTWF0dGhldywKPgo+IEFwb2xvZ2llcyBmb3IgdGhl
IGRlbGF5Lgo+Cj4gT24gRnJpLCBKdWwgMywgMjAyNiBhdCA0OjM44oCvQU0gPG1hdHRAdGhld2Vi
ZXJzLndzPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBNYXR0aGV3IFdlYmVyIDxtYXRoZXcubC53ZWJl
cjNAYm9laW5nLmNvbT4KPiA+Cj4gPiBCdW1wIFhlbiBmcm9tIDQuMTkuNSB0byA0LjIxLjEuCj4g
Pgo+ID4gUmVzb2x2ZWQgaW4gdmVyc2lvbiBidW1wOgo+ID4gLSAwMDAyLUFybS1wbGF0Zm9ybXMt
Zml4LWJ1aWxkLXdpdGgtZ2NjMTUucGF0Y2gKPiA+ICAgVXBzdHJlYW06IGh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTM5Zjk1MDg5ZTJiYTE1
YzU0MzhjZTkwNGMwY2JiZDhkNzlkM2U2ZTcKPiA+Cj4gPiBUaGUgZ2l0LWNoZWNrb3V0LnNoIGZp
eCBmb3Igbm9uLW1hc3RlciBicmFuY2ggY2hlY2tvdXQgaXMgbm93IGluY2x1ZGVkOgo+ID4gICBo
dHRwczovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXRk
aWZmO2g9MDFmYjIzZGQ3MTAwNmQ4N2U4NzRmMzEwZTljNTBmMzE1ODJmMjc0ZQo+ID4KPiA+IFJl
bWFpbmluZyBwYXRjaGVzIHJlZnJlc2hlZCBmb3IgdXBkYXRlZCBjb250ZXh0Ogo+ID4gLSAwMDAx
LU5vLXRyYWNlLWJhY2tlbmQucGF0Y2ggKEJ1aWxkcm9vdCBzcGVjaWZpYywgY3Jvc3MtY29tcGls
ZSB3b3JrYXJvdW5kKQo+ID4gLSAwMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggKEJ1aWxk
cm9vdCBzcGVjaWZpYywgY3Jvc3MtY29tcGlsZSB3b3JrYXJvdW5kKQo+ID4KPiA+IFN0YXJ0aW5n
IHdpdGggWGVuIDQuMjAsIHFlbXUteGVuIGlzIG5vIGxvbmdlciBidW5kbGVkIGluIHRoZSByZWxl
YXNlCj4gPiB0YXJiYWxsLiBBZGQgYSBuZXcgcWVtdS14ZW4gcGFja2FnZSB0aGF0IHByb3ZpZGVz
IHRoZSBxZW11LXhlbiBzb3VyY2UKPiA+IHRyZWUgd2l0aCByZXF1aXJlZCBtZXNvbiBzdWJwcm9q
ZWN0cyBwcmUtcG9wdWxhdGVkLiBUaGlzIGF2b2lkcyBhbnkKPiA+IG5ldHdvcmsgYWNjZXNzIGR1
cmluZyB0aGUgYnVpbGQuCj4gPgo+ID4gTmV3IGRlcGVuZGVuY2llczoKPiA+IC0gcWVtdS14ZW4g
KHByb3ZpZGVzIHFlbXUteGVuIHNvdXJjZSBmb3IgdG9vbHMgYnVpbGQpCj4gPiAtIGhvc3QtcHl0
aG9uLWRpc3RsaWIgKG5lZWRlZCBieSBRRU1VJ3MgbWt2ZW52KQo+ID4KPiA+IFRoZSBxZW11LXhl
biBwYWNrYWdlOgo+ID4gLSBGZXRjaGVzIHFlbXUteGVuIHZpYSBnaXQgKHdpdGhvdXQgcmVjdXJz
aXZlIHN1Ym1vZHVsZXMgdG8gYXZvaWQKPiA+ICAgbWFzc2l2ZSBST00gZG93bmxvYWRzKQo+ID4g
LSBQcmUtcG9wdWxhdGVzIHJlcXVpcmVkIG1lc29uIHN1YnByb2plY3RzIChrZXljb2RlbWFwZGIs
Cj4gPiAgIGJlcmtlbGV5LXNvZnRmbG9hdC0zLCBiZXJrZWxleS10ZXN0ZmxvYXQtMykgZnJvbSBn
aXRsYWIgYXJjaGl2ZXMKPiA+IC0gQXBwbGllcyBwYWNrYWdlZmlsZXMgb3ZlcmxheXMgKG1lc29u
LmJ1aWxkKSBmb3Igc3VicHJvamVjdHMgdGhhdAo+ID4gICBuZWVkIHRoZW0KPiA+IC0gUmVtb3Zl
cyAud3JhcCBmaWxlcyBmb3IgdW51c2VkIHN1YnByb2plY3RzIHRvIHByZXZlbnQgYW55IG5ldHdv
cmsKPiA+ICAgYWNjZXNzIGF0dGVtcHRzIGR1cmluZyB0aGUgYnVpbGQKPiA+IC0gUGF0Y2hlcyB4
ZW5fbmF0aXZlLmggI2Vycm9yIHRvICN3YXJuaW5nIGZvciBjcm9zcy1jb21waWxlCj4gPgo+ID4g
VGVzdGVkIHdpdGg6Cj4gPiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gPiAgICAg
ICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ID4gICAgICAgICB0ZXN0cy5wYWNrYWdlLnRl
c3RfeGVuLlRlc3RYZW5BYXJjaDY0Cj4gPiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBc
Cj4gPiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ID4gICAgICAgICB0ZXN0cy5w
YWNrYWdlLnRlc3RfeGVuLlRlc3RYZW5Bcm12Nwo+ID4KPiA+IEJvdGggYWFyY2g2NCBhbmQgYXJt
MzIgcnVudGltZSB0ZXN0cyBwYXNzLgo+ID4KPiA+IFF1aWNrIGJ1aWxkIGRlZmNvbmZpZyB1c2Vk
IGZvciBpdGVyYXRpb246Cj4gPiAgICAgQlIyX2FhcmNoNjQ9eQo+ID4gICAgIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+ID4gICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15Cj4g
PiAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxF
PXkKPiA+ICAgICBCUjJfUEFDS0FHRV9YRU49eQo+ID4gICAgIEJSMl9QQUNLQUdFX1hFTl9IWVBF
UlZJU09SPXkKPiA+ICAgICBCUjJfUEFDS0FHRV9YRU5fVE9PTFM9eQo+ID4gICAgICMgQlIyX1RB
UkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiA+Cj4gPiBSZWxhdGVkIHByaW9yIGF0dGVtcHRz
Ogo+ID4gICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjYwMjExMDU1MTM4LjcxOTQ1OS0xLW1hdHRoZXcubC53ZWJlckBnbWFpbC5jb20vCj4g
PiAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyNTEwMDcxNjQ3NTYuODkzMjY0LTEtdGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmUvCj4gPgo+
ID4gQ2M6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgo+ID4gQ2M6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gPiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBhcm0uY29tPgo+ID4gQ2M6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5jaHJpc3Rv
cGhlQG1pbmQuYmU+Cj4gPiBDYzogSm9obiBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdlYmVyIDxtYXRoZXcubC53ZWJlcjNAYm9laW5n
LmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcWVtdS14ZW4vQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgICB8ICA5ICsrKwo+ID4gIHBhY2thZ2UvcWVtdS14ZW4vcWVtdS14ZW4uaGFzaCAgICAg
ICAgICAgICAgICB8ICA1ICsrCj4gPiAgcGFja2FnZS9xZW11LXhlbi9xZW11LXhlbi5tayAgICAg
ICAgICAgICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKwo+Cj4gQ2FuJ3QgdGhpcyBqdXN0
IGJlIHBhcnQgb2YgdGhlIHhlbi5taz8gSXQgZG9lc24ndCBmdW5jdGlvbiBvdXRzaWRlIG9mCj4g
aXQgYW55d2F5LiBPciBhdCBsZWFzdCBrZXB0IGluIHRoZSB4ZW4gZGlyZWN0b3J5IGhlcmUgc28g
aXQncyBjbGVhcmVyCj4gdGhhdCBpdCdzIHRpZ2h0bHkgYm91bmQgdG9nZXRoZXIuCgpJIGtlcHQg
aXQgYSBjbGVhbiBwYWNrYWdlIHNvIHRoZSBhc3N1bXB0aW9ucyBhcm91bmQgdGhlIGRvd25sb2Fk
IGxvZ2ljCndlcmUgY29uc2lzdGVudCB3aXRoIG90aGVycy4gIEkgYWdyZWUgdGhhdCBtYXliZSB4
ZW4gc2hvdWxkIGhhdmUgc3ViCmZvbGRlcnMgYnV0IHRoZW4gSSdkIGhhdmUgdG8gbW92ZSB0aGUg
ZXhpc3RpbmcgZmlsZXMgYXMgd2VsbCB0byBtYWtlCml0IHNpbWlsYXIgdG8gb3RoZXIgcGFja2Fn
ZXMgdXNpbmcgdGhhdCBwYXR0ZXJuLiAgaS5lLiwgeGVuL3hlbi94ZW4ubWsKLCB4ZW4vcWVtdS14
ZW4vLi4uLgoKPgo+IEknbSBhbHNvIG5vdCBmdWxseSBjb252aW5jZWQgdGhlIHFlbXUteGVuIHBh
cnQgaXMgbmVlZGVkIGF0IGFsbCwgWGVuCj4gZG9lcyBzdXBwb3J0IHN5c3RlbSBxZW11LCBhbmQg
bG9va2luZyBhdCB0aGUgY29tbWl0cyB0aGUgWGVuIHByb2plY3QKPiBkaWQgb24gdG9wIG9mIHRo
ZSBxZW11IHZlcnNpb24gdGhleSBwaWNrZWQgaGVyZSB0aGV5IGFyZSBwcmV0dHkgbXVjaAo+IG9u
bHkgcmVxdWlyZWQgZm9yICpCU0QuCj4gSGF2ZSBJIG92ZXJsb29rZWQgc29tZXRoaW5nIHRoYXQg
d291bGQgbWFrZSBhIHN5c3RlbSBxZW11IHBhdGggaW5hcHByb3ByaWF0ZT8KCkkgbW9zdGx5IGtl
cHQgaXQgc2VwYXJhdGUgYWZ0ZXIgbG9va2luZyBhdCB0aGUgcHJpb3IgYXR0ZW1wdCBhdCB1c2lu
ZwpzeXN0ZW0gcWVtdS4gIEl0IGZlbHQgbGlrZSBhZGRpbmcgdGhhdCBkZXBlbmRlbmN5IGJldHdl
ZW4gc3lzdGVtIHFlbXUKYW5kIHhlbiBjb3VsZCBibG9jayB1cGRhdGVzIHRvIGVpdGhlciBwYWNr
YWdlIG92ZXIgdGltZSAoZS5nLiwgaWYgeGVuCmhhZG4ndCBtb3ZlZCB0aGF0IGZhciBmb3J3YXJk
IG9yIG90aGVyIGNvcm5lciBjYXNlIGNvbmRpdGlvbnMgYmV0d2Vlbgp1cHN0cmVhbSBhbmQgQnVp
bGRyb290IHJldnMuKQoKVGhhbmtzIGZvciByZXZpZXdpbmchCgpCZXN0IFJlZ2FyZHMsCk1hdHQK
CihUaGFuayB5b3UgSnVsaWVuIGZvciB0aG9zZSBtaW5vciB1cGRhdGVzIGFuZCBhcHBseWluZyEp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
