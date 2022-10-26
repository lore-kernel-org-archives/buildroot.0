Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC9C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F8260AD8;
	Wed, 26 Oct 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98F8260AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQj5sfN7fmEL; Wed, 26 Oct 2022 08:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9314560881;
	Wed, 26 Oct 2022 08:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9314560881
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B57C1BF8B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F309840170
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F309840170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPkYg8DRANUm for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 08:48:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B364013F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4B364013F
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 08:48:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j15so14637967wrq.3
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 01:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4YwIhYj5MnM+eAFESGDHLL4FvlTXlSvDxDKQIBHaMY=;
 b=Dhqf9UmZPgBiMhqpJDMQ0h62rQEJcyQG1HipzZvRU2PC1ZdieSdtgwokWFAuC45PSb
 7wgcA5c5Nor/3WSv//g00laKXDfDJXWhc6IC4QgQqp9lXkb7iW8z3V8o1MfjfptyH5md
 +NI33wCsVVEsfZBYAgrs9rT9pTNEBSu/T/uzTwWqvi/XUxq2gMlR48tEetG1wtbF+tDz
 6y02YQdrZgjAxUNh4/7ixtdMRjk17bo8j88CfC5PWQ38ZhCxaWFKdxXa2eU/9WCZIAe4
 4yMPILXWfQXBJW+KGSbsLV6552gWyYw+iZdwZPDmF1bFcN5QJPS01eXSOnGs8PQUt6Xq
 3P3w==
X-Gm-Message-State: ACrzQf3JXzb+A1rdcx9F01cAfc/vQmpOCmz2GOAt7oZr6G0CJDyXj27F
 X7dOctFQLjN2dyOc6D2NoaocYQ==
X-Google-Smtp-Source: AMsMyM6nA9v4bFOqBGFqw2ZAMjGZPMVpFc9UXMhLoIcglEKX5LfWJP94WHzulbCfEiZQ3hQyvR+XEw==
X-Received: by 2002:adf:e198:0:b0:22e:ab4d:935b with SMTP id
 az24-20020adfe198000000b0022eab4d935bmr28390437wrb.306.1666774095519; 
 Wed, 26 Oct 2022 01:48:15 -0700 (PDT)
Received: from [10.5.3.187]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bcbda000000b003b5054c6f87sm1235619wmi.21.2022.10.26.01.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 01:48:15 -0700 (PDT)
Message-ID: <c835440f-f40e-b973-0458-54b3b141bc53@smile.fr>
Date: Wed, 26 Oct 2022 10:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20221025201400.3816183-1-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20221025201400.3816183-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S4YwIhYj5MnM+eAFESGDHLL4FvlTXlSvDxDKQIBHaMY=;
 b=2OcitYH8TMstWL9yGF7awZ/+YFYHPFUQTWtkLXskq54BpjcLdBrirwyW5oyo4q5F4t
 BRrfapZAJQrMMAhz6qHrQfPG27ic9vkLtmghu7AxKwXxg4yxAN/f6aHyqDjzHYBOseAE
 iEPJov2Yh2rLxybR9oIdC9B89yondNOW5c1a2Nd+nCrnNtadcmAoLeZfv/JvlsRWuWYz
 VguuXZ8coHp7UrAyofj+59NePf779b/qvD7ewo5W6zeQlVtMrj/aSv0Dd62EoOfxBAwN
 /R+DlKip7lM/ogWrtg1+AoNGrEEU5lN3RFPmy2+f2gjS28Pj8MBvhxy0WRuqGro1cjL5
 YDKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2OcitYH8
Subject: Re: [Buildroot] [PATCH] package/gcc: add patch to fix glibc header
 conflict
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMjUvMTAvMjAyMiDDoCAyMjoxMywgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhpcyBjb21taXQgYmFja3BvcnRzIHRoZSBwYXRj
aCAiZml4aW5jOiBkb24ndCAiZml4IiBtYWNoaW5lIG5hbWVzIGluCj4gX19oYXNfaW5jbHVkZSgu
Li4pIiBmcm9tIHVwc3RyZWFtIEdDQywgd2hpY2ggaXMgbmVlZGVkIHRvIHJlc29sdmUgYQo+IGhl
YWRlciBjb25mbGljdCBiZXR3ZWVuIGdsaWJjIGhlYWRlcnMgYW5kIGtlcm5lbCBoZWFkZXJzLCB3
aGljaCBoYXMKPiBhcHBlYXJlZCBzaW5jZSB3ZSBidW1wZWQgZ2xpYmMgdG8gdmVyc2lvbiAyLjM2
IGluIGNvbW1pdAo+IDgwYzhjMTVjODUzNGEyNDM4MmI5MDBhMDcwODJhMjg5YTM2OGY3MzYuCj4g
Cj4gVGhlIHByb2JsZW0gY29tZXMgZnJvbSB0aGUgImZpeGluYyIgbG9naWMgdXNlZCBieSBnY2Mg
dG8gZml4dXAgc29tZQo+IGhlYWRlcnMgZmlsZXMsIGdlbmVyYXRlZCBpbnNpZGUgYW4gaW5jbHVk
ZS1maXhlZC8gZm9sZGVyLiBUaGlzIGxvZ2ljCj4gZW5kZWQgdXAgcmVwbGFjaW5nICJsaW51eC9t
b3VudC5oIiBieSAiX19saW51eF9fL21vdW50LmgiIGluCj4gX19oYXNfaW5jbHVkZSgpIGludm9j
YXRpb24sIGxpa2UgdGhpczoKPiAKPiAgI2lmZGVmIF9faGFzX2luY2x1ZGUKPiAgIyBpZiBfX2hh
c19pbmNsdWRlICgiX19saW51eF9fL21vdW50LmgiKQo+ICAjICBpbmNsdWRlICJsaW51eC9tb3Vu
dC5oIgo+ICAjIGVuZGlmCj4gICNlbmRpZgo+IAo+IGluCj4gYnVpbGQvaG9zdC1nY2MtZmluYWwt
MTEuMy4wL2J1aWxkL2djYy9pbmNsdWRlLWZpeGVkL3N5cy9tb3VudC5oLiBXaXRoCj4gdGhpcyBm
aXggaW4gcGxhY2UsIHRoaXMgImluY2x1ZGUtZml4ZWQiIGhlYWRlciBpcyBubyBsb25nZXIgZ2Vu
ZXJhdGVkLAo+IGF2b2lkaW5nIHRoZSBwcm9ibGVtLgo+IAo+IFRoaXMgaXNzdWUgd2FzIHZpc2li
bGUgaW4gdHdvIGRpZmZlcmVudCB3YXlzIGluIGdsaWJjIGNvbmZpZ3VyYXRpb25zOgo+IAo+ICAt
IEFzIGEgYnVpbGQgZmFpbHVyZSBkdXJpbmcgdGhlIGdjYyBidWlsZCBpdHNlbGYsIGZvciBhcmNo
aXRlY3R1cmVzCj4gICAgdGhhdCBzdXBwb3J0IGxpYnNhbml0aXplciwgYXMgbGlic2FuaXRpemVy
IGluY2x1ZGVzIG1vdW50LmgsIGFuZAo+ICAgIHdvdWxkIHRoZXJlZm9yZSBlbmNvdW50ZXIgdGhl
IGhlYWRlciBjb25mbGljdC4KCkl0IHNlZW1zIGdsaWJjIDIuMzYgd2FzIG5vdCB1c2VkIGxhc3Qg
dGltZSB0aGUgdG9vbGNoYWluLWJ1aWxkZXIgd2FzIHVzZWQKKGluZGVlZCBpdCB3YXMgZ2xpYmMg
Mi4zNS0xMzQuLi4pCgpNYXliZSBidWlsZGluZyBhbGwgcWVtdSBkZWZjb25maWcgd291bGQgdHJp
Z2dlciB0aGUgaXNzdWUgc2luY2Ugbm93IGdsaWJjIGlzCnVzZWQgYnkgZGVmYXVsdC4KCj4gCj4g
IC0gQXMgYSBidWlsZCBmYWlsdXJlIGR1cmluZyBhbm90aGVyIHVzZXItc3BhY2UgcGFja2FnZSAo
c3VjaCBhcwo+ICAgIHN5c3Zpbml0IGZvciBleGFtcGxlKSwgb24gYXJjaGl0ZWN0dXJlcyB3aGVu
IGxpYnNhbml0aXplciBpc24ndAo+ICAgIHVzZWQsIGFuZCB0aGVyZWZvcmUgZm9yIHdoaWNoIHRo
ZSBnY2MgYnVpbGQgd2FzIHN1Y2Nlc3NmdWwsIGJ1dCB0aGUKPiAgICBoZWFkZXIgY29uZmxpY3Qg
c2hvd3MgdXAgd2hlbiBidWlsZGluZyBzb21lICJyYW5kb20iIHVzZXItc3BhY2UKPiAgICBwYWNr
YWdlLgoKQW55d2F5LCBvdXIgdG9vbGNoYWluIHRlc3Rpbmcgd2l0aCB0b29sY2hhaW4tYnVpbGRl
ciBvciBxZW11IGRlZmNvbmZpZyB3b3VsZCBub3QKZGVjdGVjdCBzdWNoIGlzc3VlLgoKPiAKPiBU
aGUgcHJvYmxlbSBpcyBhbHJlYWR5IGZpeGVkIGluIEdDQyAxMi4yLjAsIHNvIG5vIHBhdGNoIGlz
Cj4gcmVxdWlyZWQuIFRoZSBwcm9ibGVtIGRpZCBub3QgZXhpc3QgYmFjayBpbiBHQ0MgOC40LjAs
IHNvIHRoaXMgdmVyc2lvbgo+IGRvZXMgbm90IG5lZWQgcGF0Y2hpbmcuIENvbnNlcXVlbnRseSwg
dGhlIHBhdGNoIGlzIG9ubHkgbmVlZGVkIGZvciBHQ0MKPiAxMC40LjAsIEdDQyAxMS4zLjAgYW5k
IHRoZSBzcGVjaWFsIEFSQyAyMDIwLjA5LXJlbGVhc2UgdmVyc2lvbi4KPiAKPiBGaXhlczoKPiAK
PiAgIChnY2MgYnVpbGQgaXNzdWUsIG9uIGFyY2hpdGVjdHVyZSB0aGF0IHN1cHBvcnRzIGxpYnNh
bml0aXplcikKPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzkwZmU0
YzNiOGI3MmEyYzI4NTU1Njc0MzgzZGU5YmJkOWU4YWUwOWEvCj4gCj4gICAoc3lzdmluaXQgYnVp
bGQgaXNzdWUsIG9uIGFyY2hpdGVjdHVyZSB0aGF0IGRvZXMgbm90IHN1cHBvcnQgbGlic2FuaXRp
emVyKQo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZDdiZjU3OTVi
NzYyMWE5MmJlMzJmMTg3OTRlM2U2Nzk0NGZiOTZkYi8KPiAKPiAgIChjcnVuKQo+ICAgaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZTNlOGRhNGY3OTdkY2VkNDhhZWRmOGM2
MzZkYjk4M2QzNjg0OTg1MC8KPiAKPiAgIChsaWJhcmNoaXZlKQo+ICAgaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvOWZjYmYwYzAzNmE5N2IyZTlhNGZjYzZlMTczYmNmYTA5
ZTFiM2RhYy8KPiAKPiBUaGFua3MgYSBsb3QgdG8gUGV0ZXIgU2VpZGVyZXIgZm9yIHBvaW50aW5n
IHRoZSByZWxldmFudCBHQ0MgY29tbWl0Lgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cHM6Ly9idWdz
LmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTAyMQoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KPiAtLS0KPiAgLi4uLW1hY2hpbmUtbmFtZXMtaW4tX19oYXNfaW5jbHVkZS0uLVBSLnBh
dGNoIHwgMTI0ICsrKysrKysrKysrKysrKysrKwo+ICAuLi4tbWFjaGluZS1uYW1lcy1pbi1fX2hh
c19pbmNsdWRlLS4tUFIucGF0Y2ggfCAxMjQgKysrKysrKysrKysrKysrKysrCj4gIC4uLi1tYWNo
aW5lLW5hbWVzLWluLV9faGFzX2luY2x1ZGUtLi1QUi5wYXRjaCB8IDEyNCArKysrKysrKysrKysr
KysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9nY2MvMTAuNC4wLzAwMDYtZml4aW5jLWRvbi10LWZpeC1tYWNoaW5l
LW5hbWVzLWluLV9faGFzX2luY2x1ZGUtLi1QUi5wYXRjaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9nY2MvMTEuMy4wLzAwMDctZml4aW5jLWRvbi10LWZpeC1tYWNoaW5lLW5hbWVzLWlu
LV9faGFzX2luY2x1ZGUtLi1QUi5wYXRjaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9n
Y2MvYXJjLTIwMjAuMDktcmVsZWFzZS8wMDAzLWZpeGluYy1kb24tdC1maXgtbWFjaGluZS1uYW1l
cy1pbi1fX2hhc19pbmNsdWRlLS4tUFIucGF0Y2gKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
