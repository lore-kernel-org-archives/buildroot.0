Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C204C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED09E849A4;
	Sat, 23 Jul 2022 16:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED09E849A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R23SMSLYXY1e; Sat, 23 Jul 2022 16:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C873483F23;
	Sat, 23 Jul 2022 16:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C873483F23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25E251BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C5EB40AA4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C5EB40AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BX8ovWtCZi4C for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C478840A99
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C478840A99
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:33:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g2so2247300wru.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ALWC+Ts36FCZV58bxPMr7Raph+H1XO9jpR5BQ0+uCgI=;
 b=x8tgXKS+h1gzraDcbrPCZq35Gmjr2o3Zmar8I7K0Mr1on8g9GGAWN2U5Uudxin5pIW
 a2DbcTAZqvmt52JgVI6Hfna3bWtNCH9VFVRK/T/GN2V3NHCiiicXcKhPFJ49LXnivj9G
 aT9tLimJ6SJq8WCFfJOt9B0KYkxnf1sf6erRy9C7krsz/Ise/3r0UdM8ebN1m/RiyXEL
 fL5e0f74TEVbUPf+vwvtvkTzXqo78MihBe9HXcubqw5eZyv0ml7DLtygsbRQ2oWxbl2h
 YklHuLr97ZTjDN8aZ5KDTOKAgAg3VV6+6KL9hwG6kdrf7ifkwpsmjvZo42xX2+lDK9dd
 nVVg==
X-Gm-Message-State: AJIora/8OzPK4Hu1bfrzRgSbnFBgH9DMz+8jncurBvGiZ3z1pz0pDy1s
 2qU/tV6UU52YzCnYUk3Vm0WX5ibmEYurOw==
X-Google-Smtp-Source: AGRyM1uo0k7eB0ZeOZ2ricyEDHmeBvar8SUIAzQF/CW3c57yvlMmWDP3FjXxoMOfj80rinVDw1fWqQ==
X-Received: by 2002:adf:f88c:0:b0:21e:6d3a:d75c with SMTP id
 u12-20020adff88c000000b0021e6d3ad75cmr2918980wrp.491.1658594030661; 
 Sat, 23 Jul 2022 09:33:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm8693143wmc.9.2022.07.23.09.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:33:50 -0700 (PDT)
Message-ID: <b7b3bb6f-af5d-1987-0bf0-4da328e1bc77@smile.fr>
Date: Sat, 23 Jul 2022 18:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ALWC+Ts36FCZV58bxPMr7Raph+H1XO9jpR5BQ0+uCgI=;
 b=QDLc6nJ1W1b+gdmtZBACDwNev7/y4wfX5RQjCOUJ9okLz21nsT8BDvT7k8cJ9JaeMp
 cZM7NvgfFEFtBOphRd7rVCTT0Vj0hUdNCy7QyaqqJnQp9jxq88mAp90sge8bDuEzI17Z
 JPcNN4YUFe7oWZdYgYbm2XIMcRlDhWhGvzxEjJ7S3b6JBLfgy7nVCphpXBnHei4b2QsP
 c218f2v6VLEzt5+3+u9npTgggD0hi0Q9KwOGq9Vf9OkJW14K0UeTYEQ0ekmAYMgIIkfN
 t+zjcJRyRiYzBJT7pCoAKFetg44TEWpVcO3N8SKWvXkQFG2Hm6g6m3jGs0Rl+oENrYgt
 mNLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QDLc6nJ1
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/post-image.sh: flexible qemu
 launch options
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAxNy8wNy8yMDIyIMOgIDE3OjU3LCBKYW1lcyBLbmlnaHQgYSDDqWNy
aXTCoDoKPiBUd2Vha2luZyB0aGUgZ2VuZXJhdGVkIFFFTVUgbGF1bmNoIGhlbHBlciBzY3JpcHQg
dG8gcHJvdmlkZSBtb3JlCj4gZmxleGliaWxpdHkgZm9yIHVzZXJzLiBUaGVzZSBjaGFuZ2VzIHBy
b3ZpZGU6Cj4gCj4gLSBUaGUgYWJpbGl0eSB0byBmb3J3YXJkIGNvbW1hbmQgbGluZSBvcHRpb25z
IGRpcmVjdGx5IHRvIFFFTVUuIFdoZW4KPiAgICBpbnZva2luZyBgc3RhcnQtcWVtdS5zaGAsIHVz
ZXJzIGNhbiBmb3J3YXJkIGFyZ3VtZW50cyBieSBhZGRpbmcgYQo+ICAgIGRvdWJsZSBkYXNoIChg
LS1gKSBpbnRvIHRoZSBhcmd1bWVudCBzZXQsIGFuZCBhbnkgdHJhaWxpbmcgYXJndW1lbnRzCj4g
ICAgd2lsbCBiZSBmb3J3YXJkZWQgaW50byBRRU1VLiBGb3IgZXhhbXBsZSwgYHN0YXJ0LXFlbXUu
c2ggLS0gLS1oZWxwYC4KPiAtIFRoZSBhYmlsaXR5IHRvIHVzZSBhIGhvc3Qgc3lzdGVtJ3MgUUVN
VS4gV2hpbGUgYSBCdWlsZHJvb3QgZ2VuZXJhdGVkCj4gICAgUUVNVSBzaG91bGQgd29yayBmb3Ig
bW9zdCBjYXNlcywgYSBkZXZlbG9wZXIgbWF5IHdpc2ggdG8gdXNlIHRoZQo+ICAgIHN5c3RlbSdz
IFFFTVUgZm9yIG9wdGlvbnMgd2hpY2ggbWF5IG5vdCBoYXZlIGJlZW4gY29uZmlndXJlZCBpbiB0
aGUKPiAgICBCdWlsZHJvb3QncyBRRU1VIGJ1aWxkIChlLmcuIGNvbmZpZ3VyaW5nIGEgZGlmZmVy
ZW50IGRpc3BsYXkgbW9kZSkuCj4gCj4gVGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIHN1cHBv
cnRlZCBhICJzZXJpYWwtb25seSIgY29tbWFuZCBsaW5lCj4gYXJndW1lbnQgdG8gaGVscCBydW4g
aW4gYSBub24tZ3JhcGhpY2FsIG1vZGUgZm9yIHNvbWUgdXNlIGNhc2VzLiBUaGVzZQo+IGNoYW5n
ZXMgdHJ5IHRvIHByb21vdGUgYSBuZXdseSBhZGRlZCBgLS1zZXJpYWwtb25seWAgYXJndW1lbnQg
dG8gZHJpdmUKPiB0aGlzIG1vZGU7IHRoYXQgYmVpbmcgc2FpZCwgYSBgc2VyaWFsLW9ubHlgIGFy
Z3VtZW50IHdpbGwgc3RpbGwgYmUKPiBhY2NlcHRlZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxp
dHkuCgpUaGUgc3RhcnQtcWVtdS5zaCBzY3JpcHQgaXMgYWN0dWFsbHkgdXNlZCBieSB0aGUgQnVp
bGRyb290IGdpdGxhYi1jaSB0byB0ZXN0IGRvCmEgcnVudGltZSB0ZXN0IChib290IHRlc3QpIGZv
ciBhbGwgUWVtdSBkZWZjb25maWdzLgoKVGhlIHFlbXUgY29tbWFuZCBsaW5lIGlzIGV4dHJhY3Rl
ZCBmcm9tIHFlbXUgcmVhZG1lLnR4dCBmaWxlcyBhbmQgc3RvcmVkIGluCmdlbmVyYXRlZCBzdGFy
dC1xZW11LnNoIHNjcmlwdC4KClNvIG9ubHkgdGhpcyBxZW11IGNvbW1hbmQgbGluZSBjb21tYW5k
IGxpbmUgaXMgc3VwcG9zZWQgdG8gd29yayBvdXQgb2YgdGhlIGJveC4KSWYgeW91IGxldCB0aGUg
dXNlZCBjdXN0b21pemUgdGhlIHFlbXUgY29tbWFuZCBsaW5lLCBpdCBjYW4gcmFpc2Ugc29tZSBp
c3N1ZS4KClRoZSAic2VyaWFsLW9ubHkiIG9wdGlvbiBpcyB1c2VkIGluIGJvb3QtcWVtdS1pbWFn
ZS5weSBbMV0gdG8gdXNlIHRoZSBzZXJpYWwKaW50ZXJmYWNlIGluIHRoZSBDSS4KClsxXQpodHRw
czovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC90cmVlL3N1cHBvcnQvc2NyaXB0cy9ib290
LXFlbXUtaW1hZ2UucHk/aD0yMDIyLjA1I24yNwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBL
bmlnaHQgPGphbWVzLmQua25pZ2h0QGxpdmUuY29tPgo+IC0tLQo+ICBib2FyZC9xZW11L3Bvc3Qt
aW1hZ2Uuc2ggfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11
L3Bvc3QtaW1hZ2Uuc2ggYi9ib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2gKPiBpbmRleCA4OGYwNDEz
NDk2Li5mMzAzMjExNTY5IDEwMDc1NQo+IC0tLSBhL2JvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaAo+
ICsrKyBiL2JvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaAo+IEBAIC00NywxNCArNDcsMjcgQEAgY2F0
IDw8LV9FT0ZfID4gIiR7U1RBUlRfUUVNVV9TQ1JJUFR9Igo+ICAJQklOQVJJRVNfRElSPSJcJHsw
JS8qfS8iCj4gIAljZCBcJHtCSU5BUklFU19ESVJ9Cj4gIAo+IC0JaWYgWyAiXCR7MX0iID0gInNl
cmlhbC1vbmx5IiBdOyB0aGVuCj4gKwltb2RlX2hvc3Q9MAo+ICsJbW9kZV9zZXJpYWw9MAo+ICsJ
d2hpbGUgW1sgXCQxID09IC0qIF1dOyBkbwo+ICsJICAgIGNhc2UgIlwkMSIgaW4KPiArCSAgICAt
LWhvc3QpIG1vZGVfaG9zdD0xOyBzaGlmdDs7CgpOYW1pbmcgc3R1ZmYgaXMgaGFyZCwgaGVyZSB3
ZSB3YW50IGFuIG9wdGlvbiB0byB1c2UgUWVtdSBpbnN0YWxsZWQgb24gdGhlIGhvc3QKc3lzdGVt
LCBub3QgZnJvbSBob3N0LXFlbXUgKC0taG9zdCBtYXkgYmUgbWlzbGVhZGluZykuCgo+ICsJICAg
IC0tc2VyaWFsLW9ubHl8c2VyaWFsLW9ubHkpIG1vZGVfc2VyaWFsPTE7IHNoaWZ0OzsKPiArCSAg
ICAtLSkgc2hpZnQ7IGJyZWFrOzsKPiArCSAgICAtKikgZWNobyAidW5rbm93biBvcHRpb246IFwk
MSIgMT4mMjsgZXhpdCAxOzsKPiArCSAgICBlc2FjCj4gKwlkb25lCj4gKwo+ICsJaWYgWyBcJG1v
ZGVfc2VyaWFsIC1lcSAxIF07IHRoZW4KPiAgCSAgICBFWFRSQV9BUkdTPScke1NFUklBTF9BUkdT
fScKPiAgCWVsc2UKPiAgCSAgICBFWFRSQV9BUkdTPScke0RFRkFVTFRfQVJHU30nCj4gIAlmaQo+
ICAKPiAtCWV4cG9ydCBQQVRIPSIke0hPU1RfRElSfS9iaW46XCR7UEFUSH0iCj4gLQlleGVjICR7
UUVNVV9DTURfTElORX0gXCR7RVhUUkFfQVJHU30KPiArCWlmIFsgXCRtb2RlX2hvc3QgLW5lIDEg
XTsgdGhlbgo+ICsJICAgIGV4cG9ydCBQQVRIPSIke0hPU1RfRElSfS9iaW46XCR7UEFUSH0iCj4g
KwlmaQo+ICsJZXhlYyAke1FFTVVfQ01EX0xJTkV9IFwke0VYVFJBX0FSR1N9ICJcJEAiCgpJIHdv
dWxkIHRocm93IGEgd2FybmluZyBpZiAkQCBpcyBub3QgZW1wdHksIGp1c3QgdG8gd2FybiB0aGUg
dXNlci4KQWN0dWFsbHkgdXNpbmcgUWVtdSBpbnN0YWxsZWQgb24gdGhlIGhvc3QgbWF5IGJlIHJl
YWxseSBvbGQgYW5kIG5vdCBhYmxlIHRvIGJvb3QKdGhlIHN5c3RlbS4uLgoKQmVzdCByZWdhcmRz
LApSb21haW4KCj4gIAkpCj4gIF9FT0ZfCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
