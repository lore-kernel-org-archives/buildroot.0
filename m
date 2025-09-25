Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3ABCAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F257F61524;
	Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu3PxdMia_17; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16DA361525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16DA361525;
	Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4AD12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEFD1411E9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A29-n_C_cPAr for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F99041196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F99041196
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F99041196
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e1bc8ffa1so14645685e9.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831399; x=1759436199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnrMHwha8wmPZ1eRyrzDBa6o4c8q5K2JzWbhkY2aMLw=;
 b=jcdBOwUtnrD5fb8zhHjlCMQXAS35SZXA+FXAf/gkON9SZrYxz8uC9dTCMXGxuYh/9E
 /x84vbao8DB9waSKDJI0bcJWO4can0OVuK4P+PIbRDcdyxY1c7nthCes82s4MGwLfvdP
 6QIcY3vH1/mMk2lzFffQVozTbeNcL4Ovhzv0bteon8l4q1/6lHFaRMQdgfZmuh/IIOX/
 a+lmWXYiS3UVASRwt+vAE47ZtzL6Rp/QI83KCxHBgNq58t8lDvawVYpwXC8uO5LivF8g
 LdCZrJfUCOHur1HRjcc99xmbi3VTB+6mil6F0Sntfd6fwhLrnRTX93ar/FyPo7RqEDfz
 jQ4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW96fIqQok+kduzg9IgccMEehbZptIncqE+tXtJg2crGjHSsB+ctYG+PWajeLpj7YRs+RoadABuLMw=@buildroot.org
X-Gm-Message-State: AOJu0YxKWye1D+sPy2vR1uoyjp3KOiscjp99wtZil+gkTnrizd2+tvN0
 O2AuT9KZObicIdDnyJSNE8bVsDAtW+tAiBgxCEiWJLPqLjWacmWh4elb8ul94d6MWmlot/d8Ant
 aPPh4xSA=
X-Gm-Gg: ASbGncvvC2kMJhyGA0o0Z06mzkXrycYCK+3IvcDEVdgOF0JvMjaE52pNushzYE6HI6T
 gjtet87dfxvQdCAIy8eyfkfyYABOFFTaiSUFQQr2CIcbGUVHkT5/YJ4J+cTmXfOislHjSrMfc9Z
 e/+cNyDWvXTmLQ4tXDdu9LDmgxHChGvnsC85dFQ6JKSSLFpvHR3DSiJJ7zmEWXfTUC5VrdLLBz8
 6+TSIcD4KRgug16+OAvGxIJ5VN95u6UY0GGOblYo5ll4Q7s+aGUhRxbqjpRTRIv/mRsoC69W1Cp
 sH2L0G55smaIDjZtwr0B9809FVgZWwBUQKuTmDBLA6bPF8HSh6D2yP+LZdPTs0ZZCjItXhY+XN5
 hOSh8UfNfieos2eo=
X-Google-Smtp-Source: AGHT+IH6Obupl7653917XePno79v5xld5YG1n/WTASVo1b7+Hy2+mf9D/8aBfogO5FVnp2tW0wczvQ==
X-Received: by 2002:a05:600c:1986:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-46e32a057c2mr44137275e9.27.1758831398713; 
 Thu, 25 Sep 2025 13:16:38 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33baacf7sm44362385e9.9.2025.09.25.13.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:38 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:36 +0200
Message-ID: <20250925201637.43075-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908183816.3689041-1-thomas.petazzoni@bootlin.com>
References: <20250908183816.3689041-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831399; x=1759436199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnrMHwha8wmPZ1eRyrzDBa6o4c8q5K2JzWbhkY2aMLw=;
 b=ITH9/lrIey3ICdo+prVZEghWIqLNhubUsfpXMiYDc9wO2gEHBej+VO8RjX03XLoRAg
 UQlFvjLc5YY4a9b0eXZLaGGmd1TFaMVemmPN68cCRVsk9q1U9L2A96uOcfRzlcR/+xx9
 6dxIbktHWP+fKQOOHXdBT7CU/ntbl0uAtoA4rhIMOw8L106aGCPAxQefUfYO+eCQhHuN
 +/PUWuBczbQZaN9JPXXtTEHHYDmlDllMSwlohTTTaCWoxz1Gf0P7lPSRj/edyppDyv1p
 sA1zcr1M1mUXS18yIt8hCEGTf5JCREmgxIMtXnHU8vPvnWcL+LIC00BqzuPek6NDk9WU
 K55Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ITH9/lrI
Subject: Re: [Buildroot] [PATCH] package/libfreeimage: fix build with GCC
 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGFrZSB0d28gcGF0Y2hlcyBmcm9tIHRoZSBEZWJpYW4ganhybGliIHBh
Y2thZ2UsIGFuZCBpbnRlZ3JhdGUgdGhlbSB0bwo+IGZpeCB0aGUgYnVpbGQgb2YgdGhlIGJ1bmRs
ZWQganhybGliIGxpYnJhcnkgZm91bmQgaW4gdGhlIGxpYmZyZWVpbWFnZQo+IHBhY2thZ2UuCj4g
Cj4gbGliZnJlZWltYWdlIGlzbid0IGV4YWN0bHkgd2VsbCBtYWludGFpbmVkOiBpdHMgbGFzdCB2
ZXJzaW9uIDMuMTguMCBpcwo+IHF1aXRlIG9sZCAoSnVseSAyMDE4KSwgdGhlcmUncyBhIGZhaXJs
eSBsYXJnZSBudW1iZXIgb2YgdGlja2V0cyBpbiB0aGUKPiBidWcgdHJhY2tlciBjbGFpbWluZyB0
byBiZSBDVkUKPiByZXBvcnRzIChodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2ZyZWVpbWFnZS9i
dWdzLyksIGl0IGlzIHN0aWxsIHVzaW5nCj4gU1ZOIGFzIHRoZSB2ZXJzaW9uIGNvbnRyb2wgc3lz
dGVtLgo+IAo+IEhvd2V2ZXIsIGl0IGlzIHVzZWQgYXMgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeSBm
b3IgQ0VHVUksIGFuZCBhCj4gbWFuZGF0b3J5IGRlcGVuZGVuY3kgZm9yIE9ncmUuIEhvd2V2ZXIs
IGl0IG5vIGxvbmdlciBzZWVtcyB0byBiZSBhCj4gZGVwZW5kZW5jeSBmb3IgbW9yZSByZWNlbnQg
dmVyc2lvbnMgb2YgT2dyZS4gQnV0IGluIGFueSBjYXNlIGl0IGNhbm5vdAo+IHNpbXBseSBiZSBk
cm9wcGVkLgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzQ1MjQ2MjI4NWJmOTNiMTNmMDkyZmI0MTY5Njk1MmY0MTVlNzViMmYvCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI1LjA1LnggJiAyMDI1LjA4LnguIFRoYW5r
cwoKPiAtLS0KPiAgLi4uLzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoICAgICAg
IHwgNDAgKysrKysrKysrKysrKysrKysrKwo+ICAuLi5CRlMtZml4LWZvci1mdW5jdGlvbi1wcm90
b3R5cGUtZXJyb3IucGF0Y2ggfCAyOSArKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDY5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnJlZWlt
YWdlLzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2xpYmZyZWVpbWFnZS8wMDA2LUZUQkZTLWZpeC1mb3ItZnVuY3Rpb24tcHJv
dG90eXBlLWVycm9yLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnJlZWltYWdl
LzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoIGIvcGFja2FnZS9saWJmcmVlaW1h
Z2UvMDAwNS1qeHJsaWItZnRiZnMtd2l0aC1HQ0MtMTQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmMxM2E4ZGMyNmYKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9saWJmcmVlaW1hZ2UvMDAwNS1qeHJsaWItZnRiZnMtd2l0aC1HQ0MtMTQucGF0
Y2gKPiBAQCAtMCwwICsxLDQwIEBACj4gK0Zyb20gMTEzODNhMDE3ZThkMDQwZjEzNzZjOTY0ZDJi
ODc2OTEwODIwNGYwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWU9LT1RBIEhp
cm9zaGkgPHlva290YS5oZ21sQGdtYWlsLmNvbT4KPiArRGF0ZTogVGh1LCAyNSBKdWwgMjAyNCAx
NTowMzozMSArMDkwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGp4cmxpYjogZnRiZnMgd2l0aCBHQ0Mt
MTQKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK0J1Zy1E
ZWJpYW46IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnLzEwNzUxMDUKPiArCj4gK19ieXRlc3dhcF91
bG9uZygpIGlzIGRlZmluZWQgaW4gaW1hZ2Uvc3lzL3N0cmNvZGVjLmMKPiArCj4gK1Vwc3RyZWFt
OiBCdWcgc3VibWl0dGVkIGF0IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvZnJlZWltYWdlL2J1
Z3MvMzg5Lwo+ICtbVGhvbWFzOiBwYXRjaCB0YWtlbiBmcm9tIGh0dHBzOi8vc291cmNlcy5kZWJp
YW4ub3JnL3BhdGNoZXMvanhybGliLzEuMn5naXQyMDE3MDYxNS5mNzUyMTg3LTUuMy8wMDEzLWp4
cmxpYi1mdGJmcy13aXRoLUdDQy0xNC5wYXRjaC9dCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQ
ZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLS0KPiArL3Vzci9i
aW4vY2MgLURESVNBQkxFX1BFUkZfTUVBU1VSRU1FTlQgLURfX0FOU0lfXyAtRGpwZWd4cl9FWFBP
UlRTIC1JIi88PFBLR0JVSUxERElSPj4vY29tbW9uL2luY2x1ZGUiIC1JIi88PFBLR0JVSUxERElS
Pj4vaW1hZ2Uvc3lzIiAtSSIvPDxQS0dCVUlMRERJUj4+L2p4cmdsdWVsaWIiIC1JIi88PFBLR0JV
SUxERElSPj4vanhydGVzdGxpYiIgLWcgLU8yIC1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb24gLWZmaWxlLXByZWZpeC1tYXA9Lzw8UEtHQlVJTERESVI+Pj0uIC1mc3RhY2stcHJv
dGVjdG9yLXN0cm9uZyAtZnN0YWNrLWNsYXNoLXByb3RlY3Rpb24gLVdmb3JtYXQgLVdlcnJvcj1m
b3JtYXQtc2VjdXJpdHkgLWZjZi1wcm90ZWN0aW9uIC1XYWxsIC1XZXh0cmEgLVdkYXRlLXRpbWUg
LURfRk9SVElGWV9TT1VSQ0U9MiAtZlBJQyAtdyAtTUQgLU1UIENNYWtlRmlsZXMvanBlZ3hyLmRp
ci9pbWFnZS9lbmNvZGUvc3RyZW5jLmMubyAtTUYgQ01ha2VGaWxlcy9qcGVneHIuZGlyL2ltYWdl
L2VuY29kZS9zdHJlbmMuYy5vLmQgLW8gQ01ha2VGaWxlcy9qcGVneHIuZGlyL2ltYWdlL2VuY29k
ZS9zdHJlbmMuYy5vIC1jICIvPDxQS0dCVUlMRERJUj4+L2ltYWdlL2VuY29kZS9zdHJlbmMuYyIK
PiArLzw8UEtHQlVJTERESVI+Pi9pbWFnZS9kZWNvZGUvc2VnZGVjLmM6IEluIGZ1bmN0aW9uIOKA
mF9sb2FkNOKAmToKPiArLzw8UEtHQlVJTERESVI+Pi9pbWFnZS9kZWNvZGUvc2VnZGVjLmM6Njg6
MTI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhfYnl0ZXN3YXBf
dWxvbmfigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gKyAgIDY4IHwgICAg
IHJldHVybiBfYnl0ZXN3YXBfdWxvbmcodik7Cj4gKyAgICAgIHwgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn4KPiArLS0tCj4gKyBTb3VyY2UvTGliSlhSL2ltYWdlL2RlY29kZS9zZWdkZWMuYyB8
IDEgKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0
IGEvU291cmNlL0xpYkpYUi9pbWFnZS9kZWNvZGUvc2VnZGVjLmMgYi9Tb3VyY2UvTGliSlhSL2lt
YWdlL2RlY29kZS9zZWdkZWMuYwo+ICtpbmRleCAxMjk5NDU4Li44MDUwMzU1IDEwMDY0NAo+ICst
LS0gYS9Tb3VyY2UvTGliSlhSL2ltYWdlL2RlY29kZS9zZWdkZWMuYwo+ICsrKysgYi9Tb3VyY2Uv
TGliSlhSL2ltYWdlL2RlY29kZS9zZWdkZWMuYwo+ICtAQCAtNjMsNiArNjMsNyBAQCBzdGF0aWMg
VTMyIF9GT1JDRUlOTElORSBfbG9hZDQodm9pZCogcHYpCj4gKyAgICAgdiB8PSAoKFUzMikoKFUx
NiAqKSBwdilbMV0pIDw8IDE2Ow0KPiArICAgICByZXR1cm4gX2J5dGVzd2FwX3Vsb25nKHYpOw0K
PiArICNlbHNlIC8vIF9NX0lBNjQNCj4gKysgICAgVTMyIF9ieXRlc3dhcF91bG9uZyhVMzIgYml0
cyk7IC8vIGZyb20gaW1hZ2Uvc3lzL3N0cmNvZGVjLmMNCj4gKyAgICAgcmV0dXJuIF9ieXRlc3dh
cF91bG9uZygqKFUzMiopcHYpOw0KPiArICNlbmRpZiAvLyBfTV9JQTY0DQo+ICsgI2VuZGlmIC8v
IF9CSUdfX0VORElBTl8NCj4gKy0tIAo+ICsyLjUxLjAKPiArCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliZnJlZWltYWdlLzAwMDYtRlRCRlMtZml4LWZvci1mdW5jdGlvbi1wcm90b3R5cGUtZXJy
b3IucGF0Y2ggYi9wYWNrYWdlL2xpYmZyZWVpbWFnZS8wMDA2LUZUQkZTLWZpeC1mb3ItZnVuY3Rp
b24tcHJvdG90eXBlLWVycm9yLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5iZGRhMzc2NDY3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGli
ZnJlZWltYWdlLzAwMDYtRlRCRlMtZml4LWZvci1mdW5jdGlvbi1wcm90b3R5cGUtZXJyb3IucGF0
Y2gKPiBAQCAtMCwwICsxLDI5IEBACj4gK0Zyb20gN2I1OWIzNzU3NTIxZDgyNDA2NzcxY2M0NzEy
N2FhNzBmZmIyNmYzZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWU9LT1RBIEhp
cm9zaGkgPHlva290YS5oZ21sQGdtYWlsLmNvbT4KPiArRGF0ZTogVGh1LCAyNSBKdWwgMjAyNCAx
NjowMTowMSArMDkwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZUQkZTIGZpeCBmb3IgZnVuY3Rpb24g
cHJvdG90eXBlIGVycm9yCj4gKwo+ICtCdWctRGViaWFuOiBodHRwczovL2J1Z3MuZGViaWFuLm9y
Zy8xMDc1MTA1Cj4gKwo+ICtVcHN0cmVhbTogQnVnIHN1Ym1pdHRlZCBhdCBodHRwczovL3NvdXJj
ZWZvcmdlLm5ldC9wL2ZyZWVpbWFnZS9idWdzLzM4OS8KPiArW1Rob21hczogcGF0Y2ggdGFrZW4g
ZnJvbSBodHRwczovL3NvdXJjZXMuZGViaWFuLm9yZy9wYXRjaGVzL2p4cmxpYi8xLjJ+Z2l0MjAx
NzA2MTUuZjc1MjE4Ny01LjMvMDAxNS1GVEJGUy1maXgtZm9yLWZ1bmN0aW9uLXByb3RvdHlwZS1l
cnJvci5wYXRjaC9dCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLQo+ICsgU291cmNlL0xpYkpYUi9qeHJnbHVlbGli
L0pYUkdsdWVKeHIuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvU291cmNlL0xpYkpYUi9qeHJnbHVlbGliL0pYUkdsdWVKeHIuYyBi
L1NvdXJjZS9MaWJKWFIvanhyZ2x1ZWxpYi9KWFJHbHVlSnhyLmMKPiAraW5kZXggMmJmMDg1YS4u
MTgyZmM3ZiAxMDA2NDQKPiArLS0tIGEvU291cmNlL0xpYkpYUi9qeHJnbHVlbGliL0pYUkdsdWVK
eHIuYwo+ICsrKysgYi9Tb3VyY2UvTGliSlhSL2p4cmdsdWVsaWIvSlhSR2x1ZUp4ci5jCj4gK0BA
IC0yOCw2ICsyOCw3IEBACj4gKyAvLypAQEAtLS1AQEBAKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICsgI2luY2x1ZGUg
PGxpbWl0cy5oPg0KPiArICNpbmNsdWRlIDxKWFJHbHVlLmg+DQo+ICsrI2luY2x1ZGUgPHdjaGFy
Lmg+DQo+ICsgDQo+ICsgDQo+ICsgc3RhdGljIGNvbnN0IGNoYXIgc3pIRFBob3RvRm9ybWF0W10g
PSAiPGRjOmZvcm1hdD5pbWFnZS92bmQubXMtcGhvdG88L2RjOmZvcm1hdD4iOw0KPiArLS0gCj4g
KzIuNTEuMAo+ICsKPiAtLSAKPiAyLjUxLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
