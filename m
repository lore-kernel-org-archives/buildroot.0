Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B38C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF46B404E1;
	Mon, 18 Dec 2023 19:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF46B404E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhmOp0vMZST4; Mon, 18 Dec 2023 19:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DFB41B18;
	Mon, 18 Dec 2023 19:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DFB41B18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 012B31BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD1E40648
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD1E40648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adoWhX5Fhs4k for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:16 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBECC40463
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBECC40463
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3b547cd4cso6992855ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928414; x=1703533214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=X68tpuB1zAi2i3blsqJcgT8JUVLK2YboSR4v2GbsYaHOmG2Jd/q4G1x7CtsPvzGGHj
 IQ012pmgkfuaQ2zbUW/PfPpnu+EfmsQZSoqyBFC81MJxiutWcoR7d4Vilu07W5XXugkp
 A/mB2BXRArWLsVaL8sHa5FfJ5JuW+VGCw1CNhXEhG/Y/GcbWKT7xJNLyXIsNpEAvZlyZ
 IwAdgf8cFKM/n4+N9Jb8bP5Yv3JOdnzaQwkfzLeSfmF2qi7LYvGMCRj7XNewOVxemIYO
 dgfqL4n9cTne46X5+A7MzJaypFd06CfKdKwH3m1d3PeljyGFHTsNmEnCRlDTKil1lnJK
 PbVA==
X-Gm-Message-State: AOJu0YzcbTOzDaZtyJYIdPLSXjGCqN3gBzZ8Medei4U0jaxyZalOWofV
 /4PGRjyYuZ2yMkZ1nBK+B9+ozRY9jQ+NOxG68bQ=
X-Google-Smtp-Source: AGHT+IFRvB+Tl4/RyBjTQ2/t7Gpe/O+pgF5/gN20aywr7uFVjv0N0IVojfenw1YpfUXhl/tMqd6kVg==
X-Received: by 2002:a17:902:780e:b0:1d0:ce26:7ea0 with SMTP id
 p14-20020a170902780e00b001d0ce267ea0mr9093728pll.57.1702928414524; 
 Mon, 18 Dec 2023 11:40:14 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:53 -0700
Message-ID: <20231218194001.544887-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928414; x=1703533214;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=P4pxkupj4pCAdGVZYxu4hxCzmvcx80EGPyDHC08AzhFsmfCrwK9yMkXotYNbUO1nL5
 RSyGbKiBJLB+O1U9Okza6uUs3LS0VQketkdlj+HdUaCsL8eIU7VzoQOrepASYJq8yeWN
 dtwf4TLgvDFpp9c1sd9hSOnxGSY20zm0A2lAU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=P4pxkupj
Subject: [Buildroot] [PATCH v2 08/14] package/ncurses: install foot terminfo
 if foot is selected
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

RnJvbSBmb290L0lOU1RBTEwubWQ6CmBgYApBcyBvZiBuY3Vyc2VzIDIwMjEtMDctMzEsIG5jdXJz
ZXMgaW5jbHVkZXMgYSB2ZXJzaW9uIG9mIGZvb3TigJlzCnRlcm1pbmZvLiAqKlRoZSByZWNvbW1l
bmRhdGlvbiBpcyB0byB1c2UgdGhvc2UqKiwgYW5kIG9ubHkgaW5zdGFsbCB0aGUKdGVybWluZm8g
ZGVmaW5pdGlvbnMgZnJvbSB0aGlzIGdpdCByZXBvIGlmIHRoZSBzeXN0ZW3igJlzIG5jdXJzZXMK
cHJlZGF0ZXMgMjAyMS0wNy0zMS4KYGBgCgpTbyBpdCBpcyBiZXN0IHRvIGZvbGxvdyB0aGUgaW5z
dHJ1Y3Rpb25zIGFuZCBpbnN0YWxsIHRoZSBmb290IHRlcm1pbmZvCnByb3ZpZGVkIGJ5IG5jdXJz
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29s
dXRpb25zLmNvbT4KLS0tCiBwYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tayB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmN1
cnNlcy9uY3Vyc2VzLm1rIGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKaW5kZXggM2I4MDVj
YjFmZC4uMDBlMWMwZDQyNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsK
KysrIGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKQEAgLTczLDYgKzczLDEzIEBAIE5DVVJT
RVNfVEVSTUlORk9fRklMRVMgPSBcCiAJeC94dGVybS14ZnJlZTg2IFwKIAkkKGNhbGwgcXN0cmlw
LCQoQlIyX1BBQ0tBR0VfTkNVUlNFU19BRERJVElPTkFMX1RFUk1JTkZPKSkKIAoraWZlcSAoJChC
UjJfUEFDS0FHRV9GT09UKSx5KQorTkNVUlNFU19URVJNSU5GT19GSUxFUyArPSBcCisJZi9mb290
IFwKKwlmL2Zvb3QrYmFzZSBcCisJZi9mb290LWRpcmVjdAorZW5kaWYKKwogaWZlcSAoJChCUjJf
UEFDS0FHRV9OQ1VSU0VTX1dDSEFSKSx5KQogTkNVUlNFU19DT05GX09QVFMgKz0gLS1lbmFibGUt
d2lkZWMKIE5DVVJTRVNfTElCX1NVRkZJWCA9IHcKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
