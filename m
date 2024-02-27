Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3930AC5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13DB409E0;
	Tue, 27 Feb 2024 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Htpq7dsMb8R6; Tue, 27 Feb 2024 16:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC6C414C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC6C414C2;
	Tue, 27 Feb 2024 16:30:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C16D1BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C8D8145F
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYaRsFee9zt4 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BABDF81438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABDF81438
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BABDF81438
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso4622404a12.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051437; x=1709656237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=ewYvyqgW7JBc9EHs2WvMJ2jTJCLli+NUp9BuZNYXB2WXuYR0bQ9U3gzKY49ey5vXdk
 PGb0yxbHIM15PV00Un2OHJ3dYBBJO9/ItIEz+oEVPBDag8FrpCjg+nG+++22R2sG2GT2
 W4qjjYT7krSuerWQQPaLgnRFXb9/Vsj5Cad35EBX+jH1ZKL9YVLVx4W/f7gwjFh+E4+y
 3UCuuqotWwpWMXXVmjIDbqMIb4+QwDaihkXHD88IeZmYhz0FduOSRDMVo6fbAUX3YjXh
 63a5T5E8JkNj6Gle5R3FYgfGA97ko+lAWnQe9FDWXwH4me9NkhZD8Iqzor/Pj+5zy9OB
 bZvQ==
X-Gm-Message-State: AOJu0Yw3OAKAKFAJidPaWVeJGTeR1JJkQ3xq4pzLtWyB7RuHz7G1egd0
 O6iJH5QP735T4GKgv+uw79Zl2hBmrKpIpvc9VUpvj84r2vsyHBlVyS3+lljK/kHuiJau3g40x9m
 x4uc=
X-Google-Smtp-Source: AGHT+IFQ/yvbOwSQ1aVmxoRw0xTzrfzpa1P47bVlkX6dnWptBKd/UGnFkgL9wSZzaX/PviVV/cYA0Q==
X-Received: by 2002:aa7:c58b:0:b0:566:1794:394c with SMTP id
 g11-20020aa7c58b000000b005661794394cmr3034192edq.24.1709051437705; 
 Tue, 27 Feb 2024 08:30:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:10 +0100
Message-ID: <20240227163019.2876942-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051437; x=1709656237;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=lhC2lBrkydhiinhKyyO+Lgg8JPL7Matm9PutVFzEjQQaWe+eGUTS6o3TSIHq1nQrhh
 J6us+PqbmYeE1D80YSKPakq6TMBSNcURiTTHcxwnmOaL/8h+dg1wCWEW/ceHZL3R13L5
 cU1WZBtw99XbLh+x7s3zNefWMtVwnIe7M2SLA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lhC2lBrk
Subject: [Buildroot] [PATCH v7 08/17] package/python-referencing: add host
 variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes in v4

Changes in v3:
- Drop Config.in.host

 package/python-referencing/python-referencing.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 27d1452e913a..66d59ed8091a 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -14,4 +14,15 @@ PYTHON_REFERENCING_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_REFERENCING_DEPENDENCIES += \
+	host-python-attrs \
+	host-python-rpds-py
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
