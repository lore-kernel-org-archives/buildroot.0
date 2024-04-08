Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93781CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 22:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E1460881;
	Mon,  8 Apr 2024 22:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMIqZpmLlo6y; Mon,  8 Apr 2024 22:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A32560750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A32560750;
	Mon,  8 Apr 2024 22:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46CE91BF3B0
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 22:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331F74012F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDK9PD3jyDa4 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 22:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98EF640003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98EF640003
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98EF640003
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 22:45:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso1323523f8f.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 15:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712616334; x=1713221134;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SAesk5TXP51roUu74eSbJPLZunRVq6NHS4nldI4bdLo=;
 b=f1rZ6vH6ZOQSVTZaxIogC6QyP+2Gv2Jgyt5kd6FiZjRZiDvYSO6MXyrnP/+Ls0k3Ct
 uyLMtFdN+fPJBExYIM6WKfRkFPY8SLLeeiwvFEEAcvjaU/RmB/R1F2peeGVUTUOFIQ7N
 6hC8CN98u86kdZ+frX+q6RerlGCF9OZYkn0qLEIG0mPZOtWp9CeJpncYP+AJv1GhEGKS
 7Ynm2CGmcL2JlbUoG3/ctGbgd8mcqGkigt0+m/KuHgW0dpA2Wd/GrGbxi74qdtRdi6gg
 /vLNUz72igLcmf/nGQwOvKn2gtQ79qU74vGf+bJiR1iu/xEFHcYzvbSVcyzWixrta4HN
 K93g==
X-Gm-Message-State: AOJu0YzK/DPP5F/keVHi//YJ+GTJpvNHUBtrspCUpI4CYarRkk0b8Gpw
 m0h59HVjk7nu1FP2bBPcKaaXEs27M2RvlN58NePD4AB3h0GRixkWk/G1iV0t
X-Google-Smtp-Source: AGHT+IG2qTEE4AgoDRf+tKNyXLxTbYuBslwZfcuRJeLqV9lu2tHodla9/4GOskTKD7u+wOTaJGSDDw==
X-Received: by 2002:a5d:6350:0:b0:343:4170:f3f1 with SMTP id
 b16-20020a5d6350000000b003434170f3f1mr771574wrw.33.1712616334051; 
 Mon, 08 Apr 2024 15:45:34 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b00343b252b096sm9960328wrx.23.2024.04.08.15.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 15:45:33 -0700 (PDT)
Date: Tue, 9 Apr 2024 00:45:31 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20240408224531.GB44146@pevik>
References: <20240408211609.2423619-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408211609.2423619-1-robimarko@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712616334; x=1713221134; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SAesk5TXP51roUu74eSbJPLZunRVq6NHS4nldI4bdLo=;
 b=MVgI/4Pj7wxQfMYIB809SXjd/D5zZIlPFn76Z25mk5D8IOjTRbte0zvIllO3Ejw7vZ
 5hwwRhfyZUujvJskxJMLWCqGtmGhkaR9e7W3SvQx2K+P2iq4wvKTW6i1GhZDBTPcbK5S
 BxoBGiTWbwJb1Hce4qAs+rkQy9mFi1rTIe7AF+8S83N6Me7fpjOKcPZE/QovharYOhmB
 +cHhUdZDo8dD1apYszLyRmsncvbgAeVpfO7+A9JNJFq9xCCT4FaqIbymG2pfso1wUN7+
 02Mrxd4bY2Ouczv1w1H8UGzmqhJp9hPIGscjckWwXH2UjrMBYX8OlrzvA6dBReq/w9DU
 n+5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MVgI/4Pj
Subject: Re: [Buildroot] [PATCH v2 1/1] kconfig/lxdialog: fix check() with
 GCC14
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9iZXJ0LCBUaG9tYXMsCgo+IEdDQzE0IG5vdyB0cmVhdHMgaW1wbGljaXQgaW50IHR5cGVz
IGFzIGVycm9yIHNvIHdoZW4gY2hlY2soKSBmcm9tCj4gY2hlY2stbHhkaWFsb2cuc2ggaXMgY2Fs
bGVkIHRvIGNoZWNrIHdoZXRoZXIgd2UgY2FuIGxpbmsgYWdhaW5zdCBuY3Vyc2VzCj4gaXQgd2ls
bCBmYWlsIHNpbGVudGx5IGFuZCB0aGUgaGVscCB0ZXh0IGluZGljYXRpbmcgdG8gaW5zdGFsbCBu
Y3Vyc2VzIGlzCj4gcHJpbnRlZC4KCj4gSG93ZXZlciwgdGhpcyBpcyBub3QgZHVlIHRvIG1pc3Np
bmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJyIHJlZGlyZWN0Cj4gdG8gL2Rldi9udWxsIGlz
IHJlbW92ZWQgd2UgY2FuIHNlZSB0aGUgcm9vdCBjYXVzZToKPiA8c3RkaW4+OjI6MTogZXJyb3I6
IHJldHVybiB0eXBlIGRlZmF1bHRzIHRvIOKAmGludOKAmSBbLVdpbXBsaWNpdC1pbnRdCgo+IFNv
LCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3b3JrIHdpdGggR0NDMTQgbGV0cyBqdXN0IHNw
ZWNpZnkgdGhlCj4gcmV0dXJuIHR5cGUgb2YgbWFpbigpIGFzIGludC4KCj4gU2lnbmVkLW9mZi1i
eTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFya29AZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBQZXRy
IFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgoKVGhhbmtzIGZvciBxdWlja2x5IGFkZGluZyB2Mi4KCkJUVyB0
aGVyZSB3ZXJlIHdoaXRlc3BhY2UgaXNzdWVzIChidXQgZml4ZWQgYnkgZ2l0IGFtKToKCkRlc2Ny
aXB0aW9uOiBbdjIsMS8xXSBrY29uZmlnL2x4ZGlhbG9nOiBmaXggY2hlY2soKSB3aXRoIEdDQzE0
CkFwcGx5aW5nOiBrY29uZmlnL2x4ZGlhbG9nOiBmaXggY2hlY2soKSB3aXRoIEdDQzE0Ci5naXQv
cmViYXNlLWFwcGx5L3BhdGNoOjY1OiBzcGFjZSBiZWZvcmUgdGFiIGluIGluZGVudC4KIAlpZiBb
ICQ/ICE9IDAgXTsgdGhlbgouZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo2Njogc3BhY2UgYmVmb3Jl
IHRhYiBpbiBpbmRlbnQuCiAJICAgIGVjaG8gIiAqKiogVW5hYmxlIHRvIGZpbmQgdGhlIG5jdXJz
ZXMgbGlicmFyaWVzIG9yIHRoZSIgICAgICAgMT4mMgouZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo2
NzogdHJhaWxpbmcgd2hpdGVzcGFjZS4KLS0KLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6Njk6IG5l
dyBibGFuayBsaW5lIGF0IEVPRi4KKwp3YXJuaW5nOiAzIGxpbmVzIGFwcGxpZWQgYWZ0ZXIgZml4
aW5nIHdoaXRlc3BhY2UgZXJyb3JzLgoKT3RoZXJ3aXNlIExHVE0uCgpBbmQgSSBzZWUgdGhlIHRv
b2xjaGFpbiB3YXJuaW5ncyBmb3IgZ2NvbmZpZyBhbmQgeGNvbmZpZyAod2hpY2ggYXJlIGxpa2Vs
eSBmaXhlZAppbiBuZXdlciBrY29uZmlnIGluIHRoZSBMaW51eCBrZXJuZWwpLgoKS2luZCByZWdh
cmRzLApQZXRyCgoKPiAtLS0KPiAgc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlh
bG9nLnNoICAgIHwgIDIgKy0KPiAgLi4uY29uZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdD
QzE0LnBhdGNoIHwgNDMgKysrKysrKysrKysrKysrKysrKwo+ICBzdXBwb3J0L2tjb25maWcvcGF0
Y2hlcy9zZXJpZXMgICAgICAgICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC9rY29uZmlnL3BhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxvZy1maXgtY2hlY2std2l0aC1HQ0Mx
NC5wYXRjaAoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4
ZGlhbG9nLnNoIGIvc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4g
aW5kZXggMTZjZDlhMzE4Ni4uMjdkNmMzMGE1NyAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L2tjb25m
aWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPiArKysgYi9zdXBwb3J0L2tjb25maWcvbHhk
aWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPiBAQCAtNDgsNyArNDgsNyBAQCB0cmFwICJybSAtZiAk
dG1wIiAwIDEgMiAzIDE1Cj4gIGNoZWNrKCkgewo+ICAgICAgICAgICRjYyAteCBjIC0gLW8gJHRt
cCAyPi9kZXYvbnVsbCA8PCdFT0YnCj4gICNpbmNsdWRlIENVUlNFU19MT0MKPiAtbWFpbigpIHt9
Cj4gK2ludCBtYWluKCkge30KPiAgRU9GCj4gIAlpZiBbICQ/ICE9IDAgXTsgdGhlbgo+ICAJICAg
IGVjaG8gIiAqKiogVW5hYmxlIHRvIGZpbmQgdGhlIG5jdXJzZXMgbGlicmFyaWVzIG9yIHRoZSIg
ICAgICAgMT4mMgo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29u
ZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdDQzE0LnBhdGNoIGIvc3VwcG9ydC9rY29uZmln
L3BhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxvZy1maXgtY2hlY2std2l0aC1HQ0MxNC5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDEwODFiYjQ1ZAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmlnLWx4
ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdDQzE0LnBhdGNoCj4gQEAgLTAsMCArMSw0MyBAQAo+ICtG
cm9tIDNhZTkxMzM3YjUzZmEzY2NmMGJhZDdmMTgxZmNhZjQ4M2ZhYjIyZWUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4gK0Zyb206IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4K
PiArRGF0ZTogV2VkLCAzIEFwciAyMDI0IDE0OjE4OjA3ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRD
SF0ga2NvbmZpZy9seGRpYWxvZzogZml4IGNoZWNrKCkgd2l0aCBHQ0MxNAo+ICtNSU1FLVZlcnNp
b246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArR0NDMTQgbm93IHRyZWF0cyBpbXBs
aWNpdCBpbnQgdHlwZXMgYXMgZXJyb3Igc28gd2hlbiBjaGVjaygpIGZyb20KPiArY2hlY2stbHhk
aWFsb2cuc2ggaXMgY2FsbGVkIHRvIGNoZWNrIHdoZXRoZXIgd2UgY2FuIGxpbmsgYWdhaW5zdCBu
Y3Vyc2VzCj4gK2l0IHdpbGwgZmFpbCBzaWxlbnRseSBhbmQgdGhlIGhlbHAgdGV4dCBpbmRpY2F0
aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBpcwo+ICtwcmludGVkLgo+ICsKPiArSG93ZXZlciwgdGhp
cyBpcyBub3QgZHVlIHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJyIHJlZGly
ZWN0Cj4gK3RvIC9kZXYvbnVsbCBpcyByZW1vdmVkIHdlIGNhbiBzZWUgdGhlIHJvb3QgY2F1c2U6
Cj4gKzxzdGRpbj46MjoxOiBlcnJvcjogcmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZ
IFstV2ltcGxpY2l0LWludF0KPiArCj4gK1NvLCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3
b3JrIHdpdGggR0NDMTQgbGV0cyBqdXN0IHNwZWNpZnkgdGhlCj4gK3JldHVybiB0eXBlIG9mIG1h
aW4oKSBhcyBpbnQuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJr
b0BnbWFpbC5jb20+Cj4gK1Jldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWls
LmNvbT4KPiArVGVzdGVkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KPiAr
LS0tCj4gKyBrY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoIHwgMiArLQo+ICsgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0t
Z2l0IGEva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaCBiL2tjb25maWcvbHhkaWFs
b2cvY2hlY2stbHhkaWFsb2cuc2gKPiAraW5kZXggMTZjZDlhMzE4Ni4uMjdkNmMzMGE1NyAxMDA3
NTUKPiArLS0tIGEva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaAo+ICsrKysgYi9r
Y29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4gK0BAIC00OCw3ICs0OCw3IEBAIHRy
YXAgInJtIC1mICR0bXAiIDAgMSAyIDMgMTUKPiArIGNoZWNrKCkgewo+ICsgICAgICAgICAkY2Mg
LXggYyAtIC1vICR0bXAgMj4vZGV2L251bGwgPDwnRU9GJwo+ICsgI2luY2x1ZGUgQ1VSU0VTX0xP
Qwo+ICstbWFpbigpIHt9Cj4gKytpbnQgbWFpbigpIHt9Cj4gKyBFT0YKPiArIAlpZiBbICQ/ICE9
IDAgXTsgdGhlbgo+ICsgCSAgICBlY2hvICIgKioqIFVuYWJsZSB0byBmaW5kIHRoZSBuY3Vyc2Vz
IGxpYnJhcmllcyBvciB0aGUiICAgICAgIDE+JjIKPiArLS0gCj4gKzIuNDQuMAo+ICsKPiBkaWZm
IC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzIGIvc3VwcG9ydC9rY29uZmln
L3BhdGNoZXMvc2VyaWVzCj4gaW5kZXggZTVhNmY2OWQ4Zi4uZjEyMGUzMjNiNyAxMDA2NDQKPiAt
LS0gYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMKPiArKysgYi9zdXBwb3J0L2tjb25m
aWcvcGF0Y2hlcy9zZXJpZXMKPiBAQCAtMTAsMyArMTAsNCBAQAo+ICAxOS1tZXJnZV9jb25maWcu
c2gtYWRkLWJyMi1leHRlcm5hbC1zdXBwb3J0LnBhdGNoCj4gIDIwLW1lcmdlX2NvbmZpZy5zaC1B
bGxvdy10by1kZWZpbmUtY29uZmlnLXByZWZpeC5wYXRjaAo+ICAyMS1Bdm9pZC1mYWxzZS1wb3Np
dGl2ZS1tYXRjaGVzLWZyb20tY29tbWVudC1saW5lcy5wYXRjaAo+ICsyMi1rY29uZmlnLWx4ZGlh
bG9nLWZpeC1jaGVjay13aXRoLUdDQzE0LnBhdGNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
