Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1A0EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA12615D0;
	Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99tNrANplckE; Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695CB61436
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011448;
	bh=P6hsGUNeJT+qnYFqi7btai++tJNvLib12eyGAU7ihjU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AkYx8q/0wdRV2rTy0/A6GAxyOR8vXU7E8ml/VN3hg7/cE2zT17hgzQcsjhM0Dd4sV
	 CHppc4haD8Arj4kS1gyxbZE8ZojXhHUu1+4hWGREvxOV7krXqMIEYCb1dxadRbXjRV
	 3+FOVU4KKDFQejfxITKit98rIn8At0nlV9Az5JNJA5ao9sej+z3uyIfcK9+w3sONXd
	 l6Bda/9Y1DJLFBJqks0UWFD80/ZEtsRsIvo7bc92eaYkIEyGV+nnqExn93Uz+PY10L
	 9NPSUyYWMjQ5QiA9qiruAQrQlFnDoKQUlNipooFbJK/IgqH+8ey4PW37YjxiJYgNb0
	 vKtApOEzi4yeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695CB61436;
	Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00891EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA49041F10
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBsLv4SimcV0 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C983E41EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C983E41EB8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C983E41EB8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso32807695e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011414; x=1771616214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6oslnqZ4sZp70yZOXOI5wHPoJPO+XpenqwLYQL7o9mc=;
 b=SnegjJFqWBv7YHmggI1UPiW5rWVeUW45IGlQ3PyL81XQScho6ET2f6idFJOcqkGRPn
 RbCTqRsl2ZMWNN5aI2k6FgWlkjDTkEoap5Cl3cvvAPkIy4u7vzESShqBZnE0YABlqlid
 govLNWfZrTM7ZGQkqmAhPrydbwGRIlEzpzcrYlGGFvAx1redprQLIe83WD6AChV7Rg/A
 E3CWoZgIMPmkS/h31lipqa68gWnGpfxW7HEU+uATbNq7Gm1FQh98rQDJeya9hlQUeT1M
 I5W4f7NXrsbuYE5L2eibr+0HkZ/1WOJc3eK0rWbxokDGmE/XZl4lOLwmpu/9jYAPzEzy
 kIIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWe9tJXhdri+Mijm1xHkPpOV5yarUORt0VftuXtLnrQjYV+onSiRAIJ5ppZiCXToh1WY0ty8zW3kM=@buildroot.org
X-Gm-Message-State: AOJu0YweaoTfHWsHMv12X3l59ila2TQw+5E0W9Jf26x9xJOOWOlDXcUJ
 bqpPl1VOw2O+0lmnIJaX+/9Hk3jS3ppFgWtD1YxxH1V4o8E4cBzBoia8pz5yE3mWKRE=
X-Gm-Gg: AZuq6aLZokXpKMYwpWZ87rZRRffEByN/DoEasD4hM2JNFgWfVbjVRHlKFeMgTMtN+Wg
 tJ6PT2UONDSdhfCZHIE211qSu9J4ojGQVO5uDoWmL0U0zZvZW6m7CofCYTpCIM77xf6f3MDDyoU
 i5YUO6jqORtKOO/O93i0sg7NuwOT3F9TChlPJ9ryJrrOb+x9xwFTeqJTM+fB5vN/v2D28th1hFm
 uKOVBxIgkmaerlZAw/PXcGNv3V4DnXwth4Lo5TPU06TIoeLungaFoP6qcj+T9+BJ8VUNwz9d4X8
 MUAgnQ3YY1r1OugxeX7SxTdTsQfuNB0ue9vAofPcRd58g2HQEdeeHzzNKogspUwYApwMOxka9d0
 2zOQR3Wb6zNfKQOTNKnP6nqzMJ1ViIkV9wWc8ZkSVxyf4d1ATr4pdDEY+Mb61BPkR06RMutY6Ot
 8FmZjPne63nYEGNs/FR4uoxXIPFQ==
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-48378da53a2mr21904065e9.13.1771011413742; 
 Fri, 13 Feb 2026 11:36:53 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483740be167sm48696775e9.15.2026.02.13.11.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:53 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:52 +0100
Message-ID: <20260213193653.38441-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202173700.428773-1-buildroot@bubu1.eu>
References: <20260202173700.428773-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011414; x=1771616214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6oslnqZ4sZp70yZOXOI5wHPoJPO+XpenqwLYQL7o9mc=;
 b=f/iwVTF2zvnhVNyr5zzLPUkbQz4bkfao/pwXm7nTGks+kvp2E4qKtqkk4lcAArWnJz
 XfWQGkWrw3Nsnym7wim9Jm9Qrp2tYB3BeKXDE1FQ9FoFSu1LNQHb0DYr/NCvNt2UCznd
 SYAcCgPwZyP+hIUx8h+o8cTTkUI6MuOci37Z06xaaF76YdJtANVQhMQh4NccQaNY5YB9
 J93xnj9hZ0q6QX5YZBlCQ7rrJdN1b4Pu9w8Gtd3tVFLf9XhaohvP7/RyDPibcoQC0UdJ
 xugs+cUR9fO53o/gLC2V3NsZj+Jf6ugE3cPxiBjrdDMq0aWkWfSxjIrVNs+vhXFbfJXq
 EAmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f/iwVTF2
Subject: Re: [Buildroot] [PATCH] package/systemd: fix building with
 libsseccomp and kernel headers < 5.8
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

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBpcyBhbHNvIGZpeGVkIGluIHN5c3RlbWQgdjI1OCsuCj4gCj4g
Rml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy84ZmYvOGZmNzdl
NzljYzczNzNmNDUyYzI1MjEyYzdlMjA1ODM2OGNkZDA1Zi8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
YXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KCkFwcGxpZWQgdG8gMjAyNS4xMS54
LiBUaGFua3MKCj4gLS0tCj4gIC4uLm5seS1hZGQtYnBmLXN5c2NhbGwtdG8tc2VjY29tcC1hbGxv
dy5wYXRjaCB8IDQ2ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3lzdGVtZC8wMDAxLW5z
cGF3bi1zZWNjb21wLW9ubHktYWRkLWJwZi1zeXNjYWxsLXRvLXNlY2NvbXAtYWxsb3cucGF0Y2gK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kLzAwMDEtbnNwYXduLXNlY2NvbXAtb25s
eS1hZGQtYnBmLXN5c2NhbGwtdG8tc2VjY29tcC1hbGxvdy5wYXRjaCBiL3BhY2thZ2Uvc3lzdGVt
ZC8wMDAxLW5zcGF3bi1zZWNjb21wLW9ubHktYWRkLWJwZi1zeXNjYWxsLXRvLXNlY2NvbXAtYWxs
b3cucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRhNzQw
ODMzOTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9zeXN0ZW1kLzAwMDEtbnNwYXdu
LXNlY2NvbXAtb25seS1hZGQtYnBmLXN5c2NhbGwtdG8tc2VjY29tcC1hbGxvdy5wYXRjaAo+IEBA
IC0wLDAgKzEsNDYgQEAKPiArRnJvbSBlNmFiNzIzYzk2YjkxZTdjNGM0OTVmY2VmMDY1NDEwMmZh
YzI2NTcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBNYXJjdXMgSG9mZm1hbm4g
PGJ1YnVAYnVidTEuZXU+Cj4gK0RhdGU6IE1vbiwgMiBGZWIgMjAyNiAxODoyNjoxOSArMDEwMAo+
ICtTdWJqZWN0OiBbUEFUQ0hdIG5zcGF3bi1zZWNjb21wOiBvbmx5IGFkZCBicGYgc3lzY2FsbCB0
byBzZWNjb21wIGFsbG93bGlzdCBpZgo+ICsgaGVhZGVycyBkZWZpbmUgQ0FQX0JQRgo+ICtNSU1F
LVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
PiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArV2hlbiBidWlsZGluZyBz
eXN0ZW1kIHdpdGgga2VybmVsIGhlYWRlcnMgPCA1LjggKHdoaWNoIGFkZGVkIENBUF9CUEYpIGl0
IGZhaWxzIHdpdGg6Cj4gKwo+ICsgIC4uL3NyYy9uc3Bhd24vbnNwYXduLXNlY2NvbXAuYzogSW4g
ZnVuY3Rpb24g4oCYYWRkX3N5c2NhbGxfZmlsdGVyc+KAmToKPiArICAuLi9zcmMvbnNwYXduL25z
cGF3bi1zZWNjb21wLmM6MTE0OjE5OiBlcnJvcjog4oCYQ0FQX0JQRuKAmSB1bmRlY2xhcmVkIChm
aXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiArICAgIDExNCB8ICAgICAgICAgICAgICAgICB7
IENBUF9CUEYsICAgICAgICAgICAgImJwZiIsICAgICAgICAgICAgICAgICAgICAgICAgIH0sCj4g
KyAgICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+Cj4gKyAgLi4vc3JjL25zcGF3bi9u
c3Bhd24tc2VjY29tcC5jOjExNDoxOTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIg
aXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiAr
Cj4gK0lmIHRoZSBrZXJuZWwgaGVhZGVycyBkb24ndCBkZWZpbmUgQ0FQX0JQRiwgaXQncyBsaWtl
bHkgdGhhdCB0aGUgcnVubmluZwo+ICtrZXJuZWwgZG9lc24ndCBrbm93IGFib3V0IHRoaXMgY2Fw
YWJpbGl0eSBlaXRoZXIsIHNvIHdlIGNhbiBhc3N1bWUgdGhhdAo+ICt3ZSdkIG5ldmVyIGFsbG93
IHRoaXMgc3lzY2FsbCBhbnl3YXkuCj4gKwo+ICtTbyBpZiBDQVBfQlBGIGlzbid0IGRlZmluZWQs
IGp1c3Qgc2tpcCB0aGlzIGFsbG93X2xpc3QgZW50cnkgZW50aXJlbHkuCj4gKwo+ICtTaWduZWQt
b2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1YnVAYnVidTEuZXU+Cj4gK1Vwc3RyZWFtOiBOL0Eg
LSBmaXhlZCBpbiBzeXN0ZW1kID49IDI1OCBieSBpbnRyb2R1Y2luZyB2ZW5kb3JlZCBrZXJuZWwg
aGVhZGVycyBmb3IgdGhpcyB1c2UtY2FzZWEKPiArLS0tCj4gKyBzcmMvbnNwYXduL25zcGF3bi1z
ZWNjb21wLmMgfCAyICsrCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gKwo+
ICtkaWZmIC0tZ2l0IGEvc3JjL25zcGF3bi9uc3Bhd24tc2VjY29tcC5jIGIvc3JjL25zcGF3bi9u
c3Bhd24tc2VjY29tcC5jCj4gK2luZGV4IDY5NTY2ODlhYjUuLmFhYWM2MDg1YjYgMTAwNjQ0Cj4g
Ky0tLSBhL3NyYy9uc3Bhd24vbnNwYXduLXNlY2NvbXAuYwo+ICsrKysgYi9zcmMvbnNwYXduL25z
cGF3bi1zZWNjb21wLmMKPiArQEAgLTEwOCw3ICsxMDgsOSBAQCBzdGF0aWMgaW50IGFkZF9zeXNj
YWxsX2ZpbHRlcnMoCj4gKyAgICAgICAgICAgICAgICAgeyBDQVBfU1lTX0JPT1QsICAgICAgICJy
ZWJvb3QiICAgICAgICAgICAgICAgICAgICAgICB9LAo+ICsgICAgICAgICAgICAgICAgIHsgQ0FQ
X1NZU0xPRywgICAgICAgICAic3lzbG9nIiAgICAgICAgICAgICAgICAgICAgICAgfSwKPiArICAg
ICAgICAgICAgICAgICB7IENBUF9TWVNfVFRZX0NPTkZJRywgInZoYW5ndXAiICAgICAgICAgICAg
ICAgICAgICAgIH0sCj4gKysjaWZkZWYgQ0FQX0JQRgo+ICsgICAgICAgICAgICAgICAgIHsgQ0FQ
X0JQRiwgICAgICAgICAgICAiYnBmIiwgICAgICAgICAgICAgICAgICAgICAgICAgfSwKPiArKyMg
ZW5kaWYKPiArIAo+ICsgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAgICog
VGhlIGZvbGxvd2luZyBzeXNjYWxscyBhbmQgZ3JvdXBzIGFyZSBrbm93aW5nbHkgZXhjbHVkZWQ6
Cj4gKy0tIAo+ICsyLjUyLjAKPiArCj4gLS0gCj4gMi41Mi4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
