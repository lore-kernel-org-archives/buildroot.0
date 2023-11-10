Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B787CC4167D
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B784031C;
	Fri, 10 Nov 2023 19:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B784031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JK0Utc0camf; Fri, 10 Nov 2023 19:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8021419BA;
	Fri, 10 Nov 2023 19:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8021419BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C89461BF852
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A069C82123
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A069C82123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfnXHejgryMK for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 19:40:07 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 380AB8210C
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 19:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380AB8210C
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9db6cf8309cso396415966b.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699645205; x=1700250005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S+bnwzhhqtv8GHbi3A9kcx/P5KuC56ERrZ/U3+ac76A=;
 b=kGkeQQWOjcYiLYMNgB8ElVFwG6Xis6/sRWKYB1uPlRPCj/UuEq0Yv+xnaNUk3+nB1P
 S3id8A3vMqZ0Fhr5uVqP6PAcvICn8A6KTgLbUQPe3BJ0nTVk3SDlz4phoTS4+dOm98Ws
 FxkLdw73pbLc1M4HE9XKoew++779gXPQgsyY1hOzSDjr0r1ZfsaFtVGD0urhYNrEPEWX
 SblBkVzIkMb0YStbtUC6dohS0MnRCaUYvGiHw5h/rh9laZKJQkUIvSZvuSb8bZD99w8G
 18Sz7RTYCo40LpEHj5GCLhdnwHfVorqdtUJLD4NByiheuSHm2DIh05hndgCCISiTbUK7
 8o8A==
X-Gm-Message-State: AOJu0YzB4gDAAIQXHrpxB/yoFrXyb4oE9eeQ/CAQie/gD3CInAw+shVO
 BgOMVkPQi+v0haz9Z7dslQ6ZVdYrhvq5lBOujTc=
X-Google-Smtp-Source: AGHT+IE31OmgMNp9aGbDw0JlOdthJpwgNZmoTDFQyGp18oza8ePTt/xJE2kzqY2ip/yifqnDNaeVKg==
X-Received: by 2002:a17:906:8456:b0:9d3:ccf0:761e with SMTP id
 e22-20020a170906845600b009d3ccf0761emr5796712ejy.49.1699645205108; 
 Fri, 10 Nov 2023 11:40:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1709066bd900b0099c53c4407dsm3500ejs.78.2023.11.10.11.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 11:40:04 -0800 (PST)
Message-ID: <bf35c736-8d92-4b84-97ab-fefc4ef2be15@mind.be>
Date: Fri, 10 Nov 2023 20:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
 <20231108215536.7a780fe2@windsurf>
 <CAFSsvmqmULY+=X8bx-mv0k0Boj4RgZD5LBQ=4gVz+KV_TO_ndQ@mail.gmail.com>
In-Reply-To: <CAFSsvmqmULY+=X8bx-mv0k0Boj4RgZD5LBQ=4gVz+KV_TO_ndQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699645205; x=1700250005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S+bnwzhhqtv8GHbi3A9kcx/P5KuC56ERrZ/U3+ac76A=;
 b=LTFFiu/BUvM4EDcC/AotHKR5M4a3dU3hGsmXnfBXluZGIIc3YD7a+1NsTP0odNk3N/
 IkfOxG87cfZOJqwmJuWlMEVFiIu5gaNQJfU3eFBfQa9ufpvdCZNk3WPxbpQ4S6Wnrnew
 +n/0NDX2zcgU6jQoyBrJ+FjPoBpgXqo9MemguRUA7ITe6DG4eq+qrCUJ1oe8aX0FVEZb
 WYg5Y7jTkQ6C6Ob1tKvdyaMQ+88xZ6CU/7SBnD3uDSADNV9PNoB3rpFK41qHQdSaqwbn
 Y3RbXMfuKets1BLF8U35/0bNynWvh6CetF/15O6BFP6IbABX/NAihcaM5AmXq+vUo0A9
 DzJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LTFFiu/B
Subject: Re: [Buildroot] [PATCH 00/12] SELinux: Basic config enforcing mode
 support.
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMS8yMDIzIDE3OjQ5LCBBZGFtIER1c2tldHQgd3JvdGU6Cj4gSGV5IFRob21hcywg
c29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IQo+IAo+IFJlZnBvbGljeSBpdHNlbGYgaXMganVzdCB0
aGF0LCBhIHJlZmVyZW5jZSBwb2xpY3kuCgogIElmIHJlZnBvbGljeSBvbmx5IHByb3ZpZGVzIGEg
cmVmZXJlbmNlIHBvbGljeSwgaG93IGNhbiBCdWlsZHJvb3QgZG8gYW55IApiZXR0ZXI/IFdlIGRv
bid0IGRvIGFueSB3ZWlyZCB0aGluZ3Mgd2l0aCBwYWNrYWdlcywgc28gYW55IHBvbGljeSB0aGF0
IGlzIAphcHBsaWNhYmxlIHRvIEJ1aWxkcm9vdCBpcyBhcHBsaWNhYmxlIHRvIGV2ZXJ5b25lLgoK
PiBRdWl0ZSBhIGZldyBnYXBzIGFyZSBtaXNzaW5nIAo+IHdpdGggc2V2ZXJhbCBwYWNrYWdlcy4K
PiBJbiBmYWN0LCBGZWRvcmEvUkhFTCBoYXZlIHRoZWlyIG93biBwb2xpY3kgYmFzZWQgb24gdGhl
IHJlZnBvbGljeSBwYWNrYWdlIGZvdW5kIAo+IGhlcmU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2Zl
ZG9yYS1zZWxpbnV4L3NlbGludXgtcG9saWN5IAo+IDxodHRwczovL2dpdGh1Yi5jb20vZmVkb3Jh
LXNlbGludXgvc2VsaW51eC1wb2xpY3k+IGJlY2F1c2UgcmVmcG9saWN5IGl0c2VsZiBpcyAKPiBu
b3QgYWRlcXVhdGUgZm9yIGEgY29tcGxldGUKPiBzeXN0ZW0gaW4gZW5mb3JjaW5nIG1vZGUuCgog
IFRoZSBiYXNpYyBxdWVzdGlvbiBpczogaWYgdGhlcmUgaXMgYW55dGhpbmcgd2UgbmVlZCB0byBj
aGFuZ2UsIHdoeSB3b3VsZCBzdWNoIAphIGNoYW5nZSBub3QgYmUgYWNjZXB0YWJsZSBmb3IgdXBz
dHJlYW0gcmVmcG9saWN5PwoKICBBbHNvLCBob3cgY29tZSBvdXIgU0VMaW51eCBydW50aW1lIHRl
c3RzIGRvbid0IGZhaWwgaWYgdGhlIHVwc3RyZWFtIHJlZnBvbGljeSAKZG9lc24ndCB3b3JrPwoK
Cj4gQWxzbyBub3RlLCB0aGF0IHRoZSB5b2N0byBzZWxpbnV4IGxheWVyIHdlbnQgYW5vdGhlciBy
b3V0ZSBhbmQgcGF0Y2hlcyByZWZwb2xpY3kgCj4gaW5zdGVhZCBvZiBwcm92aWRpbmcgc2VwYXJh
dGUKPiBzZWxpbnV4IHBvbGljeSBmaWxlcy4KCiAgVGhhdCBzZWVtcyBsaWtlIGEgbXVjaCBzYW5l
ciBhcHByb2FjaCAtIEknZCBleHBlY3QgdGhlIGRpZmYgdG8gYmUgcHJldHR5IApzbWFsbC4gQWxz
bywgSSBleHBlY3QgdGhhdCBhbnkgY2hhbmdlcyB0aGF0IHlvY3RvIG5lZWRzIHRvIG1ha2UsIHdl
IG5lZWQgdG8gZG8gCmFzIHdlbGwgLSB3aGljaCBpcyBhbGwgdGhlIG1vcmUgcmVhc29uIHRvIHVw
c3RyZWFtIHRoZW0hCgoKPiBUbyBzdW1tYXJpemU6IFRoZXNlIGFyZSBuZWNlc3NhcnkgYmVjYXVz
ZSByZWZwb2xpY3kgaXMgbm90IGNvbXBsZXRlIG5vciBzdWl0YWJsZSAKPiBmb3IgYSBzeXN0ZW0g
cnVubmluZyBpbgo+IGVuZm9yY2luZyBtb2RlLgoKICBXaHkgZG9lcyB1cHN0cmVhbSByZWZwb2xp
Y3kgcHJvdmlkZSBhICJyZWZlcmVuY2UiIHRoYXQgaXMgbm90IHN1aXRhYmxlIGZvciAKYWN0dWFs
IHVzZT8KCgogIE5vdCBJIGtub3cgbmV4dCB0byBub3RoaW5nIGFib3V0IFNFTGludXgsIEkgbWF5
IGJlIG1pc3Npbmcgc29tZXRoaW5nIGdsYXJpbmdseSAKb2J2aW91cy4gUGxlYXNlIGNvbnNpZGVy
IGFsbCBvZiB0aGUgYWJvdmUgcXVlc3Rpb25zIGFzIGhvbmVzdCBxdWVzdGlvbnMsIG5vdCBhcyAK
c25pZGUgcmVtYXJrcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gT24gV2VkLCBOb3YgOCwg
MjAyMyBhdCAxOjU14oCvUE0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IAo+IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZyA8bWFpbHRvOmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPj4gd3Jv
dGU6Cj4gCj4gICAgIEhlbGxvIEFkYW0sCj4gCj4gICAgIE9uIFRodSwgMTIgT2N0IDIwMjMgMTI6
MzE6NTcgKzAyMDAKPiAgICAgQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0
aW9ucy5jb20KPiAgICAgPG1haWx0bzphZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+
PiB3cm90ZToKPiAKPiAgICAgID4gU0VMaW51eCBzdXBwb3J0IGluIEJ1aWxkcm9vdCBpcyBjdXJy
ZW50bHkgb3V0c3RhbmRpbmchIEhvd2V2ZXIsIG9uZSBsYXN0Cj4gICAgIG1ham9yCj4gICAgICA+
IGlzc3VlIHJlbWFpbnM6IEVuZm9yY2luZyBtb2RlIG5lZWRzIHRvIHdvcmsgb3V0IG9mIHRoZSBi
b3ggY29ycmVjdGx5LCB3aXRob3V0Cj4gICAgICA+IGRlbmlhbHMsIGF0IGxlYXN0IHdpdGggYSBt
aW5pbWFsIGRlZmNvbmZpZy4KPiAgICAgID4KPiAgICAgID4gVGhpcyBwYXRjaCBzZXJpZXMgc2Vl
a3MgdG8gcmVtZWR5IHRoaXMgcHJvYmxlbSB3aXRoIGEgYmFzaWMgc2V0IG9mCj4gICAgIHBvbGlj
aWVzIGluCj4gICAgICA+IHNldmVyYWwgY29tbW9ubHkgc2VsZWN0ZWQgcGFja2FnZXMgdG8gYWxs
b3cgYSB1c2VyIHdobyB3aXNoZXMgdG8gdXNlCj4gICAgIFNFTGludXggaW4KPiAgICAgID4gZW5m
b3JjaW5nIG1vZGUgdGhlIGFiaWxpdHkgdG8gZG8gc28gd2l0aG91dCBoYXZpbmcgdG8gc3BlbmQg
c2V2ZXJhbCBob3Vycwo+ICAgICAgPiB3cml0aW5nIHRoZSBzYW1lIHBvbGljeSB0aGF0IGV2ZXJ5
b25lIHdobyB3aXNoZXMgdG8gZG8gdGhlIHNhbWUgdGhpbmcgd291bGQKPiAgICAgID4gaGF2ZSB0
byBkby4KPiAgICAgID4KPiAgICAgID4gVGhlIHBhY2thZ2VzIEkgaGF2ZSBzZWxlY3RlZCBhcmUg
YmFzZWQgb24gdGhlIHBjX3g4Nl82NF9iaW9zX2RlZmNvbmZpZwo+ICAgICB3aXRoIGFsbAo+ICAg
ICAgPiBvZiB0aGUgc2VsaW51eCBwYWNrYWdlcyBzZWxlY3RlZCBiZWNhdXNlIGl0IHdhcyB0aGUg
bW9zdCBzdHJhaWdodGZvcndhcmQKPiAgICAgb3B0aW9uCj4gICAgICA+IEkgaGFkIHRvIGNyZWF0
ZSBhIHNtYWxsLCBib290YWJsZSBzeXN0ZW0gaW4gVmlydHVhbCBNYW5hZ2VyIHdpdGggc3NoCj4g
ICAgIHN1cHBvcnQgdG8KPiAgICAgID4gcXVpY2tseSBidWlsZCBvdXQgYSBwb2xpY3kgdGhhdCBk
aWRuJ3QgZ2VuZXJhdGUgYW55IGRlbmlhbHMgaW4KPiAgICAgID4gL3Zhci9sb2cvYXVkaXQubG9n
Lgo+ICAgICAgPgo+ICAgICAgPiBJIHdhbnQgdG8gYWRkcmVzcyBZYW5uJ3MgcXVlc3Rpb25zIGZy
b20gYSBwcmV2aW91cyBkaXNjdXNzaW9uIG9uIElSQzoKPiAgICAgID7CoCDCoFEpIFdoYXQgd2ls
bCBiZSB0aGUgbWFpbnRlbmFuY2UgZWZmb3J0Pwo+ICAgICAgPsKgIMKgQSkgTWluaW1hbCBhZnRl
ciB0aGlzIHBhdGNoIHNlcmllcy4gQXMgeW91IHdpbGwgc2VlLCBtb3N0IHBvbGljaWVzIGFyZQo+
ICAgICBvbmx5IGEKPiAgICAgID7CoCDCoCDCoCBmZXcgbGluZXMgbG9uZyEKPiAgICAgID4KPiAg
ICAgID7CoCDCoFEpIEhvdyBtdWNoIHRpbWUgd2lsbCB3ZSBpbnZlc3Qgd2hlbiB3ZSBidW1wIGEg
cGFja2FnZSBvciBhZGQgYSBkZXBlbmRlbmN5Pwo+ICAgICAgPsKgIMKgQSkgVXN1YWxseSBub25l
ISBJZiBhIHBhY2thZ2UgYnVtcC9uZXcgZGVwZW5kZW5jeSByZXF1aXJlcyBuZXcKPiAgICAgcGVy
bWlzc2lvbnMgdG8KPiAgICAgID7CoCDCoCDCoCB0aGUgU0VMaW51eCBwb2xpY3ksIHRoaXMgaXMg
YSBnb29kIHRoaW5nISBXZSBzaG91bGQgc3RlcCBiYWNrIGFuZAo+ICAgICBxdWVzdGlvbgo+ICAg
ICAgPsKgIMKgIMKgIHdoeSBhIHBhY2thZ2UgcHJldmlvdXNseSBhY2Nlc3Npbmcgb25seSBmaWxl
cyBhbmQgbGlicmFyaWVzIHN1ZGRlbmx5Cj4gICAgIG5lZWRzCj4gICAgICA+wqAgwqAgwqAgdG8g
KGUuZy4pLCBjaGFuZ2UgcGVybWlzc2lvbnMgb24gYSAvZGV2LyBkZXZpY2UhCj4gCj4gICAgIFRo
YW5rcyBhIGxvdCBmb3Igd29ya2luZyBvbiB0aGlzLgo+IAo+ICAgICBIb3dldmVyLCBJJ2QgbGlr
ZSB0byB1bmRlcnN0YW5kIHdoeSB0aGVzZSBwb2xpY3kgZmlsZXMgbmVlZCB0byBiZSBpbgo+ICAg
ICBCdWlsZHJvb3QuIEZvciBleGFtcGxlLCB5b3UncmUgYWRkaW5nIHNvbWUgcG9saWN5IGZvciBP
cGVuU1NILiBCdXQKPiAgICAgQnVpbGRyb290IGp1c3QgYnVpbGRzIHVwc3RyZWFtIE9wZW5TU0gg
d2l0aCBubyBjaGFuZ2UuIFdoeSBkbyB3ZSBuZWVkCj4gICAgIHNvbWUgcG9saWN5IHNwZWNpZmlj
YWxseSBpbiBCdWlsZHJvb3QgZm9yIE9wZW5TU0ggdGhhdCBjYW5ub3QgYmUgaW4KPiAgICAgdXBz
dHJlYW0gcmVmcG9saWN5Pwo+IAo+ICAgICBCYWNrIHdoZW4gQW50b2luZSBUw6luYXJ0ICh3aGlj
aCB5b3UgaGF2ZSBpbiBDYykgd2FzIHdvcmtpbmcgb24gdGhpcywKPiAgICAgYW5kIGFsc28gbXkg
Y29sbGVhZ3VlIE1heGltZSBDaGV2YWxsaWVyICh3aGljaCBJIGhhdmUgYWRkZWQgaW4gQ2MpLAo+
ICAgICB0aGVpciBwbGFuIHdhcyB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIHVzZSB0aGUgdXBzdHJl
YW0gcmVmcG9saWN5IGZvciBhCj4gICAgIEJ1aWxkcm9vdCBzeXN0ZW0sIGJ5IGNvbnRyaWJ1dGlu
ZyBjaGFuZ2VzIHRvIHRoZSByZWZwb2xpY3kgKGFuZCB0aGV5Cj4gICAgIGNvbnRyaWJ1dGVkIHF1
aXRlIGEgZmV3KS4KPiAKPiAgICAgV2h5IGFyZSB3ZSBub3QgY29udGludWluZyBvbiB0aGlzIGFw
cHJvYWNoPwo+IAo+ICAgICBPciBpcyB5b3VyIHBvbGljeSBhICJmcm9tIHNjcmF0Y2giIHBvbGlj
eSB0aGF0IGNhbiBiZSB1c2VkIGFzIGEKPiAgICAgY29tcGxldGUgYWx0ZXJuYXRpdmUgdG8gdGhl
IHVwc3RyZWFtIHJlZnBvbGljeT8KPiAKPiAgICAgKE5vdGU6IHdlIHdpbGwgY2xlYXJseSB3YW50
IGEgcnVudGltZSB0ZXN0IGNhc2UgZm9yIHRoaXMuKQo+IAo+ICAgICBCZXN0IHJlZ2FyZHMsCj4g
Cj4gICAgIFRob21hcwo+ICAgICAtLSAKPiAgICAgVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+ICAgICBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwo+ICAgICBodHRwczovL2Jvb3RsaW4uY29tIDxodHRwczovL2Jvb3Rs
aW4uY29tPgo+ICAgICBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ICAgICBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gICAgIGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnIDxtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+Cj4gICAgIGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ICAgICA8aHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Pgo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
