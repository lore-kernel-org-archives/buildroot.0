Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AC5C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2861040564;
	Tue, 27 Feb 2024 22:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlIjbhjVyRMe; Tue, 27 Feb 2024 22:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F413940572
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F413940572;
	Tue, 27 Feb 2024 22:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 559F81BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFAD41451
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21CQ-ogeJ93N for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 267624012E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 267624012E
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 267624012E
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:31:11 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso45658771fa.3
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 14:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709073069; x=1709677869;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zi11p+DlnFE3sDVuNuE2xRQPxUvj9F5ywf25iBViSpE=;
 b=YvipXhugWNlh3WuhxqPIJR0TLYAYfryUfh8ZlC8Cl9c+WcvVhommrjUO2le8rucl8+
 kYK1qgHFBj3mG6/jT7u7X3Km0JibaEV2pZm0qOOs2yKXJI+xYCFEW0fv/8nrBNmwBoyg
 IQRMInt4hPRqCxeupNxOZVfMMA2rsSH5i5wHClsK0bH9Jxdxs1/vfvIiWLSCXm4qBG55
 fU/x6l4huzOZrnNPGkudXJNMV3Mad1Lws0fTbu8Do4obmePEqu/zpqkpQue4lFlTaXV4
 S+LXtPnCxVlVf4OG6Z4O4C+vvQPWKk3+q5BjGsSoKgkbhlEiJNO5/nDvZBDqC+ubDt3g
 T5Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5af6ksctqcDoqhLhpQ+PscUedDkj8havT7DdRhjkuSaPZqJgLrbH9GS4/S80fbpdfWfW/gN9koeouxajnAAivH5MMdFWhSA==
X-Gm-Message-State: AOJu0YwQ2vWFLkd4mQn/eDFxwBi8BPcCnCDjzybv1OTcG3VktfEFsN07
 dAQt2EOFciWhobPyV/270vBsfNqIXEPzUF2f1QWp9kuQZ49kh5JLq6oxloQ/x8k=
X-Google-Smtp-Source: AGHT+IE5LwVNJmB21mD4l8WYhW7nFkU0f9QUYRjIrFmXnypCiHOXG5w31Xq5Q5eVKhIWn2rrzqOATA==
X-Received: by 2002:a2e:b819:0:b0:2d2:6add:ecda with SMTP id
 u25-20020a2eb819000000b002d26addecdamr6395297ljo.4.1709073068975; 
 Tue, 27 Feb 2024 14:31:08 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 fa23-20020a05600c519700b004129860d532sm115781wmb.2.2024.02.27.14.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 14:31:08 -0800 (PST)
Message-ID: <90f5d326-0b04-495e-9b6d-d25ebfa59cb4@smile.fr>
Date: Tue, 27 Feb 2024 23:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240227213517.241837-1-ju.o@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240227213517.241837-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709073069; x=1709677869;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zi11p+DlnFE3sDVuNuE2xRQPxUvj9F5ywf25iBViSpE=;
 b=d4smD+DcqIGGSMLV6cXOqPjbKPrdyKsIM3+XDrUz93ct9ZN1Q3I1zU0PhcjDVI0ov/
 DkV5OYrEjNFMNL3r1gb8tQ56qZLZ/XI+pwJtkSqtdtzxRTlV+pruqOt33wrwzOTDkPEF
 fDTkyfmaZ+/0nmFijcCTdYOHm5NL27fncFFJg9mQTUMGZzkhVDllwDLpZxueWKMGi4s6
 p6gGRVePLEGnHFaAmk97ZXd04t3iOcpTcgioHvXjiavTDq7OIpb7djFxAf+dDO53fbjf
 u2D0mVvVOGs4BEyEdl/jzoqJIVsRAeTe6jBvCWN4CsEP/LdVK4Aot0QfUyb74KxfTGbP
 UkGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=d4smD+Dc
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gnu-efi
 >= 3.0.16
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKTGUgMjcvMDIvMjAyNCDDoCAyMjozNSwgSnVsaWVuIE9saXZhaW4gYSDDqWNy
aXTCoDoKPiBDb21taXQgZmE5ODkzYWQ4ZiAicGFja2FnZS9nbnUtZWZpOiBidW1wIHRvIHZlcnNp
b24gMy4wLjE3IiB1cGRhdGVkCj4gZ251LWVmaS4gVGhpcyB1cGRhdGUgaW50cm9kdWNlZCBzeXNs
aW51eCBidWlsZCBmYWlsdXJlLCBhcyByZXBvcnRlZAo+IGluIFsxXS4KPiAKPiBUaGlzIGNvbW1p
dCBhZGRzIGEgcGFja2FnZSBwYXRjaCB0byBmaXggdGhpcyBpc3N1ZS4gRm9yIHRlY2huaWNhbAo+
IGRldGFpbHMgb2YgdGhlIGlzc3VlLCBzZWUgdGhlIHBhY2thZ2UgcGF0Y2ggY29tbWl0IGxvZy4K
PiAKPiBGaXhlczoKPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvNjI1Njg4MDkzNwo+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy82MjU2ODgwOTQ5Cj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1OTcxLmh0bWwKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICAu
Y2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIC4u
LnN0ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5pdGlvbi5wYXRjaCB8IDU4ICsrKysrKysr
KysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib290L3N5c2xpbnV4LzAwMTktc3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlw
ZS1kZWZpbml0aW9uLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUg
Yi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggYTZjYzU4YzQ0OGMuLmE5OGE1M2ZiZjM2IDEw
MDY0NAo+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPiArKysgYi8uY2hlY2twYWNrYWdlaWdu
b3JlCj4gQEAgLTExOCw2ICsxMTgsNyBAQCBib290L3N5c2xpbnV4LzAwMTMtRml4LWJ1aWxkLXdp
dGgtZ251LWVmaS12ZXJzaW9uLTMuMC45LnBhdGNoIFVwc3RyZWFtCj4gIGJvb3Qvc3lzbGludXgv
MDAxNC1GaXgtYnVpbGQtd2l0aC1iaW51dGlscy1ub3RlLWdudS1wcm9wZXJ0eS1zZWN0aW9uLnBh
dGNoIFVwc3RyZWFtCj4gIGJvb3Qvc3lzbGludXgvMDAxNi1Xb3JrYXJvdW5kLW11bHRpcGxlLWRl
ZmluaXRpb24tb2Ytc3ltYm9sLWVycm9ycy5wYXRjaCBVcHN0cmVhbQo+ICBib290L3N5c2xpbnV4
LzAwMTctUmVwbGFjZS1idWlsdGluLXN0cmxlbi10aGF0LWFwcGVhcnMtdG8tZ2V0LW9wdGltaXpl
ZC5wYXRjaCBVcHN0cmVhbQo+ICtib290L3N5c2xpbnV4LzAwMTktc3RkZGVmLmgtYWRkLXdjaGFy
X3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoCgpXZSB3YW50IHRvIHJlbW92ZSAuY2hlY2twYWNrYWdl
aWdub3JlIGluIGEgbm90IHRvbyBmYXIgZnV0dXJlLCBwbGVhc2UgYWRkIGFuCnVwc3RyZWFtIHN0
YXR1cyB0YWcgaW4gdGhlIHBhdGNoIDAwMTktc3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZp
bml0aW9uLnBhdGNoCml0c2VsZi4gRXZlbiBpZiB1cHN0cmVhbSBpcyBub3QgdmVyeSBhY3RpdmUg
KGxhc3QgY29tbWl0IGlzIDUgeWVhcnMgYWdvKS4KCj4gIGxpbnV4LzUuMTAuMTYyLWNpcDI0LXJ0
MTAvMDAwMS1hcmNoLW1pY3JvYmxhemUtbW0taW5pdC5jLWZpeC1idWlsZC5wYXRjaCBVcHN0cmVh
bQo+ICBwYWNrYWdlLzE4eHgtdGktdXRpbHMvMDAwMS1wbHQuaC1maXgtYnVpbGQtd2l0aC1nY2Mt
MTAucGF0Y2ggVXBzdHJlYW0KPiAgcGFja2FnZS80dGgvMDAwMS1hdm9pZC1yZWdlbi1kdXJpbmct
aW5zdGFsbC5wYXRjaCBVcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4LzAwMTkt
c3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoIGIvYm9vdC9zeXNsaW51
eC8wMDE5LXN0ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5pdGlvbi5wYXRjaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAuLmFjOThjNDdkZmRjCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2Jvb3Qvc3lzbGludXgvMDAxOS1zdGRkZWYuaC1hZGQtd2NoYXJfdC10
eXBlLWRlZmluaXRpb24ucGF0Y2gKPiBAQCAtMCwwICsxLDU4IEBACj4gK0Zyb20gMDYzZGFjNTVj
NDVkMDI2NDY3MWMzNDYzZTgyNGFiNjU5ZTVjYmI4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
PiArRnJvbTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiArRGF0ZTogVHVlLCAyNyBG
ZWIgMjAyNCAyMTowOToxNSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHN0ZGRlZi5oOiBhZGQg
d2NoYXJfdCB0eXBlIGRlZmluaXRpb24KPiArCj4gK1N5c2xpbnV4IGZhaWwgdG8gYnVpbGQgd2l0
aCBnbnUtZWZpID49IDMuMC4xNiB3aXRoIGVycm9yOgo+ICsKPiArICAgIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAvaG9zdC9pNjg2LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVk
ZS9lZmkvZWZpLmg6NDQsCj4gKyAgICAgICAgICAgICAgICAgICAgIGZyb20gL2J1aWxkL3N5c2xp
bnV4LTYuMDMvZWZpL2VmaS5oOjIzLAo+ICsgICAgICAgICAgICAgICAgICAgICBmcm9tIC9idWls
ZC9zeXNsaW51eC02LjAzL2VmaS9hZHYuaDo0LAo+ICsgICAgICAgICAgICAgICAgICAgICBmcm9t
IC9idWlsZC9zeXNsaW51eC02LjAzL2VmaS9hZHYuYzoyOToKPiArICAgIC9ob3N0L2k2ODYtYnVp
bGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2VmaS9pYTMyL2VmaWJpbmQuaDo5
MDo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3djaGFyX3QnCj4gKyAgICAgdHlwZWRlZiB3
Y2hhcl90IENIQVIxNjsKPiArICAgICAgICAgICAgIF5+fn5+fn4KPiArCj4gK1RoaXMgaXMgYmVj
YXVzZSBnbnUtZWZpIHN0YXJ0ZWQgdG8gdXNlIHRoZSAid2NoYXJfdCIgdHlwZSBmcm9tIHRoZQo+
ICt0b29sY2hhaW4ncyA8c3RkZGVmLmg+IGhlYWRlciwgaW4gY29tbWl0IFsxXS4gQmVmb3JlIHRo
aXMgY29tbWl0LAo+ICtnbnUtZWZpIHdhcyBkZWZpbmluZyB0aGUgdHlwZSBhcyAic2hvcnQiLgo+
ICsKPiArU3lzbGludXggaXMgaW5jbHVkaW5nIGl0cyBvd24gbWluaW1hbCBzdGRkZWYuaCBmaWxl
LCB3aGljaCBtYXNrcyB0aGUKPiArb25lIHByb3ZpZGVkIGJ5IHRoZSB0b29sY2hhaW4uIFNlZSBb
Ml0uIFRoaXMgZmlsZSBkb2VzIG5vdCBoYXZlIGEgdHlwZQo+ICtkZWZpbml0aW9uIGZvciAid2No
YXJfdCIuCgpOaWNlIGNhdGNoLCBkaWRuJ3Qgbm90aWNlZCB0aGlzIHN0ZGRlZi5oIHByb3ZpZGVk
IGJ5IHN5c2xpbnV4LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsKPiArRmluYWxseSwgdGhl
IFBPU0lYIDxzdGRkZWYuaD4gaGVhZGVyIGlzIHN1cHBvc2VkIHRvIHByb3ZpZGUgdGhpcwo+ICsi
d2NoYXJfdCIgdHlwZSBkZWZpbml0aW9uLiBTZWUgWzNdLgo+ICsKPiArVGhpcyBjb21taXQgZml4
ZXMgdGhlIGlzc3VlIGJ5IGFkZGluZyB0aGUgIndjaGFyX3QiIHR5cGUgZGVmaW5pdGlvbiBpbgo+
ICt0aGUgY29tMzIvaW5jbHVkZS9zdGRkZWYuaCBoZWFkZXIuIFNpbmNlIFN5c2xpbnV4IGhhcyAi
LWZzaG9ydC13Y2hhciIKPiAraW4gaXRzIENGTEFHUyAoc2VlIFs0XSksICJ3Y2hhcl90IiBpcyBz
aW1wbHkgZGVmaW5lZCBhcyAic2hvcnQiLiBUaGlzCj4gK2Fsc28gZm9sbG93IHRoZSBwcmV2aW91
cyBnbnUtZWZpIDwgMy4wLjE2IGJlaGF2aW9yLgo+ICsKPiArVGhpcyBpc3N1ZSB3YXMgc2VlbiBp
biBCdWlsZHJvb3QgTGludXgsIGluIFs1XS4KPiArCj4gK1sxXSBodHRwczovL3NvdXJjZWZvcmdl
Lm5ldC9wL2dudS1lZmkvY29kZS9jaS8xODkyMDBkMGIwZjZmZmY0NzNkMzAyODgwZDk1NjlmNDVk
NGQ4YzRkCj4gK1syXSBodHRwczovL3JlcG8ub3IuY3ovc3lzbGludXguZ2l0L2Jsb2IvcmVmcy90
YWdzL3N5c2xpbnV4LTYuMDM6L2NvbTMyL2luY2x1ZGUvc3RkZGVmLmgKPiArWzNdIGh0dHBzOi8v
cHVicy5vcGVuZ3JvdXAub3JnL29ubGluZXB1YnMvOTY5OTkxOTc5OS9iYXNlZGVmcy9zdGRkZWYu
aC5odG1sCj4gK1s0XSBodHRwczovL3JlcG8ub3IuY3ovc3lzbGludXguZ2l0L2Jsb2IvcmVmcy90
YWdzL3N5c2xpbnV4LTYuMDM6L21rL2VmaS5tayNsMjcKPiArWzVdIGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1OTcxLmh0bWwK
PiArCj4gK1NpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gKy0t
LQo+ICsgY29tMzIvaW5jbHVkZS9zdGRkZWYuaCB8IDIgKysKPiArIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9jb20zMi9pbmNsdWRlL3N0ZGRlZi5o
IGIvY29tMzIvaW5jbHVkZS9zdGRkZWYuaAo+ICtpbmRleCBmNTJkNjJmMy4uNDM3YjExZjIgMTAw
NjQ0Cj4gKy0tLSBhL2NvbTMyL2luY2x1ZGUvc3RkZGVmLmgKPiArKysrIGIvY29tMzIvaW5jbHVk
ZS9zdGRkZWYuaAo+ICtAQCAtMjksNCArMjksNiBAQAo+ICsgICovCj4gKyAjZGVmaW5lIGNvbnRh
aW5lcl9vZihwLCBjLCBtKSAoKGMgKikoKGNoYXIgKikocCkgLSBvZmZzZXRvZihjLG0pKSkKPiAr
IAo+ICsrdHlwZWRlZiBzaG9ydCB3Y2hhcl90Owo+ICsrCj4gKyAjZW5kaWYgLyogX1NURERFRl9I
ICovCj4gKy0tIAo+ICsyLjQ0LjAKPiArCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
