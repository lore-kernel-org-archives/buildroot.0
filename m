Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35119C5B555
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 13:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9428616C7;
	Tue,  3 Jun 2025 13:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndn4ApztFqeN; Tue,  3 Jun 2025 13:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D6A61385
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D6A61385;
	Tue,  3 Jun 2025 13:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ECAC1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B4FA83A5B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oK6KJAtOAH3 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 13:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E16983A15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E16983A15
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E16983A15
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:39:07 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-adb4e36904bso615759566b.1
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 06:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957946; x=1749562746;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ygg8UG2HQTFM1lf6pGaSavj1WTZP/Fs38VNgbncETxU=;
 b=I77rtqYevKkA9gB0X/j4G8sUbGeguTrcEygFUkcRVIl81tVEswQmcn9sIfGJyp/5xV
 Ei3+r768nSUNFvOAjIZqOi68gUDFIixhlDOTtG3oAduFbfeG/H/qbaLyXu+0JwdxfZUn
 pmXv82w+e+SPdBqnd0z/KlWAiDF6bqI7pivL44MaXrnUhOiOaO2ysxSYpz54CmMWAepd
 7NFnLlmyiYP8uGkFh6oBb4jKMmTD/6D8bkMXmS/Q/a2B8oikbbrAWxOpndsfTieTjUOY
 /+ho9SXGJYLmqjgab/XGWkd3UEUE1HlCsWqQP1cb8pLgKIzmbT2yx0vyL3e26vJmBwko
 cv+A==
X-Gm-Message-State: AOJu0YxXwXVA8Nnjjc+ZfRKklXOc88Qdpi0H5o+iGHqVrTgkrK0nIUh7
 WP7JgI55QgsYDGa60nGvf4S60TCwuS5GS5USYfnh/tnvELgT4Bw9Tohl0OhB4YtKLgF9tH1z4Hg
 pzgRjUgk=
X-Gm-Gg: ASbGncv6RiOZCBd7jplpo+uhVuu/yNdKp+N9Ay5p+zCksqtHL92WCpXyieAwd1qJIF1
 T56GG+guWrBqj8ErGRNeanBMosV/OXlYveNXwWN8W9Uqav4915goVpGsn4+rDMFhFgCw5kgNczC
 bru4l85IxVxDkAovGu7FG2U+d2U/IHAt0wj1fLjsTAQr0WRCnejDFgdLYj7L7iGX1jFxG5YJAxd
 fRKtsOiiDS0omIM498vuXrUMU6U9LT+hBWAhOG1zA4pzPPCoG1M2jugysRWexzj2Xi0d13eFBVK
 oJqs11/mzJAAjOefjKXFHXxoC5M4qTJAfPCtJ91w/n8AxTMk47HO
X-Google-Smtp-Source: AGHT+IEw6mKjhGUKAGyrASk9sIcct4zRvw0ZC6job/jNQZ74uIXl50W1ObxxlM9tclAqoQGPZmLSSQ==
X-Received: by 2002:a17:906:7314:b0:ad8:a2cf:76f2 with SMTP id
 a640c23a62f3a-adb36bfb56fmr1505076466b.48.1748957945711; 
 Tue, 03 Jun 2025 06:39:05 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60567168bfesm7482674a12.75.2025.06.03.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:39:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 75A585F839;
 Tue, 03 Jun 2025 14:39:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <abe28079a139d6be300c34593614aa66@free.fr> (Julien Olivain's
 message of "Sat, 31 May 2025 23:28:22 +0200")
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-5-alex.bennee@linaro.org>
 <abe28079a139d6be300c34593614aa66@free.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 03 Jun 2025 14:39:04 +0100
Message-ID: <87ldq92bd3.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748957946; x=1749562746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygg8UG2HQTFM1lf6pGaSavj1WTZP/Fs38VNgbncETxU=;
 b=iQoEQP4kfvrhP8DDv7qf0iEZ28CyXiyanY8nLwp9mU+EtLhTKHTQV0Id0lkRa8gmkF
 2jtUQ2BB1ykEFZv/K0pSkv21jxtKV/NfoEVPPUrvnFAdm3OnpYIdrnHsQvfX/rn5rWBu
 t2c31UnOWDDG01Ztc1tuRUbDrB9zTAlC7qFX8PRoHGpvPN0ID+UsRi2uVsc3jxnV83HT
 Ni1jrDPoCO5fvmXJnyJmpXSL7N62uU7O6w3bSqXEEctLRjkOw6Q07dtGTmlHKqC6yEok
 YAfYWhFuA9fUfZSt3Rl1m1WLvh8XiYClGhpuLKYeGQbwuaVp/FIHAIAdZhqSu4aMEvgp
 Y8Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iQoEQP4k
Subject: Re: [Buildroot] [PATCH v4 4/6] package/vulkan-tools: suppress
 isystem being passed
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

SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoKPiBIaSBBbGV4LAo+Cj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2ghCj4KPiBJZiB0aGUgdnVsa2FuLXRvb2xzIHBhY2thZ2UgaXMga25v
d24gdG8gYmUgYnJva2VuIGZyb20gaXRzIGJ1bXAgdG8KPiAxLjQuMzA3IGZyb20gdGhlIHByZXZp
b3VzIHBhdGNoLCB0aGlzIHBhdGNoIHNob3VsZCBwcmVmZXJhYmx5IGJlCj4gc3F1YXNoZWQgd2l0
aCB0aGUgYnVtcC4gV2UgYXJlIHRyeWluZyB0byBrZWVwIGVhY2ggY29tbWl0IGZ1bmN0aW9uYWwK
PiB0byBtYWtlIGdpdCBiaXNlY3QgZWFzaWVyLgo+Cj4gQ291bGQgeW91IHNxdWFzaCB0aGlzIHBh
dGNoIHdpdGggdGhlIHByZXZpb3VzIG9uZSwgcGxlYXNlPwoKQWZ0ZXIgYnVtcGluZyB0aGUgdmVy
c2lvbnMgdGhlIGJ1aWxkIHNlZW1zIHRvIHdvcmsgd2l0aG91dCB0aGUgcGF0Y2ggc28KSSBjYW4g
ZHJvcCBpdCBub3cuCgo+Cj4gT24gMDMvMDMvMjAyNSAxNzoxNSwgQWxleCBCZW5uw6llIHdyb3Rl
Ogo+PiBUaGlzIGFwcGxpZXMgTk9fU1lTVEVNX0ZST01fSU1QT1JURUQgMSB0byB0aGUgdnVsa2Fu
aW5mbyBidWlsZCB0bwo+PiBwcmV2ZW50IC1pc3lzdGVtIGJlaW5nIHBhc3NlZCwgYnJlYWtpbmcg
dGhlIGJ1aWxkIHdpdGg6Cj4+ICAgLi4uIGFhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9pbmNs
dWRlL2MrKy8xNC4yLjAvY3N0ZGxpYjo3OToxNToKPj4gZmF0YWwgZXJyb3I6IHN0ZGxpYi5oOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+ICAgICAgNzkgfCAjaW5jbHVkZV9uZXh0IDxzdGRs
aWIuaD4KPj4gICAgICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+PiAgIGNvbXBpbGF0
aW9uIHRlcm1pbmF0ZWQuCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4KPj4gLS0tCj4+ICAuLi5hbmluZm8tc3VwcHJlc3MtaXN5c3RlbS1iZWlu
Zy1wYXNzZWQucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNTcgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+IHBhY2thZ2UvdnVs
a2FuLXRvb2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVtLWJlaW5nLXBhc3NlZC5w
YXRjaAo+PiBkaWZmIC0tZ2l0Cj4+IGEvcGFja2FnZS92dWxrYW4tdG9vbHMvMDAwMS12dWxrYW5p
bmZvLXN1cHByZXNzLWlzeXN0ZW0tYmVpbmctcGFzc2VkLnBhdGNoCj4+IGIvcGFja2FnZS92dWxr
YW4tdG9vbHMvMDAwMS12dWxrYW5pbmZvLXN1cHByZXNzLWlzeXN0ZW0tYmVpbmctcGFzc2VkLnBh
dGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjI2ZjhjNGE1
NWYKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysKPj4gYi9wYWNrYWdlL3Z1bGthbi10b29scy8wMDAx
LXZ1bGthbmluZm8tc3VwcHJlc3MtaXN5c3RlbS1iZWluZy1wYXNzZWQucGF0Y2gKPj4gQEAgLTAs
MCArMSw1NyBAQAo+PiArRnJvbSA5MzJhOTkwMmY5MjNhYTBiNjQyM2NlZWU4ZmIwMjg5NjY1YTFk
MTU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogPT9VVEYtOD9xP0FsZXg9MjBC
ZW5uPUMzPUE5ZT89IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiArRGF0ZTogRnJpLCAxNCBG
ZWIgMjAyNSAxMDo0NDo1OCArMDAwMAo+PiArU3ViamVjdDogW1BBVENIXSB2dWxrYW5pbmZvOiBz
dXBwcmVzcyAtaXN5c3RlbSBiZWluZyBwYXNzZWQKPj4gK01JTUUtVmVyc2lvbjogMS4wCj4+ICtD
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPj4gK0NvbnRlbnQtVHJhbnNm
ZXItRW5jb2Rpbmc6IDhiaXQKPj4gKwo+PiArRHVyaW5nIHRoZSBwcm9jZXNzIG9mIHVwZGF0aW5n
IHZ1bGthbi10b29scyBpbiBidWlsZHJvb3QgSSByYW4gaW50bwo+PiArdGhlIGZvbGxvd2luZyBi
dWlsZCBmYWlsdXJlOgo+PiArCj4+ICsgIFsgNTAlXSBCdWlsZGluZyBDWFggb2JqZWN0Cj4+IHZ1
bGthbmluZm8vQ01ha2VGaWxlcy92dWxrYW5pbmZvLmRpci92dWxrYW5pbmZvLmNwcC5vCj4+ICsg
IEluIGZpbGUgaW5jbHVkZWQgZnJvbQo+PiAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290
LmdpdC9idWlsZHMvYXJtNjQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvaW5jbHVk
ZS9jKysvMTQuMi4wL2JpdHMvc3RsX2FsZ28uaDo3MSwKPj4gKyAgICAgICAgICAgICAgICAgICBm
cm9tCj4+IC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3QuZ2l0L2J1aWxkcy9hcm02NC9o
b3N0L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9pbmNsdWRlL2MrKy8xNC4yLjAvYWxnb3Jp
dGhtOjYxLAo+PiArICAgICAgICAgICAgICAgICAgIGZyb20KPj4gL2hvbWUvYWxleC9sc3JjL3Rl
c3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2J1aWxkL3Z1bGthbi10b29scy0xLjQuMzA3
L3Z1bGthbmluZm8vLi92dWxrYW5pbmZvLmg6MzEsCj4+ICsgICAgICAgICAgICAgICAgICAgZnJv
bQo+PiAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290LmdpdC9idWlsZHMvYXJtNjQvYnVp
bGQvdnVsa2FuLXRvb2xzLTEuNC4zMDcvdnVsa2FuaW5mby9nZW5lcmF0ZWQvdnVsa2FuaW5mby5o
cHA6MjgsCj4+ICsgICAgICAgICAgICAgICAgICAgZnJvbQo+PiAvaG9tZS9hbGV4L2xzcmMvdGVz
dHMvYnVpbGRyb290LmdpdC9idWlsZHMvYXJtNjQvYnVpbGQvdnVsa2FuLXRvb2xzLTEuNC4zMDcv
dnVsa2FuaW5mby92dWxrYW5pbmZvLmNwcDozNDoKPj4gKwo+PiAvaG9tZS9hbGV4L2xzcmMvdGVz
dHMvYnVpbGRyb290LmdpdC9idWlsZHMvYXJtNjQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51
eC1nbnUvaW5jbHVkZS9jKysvMTQuMi4wL2NzdGRsaWI6Nzk6MTU6Cj4+IGZhdGFsIGVycm9yOiBz
dGRsaWIuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+PiArICAgICA3OSB8ICNpbmNsdWRl
X25leHQgPHN0ZGxpYi5oPgo+PiArICAgICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+
PiArICBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+PiArICBtYWtlWzJdOiAqKiogW3Z1bGthbmlu
Zm8vQ01ha2VGaWxlcy92dWxrYW5pbmZvLmRpci9idWlsZC5tYWtlOjc2Ogo+PiB2dWxrYW5pbmZv
L0NNYWtlRmlsZXMvdnVsa2FuaW5mby5kaXIvdnVsa2FuaW5mby5jcHAub10gRXJyb3IgMQo+PiAr
ICBtYWtlWzFdOiAqKiogW0NNYWtlRmlsZXMvTWFrZWZpbGUyOjExNjoKPj4gdnVsa2FuaW5mby9D
TWFrZUZpbGVzL3Z1bGthbmluZm8uZGlyL2FsbF0gRXJyb3IgMgo+PiArICBtYWtlOiAqKiogW01h
a2VmaWxlOjEzNjogYWxsXSBFcnJvciAyCj4+ICsKPj4gK1RoZSB1bmRlcmx5aW5nIHJlYXNvbiB3
YXMgLWlzeXN0ZW0gYmVpbmcgcGFzc2VkIHRvIHRoZSBidWlsZCB3aGljaCBJCj4+ICt0aGluayBy
ZXNldHMgdGhlIGluY2x1ZGUgcGF0aCBmb3Igc3lzdGVtIGluY2x1ZGVzLiBUaGlzIG1pZ2h0IGJl
IGEgYnVnCj4+ICtpbiBjbWFrZSBidXQgZnJvbSBsb29raW5nIGF0IHRoZSBDTWFrZSBzb3VyY2Ug
SSBmb3VuZCBzb21lIGV4YW1wbGVzCj4+ICt0aGF0IHNldDogTk9fU1lTVEVNX0ZST01fSU1QT1JU
RUQgMSBhcyBhIHRhcmdldCBwcm9wZXJ0eSB3aGljaCBzZWVtcwo+PiArdG8gZG8gdGhlIGpvYi4K
Pj4gKwo+PiArVGhpcyBkb2Vzbid0IHNlZW0gdG8gYWZmZWN0IHRoZSBub3JtYWwgbm9uLWNyb3Nz
IGJ1aWxkIGFsdGhvdWdoIEkKPj4gK3dvdWxkbid0IGV4cGVjdCB5b3UgbmVlZCB0byBwYXNzIC1p
c3lzdGVtIGFueXdheS4KPj4gKwo+PiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvVnVsa2FuLVRvb2xzL3B1bGwvMTA3Nwo+PiArU2lnbmVkLW9mZi1ieTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiArLS0tCj4+ICsgdnVsa2FuaW5mby9D
TWFrZUxpc3RzLnR4dCB8IDMgKystCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+PiArCj4+ICtkaWZmIC0tZ2l0IGEvdnVsa2FuaW5mby9DTWFrZUxp
c3RzLnR4dCBiL3Z1bGthbmluZm8vQ01ha2VMaXN0cy50eHQKPj4gK2luZGV4IDdlNTFiYjJkLi5k
NGY3ZTFmYSAxMDA2NDQKPj4gKy0tLSBhL3Z1bGthbmluZm8vQ01ha2VMaXN0cy50eHQKPj4gKysr
KyBiL3Z1bGthbmluZm8vQ01ha2VMaXN0cy50eHQKPj4gK0BAIC0yMiw3ICsyMiw4IEBAIHNldChW
VUxLQU5JTkZPX05BTUUgdnVsa2FuaW5mbykKPj4gKyBzZXQoR0VORVJBVEVEIGdlbmVyYXRlZCkK
Pj4gKwo+PiArIGFkZF9leGVjdXRhYmxlKHZ1bGthbmluZm8pCj4+ICstc2V0X3RhcmdldF9wcm9w
ZXJ0aWVzKHZ1bGthbmluZm8gUFJPUEVSVElFUyBPVVRQVVRfTkFNRQo+PiAke1ZVTEtBTklORk9f
TkFNRX0pCj4+ICsrc2V0X3RhcmdldF9wcm9wZXJ0aWVzKHZ1bGthbmluZm8gUFJPUEVSVElFUyBP
VVRQVVRfTkFNRQo+PiAke1ZVTEtBTklORk9fTkFNRX0KPj4gKysKPj4gTk9fU1lTVEVNX0ZST01f
SU1QT1JURUQgMSkKPj4gKwo+PiArIHRhcmdldF9zb3VyY2VzKHZ1bGthbmluZm8gUFJJVkFURSB2
dWxrYW5pbmZvLmNwcCkKPj4gKwo+PiArLS0KPj4gKzIuMzkuNQo+PiArCj4+IC0tCj4+IDIuMzku
NQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gQmVz
dCByZWdhcmRzLAo+Cj4gSnVsaWVuLgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBU
ZWNoIExlYWQgQCBMaW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
