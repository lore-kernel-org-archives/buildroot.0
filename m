Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B21CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 12:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A082B40110;
	Wed,  3 Apr 2024 12:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpFXqGHI46de; Wed,  3 Apr 2024 12:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F32400B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F32400B5;
	Wed,  3 Apr 2024 12:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124DC1BF980
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 12:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CA0A4017B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 12:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9m44BZEoRa6s for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 12:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D78AA40159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78AA40159
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D78AA40159
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 12:18:20 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4e60a64abcso145387766b.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 05:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712146698; x=1712751498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q3iYuxLMM9SAjKMShHqTPQXSRDQ4lXCfV/H+0MUR6Us=;
 b=SGjfLvcWsIe87CRIJGWDhF3KgtrPMXKelRI+aa75tlxiQ0rf2AHjRxiTnm288LQ2/G
 TYlRQsnMcP4iMX2JR6qhBh+SUsVxtPTrN/UUNDIvsbuFzhnH+u/oNP0wyHBVgfXWJnVa
 vlxhfquOiQOBQJizphGNBTXL3ErHc5nrGsxkt0EPUQsbQWBXlXTs1ku0jhVjbOMkzKik
 J/rlw9mBekXtm1ufymmV6AOIF6yxUHliuUx6aGJYh05O0YpvRPU7CzkRidny2MWuw2LS
 eeKq1GiB7D39/s3PFbZoNS7r7zT5if6OJnMIYwhW0gEpl/nH3rGp9bH++QbVCbzf5ZNT
 Zs2w==
X-Gm-Message-State: AOJu0YwkjtTpZNnp2+1vsPNlgIa5xktDi31Xf+OKszXwUozeGpAdBX7z
 aY9Gl+UhrHGkB4ilqF69bUssikX3NaSz7XPkJm87LlqNNSC8aRnluWUlD1qn
X-Google-Smtp-Source: AGHT+IGTmqcjPt3Z6wnGl+5xBubJAAMdnA/d8AJ7x6AsYD2IA+iNKMywiag2bg0BIrhBXPCAS5GEwg==
X-Received: by 2002:a17:906:46d0:b0:a4f:b398:2f44 with SMTP id
 k16-20020a17090646d000b00a4fb3982f44mr1132413ejs.19.1712146698141; 
 Wed, 03 Apr 2024 05:18:18 -0700 (PDT)
Received: from fedora.. (cpe-188-129-45-234.dynamic.amis.hr. [188.129.45.234])
 by smtp.googlemail.com with ESMTPSA id
 t25-20020a170906269900b00a4c9b39b726sm7691853ejc.75.2024.04.03.05.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 05:18:17 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 14:18:07 +0200
Message-ID: <20240403121807.2087547-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712146698; x=1712751498; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3iYuxLMM9SAjKMShHqTPQXSRDQ4lXCfV/H+0MUR6Us=;
 b=Mc9SMSxS7jinEGnxF7NUC5XPduDeEjRnmJDV1EKa4LOuRaHr4yyU2Q8kwrknK0snFx
 0Nyy1oGaKZojz4puvhPd+tEX2UpcuYNtLfraBxwnuhYs2C8cr01k/GGPVTYDLwZJGswf
 veNSYM5BNTzxdaG92GcoGtb0mv0JWP/6ZSM6IzCyd2Xs0/g3jZzKomZXZQY3RZ26UYFb
 tPZRymYOY6Lz2+npa6l22w1uO3fUq2CKiPElxTBHbkvYW9H1sDYJ+W+LuAULCXFl5KcP
 wjB7YkfzI3ES+oouRoYobxDSyN3hWyb4PsHlwJ5Go4mQh4VIBdX9VReoKaaDb8umeDGX
 9maQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mc9SMSxS
Subject: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDMTQgbm93IHRyZWF0cyBpbXBsaWNpdCBpbnQgdHlwZXMgYXMgZXJyb3Igc28gd2hlbiBjaGVj
aygpIGZyb20KY2hlY2stbHhkaWFsb2cuc2ggaXMgY2FsbGVkIHRvIGNoZWNrIHdoZXRoZXIgd2Ug
Y2FuIGxpbmsgYWdhaW5zdCBuY3Vyc2VzCml0IHdpbGwgZmFpbCBzaWxlbnRseSBhbmQgdGhlIGhl
bHAgdGV4dCBpbmRpY2F0aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBpcwpwcmludGVkLgoKSG93ZXZl
ciwgdGhpcyBpcyBub3QgZHVlIHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJy
IHJlZGlyZWN0CnRvIC9kZXYvbnVsbCBpcyByZW1vdmVkIHdlIGNhbiBzZWUgdGhlIHJvb3QgY2F1
c2U6CjxzdGRpbj46MjoxOiBlcnJvcjogcmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZ
IFstV2ltcGxpY2l0LWludF0KClNvLCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3b3JrIHdp
dGggR0NDMTQgbGV0cyBqdXN0IHNwZWNpZnkgdGhlCnJldHVybiB0eXBlIG9mIG1haW4oKSBhcyBp
bnQuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJrb0BnbWFpbC5jb20+Ci0t
LQogc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoIGIvc3VwcG9ydC9rY29u
ZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCmluZGV4IDE2Y2Q5YTMxODYuLjI3ZDZjMzBh
NTcgMTAwNzU1Ci0tLSBhL3N1cHBvcnQva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5z
aAorKysgYi9zdXBwb3J0L2tjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKQEAgLTQ4
LDcgKzQ4LDcgQEAgdHJhcCAicm0gLWYgJHRtcCIgMCAxIDIgMyAxNQogY2hlY2soKSB7CiAgICAg
ICAgICRjYyAteCBjIC0gLW8gJHRtcCAyPi9kZXYvbnVsbCA8PCdFT0YnCiAjaW5jbHVkZSBDVVJT
RVNfTE9DCi1tYWluKCkge30KK2ludCBtYWluKCkge30KIEVPRgogCWlmIFsgJD8gIT0gMCBdOyB0
aGVuCiAJICAgIGVjaG8gIiAqKiogVW5hYmxlIHRvIGZpbmQgdGhlIG5jdXJzZXMgbGlicmFyaWVz
IG9yIHRoZSIgICAgICAgMT4mMgotLSAKMi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
