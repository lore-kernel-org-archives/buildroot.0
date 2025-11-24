Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BFCFD317
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 12:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DD040DEE;
	Mon, 24 Nov 2025 12:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4BqbetCPUsC; Mon, 24 Nov 2025 12:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2267340DD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2267340DD4;
	Mon, 24 Nov 2025 12:58:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4639F34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 377FB40DD4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vnq4I0G1x_-I for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 12:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.182;
 helo=mail-qk1-f182.google.com; envelope-from=maxime.leroys@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70B314094D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B314094D
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70B314094D
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:58:49 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8b2f2c5ec36so500312985a.1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 04:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763989128; x=1764593928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RiIzx+Aj4VgWnm/Q+Rycbsp9+438FZOJ5WdUCEhWwHM=;
 b=jR3II/p2dXsIFjYteXliS1Edfi6RZINsCi5MRy9fnkzQZcs9ARBrTLuLre82EODHiH
 4bnmm0bVxWvdru+ghxY0YrH/zY3ZKeAx30Kcu0KnjnhSgKH81s6kmmbDE27JMeFaEJk/
 Q4VX/2tODmonqLcbMXQ6zYFC+TIRTncs073T4ygsNoj9rBDjIoPFpsgHXD/sq1Y1SdEj
 FSWxtScIgbSN/MSROhSeemdRb/QeeOR5ri53maHQAFEUinIeQn1sBoaIzgbiefZV/Yls
 0+Z+yR6nQoE8K/RoguhpRJFEJQA82SlLAJqqSdOflxBm1VzeuUrrtk4rbog4oJ9M/Dw3
 25GA==
X-Gm-Message-State: AOJu0Yyn9N/QC0Arcl3FcD0ZAyl6QOcbLLxE+GJaSzDt73d5WqlhZ9ff
 jp2eb2seUm2KBcfTPcI5wCyQTl86kfQKqul7NBN0TdMcisTh+TSZlZXhrC97leq/SiRafcqqQ1N
 X5TdXho6DzIcSm0V7M1i7zOxTng90gImfFGVY
X-Gm-Gg: ASbGncs9yiAZYHo6+9z9XSWe29xLuiOw1Mhbf0hvRUtlMknZ9Cs/7wZLWCXvUrCeeuc
 vGcPoja+X3FRsN+uu1+9Iy2AMIa4CTas8F0a1TQoyEvfFZgOMimWRn2Y1zzbe5VauAXQfknA2jt
 ddp91thDejDFJk0laYopi+6dyK3NZJZYwaxAUdgpa44AG22ZftOgfEAUgxioOnNE22wa8vmsrDQ
 MqE/ZnW1KlkzOR2z2EsyTzUu9SuGwHO4DbvFuRVuIk7iVxRlvpdJZB6FzHVMvPBlF1wTdmWnZtZ
 YaBfKsfOUDUixG6oKXRLVMEz3A==
X-Google-Smtp-Source: AGHT+IG+xvqJka1NylcLlquVuHTgGsG8QYDPkNmQ4IJCaQF2QGoNhyKWKpBpn05+WFm1MaZnNsrbYKKT62TziZYTruA=
X-Received: by 2002:a05:620a:2988:b0:8b1:a49e:9b0e with SMTP id
 af79cd13be357-8b33d23b386mr1495777685a.5.1763989127999; Mon, 24 Nov 2025
 04:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20251021120342.483933-1-maxime@leroys.fr>
 <20251021120342.483933-3-maxime@leroys.fr>
In-Reply-To: <20251021120342.483933-3-maxime@leroys.fr>
From: Maxime Leroy <maxime@leroys.fr>
Date: Mon, 24 Nov 2025 13:58:36 +0100
X-Gm-Features: AWmQ_bkG5yH67LVRCveNtg_QMvDPPvNf5E_Zg_au3IKo76ALiKeAb18Vl0mO2OE
Message-ID: <CAHHRULUO74adEa0Uw+EuUtdFw9kwe8EicFvuyGZnw0bbz9gdCQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
Subject: Re: [Buildroot] [PATCH 2/5] package/dpdk: add toggle for deprecated
 kernel modules
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

TGUgbWFyLiAyMSBvY3QuIDIwMjUgw6AgMTQ6MDMsIE1heGltZSBMZXJveSA8bWF4aW1lQGxlcm95
cy5mcj4gYSDDqWNyaXQgOgo+Cj4gRXhwb3NlIEJSMl9QQUNLQUdFX0RQREtfRU5BQkxFX0tNT0RT
IHRvIHBhc3MgTWVzb24gLURlbmFibGVfa21vZHM9Lgo+IFRoaXMgY29udHJvbHMgYnVpbGRpbmcg
RFBES+KAmXMgb3V0LW9mLXRyZWUga2VybmVsIG1vZHVsZXMsIHdoaWNoIGFyZQo+IGRlcHJlY2F0
ZWQgdXBzdHJlYW0gYW5kIHNjaGVkdWxlZCBmb3IgcmVtb3ZhbC4KCkkgYW0gcGxhbm5pbmcgdG8g
YnVtcCB0aGUgRFBESyBwYWNrYWdlIHRvIHRoZSBsYXRlc3QgTFRTIHZlcnNpb24uClRoYXQgcmVs
ZWFzZSBzaG91bGQgYmUgYXZhaWxhYmxlIHNvb24uCgpUaGUgZW5hYmxlX2ttb2RzIG9wdGlvbiBo
YXMgYmVlbiByZW1vdmVkIGluIHRoYXQgdmVyc2lvbiwgc28gSSBiZWxpZXZlCnRoaXMgY29tbWl0
IGNhbiBiZSBkcm9wcGVkIOKAlCBhc3N1bWluZyB0aGlzIHNlcmllcyBpcyBtZXJnZWQgYmVmb3Jl
IEkKc2VuZCBteSBvd24gc2VyaWVzIHRvIHVwZGF0ZSB0aGUgRFBESyB2ZXJzaW9uLgoKUmVnYXJk
cywKCk1heGltZSBMZXJveQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
