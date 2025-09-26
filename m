Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AABCAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58A5F414A1;
	Fri, 26 Sep 2025 10:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vab5HXLUqvVE; Fri, 26 Sep 2025 10:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8153B414E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8153B414E9;
	Fri, 26 Sep 2025 10:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67469198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6429E61AD7
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkQ-5wYpE3av for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AF6460E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF6460E34
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AF6460E34
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:52:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5821dec0408so2892537e87.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758883958; x=1759488758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sd+LLY3BWau4fPqxuEH1zkdgLuaZUL21bsuIiALD3dc=;
 b=wi72bPMteAbMph+Gh1nnaCsyAbTYA6Zr0+gJe4wrZgYkaA2p9rK53PBoxsRkY+pAq5
 0Tpv4kMWJ2h8BaSs/WKf39ArLAR2qaGr/mBqlwmlWxTr2xSWPsa6uc5gPhCR4mLqSbzW
 9INvoyG+YNM4JNjZgkrXncw3OmzW6+DoFSIyy4iseXT6JzexAPs0tlOcdO0nozYflTOH
 Ngekl+wH7knlFr2FgefrBoOQF32eQCy+fIBPyXwrm8m+NfUUJ9G10jfTiyM/FeN9yAIu
 YCq1eZLplGLmghz1Ictvm118XD2jBvQ1wz2Dfw/NosTdQ3CBf7Q+4wc2/qBWBiFxRygJ
 mv8Q==
X-Gm-Message-State: AOJu0YzAPvtlvBvOp8lMTJKmLBUfWROH+NiTiTdOtptV6D2/rHjIkuZ3
 eID96yu451d7VpA8htdsaRZHCG3H4NqWfzDQ6j/3Tfps/atTurv6syzmoECc31j6DIWGrZGDo5V
 Fgse6DbTzyhbmFqPI8C7+hrt5zfq/LQ7qag==
X-Gm-Gg: ASbGncuAcuwrAIUjmkg611E7KYGcufwbDOlzslBNQE9qhEN5d6lLeqURqdZX2Psx3R4
 lVspsrpU5Kl2T42zR7n5HGwwNT7Bq69dQ6hGuxBuHwsfphxW0+rXSa8m1lRQV8u/FgRJ7hMxf5/
 K2v/Kqsbrj3mXsFx+pnH7q5NcOb/XAkEpS8wBflnWxLU5ATQsZWnDZum2yG09sOSMxEKW9NYfoy
 oAO4OqFWZ8+zop5+PM=
X-Google-Smtp-Source: AGHT+IEUAXF0IzDPUDkHyeVYG9nWWrcyQh/iwWegGmIFbYsF97kTjg/YLlHw7Gvg/wd3L7iMqN4wQ69jJGx7G7YQExE=
X-Received: by 2002:a05:6512:3043:b0:57d:d62e:b200 with SMTP id
 2adb3069b0e04-582d3d8d147mr2191455e87.47.1758883957330; Fri, 26 Sep 2025
 03:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250801091417.1209867-1-yegorslists@googlemail.com>
In-Reply-To: <20250801091417.1209867-1-yegorslists@googlemail.com>
Date: Fri, 26 Sep 2025 12:52:25 +0200
X-Gm-Features: AS18NWA-cALsMEyehQM64lTJoDSTiZCTAMIJHc8HF0U80tcQoXn3OgPHDghpOLs
Message-ID: <CAGm1_kswk7CYXDhZ47MDp5rfExfE+jQJxfHJASNRMaRENLL_qw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1758883958; x=1759488758; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sd+LLY3BWau4fPqxuEH1zkdgLuaZUL21bsuIiALD3dc=;
 b=myqn+36hVQ5IWqW34d86vHfy+13fz2+MdIitXgeXC/LSwgq8sUvUpowk2ADSLYvU53
 KVaOKJAVEwIrkC8sg0gRT7uMLUVZ1qwN1HhNuGC2Oh35iCCOCMDhV/cCQfbD9J0OVICJ
 W5L7QngEsiLn38EtGQUx6rPeqDMbabxeQvnA4cTz3M2t6dAyOui1+UfQUJbyLEg2hMss
 pBLsAxjrqiflU6gEhoKEiiZQdHB+06fYoo+MsHDugXmb+cE2KirXuoTVZXn+0T+Rf26z
 Oy5/zRh9XWYVU8A1xcH+gu+lCA6A5ZgxOucNLXcF45DjgipudvmUnuOcmzYo274qLpSh
 T8zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=myqn+36h
Subject: Re: [Buildroot] [PATCH] package/libxmlrpc: bump to version 1.64.02
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMSwgMjAyNSBhdCAxMToxNOKAr0FNIDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xl
bWFpbC5jb20+Cj4KPiBGb3IgY2hhbmdlIGxvZywgc2VlOgo+Cj4gaHR0cHM6Ly94bWxycGMtYy5z
b3VyY2Vmb3JnZS5pby9jaGFuZ2Vfc3RhYmxlLmh0bWwKPgo+IFNpZ25lZC1vZmYtYnk6IFllZ29y
IFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9s
aWJ4bWxycGMvbGlieG1scnBjLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbGlieG1scnBjL2xpYnht
bHJwYy5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJw
Yy5oYXNoIGIvcGFja2FnZS9saWJ4bWxycGMvbGlieG1scnBjLmhhc2gKPiBpbmRleCBiOTE2N2Nh
NWEwLi4xNGYxNWE3YWU1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJw
Yy5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJ4bWxycGMvbGlieG1scnBjLmhhc2gKPiBAQCAtMSwz
ICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAgNzI2NWJlMWExODFlNTcx
MDY3MDdiNTI3OGRhZjY0YjJhNzE3YjhhMmE5ZTZlYzg5OTJkOGM4MDg0ZTY0ZWFhMiAgbGlieG1s
cnBjLXIzMTc2LXN2bjUudGFyLmd6Cj4gK3NoYTI1NiAgNTU2MjNmNzdjYzNhODUyZWY2YTgzNGU5
M2Q4MTUxODkxMDY5ZTM4YTE0OGMzMmIyOWY4OTA2MzVjN2MxMDkwNSAgbGlieG1scnBjLXIzMjg5
LXN2bjUudGFyLmd6Cj4gIHNoYTI1NiAgZGI3YTZkM2YxODdiMjE4YzM1MzQwMTBhODM0MjRjNmJj
ZGVmODhlNmEwYjZiMWFhM2E4NzYyMjM4YmQ2NDJlNiAgZG9jL0NPUFlJTkcKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJ4bWxycGMvbGlieG1scnBjLm1rIGIvcGFja2FnZS9saWJ4bWxycGMvbGli
eG1scnBjLm1rCj4gaW5kZXggZGQwOWZhOGY1My4uOTFjMmNiM2FmZSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsKPiArKysgYi9wYWNrYWdlL2xpYnhtbHJwYy9s
aWJ4bWxycGMubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+Cj4gLSMgMS42MC4wMSAoY29kZS9hZHZhbmNlZEByMzE3NikKPiAtTElCWE1MUlBDX1ZF
UlNJT04gPSByMzE3Ngo+ICsjIDEuNjQuMDIgKGNvZGUvYWR2YW5jZWRAcjMyODkpCj4gK0xJQlhN
TFJQQ19WRVJTSU9OID0gcjMyODkKPiAgTElCWE1MUlBDX1NJVEUgPSBodHRwczovL3N2bi5jb2Rl
LnNmLm5ldC9wL3htbHJwYy1jL2NvZGUvYWR2YW5jZWQKPiAgTElCWE1MUlBDX1NJVEVfTUVUSE9E
ID0gc3ZuCj4gIExJQlhNTFJQQ19MSUNFTlNFID0gQlNELTMtQ2xhdXNlICh4bWwtcnBjIG1haW4g
Y29kZSBhbmQgYWJ5c3Mgd2ViIHNlcnZlciksIEJTRCBsaWtlIChsaWIvZXhwYXQpLCBQeXRob24g
MS41LjIgbGljZW5zZSAocGFydHMgb2YgeG1scnBjX2Jhc2U2NC5jKQoKVGhpcyBwYXRjaCBpcyBu
b3cgb2Jzb2xldGUuCgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
