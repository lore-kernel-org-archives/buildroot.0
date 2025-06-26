Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC8C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D156C417DC;
	Thu, 26 Jun 2025 11:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EldbQMDynJ1c; Thu, 26 Jun 2025 11:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4450D4097F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4450D4097F;
	Thu, 26 Jun 2025 11:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED9510A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FDDA8426B
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTlqUSVarP3y for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 036D383ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 036D383ED7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 036D383ED7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:19:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so557660f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 04:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750936786; x=1751541586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZoW7o8a3UOpDgx7wlieZuqrQ4CzCvLcDUr0FfeYRyjU=;
 b=sG3BtXK9ZbYdK0TOPj1PjS+G89B1NIbi655j53l1+adf2n2bII9fFll1j3OA9FB3xa
 cuWCB2EpHyXj2RpiJa1v2K3PFkoClqf4oiZ0lvGf5Ri1HqxkzgLkIq8M8/2aXb4EK6Bv
 v+uJFgkJULvOUCpCRLYTXz1bXrWj1nPJPxrN/kbLak9Ai5MxUTVDQidZVQVpnOL5iug1
 nz9Sebk/xMtcS+k27Yaq4gtg286MjPz708B6zyEV8sCa3hZW3EuVSZfzzhL8q8BnI1+8
 +FRMMVJDopGD8qzTmjJvgEGM/p0e2iZVvD6sCsO11W4tvA1miqCWBxbrm5z5GH6vvnYv
 oe3A==
X-Gm-Message-State: AOJu0Yw3VeAzkP+c8EUGIMcYMljRfWxu68L3Q1WRCdH1ddqJgY+wqBZD
 1DKv/0f0EvdPgqVsk4WFyej0BoGV9wCwxpZlio4vXdH5Xw1fa/atn+xYUSTHssKRGpALYIx3RHB
 Iqjsh59M=
X-Gm-Gg: ASbGncu41JbX3g0fIUzwjsAHg5x2/4Au1+MQw6neB4xfIW/pY/WFdjNfsNVPmFXyYl/
 xBJctUfcsHvAtiDnaSLEFrbFTZwhCbpIcHkuFe7Kr456IbX6okUsuLFyjhRWeHJ22Oc/BhB4jeu
 b0aAzpWmyK6KUX6Wi+XIgQqglCDo7SWcD3VHUln4OMOuHFoD7nY+wGax1LMPiYC+NNlLdCTTgSS
 TWCtggehr/A0HSaoOpwD0uNe3hbcRexm7/zbmtFRfTAUWgSQEIWRG8jeyMKXjV0qz6xGv0+5XNL
 jPbO3GoHEqtQitkI7hcS+NyA3ZLUcqomdmlxRtq2eQ8DTk3VTdr2BUYxzs8UD5Et0VrLaZw6zDR
 XDKico2xEJzUeeidI
X-Google-Smtp-Source: AGHT+IEWa8Tb+JS9wMfWxrtHwkgG//LOq8l2egx6MFT3KiYgI6r1EOUL2mz29NJ0wj/SP/5kcy0PuA==
X-Received: by 2002:a05:6000:2482:b0:3a4:d994:be7d with SMTP id
 ffacd0b85a97d-3a6ed639e62mr5881975f8f.23.1750936785659; 
 Thu, 26 Jun 2025 04:19:45 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b6c21sm46936145e9.29.2025.06.26.04.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 04:19:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 26 Jun 2025 13:19:17 +0200
Message-ID: <20250626111922.1851579-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750936786; x=1751541586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoW7o8a3UOpDgx7wlieZuqrQ4CzCvLcDUr0FfeYRyjU=;
 b=Xv1rpHIf7gYGaABAhrJEt4HoYpu0eT0eX+92hixE/liNATcO2GgiwGQylG1N6FxCLa
 cnpuGZ8YUkY7Ca5opln3CDxHlm/f5DRkjuuav8r97OdtaEnML+2Vl3zJMSawxhj+DK5X
 crPulv43LHx1B0BDDWZDLfvPjWYol6EBWLpv+o9kefnQwXXIuVQOVslD1Ns0Qlf4c8Ng
 w6l1yLkQuo1IJWulrmnkkMd4SkVnsips4A650rZNYzYTIa1KvXGzYzZ43+wTNjnWsD/4
 WsbFE/iHqMpR9lXjB+vgDv/L6JMxoOxeW7wceej/oP9kVp4/05ovS/wtnr9tG8kNnqxi
 clDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xv1rpHIf
Subject: [Buildroot] [PATCH 1/3] package/gumbo-parser: update upstream
 repository
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGV2ZWxvcG1lbnQgb24gR29vZ2xlJ3MgR2l0SHViIHJlcG9zaXRvcnkgaGFzIHN0b3BwZWQgYSBs
b25nIHRpbWUgYWdvLgpBIGZvcmsgZXhpc3RzIG9uIENvZGViZXJnLCBhbmQgbXVsdGlwbGUgZGlz
dHJpYnV0aW9ucyAoRmVkb3JhLCBBcmNoCkxpbnV4LCAuLi4pIGFyZSBhbHJlYWR5IHVzaW5nIGl0
IChzZWUgWzFdKS4KClVwZGF0ZSB0aGUgc291cmNlIFVSTCB0byB1c2UgdGhlIG5ldyB1cHN0cmVh
bSBsb2NhdGlvbi4KClRoZSBuZXcgdXBzdHJlYW0gaGFzIGEgZGlmZmVyZW50IGhhc2ggZm9yIHRo
ZSAwLjEwLjEgdGFyYmFsbCwgc28KdXBkYXRlIGl0IGFzIHdlbGwuCgpbMV06IGh0dHBzOi8vcmVw
b2xvZ3kub3JnL3Byb2plY3QvZ3VtYm8tcGFyc2VyL3ZlcnNpb25zCgpTaWduZWQtb2ZmLWJ5OiBS
YXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9n
dW1iby1wYXJzZXIvQ29uZmlnLmluICAgICAgICAgfCAyICstCiBwYWNrYWdlL2d1bWJvLXBhcnNl
ci9ndW1iby1wYXJzZXIuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBh
cnNlci5tayAgIHwgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL0NvbmZpZy5pbiBi
L3BhY2thZ2UvZ3VtYm8tcGFyc2VyL0NvbmZpZy5pbgppbmRleCAwNGJiMjI5NGJiLi43ZWJjNDM5
NDEzIDEwMDY0NAotLS0gYS9wYWNrYWdlL2d1bWJvLXBhcnNlci9Db25maWcuaW4KKysrIGIvcGFj
a2FnZS9ndW1iby1wYXJzZXIvQ29uZmlnLmluCkBAIC03LDQgKzcsNCBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfR1VNQk9fUEFSU0VSCiAJICBvdGhlciB0b29scyBhbmQgbGlicmFyaWVzIHN1Y2ggYXMg
bGludGVycywgdmFsaWRhdG9ycywKIAkgIHRlbXBsYXRpbmcgbGFuZ3VhZ2VzLCBhbmQgcmVmYWN0
b3JpbmcgYW5kIGFuYWx5c2lzIHRvb2xzLgogCi0JICBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xl
L2d1bWJvLXBhcnNlcgorCSAgaHR0cHM6Ly9jb2RlYmVyZy5vcmcvZ3VtYm8tcGFyc2VyL2d1bWJv
LXBhcnNlci8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5o
YXNoIGIvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKaW5kZXggYzRhZjMz
MDcyYy4uZWU0MWYxNjdhNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8t
cGFyc2VyLmhhc2gKKysrIGIvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gK
QEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDI4NDYzMDUzZDQ0
YTVkZmJjNGI3N2JjZjQ5YzhjZWUxMTkzMzhmZmE2MzZjYzE3ZmMzMzc4NDIxZDcxNGVmYWQgIGd1
bWJvLXBhcnNlci0wLjEwLjEudGFyLmd6CitzaGEyNTYgIGQ0ZmQxNThkOTk4YWI4MzAyZmEyM2Ji
MDExMTliNDM0YmJmYWY3MTM5YjU5ZjljNzQ1MzBhNzAzMTc2Y2IyMTMgIHYwLjEwLjEudGFyLmd6
CiAKICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKIHNoYTI1NiAgYzcxZDIzOWRmOTE3MjZmYzUx
OWM2ZWI3MmQzMThlYzY1ODIwNjI3MjMyYjJmNzk2MjE5ZTg3ZGNmMzVkMGFiNCAgQ09QWUlORwpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLm1rIGIvcGFja2Fn
ZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLm1rCmluZGV4IDhjOTMzMGFlNzAuLjc2ZmNjODc2
YzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5taworKysg
Yi9wYWNrYWdlL2d1bWJvLXBhcnNlci9ndW1iby1wYXJzZXIubWsKQEAgLTUsNyArNSw4IEBACiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiBHVU1CT19QQVJTRVJfVkVSU0lPTiA9IDAuMTAuMQot
R1VNQk9fUEFSU0VSX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGdvb2dsZSxndW1iby1wYXJzZXIsdiQo
R1VNQk9fUEFSU0VSX1ZFUlNJT04pKQorR1VNQk9fUEFSU0VSX1NJVEUgPSBodHRwczovL2NvZGVi
ZXJnLm9yZy9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyL2FyY2hpdmUKK0dVTUJPX1BBUlNFUl9T
T1VSQ0UgPSB2JChHVU1CT19QQVJTRVJfVkVSU0lPTikudGFyLmd6CiBHVU1CT19QQVJTRVJfTElD
RU5TRSA9IEFwYWNoZS0yLjAKIEdVTUJPX1BBUlNFUl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwog
R1VNQk9fUEFSU0VSX0lOU1RBTExfU1RBR0lORyA9IFlFUwotLSAKMi40OS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
