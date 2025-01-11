Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6CE7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AE3402AD;
	Sat, 11 Jan 2025 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXcusYVc-Ejd; Sat, 11 Jan 2025 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44584062D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44584062D;
	Sat, 11 Jan 2025 15:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0BA9940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69EB40204
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV4EbzaCw2rk for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD40F400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD40F400B9
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD40F400B9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:31:56 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so13772515ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736609515; x=1737214315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3wlYg6W9XiyHLBy0kGnHZa2sHeuE4J+6H459jOoW2DY=;
 b=Yo24U5fA+IrvWcfO6udcF+1RY4rcbCD2v/52wmgclAUehlq7S3gJNQG4h3ymL5nj/m
 9Ew/ZaChu8PJstQds7srJYV7A5FS8E6wgpnXic9GJ8cjmi3JTmgStR0rE1mmBP/rn2nU
 gTzdSQlVrdwaeMlxVt4zhX/xrOdz5w8fPNE7Bq6jspQSK7bObauWUc5FavJaRUVCVFkI
 GOvfPBRAM23ag457XYhZXhNKCLe6XW+MZwimolkYgyAWy3FCq9mRRsbkJQpIeACNesOa
 5Pt18vlAHZ9aewPOzTPqtJU7nPe3JioREYEH1kac/s3PaWeJmx3xYly80Y1mKagTaG7D
 kvOg==
X-Gm-Message-State: AOJu0YzZezSWZqCL4SNJc4tECPpp5NKWfROsLDc/1TdeR8UeCFH23Zz4
 +txLTrLlw3qyBBc+9PANVlP5OhyLrW0nvfqwuWVwV1GEI2v0TiLNMv/VjCKbTf0=
X-Gm-Gg: ASbGnctRGpTJHlbtG840x23lopTjtDM49ZYhVoneq4zokwoN4oypRCmMFB0tD2/8ex/
 aAqv9PACky/RfyTxq3zolyEXFFe6EPXyZ7rXEGsoGB4bk9PrGIfzIHeA2w7mnYJ8I01i0Scl0pV
 0Wv7nFZnQdFAGGR1+cDp4mSB1r2JN9bPSaN8jvNG5TwtgNm9oqdSuLT4ips0X/wDFWcK5Aj6a/o
 s1bGyBSU3JRfoCGtk2zLybaUqiaVnQ1qnKHQmdnUCuiqO7hM+K85Pp/5bYYmwln6DIdRTfkfcPx
 aVMsrolOExu3B98z4L3QFfCndGTJU8Q=
X-Google-Smtp-Source: AGHT+IGeR6+SlIytHDdfjTr9zCZIfJFARb7hmGsf97uVyTkhk2Kkx4CF0nttEXL3wryrVJiq4fKDMg==
X-Received: by 2002:a92:cb47:0:b0:3a9:cc7f:2bc5 with SMTP id
 e9e14a558f8ab-3ce474edc85mr80137725ab.3.1736609515474; 
 Sat, 11 Jan 2025 07:31:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7458f8sm1568360173.137.2025.01.11.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:31:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:31:53 -0700
Message-Id: <20250111153153.2845643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736609515; x=1737214315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3wlYg6W9XiyHLBy0kGnHZa2sHeuE4J+6H459jOoW2DY=;
 b=nNS08RGomYkhga8uzmsrQTRAElgbc8F98R2Vdf1Nt/X4TpPOl+kZO7L/WSOWu6fAE8
 +zJnzulHWdqwKQYX7iIOjSBgTOjHvRZRp/W0R2mXqWk45OL3yIXQoPxiwcAmqZmfQhwV
 DqC73dBw5INyOT997FL8c40P3jHHSuXqtzfuCzz6A28Z1slE3SM3CaGN9P2/DwWdLH0e
 Mr5kUNx7qQyM/AewCjP2YhuFl8JLebfmly+6COzZsELRrIseACGI5JK5SpfrspSrzRwZ
 UYmnuRL2cguqFk5Qn5GpRsB7nVjFG9UY2fpZd5wXcwL07F237qatsFBwQKH449fJ42kw
 l4Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nNS08RGo
Subject: [Buildroot] [PATCH 1/1] package/python-pycrate: bump to version
 0.7.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index e86f16a8b2..0115fb8b50 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  d5bc1e0e801ebfe27e2cae35ea45bc95  pycrate-0.7.7.tar.gz
-sha256  72f86a9a50497342fb2a940b1398a46e0aa2401a90cf77405074f2264b0e3734  pycrate-0.7.7.tar.gz
+md5  cd6b9bcfd92bfc74d3bbbea3c7c5d8bc  pycrate-0.7.8.tar.gz
+sha256  4c37aa2b1c3d64067668d015ec319dd94352ddcf6db495cb9a69033451c9f391  pycrate-0.7.8.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index a6f3dccc5f..de79e3b35d 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.7
+PYTHON_PYCRATE_VERSION = 0.7.8
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/45/26/04cc9fd3df1a03a5f046e72d35f268c4dfebd278fcad228e81701576ca9d
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/01/cb/091d5632190beb38099d095eb35245fe32352375d791d9c3c2403447f79a
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
