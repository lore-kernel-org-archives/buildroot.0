Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57433C25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D798404F3;
	Wed, 22 May 2024 13:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRSnvF5NyNZ5; Wed, 22 May 2024 13:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE3F4056E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE3F4056E;
	Wed, 22 May 2024 13:06:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35DFA1BF3D9
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3000760687
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bkaj8UnpZ4g for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CB7A60586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB7A60586
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CB7A60586
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:06:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4202cea9941so40347275e9.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716383182; x=1716987982;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6O3uaNMeIDM2oVEFhN3ie6H2dPTkm0Fw86bpqES1XoA=;
 b=VHthbQ2kh0srxmWa9sDLfqvaF7b3Uc+rM6JzgCurqlpJoUD7a436JFYzdoDvK4ZTXE
 CGz7mCLlAXTwB5WwQ2KXtlokCNfKiTooNO4MHmDnSF3+oTyDHCybOUmyy8aEOnXhL91Y
 rG55gXshSu9DdLgS3LAnrkn8sTiUabHx3Wgnlm4XvXCJZjXg5Z3D8pMWMbyLmrDbgLaB
 zGLGFDQrWqdcdrYAsFxqBXVlU8ACXkk/vHsDlZxEbG+a5/PaxKHUDZmJNqyp4fPnw7Jw
 YFwvfiOn/0NH4ibbMPcGbX+WDCzqWooqxbK5UNCIz3yXKqxLLVbiI5MaSJ+hz9Qzk07G
 0YZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOxYsFWHDvRaXPW/JypM/bq7+bQu/jjfIwHViQZiBbgx+HJrcsF28D4y4teciOq4p7ghRTgEbqtpw+nrZqkdFbsJHXi4sNGA==
X-Gm-Message-State: AOJu0Yzzmbv06iL5SSzq/q9InIAevPZ+MAPEDYFqLXvC1fkJ9Nv0QquV
 TkislXRbZvFMcTREEtp+ev17ZSHPG1f/MTQoc/42/P9mqE30gWpKnZEj9sIdZ4+rTWicBCeUhLT
 F
X-Google-Smtp-Source: AGHT+IGzsiEKdsLQqwdGq8xGGS+os2NacGa03cMklFzdKVW2MR8Ptb2j/UJQM8LJZjfq3ZQuCR74MQ==
X-Received: by 2002:a05:600c:215a:b0:416:605b:5868 with SMTP id
 5b1f17b1804b1-420fd3600c4mr13741675e9.35.1716383182163; 
 Wed, 22 May 2024 06:06:22 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420113d808bsm411061835e9.12.2024.05.22.06.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:06:21 -0700 (PDT)
Message-ID: <9c28057c-63e4-4996-952b-44d87bbc595c@smile.fr>
Date: Wed, 22 May 2024 15:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240521194441.102448-1-ju.o@free.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240521194441.102448-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716383182; x=1716987982;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6O3uaNMeIDM2oVEFhN3ie6H2dPTkm0Fw86bpqES1XoA=;
 b=0GjIOa94wfND9we+P7ZLR2fE1dAjezmvs8heSR2COyHxZbfEU+8j0IAFi0PIjShTEb
 86iA4/PX0cVgBajJDxKGZAyL59IalXgQznfc3HcS/777vP9ZxSW2swrpJ+USHWl2qTRQ
 vq8HOouQwik4WLcblr+linic9DK/egkTIkClWC8lyRLKsr6l5B9LCAH7MSQOWt+uLorr
 DwLLJArIlI0CTF7SlvdrHm+m6ibJmg+9WUOLpk8NNLoQ7OLy/mxiyDHcIxfexZ3bzfn1
 ViCjrZLQPp/F5QpjKl6dGt54/r5T6BwbrdDXuIQkW/EoLPBDRri1dVv/3mY2THLGdcPW
 so/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0GjIOa94
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve
 python-magic-wormhole test reliability
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

SGVsbG8gSnVsaWVuLAoKTGUgMjEvMDUvMjAyNCDDoCAyMTo0NCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgcHl0aG9uLW1hZ2ljLXdvcm1ob2xlIHJ1bnRpbWUgdGVzdCBjYW4gcmFu
ZG9tbHkgZmFpbCBvbiBzbG93Cj4gcnVubmVycywgc2VlIFsxXS4KPiAKPiBUaGUgaXNzdWUgaXMg
dGhhdCB0aGUgc2VuZGluZyBjb21tYW5kIGlzIHN0YXJ0ZWQgZmlyc3QgaW4gYmFja2dyb3VuZAo+
IF93aXRob3V0XyByZWRpcmVjdGluZyBpdHMgb3V0cHV0IHRvIC9kZXYvbnVsbC4gVGhlIHJlY2Vp
dmluZyBjb21tYW5kCj4gaXMgc3RhcnRlZCBhZnRlciwgZXhwZWN0aW5nIHRoZSBtZXNzYWdlIHRv
IGJlIHByaW50ZWQgb24gdGhlIGZpcnN0Cj4gc3RhbmRhcmQgb3V0cHV0IGxpbmUuIE9uIHNsb3dl
ciBzeXN0ZW1zLCB0aGUgc2VuZGluZyBjb21tYW5kIHN0aWxsCj4gcHJpbnQgbWVzc2FnZXMgd2hp
bGUgdGhlIHRlc3QgY29udHJvbGxlciBleHBlY3Qgb3V0cHV0IGZyb20gdGhlCj4gcmVjZWl2aW5n
IGNvbW1hbmQuIFRoZSBleHBlY3RlZCBzdHJpbmcgZmluYWxseSBhcHBlYXIsIGJ1dCBub3Qgb24g
dGhlCj4gZmlyc3QgbGluZS4gVGhpcyBtYWtlcyB0aGUgdGVzdCBmYWlsLgo+IAo+IFRoaXMgY29t
bWl0IGZpeGVzIHRoZSBpc3N1ZSBieSByZWRpcmVjdGluZyBhbGwgb3V0cHV0cyAoc3Rkb3V0LCBz
dGRlcnIpCj4gb2YgdGhlIHNlbmRpbmcgY29tbWFuZCB0byAvZGV2L251bGwuIFRvIGhlbHAgZXZl
biBtb3JlLCB0aGUgc2xlZXAgdGltZQo+IGlzIG1vdmVkIGZyb20gdGhlIGVtdWxhdG9yIHRvIHRo
ZSB0ZXN0IGNvbnRyb2xsZXIuIFRoZSBzbGVlcCB0aW1lIGlzCj4gYWxzbyBtdWx0aXBsaWVkIGJ5
IHRoZSB0aW1lb3V0X211bHRpcGxpZXIuCj4gCj4gRml4ZXM6IFsxXQo+IAo+IFsxXSBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzY4ODg2OTE1MDgKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiAgLi4uL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fbWFnaWNfd29ybWhvbGUucHkgICAgICAgIHwgMTAgKysr
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9tYWdpY193b3JtaG9sZS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX21hZ2ljX3dvcm1ob2xlLnB5Cj4gaW5kZXggNWEwZjAyNzdiMDUuLjE4MGNmZjJl
NGE0IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX21hZ2ljX3dvcm1ob2xlLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fbWFnaWNfd29ybWhvbGUucHkKPiBAQCAtMSw0ICsxLDUgQEAKPiAgaW1w
b3J0IG9zCj4gK2ltcG9ydCB0aW1lCj4gIAo+ICBmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRo
b24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQo+ICAKPiBAQCAtNDYsOSArNDcsMTIgQEAg
Y2xhc3MgVGVzdFB5dGhvblB5M01hZ2ljV29ybWhvbGUoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToK
PiAgICAgICAgICB3b3JtaG9sZV9jbWQgPSAid29ybWhvbGUgLS1yZWxheS11cmw9e30gLS10cmFu
c2l0LWhlbHBlcj17fSIuZm9ybWF0KAo+ICAgICAgICAgICAgICByZWxheV91cmwsIHRyYW5zaXRf
aGVscGVyKQo+ICAKPiAtICAgICAgICBjbWQgPSB3b3JtaG9sZV9jbWQgKyAiIHNlbmQgLS1jb2Rl
PXt9IC0tdGV4dD1cInt9XCIgJiAiLmZvcm1hdChjb2RlLCB0ZXh0KQo+IC0gICAgICAgIGNtZCAr
PSAic2xlZXAgMjUiCj4gLSAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQsIHRpbWVvdXQ9MzAp
Cj4gKyAgICAgICAgY21kID0gd29ybWhvbGVfY21kCj4gKyAgICAgICAgY21kICs9IGYiIHNlbmQg
LS1jb2RlPXtjb2RlfSAtLXRleHQ9XCJ7dGV4dH1cIiIKPiArICAgICAgICBjbWQgKz0gIiAmPiAv
ZGV2L251bGwgJiIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiArCj4gKyAgICAg
ICAgdGltZS5zbGVlcCgzMCAqIHNlbGYudGltZW91dF9tdWx0aXBsaWVyKQo+ICAKPiAgICAgICAg
ICB3b3JtaG9sZV9lbnYgPSAiX01BR0lDX1dPUk1IT0xFX1RFU1RfS0VZX1RJTUVSPTEwMCAiCj4g
ICAgICAgICAgd29ybWhvbGVfZW52ICs9ICJfTUFHSUNfV09STUhPTEVfVEVTVF9WRVJJRllfVElN
RVI9MTAwICIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
