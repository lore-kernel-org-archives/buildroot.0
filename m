Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F133C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C1A80E4A;
	Thu,  2 Nov 2023 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C1A80E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33ppM6j2zG7b; Thu,  2 Nov 2023 18:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B010C8089B;
	Thu,  2 Nov 2023 18:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B010C8089B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6441BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7508243549
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7508243549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPt-Sjon3NjR for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:54:19 +0000 (UTC)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1CCC43541
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CCC43541
Received: by mail-pj1-x1043.google.com with SMTP id
 98e67ed59e1d1-28028f92709so1049623a91.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951258; x=1699556058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVjVU2ozWm2AglnAUm3u97rGkhHa3b5dn35CgWzZtGc=;
 b=rHR3G04Qcec7Eiaum6J8riH9ksvwp6ga3Sl0hZAq/DK7FrO5k3cgxGz+jkdhuCr8ln
 OO1KJQXR43lVUuCVQ77VeAVzJnS7lMLftGwMEpVatlXzUBYh5a7pwSWdHdDy/L+9wCbK
 n+tv5jGaMBfCWmn51BjQPGyRo8tZFQtSt490x9KHD2bycM4ckumMh7gKvtzeNl4anctV
 jV3iDwPpzw6hN+A94UNPYgqQgABp79jy/HYfkfZj314Fg8jb+lhTGh9suIUJOcyCqGCN
 nrDd4VGxky4qAWJOq7el1fOtnqiditRGFUjGXEiDxhtF2PmcZANVbZYFgUxUBCjR34qE
 SAgw==
X-Gm-Message-State: AOJu0YxrmKxDUd4tbRA7BxcKy38rFsH0BwzxIOL6iBw3xF3NfOfev0A9
 R8dIGe8xkEMcZ5O1isVIY7HjyOn38kTQ36emIAkMXiihpoY=
X-Google-Smtp-Source: AGHT+IFic61ReeKCFw8Qukp4NZVOM/9Cpur4ag/T0+7eGYG+QqMeYCs1i9fbaCv9HezeLAPI/FEpgQ==
X-Received: by 2002:a17:90b:a01:b0:277:68c3:64b9 with SMTP id
 gg1-20020a17090b0a0100b0027768c364b9mr447612pjb.5.1698951258203; 
 Thu, 02 Nov 2023 11:54:18 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 ge17-20020a17090b0e1100b0027cf8869ee7sm210962pjb.0.2023.11.02.11.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:54:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:54:09 -0600
Message-ID: <20231102185411.51382-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698951258; x=1699556058;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVjVU2ozWm2AglnAUm3u97rGkhHa3b5dn35CgWzZtGc=;
 b=T5gNM6/1cRkE5kNhCZYZoiQfFUlXSnTfwAFMvVXZCmFpU9qjkI9zSL2pqB2v9ntkb1
 bs7VPQaxhBU5myaMmyynPOHBVDK20VKeWd0Z/jSEoIDAJfumjX5BXIHc5Q/nmsphOtvH
 OgzHHiWoigpXyDZFnLeXvLaEt2IUYJr6RiujI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=T5gNM6/1
Subject: [Buildroot] [PATCH 3/5] package/flutter-engine: use impeller
 rendering engine
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogaHR0cHM6Ly9kb2NzLmZsdXR0ZXIuZGV2L3BlcmYvaW1wZWxsZXIKSW1wZWxsZXIgcHJv
dmlkZXMgYSBuZXcgcmVuZGVyaW5nIHJ1bnRpbWUgZm9yIEZsdXR0ZXIuIFRoZSBGbHV0dGVyIHRl
YW3igJlzCmJlbGlldmVzIHRoaXMgc29sdmVzIEZsdXR0ZXLigJlzIGVhcmx5LW9uc2V0IGphbmsg
aXNzdWUuIEltcGVsbGVyIHByZWNvbXBpbGVzIGEKc21hbGxlciwgc2ltcGxlciBzZXQgb2Ygc2hh
ZGVycyBhdCBFbmdpbmUgYnVpbGQgdGltZSBzbyB0aGV5IGRvbuKAmXQgY29tcGlsZSBhdApydW50
aW1lLgoKSW1wZWxsZXIgaGFzIHRoZSBmb2xsb3dpbmcgb2JqZWN0aXZlczoKCiAgLSBQcmVkaWN0
YWJsZSBwZXJmb3JtYW5jZTogSW1wZWxsZXIgY29tcGlsZXMgYWxsIHNoYWRlcnMgYW5kIHJlZmxl
Y3Rpb24KICAgIG9mZmxpbmUgYXQgYnVpbGQgdGltZS4gSXQgYnVpbGRzIGFsbCBwaXBlbGluZSBz
dGF0ZSBvYmplY3RzIHVwZnJvbnQuCiAgICBUaGUgZW5naW5lIGNvbnRyb2xzIGNhY2hpbmcgYW5k
IGNhY2hlcyBleHBsaWNpdGx5LgoKICAtIEluc3RydW1lbnRhYmxlOiBJbXBlbGxlciB0YWdzIGFu
ZCBsYWJlbHMgYWxsIGdyYXBoaWNzIHJlc291cmNlcyBsaWtlCiAgICB0ZXh0dXJlcywgYW5kIGJ1
ZmZlcnMuIEl0IGNhbiBjYXB0dXJlIGFuZCBwZXJzaXN0IGFuaW1hdGlvbnMgdG8gZGlzawogICAg
d2l0aG91dCBhZmZlY3RpbmcgcGVyLWZyYW1lIHJlbmRlcmluZyBwZXJmb3JtYW5jZS4KCiAgLSBQ
b3J0YWJsZTogRmx1dHRlciBkb2VzbuKAmXQgdGllIEltcGVsbGVyIHRvIGEgc3BlY2lmaWMgY2xp
ZW50IHJlbmRlcmluZyBBUEkuCiAgICBZb3UgY2FuIGF1dGhvciBzaGFkZXJzIG9uY2UgYW5kIGNv
bnZlcnQgdGhlbSB0byBiYWNrZW5kLXNwZWNpZmljIGZvcm1hdHMgYXMKICAgIG5lY2Vzc2FyeS4K
CiAgLSBMZXZlcmFnZXMgbW9kZXJuIGdyYXBoaWNzIEFQSXM6IEltcGVsbGVyIHVzZXMsIGJ1dCBk
b2VzbuKAmXQgZGVwZW5kIG9uLAogICAgZmVhdHVyZXMgYXZhaWxhYmxlIGluIG1vZGVybiBBUElz
IGxpa2UgTWV0YWwgYW5kIFZ1bGthbi4KCiAgLSBMZXZlcmFnZXMgY29uY3VycmVuY3k6IEltcGVs
bGVyIGNhbiBkaXN0cmlidXRlIHNpbmdsZS1mcmFtZSB3b3JrbG9hZHMKICAgIGFjcm9zcyBtdWx0
aXBsZSB0aHJlYWRzIGlmIG5lY2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8
YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIHBhY2thZ2UvZmx1dHRlci1l
bmdpbmUvZmx1dHRlci1lbmdpbmUubWsgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1dHRlci1lbmdp
bmUvZmx1dHRlci1lbmdpbmUubWsgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0ZXItZW5n
aW5lLm1rCmluZGV4IDQ3MDFjMWY1MzYuLjMyYWFhMWNjY2YgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
Zmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsKKysrIGIvcGFja2FnZS9mbHV0dGVyLWVu
Z2luZS9mbHV0dGVyLWVuZ2luZS5tawpAQCAtMTI0LDYgKzEyNCw3IEBAIGVuZGlmCiAKIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMpLHkpCiBGTFVUVEVSX0VOR0lORV9ERVBFTkRFTkNJ
RVMgKz0gbGliZ2xlcworRkxVVFRFUl9FTkdJTkVfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWltcGVs
bGVyLW9wZW5nbGVzCiBlbmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkdMRlcpLHkpCkBA
IC0xNDIsNyArMTQzLDcgQEAgZW5kaWYKIAogIyBUaGVyZSBpcyBubyAtLWRpc2FibGUtdnVsa2Fu
IG9wdGlvbgogaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUikseSkKLUZM
VVRURVJfRU5HSU5FX0NPTkZfT1BUUyArPSAtLWVuYWJsZS12dWxrYW4KK0ZMVVRURVJfRU5HSU5F
X0NPTkZfT1BUUyArPSAtLWVuYWJsZS12dWxrYW4gLS1lbmFibGUtaW1wZWxsZXItdnVsa2FuCiBl
bmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX1hPUkc3KSQoQlIyX1BBQ0tBR0VfTElCWENCKSx5
eSkKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
