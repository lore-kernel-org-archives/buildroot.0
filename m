Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199CBC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47A883EA7;
	Sat, 17 Feb 2024 16:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snSLAkE6DqPQ; Sat, 17 Feb 2024 16:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D98C483EB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98C483EB2;
	Sat, 17 Feb 2024 16:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 749B71BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE58401D8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8pwelAy1Ave for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEB28400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEB28400C4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEB28400C4
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso2484282a12.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185793; x=1708790593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+B3MCcfYmt4dA89NvntKUENgJbEVQ/MwJPsd32SSgCY=;
 b=uyiH5rf4LUna2zVFNHOVIfhBkvUxK9upKHgFfndp0e55zNujfmjhGMc2PMiSvpANzK
 sAKiqgvVX8RHk1rMvA7pemjBF3llcZd35d5h2mzhKH8ySE07nSmYr7c3gPpn4e2Qkjly
 9yMZzg86kNO29HuF0BUtHxt6yD5WX9e7qBlTfCrWZSS/EzpnVPFPvvjVbV9gcXbF3U1c
 N9u+1PLuw3y7rUGt74Hr4R5BVj9EA1M7BDwVeLxYXrnwvDlWMrW77JkdKz8m+vPdDXAG
 i+lI1R9lBLEiN9uA0FxIYz+YSa7/frSf9Ps9xtPvEFZjIaclvW7537q5WhT/Vr0auh8e
 KSTw==
X-Gm-Message-State: AOJu0Yz/TX3U0EmcP+LoFULAP7vM6AB1rYwemgnwjqhPS6jJRaqp01e5
 Cf7uTAKz/m7uvsw8zH44p0KApwA5ELstud0Kgvno/Fck48m8FYLS50GkrFk8fpKp8mNn3uCsasA
 fjRA=
X-Google-Smtp-Source: AGHT+IG1vtfA5wvPONYvuXYklJzOc6XQsOG1x2wMUca4z3ij1RxH0tdkeS7LL5T+4KCUpbSzxHf2dg==
X-Received: by 2002:a05:6402:4301:b0:564:27a5:4289 with SMTP id
 m1-20020a056402430100b0056427a54289mr1090633edc.18.1708185793548; 
 Sat, 17 Feb 2024 08:03:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:36 +0100
Message-ID: <20240217160244.1320482-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185793; x=1708790593;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+B3MCcfYmt4dA89NvntKUENgJbEVQ/MwJPsd32SSgCY=;
 b=D2YRjkdPfRXnrXitTHUqboPU/RNo4bCc8VPeFGobR6vsivJ6k9mJkcN9zh5pRynga0
 wIVn4XPcwuqZjo9wNNwffDUL6OiaKKxRLYiyoAJ5TJF7M/BWIrzfhc/Xtp1ejLSEgGPB
 1lvxiVpW9c7lRM/ymmY9orHy4vmu6UsPka05A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=D2YRjkdP
Subject: [Buildroot] [PATCH v4 12/20]
 package/python-jsonschema-specifications: add host variant
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
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../python-jsonschema-specifications.mk                      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9d4..b6e309ab2bc9 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,9 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
