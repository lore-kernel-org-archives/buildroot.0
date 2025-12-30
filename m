Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA3FE94120
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1587F81295;
	Tue, 30 Dec 2025 08:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmRUIoSnzVct; Tue, 30 Dec 2025 08:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4316281323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082788;
	bh=8OBsMLUCbgoiVAyQa+fQOGLogpfKjz8VM6Yrsg1knvA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=faIf3RgOzWNgWBtW2Tjeq0ytO/n9m+ZlKaob4ucw/4IqfWYAE9DsnwhaFWWzvWbSu
	 7LD//mA18wLKjGmu1RhDIx79kT2NiR8FMLwe3wuzTQbMf2neA5DhOvwH31G2HGCh8A
	 /oZn02weLpHVBmAhvQT2NsjQir4x6t1H7nMEgDaDBIihlLf28v7f2ftOIEqtoBYy5B
	 91eikf1lah49gcgMWJx5Coj/j+xspIj7GHrNkuan6SpCWBm8gTRsanpEbOuvgYpd5D
	 xz1yuwHF2ASVtOLvvutSoAbS/2iUb1b4wBJ0iQe6SKVonYHf4PFyDk7UQnn64UioqU
	 806Gc+g672olw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4316281323;
	Tue, 30 Dec 2025 08:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 151AA177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D6660791
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hV8AfIz3rfU2 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2D156085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D156085A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D156085A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so4838870f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082782; x=1767687582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BqlvK550LsN8O2Xc+IoO9wNO0F+nyYRnod9Q6gEREu8=;
 b=FJyLxy363/qSXM8t4JJ/aNGc7+XFlxuJQQxsJWb/Fuw5kF6c29MDsbCOzYisTYm/5Q
 V2Y2rJ7PRJV7k/zUAm+hvO2tu8y4fR1uDQ7Nu/mYvt1a/Gycufz8iByvuoMVsCLmZQF3
 cdnMtahtLrJxgEaA/ol4zJzXqOIsIrhkIyfGhRKbbqFx8dHs7Wuo0uDcTBhOpsb9mX4k
 sKdONZR84q/aMJspQMEDknjXtEmAG4jqV7GrvpmSunS0nTUOWKNBCqAWDPPSSUohv9kv
 TfA9HUl4oxkAKognSe8DjYIJPxI99Bdy9Ag2rwzli4PFrENUXPVFuPY/8yv0wr2ctJkD
 4YYg==
X-Gm-Message-State: AOJu0YyfKrMFIHE53HKH22Kiz0JH1wKzPSyd/8vP2zvPI7lhXknDhTP+
 QsKbKW6DYiRShviCIov7FNxr4xkrIc5c9ZezETwlYZmNFf9xJedbrJFD+Mlq403PRWVyjNT13re
 8TYqBinU=
X-Gm-Gg: AY/fxX75Mk6/VJgCEf0ZqoTXIcmnxP3huXtHYZr+X/wd0ooKqosA4JPwZKXX6J/9lDd
 9e3Z4jpCOEa1Y41t+EkAreEaNr1HSYNhfsR6ZPIQ3Yjxnp8fIwurL+EXyXXjds2RN/q1UPg5nuQ
 QYRAEL8xOPdU/m4//IRDtISYkmwOJAu0hbaN0BjNy4xb+1JdYR1KDLKMR6RUmeqyfcFaE7SjdKo
 sWBmEG43HdeyEDbj12dYHhEmY8MWlj1txK2rx9ucAF2hFsDfFcYlyGGkZdU9ayC9XnVN+tII8tL
 hgYvnSu1ONu2Ve7cedvseovVd+C4Tws68AlF1luKJ8RheY0A9KOn0aNAShU/PUw2V0Ettkt85EF
 DxxDqiq2TgZ2/49s5SRK67yfU5ppPSaGDCtglu5BZyaL4BHz8bKu9rV2MKrdxBstDhOezTwiFS5
 yGYfE=
X-Google-Smtp-Source: AGHT+IGBUlddFRpeX5iYnA84nEDC5EDw5Vi9PALr55W1XGo5snQUPKQtmrJteEKOo9QzYFJyjypmpw==
X-Received: by 2002:a05:6000:2403:b0:42f:8816:a509 with SMTP id
 ffacd0b85a97d-4324e70492amr40811437f8f.62.1767082781715; 
 Tue, 30 Dec 2025 00:19:41 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:16 +0100
Message-ID: <20251230081917.18676-15-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082782; x=1767687582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqlvK550LsN8O2Xc+IoO9wNO0F+nyYRnod9Q6gEREu8=;
 b=VscoDtzqXviIxY7ndEFuEWtRPGB3oCJuORuAssiSWSVq8SN5LqzXqEQPRAaXbGAHns
 6LK5Msq/2Khw4VvwPwfIlazmqYlkWx3+Vlqk+8bqIPKR2s/EsGsL57hWXC7lv5vb31Xb
 W3oaTpLnryBBoe2X4tBsMwwphE60tYMHe/U4c4uBNMfPniYpTLl2dYTEvQlli/mnC+Wn
 nhTuGF+by02qJWKySnUYB8PB1zV+bBJ7hAj+Xi9snyjPMN7hMLF32lZkGLvzakYnl6E7
 LTNotXTBTbNdNa6Qe/xzo5kjp0YwqRq6mqTw0k6U7Tc1FIyi7PiyRWbH/JmKsxgyW6nN
 lIOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VscoDtzq
Subject: [Buildroot] [PATCH v2 14/15] package/dovecot: remove stale
 IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the dovecot package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 948e71689a package/dovecot: ignore CVE-2016-4983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dovecot/dovecot.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 6612787a94..a4c799221c 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -21,12 +21,7 @@ DOVECOT_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
 
-# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
-# is part of the Red Hat packaging and not part of upstream dovecot
-DOVECOT_IGNORE_CVES += CVE-2016-4983
-
 # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
-
 # Note: this ignore CVE entry is reported as stale by pkg-stats, but
 # the NVD database is incorrect:
 # https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
