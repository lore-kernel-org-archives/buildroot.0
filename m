Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76310C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F571424F6;
	Sun, 24 Jul 2022 13:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F571424F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0y0v4hqx8ET; Sun, 24 Jul 2022 13:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B6E424EC;
	Sun, 24 Jul 2022 13:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B6E424EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1CE61BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99A560FDF
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A99A560FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03D5UACgU26w for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9399660E90
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9399660E90
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:30:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7788017wmb.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C59t9TFtwrEEjIOvIz38fJyXgm+jobNj3Uuj1+vCrSo=;
 b=2ISSsO7Niaz10DNXhu9E6n8txQhHgiFeFnN6rsY6SbHlEkJB7QDf4L+8zbMWENW4tH
 ern/06lhKpKvT4HJAvFqEBLbnx2TpyyWF5vtZR9YItVn792XHD7d49awKVgPrV6KbuSU
 T8d8qlEN4H5gV1nVp5HSC7uMU/5Mp+7z9M13W8/3IFVJoUpRGOK+ObZ4aSgcsKKKyKta
 j2vSl6ug3yH1qjtS6OCmEpHEParqZslYKaiIOXHB92OtfQ3ElerGVpxei/4MO0HJtaUH
 WPxXE2BwtJtsar47dVhHv3KkgAH6ThzaHJc3cEKT1kSHh0O/hBDkYOj9i/deWqov8xf4
 jpPA==
X-Gm-Message-State: AJIora/oh4GjIl6GTzMP128WpA+0B/tK7DTy2zBSvR7ETYI2e613Qq/B
 TtzzJvmeTnNibsLdbg0gRKdnNQ==
X-Google-Smtp-Source: AGRyM1uDbBeODZsASFBa4miX9pBp6o8eTo/6b7dTO+xMCRoJQwVfbUXDIPLWvWr4g1qy/X9iep+ZnQ==
X-Received: by 2002:a05:600c:4e54:b0:3a3:3197:9491 with SMTP id
 e20-20020a05600c4e5400b003a331979491mr5274275wmq.58.1658669442719; 
 Sun, 24 Jul 2022 06:30:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm11686902wmc.9.2022.07.24.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:30:42 -0700 (PDT)
Message-ID: <1e743b08-f6fe-1980-2e8e-89864a84a939@smile.fr>
Date: Sun, 24 Jul 2022 15:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
References: <20220724131839.20548-1-dgouarin@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724131839.20548-1-dgouarin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C59t9TFtwrEEjIOvIz38fJyXgm+jobNj3Uuj1+vCrSo=;
 b=LsJchuYRKZI0EN1spl6dVB+AHDlZ8DmU4jsC64sKzdv4siZgj/pmxO8A7YxtN6NtJd
 fEIA4mNK0f8FlS/ZlfCMKbWr92AVuYp8kKZ3KdbxeuwQz+xv7HH32e+6aNNMFQWuulQm
 yIVahz7H/1S3cvdLAbzGHtJJqDRYvt+Fcl6yEPTg20WIZiBEqSC9TzEexdOXBB/pw6ZB
 2kFim8PsbeJEIf1Pj5oDUFZIQGbFrm3CYha36iuG/InT6bb/ZOIdi/40bumX1yZalOUp
 UDkhFBz1l6GHHE5+/jq9Hx+d+umvfSK9WG4LVviOpinQXF93kiZy5uEzPRVSTn7B+Jm0
 EYJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LsJchuYR
Subject: Re: [Buildroot] [PATCH V2] Version 2.3.4 of libtalloc needs to
 define PYTHONHASHSEED, as a check has been added to the configure script,
 and build will fail if it is not defined.
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGF2aWQsCgpMZSAyNC8wNy8yMDIyIMOgIDE1OjE4LCBEYXZpZCBHT1VBUklOIGEgw6lj
cml0wqA6Cj4gRnJvbTogRGF2aWQgR09VQVJJTiA8ZGF2aWQuZ291YXJpbkB0aGFsZXNncm91cC5j
b20+CgpUaGUgY29tbWl0IHRpdGxlIGlzIGEgYml0IGxvbmcsIHVzdWFsbHkgd2Ugd2FudCBzb21l
dGhpbmcgbGlrZToKCnBhY2thZ2UvbGlidGFsbGM6IGJ1bXAgdmVyc2lvbiB0byAyLjMuNAoKPiAK
PiBUaGlzIGlzIG9yaWdpbmF0ZWx5IGEgd29ya2Fyb3VuZCBieSBzYW1iYSBkZXZlbG9wcGVycyBt
ZWFudCB0byBhdm9pZCByZWJ1aWxkaW5nIHRhbGxvYwo+IHdpdGggZWFjaCBjYWxsIHRvIG1ha2Uu
IERlZmluaW5nIFBZVEhPTkhBU0hTRUVEIHdvdWxkIG5vdCBiZSByZXF1aXJlZCBpbiB0aGUgY29u
dGV4dAo+IG9mIGJ1aWxyb290LCBpZiBub3QgZm9yIHRoZSBjaGVjayBpbiB0aGUgY29uZmlndXJl
IHNjcmlwdC4KPiAKPiBUaGlzIGNoYW5nZSByZXF1aXJlZCBhbiB1cGdyYWRlIHRvIHBrZ193YWYu
bWsuCgpUaGUgd2FmIGluZnJhIGhhcyBiZWVuIHVwZGF0ZWQgbm93LiBNYXliZSB0aGlzIHRlY2hu
aWNhbCBkZXRhaWwgd291bGQgZ28gYmVsbG93CiItLS0iIGxpbmUuCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIEdPVUFSSU4gPGRhdmlkLmdvdWFyaW5AdGhhbGVzZ3JvdXAuY29tPgo+IAo+IC0t
LQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIGVkaXQgY29tbWl0IG1lc3NhZ2UgKHN1Z2dlc3Rl
ZCBieSBZYW5uIEUuIE1PUklOKQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEdPVUFSSU4gPGRhdmlk
LmdvdWFyaW5AdGhhbGVzZ3JvdXAuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2xpYnRhbGxvYy9saWJ0
YWxsb2MuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLm1rICAgfCA1
ICsrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MuaGFzaCBiL3Bh
Y2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5oYXNoCj4gaW5kZXggY2JmZDExZTYzYi4uMGJjOGVk
YjY5NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MuaGFzaAo+ICsr
KyBiL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4g
ICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgNmJlOTViMjM2OGJkMGFmMWM0Y2Q3YTg4
MTQ2ZWI2Y2VlYTE4ZTQ2YzNmZmM5MzMwYmY2MjYyYjQwZDFkOGFhYSAgdGFsbG9jLTIuMy4zLnRh
ci5nego+ICtzaGEyNTYgIDE3OWY5ZWJlMjY1ZTY3ZTRhYjJjMjZjYWQyYjdkZTRiNmE3N2M2YzIx
MmY5NjY5MDMzODI4NjlmMDZiZTY1MDUgIHRhbGxvYy0yLjMuNC50YXIuZ3oKPiAgc2hhMjU2ICBm
ODM0MGM0NDlkZDY0YTU1YzY2MDViMDJmY2FkMmFlYzZmNDczNjEyYWM2MDI2NzM5YTIyOTk1Mzgw
YTgwNDNjICB0YWxsb2MuaAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxs
b2MubWsgYi9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MubWsKPiBpbmRleCA4Y2JhNjk5ZWEx
Li5kMTJmNGZjZmZmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5t
awo+ICsrKyBiL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5tawo+IEBAIC00LDcgKzQsNyBA
QAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MSUJUQUxMT0NfVkVSU0lP
TiA9IDIuMy4zCj4gK0xJQlRBTExPQ19WRVJTSU9OID0gMi4zLjQKPiAgTElCVEFMTE9DX1NPVVJD
RSA9IHRhbGxvYy0kKExJQlRBTExPQ19WRVJTSU9OKS50YXIuZ3oKPiAgTElCVEFMTE9DX1NJVEUg
PSBodHRwczovL3d3dy5zYW1iYS5vcmcvZnRwL3RhbGxvYwo+ICBMSUJUQUxMT0NfTElDRU5TRSA9
IExHUEwtMy4wKwo+IEBAIC00MCw2ICs0MCw5IEBAIGVsc2UKPiAgTElCVEFMTE9DX0NPTkZfT1BU
UyArPSAtLWRpc2FibGUtcHl0aG9uCj4gIGVuZGlmCj4gIAo+ICsjTElCVEFMTE9DX0NPTkZfRU5W
ICs9IFBZVEhPTkhBU0hTRUVEPTEKPiArI0xJQlRBTExPQ19NQUtFX0VOViArPSBQWVRIT05IQVNI
U0VFRD0xCgpodW1tLCB0aGVzZXMgbGluZXMgYXJlIGFjdHVhbGx5IGNvbW1lbnRlZC4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiArCj4gIExJQlRBTExPQ19XQUYgPSAuL2J1aWxkdG9vbHMvYmlu
L3dhZgo+ICAKPiAgIyBsaWtlIHNhbWJhNCwgbGlidGFsbG9jIHVzZXMgdGhlIHdhZiBidWlsZCBz
eXN0ZW0gd2hpY2ggcmVxdWlyZXMgYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
