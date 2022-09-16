Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A96ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EB683372;
	Fri, 16 Sep 2022 21:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6EB683372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3aUud1iNytf; Fri, 16 Sep 2022 21:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524CB8432A;
	Fri, 16 Sep 2022 21:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 524CB8432A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA011BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F2E140C18
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F2E140C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLfpKtXlHiUD for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9131240137
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9131240137
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:08:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g3so17043495wrq.13
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date;
 bh=17heRiSIWomqCH3In592S0tnN9B8uIru/a8/00egaXY=;
 b=TAoKWfcEITzZhaZiBj64y874gJqRS35d23EDPPvo3LFlLnn25titniXinckCJ0Kk88
 dw61rdZTT/SSwsAF/C78JkC6N57E+c5w6pb2NaPUXcFIGX6jPad0SviZa0As3Z2YA3iK
 W8xk3UXvnTHWGmnv/vee0zXkdhPotqXmeXd10iA8NEcBjrPrcLGKilFeR0iMWNmqUb19
 j+Sm7WJDUieafCLOYhUuwE9jQmBOeCOOsoX6jxA/YY540fF61RZPx1AiutfhJSiwkWyF
 6ftylU3d/nlIUtD1uzdMAcZttPcv+HJBNUohDMqjD8zNM/e5/J4rs5kMuV6ZLpg21EGF
 a3Kw==
X-Gm-Message-State: ACrzQf2Tph22ktaoltegonUDd4lONQqQs0+NzuqecOsQJ6FL3fYaTYnw
 XZ8IodhW+utZuSZvUrQIjg==
X-Google-Smtp-Source: AMsMyM5TsdI+qCrC+w+qkwHe5X9n6HOS9vKC7LVPiyFnMx2pnaZRIcG7AZbUKnztgOLAoZxFxhymjg==
X-Received: by 2002:a5d:6d42:0:b0:220:7ab1:9da9 with SMTP id
 k2-20020a5d6d42000000b002207ab19da9mr3963500wri.403.1663362531716; 
 Fri, 16 Sep 2022 14:08:51 -0700 (PDT)
Received: from localhost (cpc155795-brmb11-2-0-cust469.1-3.cable.virginm.net.
 [80.6.125.214]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003a845fa1edfsm7991247wms.3.2022.09.16.14.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 14:08:51 -0700 (PDT)
Date: Fri, 16 Sep 2022 22:08:49 +0100
From: Richard Ash <richard@audacityteam.org>
To: Alex <earthquake.de@freenet.de>
Message-ID: <20220916220849.59cd518a@audacityteam.org>
In-Reply-To: <a5f78f21-7b6e-6e68-0104-d51879d82e35@freenet.de>
References: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
 <c1d1e5ac-efe5-eeff-af5d-dd9d6eae5696@green-communications.fr>
 <a5f78f21-7b6e-6e68-0104-d51879d82e35@freenet.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Clacks-Overhead: GNU Terry Pratchett
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
 bh=17heRiSIWomqCH3In592S0tnN9B8uIru/a8/00egaXY=;
 b=H019mLOfYtfBUrKnpv3MD7uY5yYY8vVd0obzYydWWV+6gmLFk6NG1jfoEu2HmANEK4
 LDror7NPWS3b9DKWaSEYx4d61pDeqrk1QT6Ngmk3oyHeAg+0zpsl9IWO3qcMzM8Qb6VX
 EoPpReNPTYOHHJE3/ac/kdrsTP1eBGw4NqgGuVhqMZG6xg2exlyRVBsJ2qcpimkP012p
 QDjhsP6Z3cZOAPJsMQoEpTr6WjKnn3Q4Iqibd3wEocO/d8YLqzZYzp2c9Sa4YjOJDmQk
 6frFzd9zirk0olZLo8ebWoj8FDXDa5wQAyNC3vJhkU2K2zYXrR1Q1rWOP/mjZab8HgSM
 3Lkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H019mLOf
Subject: Re: [Buildroot] libstdc++ DSO missing
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: busybox@busybox.net, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxMSBTZXAgMjAyMiAxMTo0MTo1MSArMDIwMApBbGV4IDxlYXJ0aHF1YWtlLmRlQGZy
ZWVuZXQuZGU+IHdyb3RlOgoKPiBUaGFuayB5b3UgZm9yIHlvdXIgZGV0YWlsZWQgZXhwbGFuYXRp
b24uCj4gPiBPbiAwOS8wOS8yMDIyIDE0OjM0LCBBbGV4IHdyb3RlOiAgCj4gPj4gSGksCj4gPj4K
PiA+PiBJIGludGVyZ3JhdGVkIG15IGFwcGxpY2F0aW9uIHRvIGJ1aWxkcm9vdC4gQ29tcGxpZSBp
cyBzdWNjZXNzZnVsbAo+ID4+IGJ5IHdoZW4gbGlua2luZyBJIGdldCBlcnJvcnM6Cj4gPj4KPiA+
PiB4ODZfNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9saWI2NC9saWJzdGRjKysu
c28uNjogZXJyb3IKPiA+PiBhZGRpbmcgc3ltYm9sczogRFNPIG1pc3NpbmcgZnJvbSBjb21tYW5k
IGxpbmUgIAo+ID4KPiA+IFRoaXMgZXJyb3IgbWVhbnMgdGhhdDoKPiA+IC0gdGhlIGxpbmtlciBm
b3VuZCBhIGxpYnJhcnkgd2l0aCBhIERUX05FRURFRCBkZXBlbmRlbmN5IG9uIAo+ID4gbGlic3Rk
YysrLnNvLjYKPiA+IC0gdGhlIGxpbmtlciBmb3VuZCBsaWJzdGRjKysuc28uNgo+ID4gLSB0aGUg
bGlua2VyIGlzIG1pc3Npbmcgc3ltYm9scwo+ID4gLSB0aGUgbGlua2VyIGZvdW5kIHRoZSBtaXNz
aW5nIHN5bWJvbHMgaW4gbGlic3RkYysrLnNvLjYKPiA+IC0gYnV0IHRoZSBsaW5rZXIgY29tbWFu
ZCBsaW5lIGRvZXMgbm90IGluY2x1ZGUgbGlic3RkYysrLnNvLjYKPiA+IC0gc28gdGhlIGxpbmtl
ciBpcyBub3Qgc3VyZSBpZiB0aGUgdXNlciBhY3R1YWxseSBpbnRlbmRlZCB0byBsaW5rCj4gPiB3
aXRoIGxpYnN0ZGMrKy5zby42Lgo+ID4gLSBzbyBpdCByZWZ1c2VzIHRvIGxpbmsuCj4gPgo+ID4g
U2luY2UgbGlic3RkYysrLnNvLjYgaXMgdGhlIEMrKyBydW50aW1lIGxpYnJhcnksIHRoaXMgZWl0
aGVyIG1lYW4KPiA+IHRoYXQ6Cj4gPiAtIHlvdSBhcmUgbGlua2luZyBhIEMrKyBwcm9ncmFtIHdp
dGggbGQgb3IgZ2NjIGluc3RlYWQgb2YgZysrICAKPiAKPiBZYXAsIG91dHNpZGUgb2YgYnVpbGRy
b290LCBsaW5raW5nIGNhbGxzIHRoZSBnKysgYnV0IHdoZW4gbGlua2luZwo+IGluc2lkZSBidWls
ZHJvb3QswqAgY2FsbHMgdGhlIHg4Nl82NC1idWlsZHJvb3QtbGludXgtZ251LWxkLAo+IGJlY2F1
c2UgJChMRCkgaW4gdGhlIG1ha2VmaWxlIGlzIHNldCB0byB4ODZfNjQtYnVpbGRyb290LWxpbnV4
LWdudS1sZCAKPiB3aXRoaW4gYnVpbGRyb290LgoKSSBkb24ndCB0aGluayBpdCdzIGV2ZXIgYmVl
biBub3JtYWwgdXNhZ2UgdG8gdXNlICQoTEQpIHdoZW4gdHJ5aW5nIHRvCmxpbmsgYW55dGhpbmcg
aW52b2x2aW5nIGR5bmFtaWMgbGlua2FnZS4gQXMgZmFyIGFzIEknbSBhd2FyZSwgeW91cgpNYWtl
ZmlsZSBzaG91bGRuJ3QgYmUgdXNpbmcgJChMRCkgaWYgeW91IGFyZSBsaW5raW5nIGR5bmFtaWNh
bGx5LiBBcwp5b3UgYXJlIGxpbmtpbmcgYSBDKysgYXBwbGljYXRpb24sIHRoZSBsaW5rIGNvbW1h
bmQgc2hvdWxkIGJlIHVzaW5nCiQoQ1hYKSAobWFrZSBkb2Vzbid0IHNlZW0gdG8gaGF2ZSBhIGJ1
aWx0IGluIHJ1bGUgZm9yIGxpbmtpbmcgQysrLCBidXQKaXQncyB3aGF0IEkgaGF2ZSBhbHdheXMg
dXNlZCBhbmQgbm90IGhhZCB0aGlzIHNvcnQgb2YgcHJvYmxlbSkuCiQoQ1hYKSB3aWxsIGJlIHBv
aW50aW5nIHRvIHRoZSBjb3JyZWN0IGcrKywgd2hpY2ggd2lsbCB0aGVuIGNhbGwgb3V0IHRvCnRo
ZSBjb3JyZWN0IGxkIGFzIHJlcXVpcmVkLCB3aXRoIHRoZSBjb3JyZWN0IG9wdGlvbnMuCgpJZiB5
b3UgbWFrZSB0aGlzIGNoYW5nZSB0byB5b3VyIE1ha2VmaWxlIHlvdSBzaG91bGRuJ3QgbmVlZCB5
b3VyIGtsdWRnZS4KClJpY2hhcmQKIAo+IEluc2lkZSB0aGUgcGFja2FnZSAubWsgZmlsZSBvZiB0
aGUgQlVJTERfQ01EUyBjYWxscyBtYWtlOgo+IAo+ICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpwqAgLUMgJChARCkKPiAKPiBTbyAoYSBrbHVkZ2UgdG8gdGVzdCksIGkgcmVwbGFjZWQg
aW4gdGhlIE1ha2VmaWxlCj4gJChMRCkKPiBieQo+ICQoSE9TVF9ESVIpL2Jpbi94ODZfNjQtbGlu
dXgtZysrCj4gTm93IGxpbmtpbmcgaXMgc3VjY2Vzc2Z1bGwuLi4KPiBJcyB0aGVyZSBhIG1vcmUg
ImVsZWdhbnQiIHdheSB0byBkbyB0aGlzLi4uPyBOb3Qgc28gYSBrbHVkZ2UgbGlrZQo+IHRoYXQs
IG1lYW4gc2V0dGluZyB0aGlzIHdpdGhpbiB0aGUgbWsgZmlsZSBiZWZvcmUgY2FsbGluZyB0aGUg
cHJvamVrdAo+IG1ha2UuLi4gQW5kIGhvdyB0byBzcGVjaWZleSAkKENDKSBhbHNvIHRvIGcrKz8/
Cj4gCj4gCj4gPiAtIHlvdSBhcmUgbGlua2luZyBhIEMgcHJvZ3JhbSB3aXRoIGEgQysrIGxpYnJh
cnkgdGhhdCByZXF1aXJlcyAKPiA+IGxpYnN0ZGMrKy5zby42LCBpbiB0aGlzIGNhc2UgeW91IG1h
eSBuZWVkIC1sc3RkYysrIG9uIHRoZSBsaW5rZXIgCj4gPiBjb21tYW5kIGxpbmUuCj4gPiAgCj4g
Pj4gQXJlIGxpYnJhcmllcyBtaXNzaW5nIGZyb20gYnVpbGRyb290IGVudmlyb25tZW50PyAgCj4g
Pgo+ID4gTm8sIG9ubHkgdGhlIGxpbmtlciBjb21tYW5kIGxpbmUgaXMgaW5jb3JyZWN0Lgo+ID4g
IAo+ID4+IEFkZGl0aW9uYWwgSSBnZXQgd2FybmluZ3MgdGhhdCBzb21lIC5zbyBmaWxlcyBub3Qg
Zm91bmQsIGJ1dCB0aGV5Cj4gPj4gYXJlIGF2YWlsYWJsZSBpbiBvdXRwdXQvYnVpbGQvPFRvb2w+
L2xpYiAgCj4gPgo+ID4gVGhlIGNvbXBpbGVyIHdpbGwgb25seSBzZWFyY2ggbGlicmFyaWVzIGlu
IG91dHB1dC9zdGFnaW5nL2xpYiBvciAKPiA+IG91dHB1dC9zdGFnaW5nL3Vzci9saWIuCj4gPiBU
aGUgcGFja2FnZSBmb3IgPFRvb2w+IHNob3VsZCBpbnN0YWxsIHRoZSBsaWJyYXJpZXMgdGhlcmUs
IHNvIHRoYXQgCj4gPiBvdGhlciBwcm9ncmFtcyBjYW4gbGluayB3aXRoIHRoZW0uIFRoaXMgaXMg
ZG9uZSBieSBwdXR0aW5nCj4gPgo+ID4gPFRPT0w+X0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4K
PiA+IGluIGl0cyAubWsgZmlsZS7CoCBJZiA8VG9vbD4gaXMgYSBnZW5lcmljLXBhY2thZ2UgKGFu
ZCBub3QgYSAKPiA+IGF1dG90b29scy9tZXNvbi9jbWFrZSBwYWNrYWdlKSwgdGhlbiB5b3UgYWxz
byBuZWVkIHRvIG1hbnVhbGx5Cj4gPiBleHBsYWluIGhvdyB0byBpbnN0YWxsIGxpYnJhcmllcyB0
byAkKFNUQUdJTkdfRElSKS9saWI6ICAKPiAKPiBJbmRlZWQgSSBmb3Jnb3Qgb25lIG9mIHRoZSAu
c28gdG8gYmXCoCBpbnN0YWxsZWQgdG8gc3RhZ2luZy4gQWZ0ZXIKPiBhZGRpbmcgdGhpcyBhbmQg
YXBwZW5kIHRvIHRoZSAkKE1BS0UpIGNhbGwgdGhlCj4gTERfTElCUkFSWV9QQVRIPSIkKEBEKS4u
LzxUb29sPi9saWIiIGNvbXBpbGUgYW5kIGxpbmtpbmcgaXMKPiBzdWNjZXNzZnVsbC4KPiAKPiA+
Cj4gPiBodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNfaW5mcmFzdHJ1
Y3R1cmVfZm9yX3BhY2thZ2VzX3dpdGhfc3BlY2lmaWNfYnVpbGRfc3lzdGVtcyAKPiA+Cj4gPiAg
Cj4gPj4gQnV0IEkgaW5jbHVkZWQgdGhpcyBwYXRoIGJ5ICQoQEQpLy4uLzxUb29sPi9saWIgIAo+
ID4KPiA+IFdoaWxlIGl0IG1heSB3b3JrLCB0aGlzIGlzIGEga2x1ZGdlLiAgCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
