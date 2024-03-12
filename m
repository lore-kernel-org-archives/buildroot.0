Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C615C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063F860A56;
	Tue, 12 Mar 2024 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yY2c5juY_on7; Tue, 12 Mar 2024 19:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E76060B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E76060B98;
	Tue, 12 Mar 2024 19:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C25D31BF32D
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC4AB40654
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jw0mBwa3hr4f for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:35:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1ED340562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1ED340562
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1ED340562
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:35:47 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3663080b6a4so24436645ab.0
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710272146; x=1710876946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=We+Hy0PT7JOeHqbB4DGGMY0jDGpv2KSPw+4iooWFQKU=;
 b=UfgX2ibMgf4ODg/Px8RRgeOwT52A828rZQGlzDqWGlgOrTR8seUDefgGGZ/z96S9Qf
 UgNo+OFpTYwf6VO+Qs5T/q9siJJN2kKIYK4RsC72ILIWdCaA/Na/qTJ562ucS6besNbh
 FE7Cop2gwAQzOfsZ0hNdh8AF0xvejbfoOTLech0OpFOuwdxEG591rbPa5WJEinQLPs8z
 CQ7283SEUoHNIszpF2NlvOuqSiSW6SjJoSrL0+JnTkvDxDKspwmrEhyReEk6d614NWF7
 cZNwjloAFgm7HXMeADHwvBVv93NJQEzS0wSgvarOYN/a7kkbtSjLovJj8yufWl8a/Els
 6qsw==
X-Gm-Message-State: AOJu0Yw0fHFdU8Y3xMvVYWK+v/UHXJgx3Ut+wrKZ6WKT++o7vdwFy7ky
 sQP90R6PckTxCACg5MCXnhckq9DNsdH2ofpmuPS74pyzhXPycFe9XhgFkaqepf8L49+vOwHypXj
 lhA==
X-Google-Smtp-Source: AGHT+IFdWWrtyFrqPH9FkleuAUFIE2sVZzRDlbICtW1mA57PtYaVZuZ3/aO77nqXhM+S8zfan79SJg==
X-Received: by 2002:a05:6e02:2149:b0:364:279c:4a08 with SMTP id
 d9-20020a056e02214900b00364279c4a08mr13114911ilv.23.1710272146205; 
 Tue, 12 Mar 2024 12:35:46 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a92ca86000000b00366655e956esm669667ilo.37.2024.03.12.12.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:35:45 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 382D31060DED; Tue, 12 Mar 2024 14:35:45 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 14:35:27 -0500
Message-Id: <20240312193528.664465-3-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312193528.664465-1-jeremy@jeremypeper.com>
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710272146;
 x=1710876946; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We+Hy0PT7JOeHqbB4DGGMY0jDGpv2KSPw+4iooWFQKU=;
 b=Yb364bF47f1trnuOiN5UdcycGsBzwLck+1WKQ337PVHuwu3Bpu6p+sEFwEBhAUeri+
 gZ6gLIvu0C/w0s90XmE9FuwDmWtWS0cAYz6i9DgCS2WJ0YWprODs7Wboo9Cw0/c8yNIp
 6wtYndVT5x/qWJ/Bg/fKQsbNQyNDCJ/cFqK6ZcaLSy36i93sQJ8gDyteogC5kcXN11nB
 m4YhAKg27XD/+u1iDNuauix8ZhRnrDGJ7BLghuhVGyYeTAQSnvYr3sOsH8R2LacxEC0N
 eYTVsgU7D/gKJ+ZLvmD8RPYC2ZpQpfN8g2BR4yAnoovy7hqGP1kbkCONwFoeX27gZ9Ma
 /osw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Yb364bF4
Subject: [Buildroot] [PATCH v2 3/3] package/python-rtslib-fb: 2.1.76
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/python-rtslib-fb/python-rtslib-fb.hash | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 3c2e39ff..39c390ed 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9f581c4bcffebc60be236af8a6ebdeccdb66d0435eeb04ab1b743c170b95d046  python-rtslib-fb-2.1.74.tar.gz
+sha256  ac15c113d09209c7b0d14d94a12ed88205a7c2feadd1096f573049fd737f7e74  python-rtslib-fb-2.1.76.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 09bde874..6396d26a 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.74
+PYTHON_RTSLIB_FB_VERSION = 2.1.76
 # Do not switch site to PyPI: it does not contain the latest version.
 PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
