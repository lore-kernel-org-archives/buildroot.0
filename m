Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CA2C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26069414D6;
	Tue, 27 Feb 2024 16:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vstxgBIV5Bky; Tue, 27 Feb 2024 16:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B983D414D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B983D414D1;
	Tue, 27 Feb 2024 16:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 719B61BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF7540C28
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urSOg2_8ERZ0 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B8D940AAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8D940AAF
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B8D940AAF
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512f54fc2dbso3177524e87.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051439; x=1709656239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=rP6BOH6WUfbwo+8pozF4rtIJKNWa3ShhmZNDSkoGbh0su4ZT6gb27tsLjRqfWo349h
 80nBfhhrWhUIIoQdOJNx4/zs93DBy/2e7r4EYifWSAtffeYso6nx5BK9q78I6eDkR4Ym
 b6f6RoQtMW/7URZdjWOkmQycMli0vuMNgYBHbohAVcZxWY+PrGSV7gWqGpLwEDZbTgEC
 kEhNllEQy3ZlF0EfqB7KxedJqV11ZKKc3g5mVch8RdrZaMZNBxAs+4Wr1wbt9LV1Ly1I
 Qg7o+8PwKcwiSNvRbXxiyaK8IHGOOK0hsMjt39+atFpScQ9u1vzRu8NUxWrReN89D6ua
 luCw==
X-Gm-Message-State: AOJu0YwhWDCLgyF1XnHZXxjq/+EO9p9wq4/UQex23+bNi+Fk6Eh3FB+n
 c3aClZZJryYO5BgOh8tp0O5qYdyNEjBaziVnE2efgacCes5YRaAHuCwgYLsPrEy7DIc6TYdSXFt
 h478=
X-Google-Smtp-Source: AGHT+IHDW3t1zDGyG5ViXMvXGl5z4lK3NDRMZM1GEX6BwADBei98DKIVm3Zo8mDf0I8iw5vs1hHcjA==
X-Received: by 2002:ac2:518f:0:b0:512:d713:1de2 with SMTP id
 u15-20020ac2518f000000b00512d7131de2mr6534137lfi.40.1709051438886; 
 Tue, 27 Feb 2024 08:30:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:11 +0100
Message-ID: <20240227163019.2876942-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051439; x=1709656239;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=qVFCInqglqotSPb/BZHMy7Lpf3fWLB5FlZRLlkQ+A78um+hl5hH3rSboY+dCBDibr9
 psd+dZPO1E8LaX/74ZJd5vEOXT3UllblGQmHOVLTZn7x4ykZGpqW6MoZntwGK8fik1h2
 +3jaZRSaMcffNmwO8Q9z/Y4sWH+Zux21YsoEw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qVFCInqg
Subject: [Buildroot] [PATCH v7 09/17]
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
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-jsonschema-specifications.mk                | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9d4..653c839bb450 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,14 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES += \
+	host-python-referencing
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
