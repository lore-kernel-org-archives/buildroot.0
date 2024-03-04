Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC6C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B62F414C5;
	Mon,  4 Mar 2024 15:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wL1wsSWs_iz; Mon,  4 Mar 2024 15:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 296D741559
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 296D741559;
	Mon,  4 Mar 2024 15:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC481BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB5060C1E
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COiwUvtPyj7h for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2297660A3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2297660A3D
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2297660A3D
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso600878566b.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566458; x=1710171258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=MaC2rGqgHRXIg9Nnw/6/oYtCGn0IMxRqLdFYdaLKkbIXvJW734sf/hwMNmgsBxdajz
 EgsAMdykF3jtjORiJtGz6zPQ4iPBBwQPGSmIVFg8Dj3LBhVVVoGkmUAYXFLYWiwGD/xr
 2JusPmI4zHJay3QfqWw2fNZlOvCK8PIEC8MPVTycZ9qrdEP/dd4hOCxwFy8hx5a8WdaU
 nh7GuDN1mrczOBPYVkz5fSGDrPGAIlvhVww4t27YHnAhybUFPKrYZ+dcu+VWGztJWyF+
 CVWsHt0kp/dtNtn5RR7jfm3+/oXUsfM6fx/KRaKkQlQxJHzcuCllnIJ1IXkoOxJJn2Na
 vPdg==
X-Gm-Message-State: AOJu0YyJaLy3HipiQ1NW/KewGy226x/suFcjAeEqsod0wkqCJUAEGdJD
 v1A+AfqFW1d9/R1VsQ5jM13L7esrNqjDUMe1vkzXqjMNzmI7gaeDNt5TvaUdB8sA4Lba+MesHHq
 KHWM=
X-Google-Smtp-Source: AGHT+IFGJ4YXOUvNdli5/dw7NDNMaWhxPgpGga4SGxCaAiUZyVzVEXgCuASb3Sn+unTtoLhigbGZ2Q==
X-Received: by 2002:a17:906:5947:b0:a42:fb21:5066 with SMTP id
 g7-20020a170906594700b00a42fb215066mr6013010ejr.31.1709566457768; 
 Mon, 04 Mar 2024 07:34:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:39 +0100
Message-ID: <20240304153253.732708-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566458; x=1710171258;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=RgDUddyTXyXmtH/0YzRrkpqprQJUOnMuMzj+FGU9xtJ8+gdYoTZ/elfF2sh5iGdohr
 aEbrzDQGH92OO2EZYGHMKXXu7acilQFAQu9hblV4JRXpi/0GC3d+tMp8DkGXz0uo6/cD
 TOQp+84z7LEfWgdLbxpiHrDAtT06WfWflDook=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RgDUddyT
Subject: [Buildroot] [PATCH v9 08/22] package/python-referencing: add host
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
