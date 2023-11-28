Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041C6C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 13:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9D774097A;
	Tue, 28 Nov 2023 13:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D774097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ib8R6UUWb8Gd; Tue, 28 Nov 2023 13:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACDF40971;
	Tue, 28 Nov 2023 13:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACDF40971
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 180D31BF94D
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2A2860B9F
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A2860B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nm1YUGqFBEc for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 13:43:36 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E71960FBB
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E71960FBB
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cfabcbda7bso26635705ad.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 05:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701179016; x=1701783816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mhTnIn1M4ybo6l2zGI6wclFTuNPGx9ieBmbCKjQKLBo=;
 b=eE5w4z9zhavmVG1COwAJgaZpSFGQljrXj4PldJ8QMxRLgaFjxx7cKETvP7dYn9URHz
 DK0JFSljavdDDEVZNHTg+vP4+Te2XUR+mAGHhDMouv1SDrEWwd0Pn9IdXmibIJSQxG8z
 JuVrDl1U/YgE+8v6l7XBObsuOsfwGMRQoKIg6KOcpnTOaEo3GvJ3f0YrZXjgCQWtQI17
 REqDXC4liWR6TIc7ASSE8hsqzT9hBiadRK+zILqFjWQdnwPFEjTgkFcVG4lk2UTlEEjV
 XFgnEmrMLaJDrh6sf1wb4WJ2WygbAA3BjVgcT3Wb1dlsbTEbDjdcK5Z1GO5Sx+yNh1r9
 Xywg==
X-Gm-Message-State: AOJu0YxL6L02QrL4oDLkqxi7TQ9nu3QrQ9YUoqI2FIqlp/uD4vrPy9Ml
 jtIunJY8sxvo8YhTER+9CwXRjSthg86XaPHwiIBA6g==
X-Google-Smtp-Source: AGHT+IHVBSL9clFnYAHuJ1GXok5wbhU5hYrcXgz9eaeB2ARh/fn6xpgpUAlNmZ4MAeyKRl/jDoC5Rw==
X-Received: by 2002:a17:902:ea05:b0:1cf:d52a:2247 with SMTP id
 s5-20020a170902ea0500b001cfd52a2247mr8195273plg.13.1701179015755; 
 Tue, 28 Nov 2023 05:43:35 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001cf5cb82358sm10277305plh.14.2023.11.28.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:43:35 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 10:43:00 -0300
Message-ID: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701179016; x=1701783816;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mhTnIn1M4ybo6l2zGI6wclFTuNPGx9ieBmbCKjQKLBo=;
 b=ZbaezGT8BCX5jgb6+UTtoeMrCl49JpcH95Ol53gsdUW1O87K9SX7TwCg5/p18UThzW
 K4VvSfm/IRLSaStH7MG/gHicuOmK5UzcGWAEaX85FfG6S19XlRdssnnHktA/Kv4V/iVO
 uqRlpcmHU5a9YA/yYEWKrTrQdcHpUxgdBaf89pMHN1LQseA3hvcd3e3Yrqn7axXPAfvG
 BDEXD1MlV4CXf0RqOtgLblSb1hLyaOk0vuPKbvpgR1y4lt6r+CflYqJ6vqP7psVS+Sos
 9QiMmCQxWuNB6oqI0UlvHR8SDHU61dYrSmiL5tc3S6SlrYQZ2YtscnqwwVJYhgMMzSXL
 5mDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZbaezGT8
Subject: [Buildroot] [PATCH 1/2] package/rsyslog: bump version to 8.2310.0
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3JzeXNsb2cvcnN5c2xvZy5tayBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDg0
ZmQyZDJlNWUuLmNmOWYyYzBlNzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9n
Lm1rCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUlNZU0xPR19WRVJTSU9OID0gOC4yMjA0LjEKK1JT
WVNMT0dfVkVSU0lPTiA9IDguMjMxMC4wCiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5j
b20vZmlsZXMvZG93bmxvYWQvcnN5c2xvZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQ
TC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNMT0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlO
Ry5MRVNTRVIgQ09QWUlORy5BU0wyMAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
