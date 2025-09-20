Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A26CCAC5A8
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 16:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF8CA82AB6;
	Sat, 20 Sep 2025 16:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKOZAW4HuDXf; Sat, 20 Sep 2025 16:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CC882FA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82CC882FA2;
	Sat, 20 Sep 2025 16:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9C1D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 16:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126354007A
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 16:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JE0nsDXS7Dx2 for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 16:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0CAC4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0CAC4002D
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0CAC4002D
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 16:00:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3ef166e625aso1329945f8f.2
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758384020; x=1758988820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdcODGNNeWvkUl+5t7/LDtU2X7fTX1rl+98e1G7cSrA=;
 b=VvtkeJCHLfAOzsIfvF4GS9iUMKKjGP6rqGEL+bughDqdf85jIRFhIUa0yPF11Gfyy6
 XEKgzKsYMoOuV8WXifa9Vm1Cffq8bCLA40vRnO1UB25vRXCPldUNc4AqjlwwdESqxkyh
 mF0NLVidzjsTWLhVl3r/VqSlrDIpqmDFzUEv2p78tPFqNYdyZ2VySDWTB4v/ITSep6hk
 i2vV76uc99ELPVTVbXLtBxTfTt5t2J6rkP5SpmjopqnHH4miAXDfEfzzqCLWDHRjmE1U
 UbkJiZV4Ea7yJRAIOjVE0k5kuxkaLNapgYuWL5r77/2aHLXFtIfHG7HLzGzIrUWrBK1N
 p6JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz89ChQxqEgvqRs87+s+zjgAtMUuWuRiFpyE4FPtwB7STprsBV1P7I331daRgu8KyXPwJGO9pn12g=@buildroot.org
X-Gm-Message-State: AOJu0YzUpqVmqREtAQkyJrTe1bjf3tnIr8gpeTHYJnQ/k+pWubYFvBv2
 RLWV/+bfATFApxiAo4cQiAI1g60KNJwp2P+EI596pUHw7LvsmYzme5zIFRfVtT4PEsj/YRff3Mo
 Kcw6ODTk84A==
X-Gm-Gg: ASbGncsCC1eL4FW2eIdIFrqoMFX1+l0xQ9GyQmO3Yb7ULnAdo0wR7w8Tpbd0dZ3HdUG
 f99p9yq9BXoFsSZ9UQHOjWJYNBYsEm/9C0SgvVPGSEkhL8EGwsrcudtQKm25aTEiDe46sqlIJf/
 ISEPSsAKYAMDiIsFE1EwpAZh0fVGswocIRxXpWcaJDIfvJMV+ZVtYgU4o3XEhRu4xdvLooumyl+
 C6oQY3hNcHP428drdYDtnLo4vy6Myx/lMrMTmDORrpwmg1ttwy6qwn8cD01VaiJYmsdrECwtDaw
 InR7AmlJ8DNQ4o4ZKUP+OBoZ9hhB89naxIw5u40iEanjWxKD8IAOJRtboaaNNllWq9Q+yawsgtE
 miXe6rmUEJA+ZK1wbcZiKSaQLyx+i73RAHc9hsewhJBUp1FUxRhfsI8CmHr2U4kd4O9Syd2wIkB
 wcAkro0QiBJHcbupM9QGtBX+35ilJHV4+dOMZ+ClXGj6VsrMvURFSvUsgIfhCg2A==
X-Google-Smtp-Source: AGHT+IFDU/bsKuQtlhBG+vbSbhxyCpWKEoxzA+ZM6ibaCmXCsFkN70fNe3w+RKovWICmP9bihkxgww==
X-Received: by 2002:a05:6000:2c0e:b0:3e5:a68:bdd0 with SMTP id
 ffacd0b85a97d-3ee8585f7d1mr6073911f8f.52.1758384019871; 
 Sat, 20 Sep 2025 09:00:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f321032a1sm108545935e9.2.2025.09.20.09.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Sep 2025 09:00:19 -0700 (PDT)
Message-ID: <721a94b3-4944-48b3-8186-825acb4eb698@smile.fr>
Date: Sat, 20 Sep 2025 18:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
Content-Language: fr, en-US
In-Reply-To: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1758384020; x=1758988820; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gdcODGNNeWvkUl+5t7/LDtU2X7fTX1rl+98e1G7cSrA=;
 b=fE7ToYBlkS54iC/wNdu6psYXmtGCNjIO3HnvZKqxGGWM0DEEyloANN8qndtidR3QZs
 1j9D/AdBeHRkuHZ93fPqsQm2zMNMmPBcqPxDWLMAsXGFH2Tl4cLVf2bNA8oTrnpTfHJG
 tTPh26CmYyi+v7FJWUxNqf18QwMAUPciEU/1U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=fE7ToYBl
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.55
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

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDE5LzA5LzIwMjUgw6AgMjA6MjEsIFdhbGRlbWFyIEJy
b2Rrb3JiIGEgw6ljcml0wqA6Cj4gRmluYWxseSB0aGUgYWFyY2g2NCB0bHMgYnVnIGlzIGZpeGVk
LiAocHl0aG9uIDMuMTMgc2VnZmF1bHQpCj4gVW5mb3J0dW5hdGVseSBpdCBpcyBub3QgY292ZXJl
ZCBieSBhbnkgdGVzdGNhc2Ugb2YgdUNsaWJjLW5nLXRlc3QuCgpUaGFua3MgZm9yIGZpbmRpbmcg
dGhpcyBpc3N1ZSEKCkkganVzdCBzZW50IGEgZm9sbG93dXAgcGF0Y2ggdG8gZml4IHRoZSB6ZnMg
dUNsaWJjIHRlc3Q6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTA5MjAx
NTU4MDMuODI5NDI0LTEtcm9tYWluLm5hb3VyQHNtaWxlLmZyL1QvI3UKClJ1bnRpbWUgdGVzdGVk
IHVzaW5nIFRlc3RaZnNVY2xpYmMgd2l0aCB1Q2xpYmMtbmcgMS4wLjU1CgpUZXN0ZWQtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IEhlcmUgaXMgdGhlIGdpdCBzaG9ydGxvZyBmb3IgdGhlIHJlbGVhc2U6Cj4gCj4gTWFy
aXVzIE1lbHplciAoMSk6Cj4gICAgICAgbWFsbG9jLXN0YW5kYXJkOiBGaXggdHJ1bmNhdGlvbiBw
cm9ibGVtIGluIG1hbGxvYwo+IAo+IFdhbGRlbWFyIEJyb2Rrb3JiICg1KToKPiAgICAgICBGaXgg
U3lzdmlwYyBmb3IgQVJNLCBBQVJDSDY0LCBSSVNDVjY0LCBLVlggYW5kIG02OGsKPiAgICAgICBy
ZW1vdmUgdUNsaWJjIHNwZWNpZmljIGdldHRleHRfcHJpbnRmCj4gICAgICAgYWFyY2g2NDogZG8g
bm90IGZvcmNlIHRscy1tb2RlbCBpbiBDUFVfQ0ZMQUdTLCB0aGlzIGlzbid0IHJlcXVpcmVkCj4g
ICAgICAgYWFyY2g2NDogcmVzcGVjdCByX2FkZGVuZCBmb3IgVExTREVTQyByZWxvY2F0aW9ucwo+
ICAgICAgIGJ1bXAgdmVyc2lvbiBmb3IgMS4wLjU1IHJlbGVhc2UKPiAKPiB5bGl1ICg1KToKPiAg
ICAgICBtaXBzMzI6IFByZXZlbnRpbmcgRk9SQ0VfRlJBTUVfUE9JTlRFUiBmcm9tIGJlaW5nIG9w
dGltaXplZCBhd2F5Cj4gICAgICAgbWlwczMyOiBEZWZpbmUgX19JUENfNjQgYWNjb3JkaW5nIHRv
IGtlcm5lbCB2ZXJzaW9uCj4gICAgICAgdGltZTY0OiBmaXhlZCBtc2djdGwvc2VtY3RsL3NobWN0
bCByZXN1bHQgZXJyb3JzIGZvciBmb3IgTUlQUzMyL1JJU0NWMzIKPiAgICAgICB0aW1lNjQ6IGZp
eCAqY3RsIGZ1bmN0aW9ucyBpbiBtaXBzMzJlYi9taXBzNjQKPiAgICAgICB0aW1lNjQ6IGZpeCAq
Y3RsIGZ1bmN0aW9ucyBpbiBtaXBzMzJlYgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJy
b2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gLS0tCj4gCj4gRGVhciBzdGFibGUgTWFpbnRhaW5l
cnMsIGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91IGNvdWxkIHVwZGF0ZSBhbGwKPiBzdGFibGUgYnJh
bmNoZXMgd2l0aCB0aGlzIG1haW50ZW5hbmNlIHJlbGVhc2UuCj4gCj4gLS0tCj4gIC4uLmVtb3Zl
LXVDbGliYy1zcGVjaWZpYy1nZXR0ZXh0X3ByaW50Zi5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2ggICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tCj4gIHBhY2thZ2UvdWNsaWJjL3VjbGliYy5tayAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdWNsaWJjLzAwMDEtcmVtb3ZlLXVDbGli
Yy1zcGVjaWZpYy1nZXR0ZXh0X3ByaW50Zi5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3VjbGliYy8wMDAxLXJlbW92ZS11Q2xpYmMtc3BlY2lmaWMtZ2V0dGV4dF9wcmludGYucGF0Y2gg
Yi9wYWNrYWdlL3VjbGliYy8wMDAxLXJlbW92ZS11Q2xpYmMtc3BlY2lmaWMtZ2V0dGV4dF9wcmlu
dGYucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA5NjczNmRhNTYyLi4w
MDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS91Y2xpYmMvMDAwMS1yZW1vdmUtdUNsaWJjLXNwZWNp
ZmljLWdldHRleHRfcHJpbnRmLnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDM0ICswLDAg
QEAKPiAtRnJvbSA5ZmZlZDlhZGIxMzBkNDViOWYzMWNhN2EzMDUxNTNlODY1ODZjODc3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9tOiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5h
ZGsub3JnPgo+IC1EYXRlOiBGcmksIDE1IEF1ZyAyMDI1IDIwOjI5OjUyICswMjAwCj4gLVN1Ympl
Y3Q6IFtQQVRDSF0gcmVtb3ZlIHVDbGliYyBzcGVjaWZpYyBnZXR0ZXh0X3ByaW50Zgo+IC0KPiAt
T3RoZXIgQyBsaWJyYXJpZXMgbGlrZSBtdXNsL2dsaWJjIGRvZXMgbm90IGRlZmluZSBpdC4KPiAt
SW5jbHVkaW5nIHN0ZGlvLmggaGVyZSBicmVha3MgR3J1YjIgY29tcGlsYXRpb24gd2l0aAo+IC1n
Y2MgMTQgYW5kIGFib3ZlLgo+IC1UaGFua3MgdG8gVGhvbWFzIFBldGF6em9uaSBmb3IgYW5hbHl6
aW5nIHRoZSBHcnViMiBidWlsZCBlcnJvci4KPiAtCj4gLVJlcG9ydGVkLWJ5OiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC1TaWduZWQtb2ZmLWJ5OiBX
YWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+IC1VcHN0cmVhbTogaHR0cHM6Ly9j
Z2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdpdC9jb21taXQvP2lkPTlmZmVk
OWFkYjEzMGQ0NWI5ZjMxY2E3YTMwNTE1M2U4NjU4NmM4NzcKPiAtLS0tCj4gLSBpbmNsdWRlL2xp
YmludGwuaCB8IDMgLS0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAtCj4g
LWRpZmYgLS1naXQgYS9pbmNsdWRlL2xpYmludGwuaCBiL2luY2x1ZGUvbGliaW50bC5oCj4gLWlu
ZGV4IGI3MTIzYTk2My4uNmQ4YjlmMzQyIDEwMDY0NAo+IC0tLS0gYS9pbmNsdWRlL2xpYmludGwu
aAo+IC0rKysgYi9pbmNsdWRlL2xpYmludGwuaAo+IC1AQCAtNTAsOSArNTAsNiBAQCBjaGFyICpi
aW5kdGV4dGRvbWFpbihjb25zdCBjaGFyICpkb21haW5uYW1lLCBjb25zdCBjaGFyICpkaXJuYW1l
KTsKPiAtIAo+IC0gI2VuZGlmCj4gLSAKPiAtLSNpbmNsdWRlIDxzdGRpby5oPgo+IC0tI2RlZmlu
ZSBnZXR0ZXh0X3ByaW50ZihhcmdzLi4uKSBwcmludGYoYXJncykKPiAtLQo+IC0gLyogdG8gc3Vw
cGx5IExDX01FU1NBR0VTIGFuZCBvdGhlciBzdHVmZiBHTlUgZXhwZWN0cyB0byBiZSBleHBvcnRl
ZCB3aGVuCj4gLSAgICBpbmNsdWRpbmcgbGliaW50bC5oICovCj4gLSAjaW5jbHVkZSA8bG9jYWxl
Lmg+Cj4gLS0tIAo+IC0yLjQ3LjIKPiAtCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWNsaWJjL3Vj
bGliYy5oYXNoIGIvcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2gKPiBpbmRleCA4ZDhiMzMzOTU4
Li41NjE3NGEzM2I4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdWNsaWJjL3VjbGliYy5oYXNoCj4g
KysrIGIvcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBG
cm9tIGh0dHBzOi8vZG93bmxvYWRzLnVjbGliYy1uZy5vcmcvcmVsZWFzZXMvMS4wLjU0L3VDbGli
Yy1uZy0xLjAuNTQudGFyLnh6LnNoYTI1Ngo+IC1zaGEyNTYgIGQxZWNmNjVjYzIyMTdkZDQxMThh
NGRhZmMxYWJmMjdjNTg1YjVjYjU3OGYzYmQ3OTkxZmM2NDBiNzk2NDNmZjIgIHVDbGliYy1uZy0x
LjAuNTQudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy51Y2xpYmMtbmcub3JnL3Jl
bGVhc2VzLzEuMC41NS91Q2xpYmMtbmctMS4wLjU1LnRhci54ei5zaGEyNTYKPiArc2hhMjU2ICA1
ZjdmM2FhZmRkYjJjYTA4ZmIyOTViZTQ1NTYxYzAxODg0MDcxMDNkNzQ0NmNmZDI2NGI5YjgyMmZl
ZDNlZDJkICB1Q2xpYmMtbmctMS4wLjU1LnRhci54ego+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+
ICBzaGEyNTYgIGVjNjBiOTkzODM1ZTJjNmI3OWU2ZDkyMjYzNDVmNGU2MTRlNjg2ZWI1N2RjMTNi
NjQyMGMxNWEzM2E4OTk2ZTUgIENPUFlJTkcuTElCCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWNs
aWJjL3VjbGliYy5tayBiL3BhY2thZ2UvdWNsaWJjL3VjbGliYy5tawo+IGluZGV4IDFlNDk0NjNk
ZDQuLjBjMzAzZDc3ZjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS91Y2xpYmMvdWNsaWJjLm1rCj4g
KysrIGIvcGFja2FnZS91Y2xpYmMvdWNsaWJjLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVVDTElCQ19WRVJTSU9OID0gMS4wLjU0Cj4g
K1VDTElCQ19WRVJTSU9OID0gMS4wLjU1Cj4gIFVDTElCQ19TT1VSQ0UgPSB1Q2xpYmMtbmctJChV
Q0xJQkNfVkVSU0lPTikudGFyLnh6Cj4gIFVDTElCQ19TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMu
dWNsaWJjLW5nLm9yZy9yZWxlYXNlcy8kKFVDTElCQ19WRVJTSU9OKQo+ICBVQ0xJQkNfTElDRU5T
RSA9IExHUEwtMi4xKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
