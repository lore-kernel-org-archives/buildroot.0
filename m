Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7C1C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9154F83DCD;
	Fri,  4 Jul 2025 06:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjkCGDJfLHca; Fri,  4 Jul 2025 06:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE3CA83E25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3CA83E25;
	Fri,  4 Jul 2025 06:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 100F11EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5FB583E29
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi7BVPFrVsle for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DACDA83DC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DACDA83DC3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DACDA83DC3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d54214adso3581855e9.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611636; x=1752216436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfVnJQvDF9ArwHP9SSu6VIFRsTPeqDZ3Jqayyn+gDtM=;
 b=WVIILl4QPHmyyfe09bH3PEqZMkskfJAGKQvzXi7poqQS5TWpJDUKGS6crT2wxXFjWR
 OBxUt38PsLO3wXCZXmJaYVpJsecdD08Ii27Cd2X493aZMTtJgs7kNZX5ZZ/URRCOT1qA
 PRednmo0snJCbsceChokcDvKjD9V+vYPsRO/XacmBYVaSka9ggytsh3Xq6p8r4Pxe9j3
 XVuwIWxzuLbsQsL3cdV/sfnIuDC0xE4gzjJXiuolZt2mq9Kx5mO8L9jQXQmUOUVjXY4q
 QlK2Ybj49tj6vPE9T4LuDckltc1Txa2rkRmqhYziUZHx/tWSw+MDAtXbOOADl48bs4rs
 2nYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPUE8oJld3EWEeFTXhbQsPB4I8WJonY4BiDu6pBQl6mgAFcxqEr0WogNs8YEoBQjLF7FyuBCJTcPk=@buildroot.org
X-Gm-Message-State: AOJu0YxPw51YiKIniPhvjelBEJ12Tq/liZHAHhIfq2YLxUVg3LfetSRW
 5C96aI17XlzUaMeF7c67De73AYP14PUyunNUOzMVEmzB2ELztrkVRb4gpLsT6siIx9E=
X-Gm-Gg: ASbGncv28CgVDwihR1cr4AnXF/pqZdFT5yp9nXVh+XknzwoHR4AsAo1PzAM9w5cK5TU
 866VcnJFOhmikcNyLFfocDbZzetH6r20U7zngUbcIAgQj7hFquwSlEq11Rmx5MzyR0gPaXeMw89
 t9I/quw07EHh1H1uhoKrswXDXam+De/GmD5Dw4eh+6VfZGLtA8qe8bfotUoYhbgiR/5AWRnPmcy
 LAX4qSNgayP0Y2bdhLIHEA+S2d7fz5PEI7VAjpS/23UnQ9sxF8D0P77mmLDB3u9q20HLi1DTw04
 oPOAO1or3zaMgH3BCufOu3MKuZttv369NJ7PIN9uPXUcudbfcsWqE4EIotJnwkwIoXam5BfkFvP
 EwailYKYGcFLYyPiV2rjB
X-Google-Smtp-Source: AGHT+IG5qZZFSlXIFMVBTv/OMtNSLhQHf8l6l2OhPThicEpoAwfKVwdJ/HjSXSR2xKwXk11WCWq6qQ==
X-Received: by 2002:a05:600c:4f4d:b0:442:f956:53f9 with SMTP id
 5b1f17b1804b1-454b3162015mr11851715e9.18.1751611635887; 
 Thu, 03 Jul 2025 23:47:15 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030c2e8sm1640355f8f.3.2025.07.03.23.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:15 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:09 +0200
Message-ID: <20250704064714.4064679-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627121948.1933049-1-raphael.melotte@mind.be>
References: <20250627121948.1933049-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611636; x=1752216436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfVnJQvDF9ArwHP9SSu6VIFRsTPeqDZ3Jqayyn+gDtM=;
 b=M3Ocf8ANnKrc7DMehkkDU6PtR6qKwy7MfGRsdLu+fgalOsoKYRfJ3BZn7uxgrpjwlT
 xAQzXvEwOx3/ABooOxk8eP/ZPxxAD9f70snNMK12nE5AltvaLLcWWIRbx5dSo1fDG/O2
 3ieK87VlK3O3mG9r91I7BJEkeOGSCNcC3mNHGR41uNOqk2hhnxE/MPuYAyACVml0vDnX
 zZEOHiNTJ4T1AbosZ12dlENcIDafIKeRXic4yvQzSaGOVLMNTzGc/l59T7A+NPDnACKL
 GlCS8VF8+35baoGO+fknffRwyruX3gqthXi5AUdwpZ2gVthkI+J3icyRe1hpF2e5jIXh
 b6Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M3Ocf8AN
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 nginx-modsecurity
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

SW4gcmVwbHkgb2Y6Cj4gVGhpcyB0ZXN0IHZlcmlmaWVzIHRoYXQgd2UgY2FuIHJ1biBuZ2lueCB3
aXRoIHRoZSBtb2RzZWN1cml0eQo+IGRpcmVjdGl2ZXMuCj4gSXQgYWxzbyBjaGVja3MgYSB2ZXJ5
IHNpbXBsZSBydWxlIHRoYXQgYmxvY2tzIHJlcXVlc3RzIGNvbnRhaW5pbmcgdGhlCj4ga2V5d29y
ZCAiYmxvY2ttZSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnguIFRoYW5rcwoKPiAtLS0K
PiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysK
PiAgLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS5weSAgIHwgMzYgKysr
KysrKysrKysrKysrKysrKwo+ICAuLi4vb3ZlcmxheS9ldGMvbmdpbngvbW9kc2VjdXJpdHktcnVs
ZXMuY29uZiAgfCAgNyArKysrCj4gIC4uLi9vdmVybGF5L2V0Yy9uZ2lueC9uZ2lueC5jb25mICAg
ICAgICAgICAgICB8IDE1ICsrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9uZ2lueF9tb2RzZWN1cml0eS5weQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9u
Z2lueC9tb2RzZWN1cml0eS1ydWxlcy5jb25mCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5L292ZXJsYXkvZXRj
L25naW54L25naW54LmNvbmYKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKPiBpbmRleCBkMTI3MzY0YTU4Li41NzMxYjRiYmUwIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BF
UlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTI4NTAsNiArMjg1MCw4IEBAIEY6CXN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMucHkKPiAgRjoJc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdl
ci5weQo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Vy
bGxpYjMucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
am1lc3BhdGgucHkKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lu
eF9tb2RzZWN1cml0eQo+ICtGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25n
aW54X21vZHNlY3VyaXR5LnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX3B5bXVwZGYucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fcnNhLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX3MzdHJhbnNmZXIucHkKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkucHkKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjFiMzRjMDhlMjAKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS5w
eQo+IEBAIC0wLDAgKzEsMzYgQEAKPiAraW1wb3J0IG9zCj4gKwo+ICtpbXBvcnQgaW5mcmEuYmFz
ZXRlc3QKPiArCj4gKwo+ICtjbGFzcyBUZXN0TmdpbnhNb2RzZWN1cml0eShpbmZyYS5iYXNldGVz
dC5CUlRlc3QpOgo+ICsgICAgb3ZlcmxheSA9IGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdl
L3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkvb3ZlcmxheSIpCj4gKyAgICBjb25maWcgPSBpbmZyYS5i
YXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAo+ICsgICAgICAgIGYiIiIKPiArICAg
ICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiArICAgICAgICBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQo+ICsgICAgICAgIEJSMl9VU0VfTU1VPXkKPiArICAgICAgICBCUjJf
VEFSR0VUX1JPT1RGU19DUElPPXkKPiArICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPX0da
SVA9eQo+ICsgICAgICAgIEJSMl9ST09URlNfT1ZFUkxBWT0ie292ZXJsYXl9Igo+ICsgICAgICAg
IEJSMl9QQUNLQUdFX05HSU5YPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9OR0lOWF9IVFRQPXkK
PiArICAgICAgICBCUjJfUEFDS0FHRV9OR0lOWF9NT0RTRUNVUklUWT15Cj4gKyAgICAgICAgIiIi
Cj4gKwo+ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAgICAgIGNwaW9fZmlsZSA9IG9z
LnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKPiArICAg
ICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjUiLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBvcHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmlsZV0pCj4gKyAgICAgICAgc2VsZi5lbXVsYXRv
ci5sb2dpbigpCj4gKwo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm5naW54IC1WIikKPiAr
ICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJ3Z2V0IGh0dHA6Ly9sb2NhbGhvc3QvaW5kZXguaHRt
bCIpCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiZ3JlcCAtRiAnV2VsY29tZSB0byBuZ2lu
eCEnIGluZGV4Lmh0bWwiKQo+ICsgICAgICAgIGNtZCA9ICJ3Z2V0IC1xIC1PIC9kZXYvbnVsbCAt
LXNlcnZlci1yZXNwb25zZSAyPiYxICIgXAo+ICsgICAgICAgICAgICAiaHR0cDovL2xvY2FsaG9z
dC9ibG9ja21lLyAyPiYxIHwgYXdrICcvXiAgSFRUUC97cHJpbnQgJDJ9JyIKPiArICAgICAgICBv
dXQsIHJldCA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKPiArICAgICAgICBzZWxmLmFzc2VydEVx
dWFsKHJldCwgMCkKPiArICAgICAgICAjIENoZWNrIGZvciBIVFRQIDQwMyBVbmF1dGhvcml6ZWQ6
Cj4gKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChvdXRbMF0sICI0MDMiKQo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5L292
ZXJsYXkvZXRjL25naW54L21vZHNlY3VyaXR5LXJ1bGVzLmNvbmYgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5L292ZXJsYXkvZXRjL25naW54L21v
ZHNlY3VyaXR5LXJ1bGVzLmNvbmYKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjk0YTEzMmE5YzcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9t
b2RzZWN1cml0eS1ydWxlcy5jb25mCj4gQEAgLTAsMCArMSw3IEBACj4gK1NlY1J1bGVFbmdpbmUg
T24KPiArU2VjUnVsZSBSRVFVRVNUX1VSSSAiQGNvbnRhaW5zIGJsb2NrbWUiIFwKPiArICAgICJp
ZDoxMDAwMDEsIFwKPiArICAgIHBoYXNlOjIsIFwKPiArICAgIGRlbnksIFwKPiArICAgIHN0YXR1
czo0MDMsIFwKPiArICAgIG1zZzonQmxvY2tlZCByZXF1ZXN0IHdpdGggZm9yYmlkZGVuIGtleXdv
cmQgaW4gVVJJLiciCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkvb3ZlcmxheS9ldGMvbmdpbngvbmdpbnguY29uZiBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkvb3Zlcmxh
eS9ldGMvbmdpbngvbmdpbnguY29uZgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uM2QxYjk5MDU1Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5L292ZXJsYXkvZXRjL25naW54
L25naW54LmNvbmYKPiBAQCAtMCwwICsxLDE1IEBACj4gK2V2ZW50cyB7Cj4gKyAgICB3b3JrZXJf
Y29ubmVjdGlvbnMgMTAyNDsKPiArfQo+ICsKPiAraHR0cCB7Cj4gKyAgICBzZXJ2ZXIgewo+ICsg
ICAgICAgIG1vZHNlY3VyaXR5IG9uOwo+ICsgICAgICAgIGxpc3RlbiA4MDsKPiArICAgICAgICBs
b2NhdGlvbiAvIHsKPiArICAgICAgICAgICAgcm9vdCAgIGh0bWw7Cj4gKyAgICAgICAgICAgIGlu
ZGV4ICBpbmRleC5odG1sIGluZGV4Lmh0bTsKPiArICAgICAgICAgICAgbW9kc2VjdXJpdHlfcnVs
ZXNfZmlsZSAvZXRjL25naW54L21vZHNlY3VyaXR5LXJ1bGVzLmNvbmY7Cj4gKyAgICAgICAgfQo+
ICsgICAgfQo+ICt9Cj4gLS0gCj4gMi40OS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
