Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5E7C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F7C940643;
	Sat, 24 Feb 2024 20:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CQYr-HBmkGX; Sat, 24 Feb 2024 20:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F25844064D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F25844064D;
	Sat, 24 Feb 2024 20:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256241BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1455360675
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4IUjbKT-1Yn for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BFC660671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFC660671
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BFC660671
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d2770e44d0so15033081fa.2
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808258; x=1709413058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=sNq6VMA7pPdoHxiAFF+CBjaWhv4SGxVPUzcZyo+ZS1MQXGRfKfxBh66S7RXcq0NeGi
 6oQr3KiTslC1TZn3Q6Laq5GVVIAkGkQrZz837t3miP4a3fhLK0LZy4Qf5NeVfuVVQqT3
 KaiyfKypx/8Lm+czSwt+vzrC3EhkDUPDJNOJD2OGVm7Lb9fIJSmPRlNJwyDsN9o+rOe2
 7Cv111t2xx56IWo0fw0SX1E1Ygs0p81Y4cTQVbO67fhGlGzU2Xl4EgDvcolE5ysgmy0z
 hhbqBFuEvnyaAmo1F9n28zD7PhircWqQN0NiVfVJqOmDslp4ZLN0nqzx6V02e1b42leW
 yK1w==
X-Gm-Message-State: AOJu0YydkpS5xqO9ose7ZeQsg5xjncVI1RbaPxwPcuDa6IqMDHWF6ZjA
 ySWRjDKu+I3AgttgvxeXtbmRb8jKUlQ9VwvCGqPIao3Vi2ILbguSyYBvD32NsVrcxCKrHyY8QA3
 YnKc=
X-Google-Smtp-Source: AGHT+IGCla03ADxc3PAEynYJg9e0Xc4IJZlfLKG1tM/j/LMusRM5u3l0pnnGlTmo21pvl4U4qGySeA==
X-Received: by 2002:ac2:4295:0:b0:512:da71:b162 with SMTP id
 m21-20020ac24295000000b00512da71b162mr1962983lfh.3.1708808258616; 
 Sat, 24 Feb 2024 12:57:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:46 +0100
Message-ID: <20240224205654.1546744-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808258; x=1709413058;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=Xf0hoy4TkOwXBM9ww1I/g03OSL9kPS8YYZqwfcQ08m2QlAkh7xiXqZOCg1tEU7JwM/
 RKG2ot/8/SXCD8D3YrFRM225Dkvpp+gXy5nmDLoPWLhSYbziLW6V/RfBKuWKO04vCeSd
 AKtau4NC+qXvTn/92k7AIJOV5uoAuJ9kadM0Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Xf0hoy4T
Subject: [Buildroot] [PATCH v6 09/16]
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
