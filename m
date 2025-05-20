Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B81C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E3161017;
	Tue, 20 May 2025 11:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88BnCmk7KoJd; Tue, 20 May 2025 11:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774F960F71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 774F960F71;
	Tue, 20 May 2025 11:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2E1193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C415E60F71
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf4NNiXo5LhE for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:41:55 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 081ED605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 081ED605D5
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 081ED605D5
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:41:54 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4769aef457bso67027761cf.2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747741313; x=1748346113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YWJrR823ETRhiBbj7Mn8GNqAdRrmN6yW47f3i09pKCQ=;
 b=fqGt9lLO2NADvZA5JqjsF+gLrnxu5bDrJELhylpmPZk0j5UtRsSqD9bv5zByEKTbP9
 0GTPQaLGBTk6fXHQMcrLY7vwX7KyjFi+xSc7UPzldnRYmFpIRHUqMkLsZ1aSIUMxus7V
 FVBhPM+3GXc+GASNf5KDkkoJCtRT6UsQhqkVMmlUGvlvspPdvbrnPjOabuhFa4eGXotR
 lhPfuNb4kDmYzndWrl6mWlfcYWK9j1SYYRelugxACOO6QFjohM64rLIsPnS3timGXeBi
 GzOtGIv1aZt+e1zJoodUYXzsQwQ9BnPIaz4TeZhIEz6uuQzqkcROja0ZbE4xF109C57b
 TJZQ==
X-Gm-Message-State: AOJu0YzE6fG0azUNEqUerIyNYiKw7p9Vx6raMLBJH2Hte6SQlhAyuEFU
 ZoMFJoM0xMwjFpXfKUzlTvuW+drEF9TOb31J96RhNuk67ZMi+EN317Q9CHTGnA1TEMwN2CH28Eh
 +25OG
X-Gm-Gg: ASbGnculE8kOpYwLaXl722vejQGG0Ed18AhfH+tTG3beWTIMqnKzhSZ+KfBLQo81Qqh
 FlGRZQ50p26YVoVyGhSI4XuaMdjjIbItqWnfYToRFIjdW+Mfcc9FPdRyEn3/Eg1f16XRD971K78
 JPf4Uo1xy4qB2LC2KowFm5Fqsdd4TI7oOX/sPpg84LOhnsdqncsiUeiOJ6ChcXqM/sEN0kXdBjM
 7T3S8zT6lgXm5U3mtRJZ4Zv5Iw+SX1QMoM/1D0ynVJTCNVjZlxpLCIt6yhHwDKzJSRDMdT1ANcM
 Samx5O/7teKk8Ti4C3QbH0/rhMWHGSmZbUVO6Xw9bCvJriSIJk+BUL/vdjCSSfp1i9gUV5+KErJ
 Y
X-Google-Smtp-Source: AGHT+IF8+sTHiPcYSRF35a+I3du02vU0czDSGz71ZMUe7GjDRJnrczo0Tly9rEZ+03whgLAWe5q8oA==
X-Received: by 2002:a05:622a:4005:b0:476:8f75:b885 with SMTP id
 d75a77b69052e-494ae48f92emr298527221cf.44.1747741313200; 
 Tue, 20 May 2025 04:41:53 -0700 (PDT)
Received: from localhost.localdomain ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae3f9450sm69876701cf.28.2025.05.20.04.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:41:52 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 08:41:39 -0300
Message-ID: <20250520114139.9114-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1747741313; x=1748346113;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YWJrR823ETRhiBbj7Mn8GNqAdRrmN6yW47f3i09pKCQ=;
 b=hmTpZubSZnL8La/Mw1a/dttL/KXPefKT4bQ34CzWT6Oz3wRcBg4TdCBqOwXOWsneCL
 qCvz2rc/2LXPMevsThYNupAY1zmS5EWu5RCvucig6LZ3Ws1O64v8VoVNfFZ2azA4wpHh
 Gg28obiLSvl9ERSN3MIHPzH1vD+EOa1gSxenN74XLY+II4vSRael2ZgQ0UdH2LFjEEoh
 PLuBxP3g5dZx8Dqlxvks6ksivOnq7BHNEFt+UE0ZrSYCMqrwX3Y2NGXK7FI3XvRzO6fK
 Y9E58pWPZCIl7u3fZEk8X68y2vsWn4TwCNS8/Ahl7SbU2O3eehHAOtY2QWDnmvsK0l6S
 UafA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hmTpZubS
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.41
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2csIHNlZToKaHR0cHM6Ly9kb2NzLnNxbGFsY2hlbXkub3JnL2VuLzIwL2No
YW5nZWxvZy9jaGFuZ2Vsb2dfMjAuaHRtbCNjaGFuZ2UtMi4wLjQxCgpTaWduZWQtb2ZmLWJ5OiBG
bMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KLS0tCiBwYWNr
YWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2ggfCA0ICsrLS0KIHBh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoIGIv
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCmluZGV4IGM2
NmVlNDRlOTEuLjkzZjZiYjM1YWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hl
bXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15
L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZy
b20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NxbGFsY2hlbXkvanNvbgotbWQ1ICA0YWVjYjhkM2Ix
ZDA3N2Q2MDk5YzFmOGVkMTgzNjdhNCAgc3FsYWxjaGVteS0yLjAuMzkudGFyLmd6Ci1zaGEyNTYg
IDVkMmQxZmU1NDhkZWYzMjY3YjRjNzBhODU2OGYxMDhkMWZlZDdjYmJlY2NiOWNjMTY2ZTA1YWYy
YWJjMjVjMjIgIHNxbGFsY2hlbXktMi4wLjM5LnRhci5negorbWQ1ICA3NmFkZThiMTNmNzdiOWNl
YWZmNmM5MWY1NjE3YzY2OCAgc3FsYWxjaGVteS0yLjAuNDEudGFyLmd6CitzaGEyNTYgIGVkYmE3
MDExOGM0YmUzYzJiMWY5MDc1NGQzMDhkMGI3OWM2ZmUyYzBmZGM1MmQ4ZGRmNjAzOTE2ZjgzZjRk
YjkgIHNxbGFsY2hlbXktMi4wLjQxLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBj
aGVja3N1bXMKIHNoYTI1NiAgOTgyMTcyMGI1OGQ0YTU2NWI2MTMyMTAwN2E4YWQ0M2FiNjk5MWEz
OTU5ZTY2Y2Q1ZGI0ZGQ5ZWFlNjljN2RmYyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayBiL3BhY2thZ2UvcHl0aG9uLXNx
bGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5kZXggMjZkN2QzMDhiOS4uMTBhOWYxNmI2
NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVt
eS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1r
CkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1NR
TEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4zOQorUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIu
MC40MQogUFlUSE9OX1NRTEFMQ0hFTVlfU09VUkNFID0gc3FsYWxjaGVteS0kKFBZVEhPTl9TUUxB
TENIRU1ZX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1NRTEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8wMC84ZS9lNzdmY2FhNjdmOGI5ZjUwNGI0
NzY0NTcwMTkxZTI5MTUyNDU3NWRkYmZlNzhhOTBmYzY1NmQ2NzFmZGMKK1BZVEhPTl9TUUxBTENI
RU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjMvNjYv
NDViMTY1YzU5NWVjODlhYTdkY2MyYzFjZDIyMmFiMjY5YmM3NTNmMWZjN2ExZTY4Zjg0ODFiZDk1
N2JmCiBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX1NR
TEFMQ0hFTVlfTElDRU5TRSA9IE1JVAogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
