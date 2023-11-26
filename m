Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF7AC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 01:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C995400F6;
	Sun, 26 Nov 2023 01:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C995400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mosj-6k-MmUC; Sun, 26 Nov 2023 01:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD6E4033A;
	Sun, 26 Nov 2023 01:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD6E4033A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94E671BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E2D360A70
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2D360A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7m63gz_vMvwD for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 01:19:42 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26A0D606BF
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 01:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A0D606BF
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7b3968cc62aso6623039f.0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 17:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700961581; x=1701566381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=TcttL5BIbA4u3bvMS7txBpwnrziLGTutQx8x0BE4O6J3SUcM7G4e5kgLcJ6rW0WQek
 dZGzTQQf66qmQed2xOc31Cau7jjkCrtZ2lXa65Mk4LEo4mzpgYRRw7hfcMqYbgWDm7L+
 O/C0h+Uon8XuxCe38TZE3vlvJP4H//t3c/8rc9kM+usiIx29hNwNJUOzh1hO5NSAhrbC
 2QhuiLMhKWEoN3zngE/SrefSjC6VajID3U5lzFB8pxG9JeD7LfDzhRylnHlWvR6vgZ80
 zLCRh/G//+knFxraPD7Oqg9YRCX2YWyIwLCi+jGaPEF4/DLHDs/c50Fs5aJSSItKB+kk
 BWIw==
X-Gm-Message-State: AOJu0YwBAf6tPypbejcj98Oe0FMBGdvLeEDvmbjwaqG+6hu6Vraiym4v
 Bxm1U/wJSTPzVAJAzA102qb0SfPSMdM=
X-Google-Smtp-Source: AGHT+IFcLs6BYp2Sy5jwg5IihgvpxTrj2rAwq3EWp+UQH10j2bUd+Q0YHNlw4Oc6C1UnM18PNApDfw==
X-Received: by 2002:a6b:5918:0:b0:7b3:7f27:750d with SMTP id
 n24-20020a6b5918000000b007b37f27750dmr4747986iob.8.1700961580798; 
 Sat, 25 Nov 2023 17:19:40 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1585075jal.17.2023.11.25.17.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 17:19:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 18:19:31 -0700
Message-Id: <20231126011932.1380631-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126011932.1380631-1-james.hilliard1@gmail.com>
References: <20231126011932.1380631-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700961581; x=1701566381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=dKsPYCeqqp6QKVwDBM8Y+/w5tm6ftlVPL9U1z6zGrdTTIR6Vv3ZOeDFF1B4hBVOKH3
 8qchYENZVyZb90QJfQPZUAETdLuESKMLcvrbELwjNjHeN95b+VB6hOrW3wc89G4cEcsp
 /1m5e937tou9EZfeG88D5vDnBAJwmAG6O7ieOj4VkvGMPmdoeVzxA8H7M3Q4/i3nONVe
 m5sqNDAPAJKgR/yFgeTIz422oiwjTBfRGklRYngnNwPLPYRBTPSDXmD3QnAFwhSXebGT
 hYxAlBzbYoL1kntLjR0N9RSqiP9f55dsXQ7Y9WBym2cMm8vRA0UzUd8RxcEczZt4z33I
 2l1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dKsPYCeq
Subject: [Buildroot] [PATCH v5 4/5] package/python-setuptools-rust: add host
 setuptools-scm dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-setuptools-scm for python-setuptools-rust to build
correctly when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing setuptools_rust.egg-info/PKG-INFO
writing dependency_links to setuptools_rust.egg-info/dependency_links.txt
writing entry points to setuptools_rust.egg-info/entry_points.txt
writing requirements to setuptools_rust.egg-info/requires.txt
writing top-level names to setuptools_rust.egg-info/top_level.txt
reading manifest file 'setuptools_rust.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
adding license file 'LICENSE'
writing manifest file 'setuptools_rust.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	setuptools_scm

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index f07263becf..e664a5604f 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -10,6 +10,9 @@ PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
+	host-rustc \
+	host-python-semantic-version \
+	host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
