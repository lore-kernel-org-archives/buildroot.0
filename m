Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6DC4829C
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D14460603;
	Sat, 10 Feb 2024 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IefU1Ls2VIJg; Sat, 10 Feb 2024 21:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFEED60627
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFEED60627;
	Sat, 10 Feb 2024 21:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 149461BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECCE741BDF
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WdHuJgpqlZ0 for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDFEE4EC04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDFEE4EC04
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDFEE4EC04
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b728b6981so299561f8f.2
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600301; x=1708205101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3fgKjB9t6pmXKaW5HBBeN4CK0Gnuy4AJtSnbzz5u+Rw=;
 b=OajjjmaiGzQzzNap8o1LEbA6ayA0l3xeqwgHYOG1PUdX7DW9nZ3e/QcydO3JzUCGJP
 jrPDlf2S5NOcZzo8ZGcE0jncnOJ/1zC9WAV0BfQBIAwpJIq+9CHCbTXd/2FpZnp/BO6K
 dMujb46EYt/oq0RnWhOt5iYGpZWztH5WMn+gBogeq3vlqXIYJVSqI06uVw4YYz7sapOw
 PDX90ggeyh1pLHivKP77DrqqXO4Z2uDMVrvXsoxnAnd/aRqebccOb+V3HYGcRMrin5z4
 5YQz64BnPrO7jPrx1GGCfxYBBEMNeysE4ayTHfo7xR0C+gCjM4rj3bwHaRi+VZhZh2eb
 pNOw==
X-Gm-Message-State: AOJu0Yz9EcJfAw5Fi0HQDtI8aaMYMkLTRT7epfPPYq4UjrfGcabpGX52
 Gy+a+h6QGUpkCSBRxBmRbiT+l4Pit9atEznW2cAWqrm8ujiR1F37WLzG7eEo
X-Google-Smtp-Source: AGHT+IE58Nd8sfqNSQLdgG572sOcEe/y47ftudc93nSXzYhhW6NGtum+uLBK37HNWe8Y9zALcRZMTw==
X-Received: by 2002:a5d:56ca:0:b0:33b:17c5:f25a with SMTP id
 m10-20020a5d56ca000000b0033b17c5f25amr2101016wrw.64.1707600301672; 
 Sat, 10 Feb 2024 13:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9oJtN245/6J62mh8g39p0SqMqHcOISDbzLY1WX4VgcXJ5BAwURhE7XWCcGFxLIi+bssIL7yGT4QxCr7yPocrO85DDgj1guJspuQ==
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:25:01 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:57 +0100
Message-ID: <cb07eaf151493d53f2f740a2d29648067e79c2d2.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600301; x=1708205101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fgKjB9t6pmXKaW5HBBeN4CK0Gnuy4AJtSnbzz5u+Rw=;
 b=mKvT+LmajKARe+RQ0YuDKIUfv+R6ehWyQumuPJbrQygBSR/tMxlrh7I7qHEGoIeVTG
 gWpuyFkJZWeYJRdSQ+TaCHTgH4OvN/U1iiBtAcP2ClVmNpT6gqUL2OsI/dnTM4sVsNeo
 qJ40uERzx58jzgXbWi44zSjeuj6CJi0CCZXImo42MEZzgMSF/oPcCHwaozFXNaEYj+Mw
 WtgDzBoc9Rxae92UEiwdpaZFgT6edXMdAAGKoqiK062S3DgrZY4tXO1LCEwqlLTixO0C
 ntmtewymWCjTl78NBQ8cDxS0N4K/aoYXrXifKh1BhHUx9HWnt7R8aCsNNenXR2MeKpN2
 NNdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mKvT+Lma
Subject: [Buildroot] [PATCH 4/6 v2] doc/manual: document _CPE_ID_VALID
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The way we handle CPE_ID variable is unsual compared to the other
variables: we mostly compute defaults for all of them, and eventually
aggregate the various CPE_ID variables to form the CPE ID name.

However, we do not consider that CPE ID to valid, unless there is one
(or more) CPE_ID variables actually set by the package; this shows that
the CPE ID has been checked to be valid against the NVD CPE database. In
that situation, we internally define the duly undocumented _CPE_ID_VALID
variable.

However, it is totally possible (and very often the case) that the
default value we set to those variables are appropriate, and do defne a
valid CPE ID. In this case, the package will define any arbitrary CPE_ID
variable to its default value, usually by setting either the VENDOR or
PRODUCT field, though there is no rule or requirement that be the case.

This is not very clean, non-obvious, and does not allow for easily
adding checks in check-package.

Add the _CPE_ID_VALID variable to the manual, to make it official that
it should be used when the default values of the others are valid.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-generic.adoc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 935270a19c..ce8608682f 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -516,6 +516,10 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
   identifier]. The available variables are:
 +
 --
+** +LIBFOO_CPE_ID_VALID+, if set to +YES+, specifies that the default
+   values for each of the following variables is appropriate, and
+   generates a valid CPE ID.
+
 ** +LIBFOO_CPE_ID_PREFIX+, specifies the prefix of the CPE identifier,
    i.e the first three fields. When not defined, the default value is
    +cpe:2.3:a+.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
