Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB2EC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 18:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84EC860D8E;
	Sun, 18 May 2025 18:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wABTmQDxui9C; Sun, 18 May 2025 18:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0E1260D6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E1260D6B;
	Sun, 18 May 2025 18:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAB8B1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C51181148
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgHnU_d6k_LO for <buildroot@buildroot.org>;
 Sun, 18 May 2025 18:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADB1780D78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB1780D78
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADB1780D78
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:43:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-551ed0038a0so887417e87.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747593811; x=1748198611;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8oVu/CdacNBp3mDQYVdmBnYJZ3TSF59BxnIFfGbnzCw=;
 b=TD9N7OPlgk6IjMipAJpE2C41iGfseeK14kNg/RY/ccB3YpWjoVlbQui13Jh8OTLbiT
 EeY7FPy8n6wvhzAjfoYUTj//VIqsYpDChnoqtGxrscZ4O5QGtkiWpDG0TetZ1HsXpdiz
 60zYNv8I97PVnGcqhSpQLhY/Fves+o1GI7FZ+xujQWje1CRPxngWX0IoMLGJuMgE27iH
 M4FFYB4MyaIDINzbHjevnosKuioj7Hp1+sGn/SpIkFo1gqmpa63KLP+VtLHVn257Japb
 4pPD+XiYZ1Qyxv1roiZf+jcfbdEBckNEZtKG5PopOsFKHhXXZ3g/AWBRYM1nfGF1tlfF
 MEpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcPVzWaAhSWnaZuiRrRHHXN3VvaTArbm4dTEPGcfB3p+/uq1Ckx7EeiGe1jWpSnAQ0FVyzzZFl+Vo=@buildroot.org
X-Gm-Message-State: AOJu0YyZEBODAAeCvgaGoWbZDdfqf8m8K8JFCvRR6jDuKKdhQwijqgzK
 UdlFnusA1tS/24HyaJPs61uIrlzHt4SfmbN996t8sLW3yaOEtnCLXbtr
X-Gm-Gg: ASbGncvpaeuu7kC/KfEpaSKcLFG13tiUhm/TQ76X2tlN7TA4BEP0qMTuVfZK5snwMnm
 W/mu8HTTnubeRsVZKWMnJhV/O+GyLZomwagBkOXdyFznfX/zEhaAW7Xt9ELL8uvizhkAAJW0ICr
 anCuj2Snk61AzSPCOtV45K8+nbKVQVkIp2OZmYLNVlkvffd0JfTCi+tjlHPvBt2qZLDnRrSCngL
 sTi5tQtKBnvjFEbuv9il3YWuPg+73zL4t4xdIHt7lN09F5Fv8wEWQrIDx8bqJu33H2twgT7zHWP
 Ars80IfTRfEmjDli1XY6+QOaT5oq8w==
X-Google-Smtp-Source: AGHT+IEVRLNI7puQFFC5UyfQdbLnaN+83gedTwceiNnGEgHs2tFbaj4uk+N1tDqg/xypuA8v7G48NA==
X-Received: by 2002:a05:6512:31d1:b0:54f:bc43:dafb with SMTP id
 2adb3069b0e04-550e7243888mr3554658e87.43.1747593811070; 
 Sun, 18 May 2025 11:43:31 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f16098sm1517695e87.26.2025.05.18.11.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 11:43:30 -0700 (PDT)
Message-ID: <836bd770a0189f99a9322be4acc38843d8272eb8.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>, Steve Kenton <skenton@ou.edu>, 
 Wade Berrier <wberrier@gmail.com>
In-Reply-To: <20250518174630.2149476-3-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
 <20250518174630.2149476-3-bernd@kuhls.net>
Organization: wires.se
Date: Sun, 18 May 2025 20:43:29 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747593811; x=1748198611; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oVu/CdacNBp3mDQYVdmBnYJZ3TSF59BxnIFfGbnzCw=;
 b=WwC+STKMnRHyLtvPuHUmYbJt5Jyc90p7Svcs9YVomRfGgB68T0fejwVg54j87Lc5p7
 0CVoUVWS88J0CpXkQr+wVb2YDf4MDV02C5eKZeaeO47s7WhEnJvVMVx9gZVbsghWbXLL
 IfbfRz057G0YL2hWnuhIHWGi37rsywdDyTrv6rwvyt/fIhcoYef/m0fsK/D6DDi3cyXy
 1N+yoBQGR7Ptqe5jM/FFeQohOklW2BUulpyigw2M1ksqxd6nrAIBhl7zB+cSIx5VWb0h
 LSPPDuKs1cliL6eqesGB5MIM3D7/r2KcWPIiimU9Mbc2JBERmlXQjXrHnZn0x8v8OMUm
 wGMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WwC+STKM
Subject: Re: [Buildroot] [PATCH 3/5] package/mrouted: fix build with gcc-15.x
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBndWVzcyB0aGF0J3MgYSByZW1pbmRlciBhcyBnb29kIGFzIGFueSB0byBtZXJnZSB0aGUgUFIu
CgpsZ3RtIC9KCgpSZXZpZXdlZC1ieTogSm9hY2hpbSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5j
b20+CgpPbiBTdW4sIDIwMjUtMDUtMTggYXQgMTk6NDYgKzAyMDAsIEJlcm5kIEt1aGxzIHdyb3Rl
Ogo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4g
wqBwYWNrYWdlL21yb3V0ZWQvMDAwMS1nY2MxNS5wYXRjaCB8IDMzCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tcm91dGVkLzAwMDEtZ2NjMTUucGF0Y2gKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tcm91dGVkLzAwMDEtZ2NjMTUucGF0Y2ggYi9wYWNrYWdl
L21yb3V0ZWQvMDAwMS0KPiBnY2MxNS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNzgxZjgzZjVjNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L21yb3V0ZWQvMDAwMS1nY2MxNS5wYXRjaAo+IEBAIC0wLDAgKzEsMzMgQEAKPiArRnJvbSBjZGIz
ODhjOGRjNmU2NjFkMmEyM2YxZTliNzkxMDJiYzY4ZTg5YWY1IE1vbiBTZXAgMTcgMDA6MDA6MDAK
PiAyMDAxCj4gK0Zyb206IFBoaWxpcHBlIFRyb2luIDxwaGlsK2dpdGh1Yi1jb21taXRzQGZpZmku
b3JnPgo+ICtEYXRlOiBXZWQsIDIzIEFwciAyMDI1IDE2OjA0OjIwIC0wNzAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gQzIzIGNvbXBhdGliaWxpdHkuCj4gKwo+ICtib29sIGlzIGEga2V5d29yZCBpbiBD
MjMuCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3Ryb2dsb2JpdC9tcm91dGVk
L3B1bGwvNjUKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5u
ZXQ+Cj4gKy0tLQo+ICsgc3JjL2tlcm4uYyB8IDYgKysrLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy9r
ZXJuLmMgYi9zcmMva2Vybi5jCj4gK2luZGV4IDI3ZjhkZDQuLjA0ZjFjMzYgMTAwNjQ0Cj4gKy0t
LSBhL3NyYy9rZXJuLmMKPiArKysrIGIvc3JjL2tlcm4uYwo+ICtAQCAtMTA0LDExICsxMDQsMTEg
QEAgdm9pZCBrX3NldF9yY3ZidWYoaW50IGJ1ZnNpemUsIGludCBtaW5zaXplKQo+ICvCoCAqIGlu
IHRoZSBrZXJuZWwgYW5kICJwYW5pYyIuIFRoZSBrZXJuZWwgcGF0Y2ggZm9yIG5ldGluZXQvaXBf
cmF3LmMKPiArwqAgKiBjb21pbmcgd2l0aCB0aGlzIGRpc3RyaWJ1dGlvbiBmaXhlcyBpdC4KPiAr
wqAgKi8KPiArLXZvaWQga19oZHJfaW5jbHVkZShpbnQgYm9vbCkKPiArK3ZvaWQga19oZHJfaW5j
bHVkZShpbnQgZmxhZykKPiArIHsKPiArICNpZmRlZiBJUF9IRFJJTkNMCj4gKy3CoMKgwqAgaWYg
KHNldHNvY2tvcHQoaWdtcF9zb2NrZXQsIElQUFJPVE9fSVAsIElQX0hEUklOQ0wsICZib29sLAo+
IHNpemVvZihib29sKSkgPCAwKQo+ICstwqDCoMKgwqDCoMKgwqAgbG9naXQoTE9HX0VSUiwgZXJy
bm8sICJGYWlsZWQgc2V0dGluZyBzb2NrZXQgSVBfSERSSU5DTCAldSIsCj4gYm9vbCk7Cj4gKyvC
oMKgwqAgaWYgKHNldHNvY2tvcHQoaWdtcF9zb2NrZXQsIElQUFJPVE9fSVAsIElQX0hEUklOQ0ws
ICZmbGFnLAo+IHNpemVvZihmbGFnKSkgPCAwKQo+ICsrwqDCoMKgwqDCoMKgwqAgbG9naXQoTE9H
X0VSUiwgZXJybm8sICJGYWlsZWQgc2V0dGluZyBzb2NrZXQgSVBfSERSSU5DTCAldSIsCj4gZmxh
Zyk7Cj4gKyAjZW5kaWYKPiArIH0KPiArIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
