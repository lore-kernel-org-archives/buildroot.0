Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDBEC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 13:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4DD613BA;
	Tue,  3 Jun 2025 13:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Osxw67VONDPS; Tue,  3 Jun 2025 13:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BDB61303
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BDB61303;
	Tue,  3 Jun 2025 13:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD239DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDD9483A5B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6whphJkv81xn for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 13:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C93DA83A15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C93DA83A15
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C93DA83A15
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:40:22 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-602039559d8so10605029a12.1
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 06:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958020; x=1749562820;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KtpD1YHSykoP+BQCuFctpeTD2FpKshKVtPF7d2uSB7M=;
 b=qb9/H78M1DentovqET5whIycuietUJ0mNGSCBKPg+OF9aJqls2/YtPWATjghzQE8Pe
 85vWg+peYFm58MfTIzEQNUofv41TUYOMIdSLwjCVV2j9usT1zOxvD5dudfhMBpliPb7F
 YXG9ReCCBkpX98pFI0xO1WDye2U1r3+ZVgY2TK5tkaMuq4SsOx0K8P+mjI4w9ORYinYQ
 2EJWxS7SshdGrCfZollplfF8hFcIosrxnrJGMyx+xL586o6WSP6UQWK30WA+2l7SGJfb
 M85D7DzTI3gzqmPcYjMeIw92L0Z4DAwcTZU3MztJHGMYRvYHPfIJ3fQSVnKy3ZtsVJA3
 8xgw==
X-Gm-Message-State: AOJu0Yzx57BpcboyQ23LCosCkWzEN4hN3hSpMQZuXtLb0uC+ltGccFZU
 dQGoT0vQo5s2Jqg5RFyE868UH24fQWbNJyah7nKxiHkXf4wVd1S8mFPyshSQh7OvxPiwNsi/syD
 POw1Wwy8=
X-Gm-Gg: ASbGncvqKEM7znWMC7ulm16Bn+ast2hh3aDpSVyVCDOFVIEJP2d73iIazzq9VwG7xSp
 NyDy507bxwGMo18ILg+JhvzeMMrmdicfMFdA3j6BZzsGfZwumTQFQJgyqvXh6Vha6wOnOIsoGU9
 hqf09NgIWBu5gCcNr8z51WugOVVhOQsgtYv8OeiZbmhsIpu1+Agil/q8a00Z4RNjapfs4vKIzEK
 PRh+w1JroVSs4tDQsmvCibN0dbIAUaOkcBjsRS5VjvSGnYAT+ys4+azlShE1wvxzAJovTWBMfXO
 GCEk6uO5Hu1ogZVWNLBkDDumZkSZ7yNuq+de5wT2JwMTuGXV6BbY83lbSFh2tg4=
X-Google-Smtp-Source: AGHT+IGyn2I66L4F4kKIE9XKVcCRN1nYbGAXwcV7UOiI6qR8m6P/iuukT/rtKTeQ5Y2FiTbcP58xwA==
X-Received: by 2002:a05:6402:274e:b0:606:a26c:6f4f with SMTP id
 4fb4d7f45d1cf-606a26c72e3mr4226055a12.10.1748958020447; 
 Tue, 03 Jun 2025 06:40:20 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c59f81sm7491699a12.18.2025.06.03.06.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:40:19 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3E0635F839;
 Tue, 03 Jun 2025 14:40:19 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <718a3907f383c7d17b956ee261071dae@free.fr> (Julien Olivain's
 message of "Sat, 31 May 2025 23:51:12 +0200")
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-7-alex.bennee@linaro.org>
 <718a3907f383c7d17b956ee261071dae@free.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 03 Jun 2025 14:40:19 +0100
Message-ID: <87frgh2bb0.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748958020; x=1749562820; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtpD1YHSykoP+BQCuFctpeTD2FpKshKVtPF7d2uSB7M=;
 b=ugC3e+CvjYXn96rg5MlG+BGS+4X3dbJZKURfKhAw+bqL5ZNv1mHyBha9TnQO68qsZE
 Gx5FURpibBlCiMH9KRl5JZytRWOninSqKc58UCso2wJ1KORrW1iqCXJycFwyOMJOqCOs
 5Gl5/vBxfMLbIwSf/3zLYISvhPq2GtmfgONMtzdMesgm3dUQ7Tut3+muVeJ6ZRslTnNC
 0QslAfACiBFoVmEJP4VpNmvovdi43OBxz6JHG4pNj6Jj0yfLcigxlOkFH/1e8chUVNFg
 mBjK74LJmUoUeEPaXqL0NNqfXteAGNIRoItBseLOldWBGKBLZiX/2TuT5Uk72w1Aot4u
 F2KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ugC3e+Cv
Subject: Re: [Buildroot] [PATCH v4 6/6] support/testing: add test for vkmark
 package
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

SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoKPiBIaSBBbGV4LAo+Cj4gT24g
MDMvMDMvMjAyNSAxNzoxNSwgQWxleCBCZW5uw6llIHdyb3RlOgo+PiBUbyB0ZXN0IHZrbWFyayB3
ZSBuZWVkIGEgaGVhZGxlc3MgV2VzdG9uIGNvbXBvc2l0b3Igc28gd2UgY2FuIHJ1biB0aGUKPj4g
dGVzdCB3aXRob3V0IG1lc3NpbmcgYXJvdW5kIHdpdGggYWN0dWFsIGRpc3BsYXlzLgo+Cj4gVGhp
cyB0ZXN0IGNvdmVycyBhIGJpdCBtb3JlIHRoYW4gdGhlIHZrbWFyayBwYWNrYWdlLiBJdCBhbHNv
IHRlc3QgTWVzYTNECj4gVnVsa2FuIFZpcnRpbywgd2hpY2ggYnJpbmdzIG5ldyByZXF1aXJlbWVu
dHMgb24gdGhlIGhvc3QtcWVtdSAodG8gaGF2ZQo+IHRoZSBzdWZmaWNpZW50IHZlcnNpb24gYW5k
IGJ1aWxkIG9wdGlvbnMpIGFuZCBhbHNvIG9uIHRoZSBob3N0IGl0c2VsZgo+ICh0byBoYXZlIGEg
dmFsaWQgdnVsa2FuIGltcGxlbWVudGF0aW9uKS4KPgo+IFRoZSBCdWlsZHJvb3QgdGVzdCBzdWl0
ZSBjdXJyZW50bHkgcnVucyBpbiB0aGUgRG9ja2VyIHJlZmVyZW5jZSBpbWFnZSwKPiB3aGljaCBp
bmNsdWRlIGFuICJvbGQiIHFlbXUgNy4yLjE1LiBTcGVjaWZpYyBydW50aW1lIHRlc3RzIGNhbiBy
ZXF1ZXN0Cj4gYSBidWlsZCBvZiBob3N0LXFlbXUsIHdoaWNoIGlzIGN1cnJlbnRseSB2ZXJzaW9u
IDEwLjAgYnV0IHdpbGwgbGFjawo+IHRoZSB2aXJnbHJlbmRlcmVyIHN1cHBvcnQuIFNlZToKPiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUt
cmMyL3BhY2thZ2UvcWVtdS9xZW11Lm1rI0w0NjUKPgo+IEZpbmFsbHksIGlmIHRoZXJlIGlzIG5v
IGFjdHVhbCBWdWxrYW4tY2FwYWJsZSBHUFUgaGFyZHdhcmUgb24gdGhlIGhvc3QsCj4gaXQgc2hv
dWxkIHRoZW4gdXNlIGEgaG9zdC1tZXNhM2QgdnVsa2FuIGxsdm1waXBlLiBUaGlzIHdvdWxkIHBy
b2JhYmx5Cj4gYmUgYSBjb25zaWRlcmFibGUgcmV3b3JrIChvZiBob3N0LXFlbXUgcmVjaXBlLCBv
ciByZWZlcmVuY2UgZG9ja2VyCj4gaW1hZ2UpLgo+Cj4gSWYgbWVyZ2VkIGFzIGlzLCB0aGlzIHRl
c3Qgd2lsbCBhbHdheXMgZmFpbCBpbiB0aGUgQnVpbGRyb290IEdpdGxhYiBDSToKPiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzCj4KPiBDb3VsZCB0aGlz
IHRlc3QgYmUgc2ltcGxpZmllZCB0byBydW4gdmttYXJrIHdpdGggTWVzYTNEIFZ1bGthbiBsbHZt
cGlwZT8KPgo+IEl0IHdpbGwgbm8gbG9uZ2VyIHRlc3QgdGhlIFZ1bGthbiBWaXJ0aW8gR1BVIHBh
dGgsIGJ1dCBhdCBsZWFzdAo+IHRoZSB2a21hcmsgcmVjaXBlIHdpbGwgYmUgdGVzdGVkLgoKSSd2
ZSBzaW1wbGlmaWVkIHRoZSB0ZXN0IGZvciBDSSBhbmQgYWRkZWQgdGhlIFNXUkFTVCBkcml2ZXIg
c28gdmttYXJrCmNhbiBydW4gZXZlbiB3aXRoIGFuIHVuLWFjY2VsZXJhdGVkIGRpc3BsYXkgZGV2
aWNlLiBNYW51YWxseSB0ZXN0aW5nCndpdGggdGhlIGxhdGVzdCBRRU1VIHdvcmtzIHdpdGggZnVs
bCBhY2NlbGVyYXRpb24uCgo+Cj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4KPiBCZXN0IHJlZ2FyZHMs
Cj4KPiBKdWxpZW4uCgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBA
IExpbmFybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
