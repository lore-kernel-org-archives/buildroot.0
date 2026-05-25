Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A4CCD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 18:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D9060779;
	Mon, 25 May 2026 18:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5QTN8JV08Q7; Mon, 25 May 2026 18:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D4460774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779735148;
	bh=lu8TsiIbmzWb7M6BN5gjZS5BIQZ1en6pFJPHfvV2Fv8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UfG1pM86Hj6iEYP3ml9QrnYL2CacKQNONYXHp1rYleKvjWil9tjj92sFvxWggPEuH
	 mPmFqhYbLWBgWliwHATdY9rq9BWTisy5rBKinuxWg1rDtc73x+/Kv5e451veiq5UhS
	 49nQ8LaCTgku35fNHXKe0RwKVnVVOb5rMcZH7dEj7fdGCOyjevPwtdkq5JOAQXxJp2
	 Pasn4x8OzGATN8ux8J/NkXXKKu4C8t3EmLlbff4dghpN60CA6rYv7XE1eqO9JB9H8r
	 U37wZJAkze/6Asnp11yds0Ijw6f4Ht6Kt/flvyLsruo5mnEYzWzY29JJSKXGui3oT2
	 gVWOdov+ML+jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D4460774;
	Mon, 25 May 2026 18:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC96821F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD74440C8C
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK2mrfbdGGyo for <buildroot@buildroot.org>;
 Mon, 25 May 2026 18:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B65C240C86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B65C240C86
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B65C240C86
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:52:26 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c8016d642b2so4443033a12.0
 for <buildroot@buildroot.org>; Mon, 25 May 2026 11:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779735146; x=1780339946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUsHbnfhzMlNl3cOMqnxznr4xOTrlHsemclhsQCcxJc=;
 b=lcdQR0PwN9HynUqymbFMxBDh96izWh/EskuZoWl9Sq0wWcRVKsoXIEq2+YOcJgH8FE
 lXQVGN0AO3QPKR3GLB6MDjOCCqOpEzHlbOwJR1hojk75vLRt/yO01TnRY7H5xsBAoG/a
 +QnhjTYB1wxPZ8VgkKLe1e4/MepaKHEiPV58WgwPumPatUvM9PrKm8vhwA7FP0kb6b+Z
 4I7LgLc2eIxOJC5HFDb8VPBObF83hrJh5K9PNldV/unVD9EbGDb8OPPV0oS2NoPQlddy
 d0F4mTc2qKdNGHWfpa39SBxGS/uac1iwCOJxPiE2APCW3VzWhLJDaG8OZe5HxRkVAJ/D
 dnCw==
X-Gm-Message-State: AOJu0YyJsG70HhtU/rTf6Jx+kmrd0CdtuLp+ZXurqVhqWLbCTSdDxq4M
 1VsvmhsQE8LSGOhOOAQJu4J9AokYCOT49bEfpW48Ayy6eTee/EKYBxR9Ynqntk8K
X-Gm-Gg: Acq92OHVdmV81UYTDiZY/12YmaRTAgpF1JYwlsdX+yBjeNLtwo5wyRPPpQ5W5J+UrE/
 ck+0qdP9rmNxjOr4Vk4CZ1CPyNrhscGfy6Y4aLtZt/19tw1FHeHHdWPql1W1Jk58c4vk5GP8r12
 wmF0qlZhcjZmMs72i3ycP8PEPOSj6ZJl6CqlY5hUY/lb/vwS8nSKFxFkdAPrT6/vrvkoLGkbR8w
 vbz3sqbyHDOXctV4jonfDNwxJT/VvYOeedeB/QkyBehBeQRRkJJ2ZyWTXbYnkk0DxcTZMPGEpys
 fL7PjE39A2koCDfykPdLNwYE2NYTl4LmLngNbYZI10OAnY8qZFVDy/yPV5/bB4ggkLIMoXhUZfP
 7rUJwAkhMz5g9rqmihHzK130DDRuHhaSBe9Zpj6rbBOsGWHLZXn+C7mm2fZv+l1MCLH9JozSw8n
 hKisKymYWllSZITE6wAnnH441XjqYJf+GDau9iYEdzsugfGUCiAiwmUKsc0QY=
X-Received: by 2002:a17:903:11c4:b0:2b4:6597:44d9 with SMTP id
 d9443c01a7336-2beb082545dmr134073225ad.8.1779735145734; 
 Mon, 25 May 2026 11:52:25 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1172:1d84:d8ea:ba5f:a154:93eb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58db58esm96597925ad.62.2026.05.25.11.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 11:52:25 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue, 26 May 2026 00:22:11 +0530
Message-ID: <20260525185212.40430-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779735146; x=1780339946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lUsHbnfhzMlNl3cOMqnxznr4xOTrlHsemclhsQCcxJc=;
 b=YSnqjZEJzf93DFRPGmmsWlYe+Bjmk4kB6tvOE8dy59w05LGDVEyImRNArb1i06OIvP
 YeISbmM7YZ08Wj5R1bIABsu5RNsJY4vMZWQiYS/5R2ZlmgvII4iWBbQPwZE2QD8V8dTh
 ouUJHNb/czxd0NmCRVKdflPL+uYUADVHTvaJLmVzePXIUZDSF0NWm3zICoAFgrZbArQZ
 qsKX7/CnETTDSqpxKg0cUfGXvxPd63oXRdqLut2LxOLbNY/lu6bHwzMLjXzFzpf/VZrJ
 Rhd0rXOp77sB5avOxAA90b9tKVeWUEBeXrg6JET/74d2xcje/jz0bprmk6U0IqI/W+vZ
 hOHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YSnqjZEJ
Subject: [Buildroot] [PATCH] package/xterm: bump to version 410
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update xterm from version 401 to 410.

For detailed changes, see the upstream changelog:
https://invisible-island.net/xterm/xterm.log.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index e86db1c06e..3438e7999a 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a  xterm-401.tgz
+sha256  7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f  xterm-410.tgz
 # Locally calculated
-sha256  99f70364bb769635eb9de18cc286e16cb78026f3b6478276344ee8619098dff6  COPYING
+sha256  f272fa007de2cffdb22b4df09e9a3aaec3555d5a6913229b70006ee137ab22b5  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index fb6de107e9..dc2f3c0e60 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 401
+XTERM_VERSION = 410
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
