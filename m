Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA40C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1296E60FE3
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1296E60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE85A406D9;
	Fri, 15 Oct 2021 19:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlY1ULYYWgSA; Fri, 15 Oct 2021 19:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B2F40623;
	Fri, 15 Oct 2021 19:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B43D81C1135
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3FC0605E5
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYTCViII-B4X for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:40:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D424560726
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:40:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso3128968wms.4
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dHD1HMEIvzlIgUdUlse4v7QMwzRwKB0rRMxGYt5EZs0=;
 b=KbgpHl0SOZzrwx5r5YEH43o2giToo+NRuI3jPGQ0i8hsSA0k2JG5IvwvTTllMAdifj
 /xAszJgLpCJ12Em6UUZzNYMXfA0dNBmcYiLBitkK/mhvIv3WY/maNy6tMfDYsk3H/0NZ
 TZC1gYBNFQViG8KPlBEa1Rfwd66IngCsgFoZUK/IrPvb6abiYyn7TqNLeBK/8y1fSRsT
 rs6aXvIrKql8E8Kee1/YaCc7r70lXIM9gdO9xPfk6kN1qlU7OTB5HPuSQvr72OWtEorx
 6F22I/esJvP6pg4wo3Ec7lfgdTtFQSmt5h5uEY4Rfyx+j2Pp5d4L19SEndID9f399H8z
 EKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dHD1HMEIvzlIgUdUlse4v7QMwzRwKB0rRMxGYt5EZs0=;
 b=nIjuA68XgCbGvnz5rPuN82r/HbSVIabopdJc0/zYHLd+ZyiHt1KwsZonElasbPdb5P
 1ifRZQCaUOSXV90LkeEkq1BvAM21nvusu2OPCFlEWYjyAv4Sy7wJbMatTBgE/zpcL+N9
 q7vCHjK4AxHK4GsbZt4wGnP98cijRs4vQ6+eV6SXYBnBgFYCHsg1k72hsYftfQrVhpOn
 1DNbsNvgqPWbA1wLs7BL6rThUwilmmPDwnm+34/Tb9XzVhgoSbigRRk9Z2EnZOweSvbZ
 yVZtmFVwvJM+tgm1S3ZSTMC7uOeB/836ocDlOWLY0PGZXA1mT5vz8q87ZWJvRAPcqazW
 tFuA==
X-Gm-Message-State: AOAM5331XwvuMXCk4pHNH5Oh7tHkJob8tEZZZCDY4SQtNjxsB4VKfz63
 GSXtnoRMnm8Nf69LAb0bdssZEXYdTUU=
X-Google-Smtp-Source: ABdhPJzMLwbRhwofCwVsGHgk1Agi29lpSVBx/fGeystCp6/+Wxs2eJ5WLj3J9565MZ6R20zgbEatwQ==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr28742643wmh.167.1634326830872; 
 Fri, 15 Oct 2021 12:40:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id x21sm11223829wmc.14.2021.10.15.12.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:40:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:38:59 +0200
Message-Id: <20211015193901.1543587-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
References: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/python-ujson: fix arc build
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the follownig build failure on arc since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/93f231c4a860f4467029a2c2e4fc0b67096b14f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-Add-support-of-ARC-architecture.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/python-ujson/0002-Add-support-of-ARC-architecture.patch

diff --git a/package/python-ujson/0002-Add-support-of-ARC-architecture.patch b/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
new file mode 100644
index 0000000000..d38b24f5fc
--- /dev/null
+++ b/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
@@ -0,0 +1,36 @@
+From eafa625a34fd5d8bec18eddfccbca55ce77b4849 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 1 Nov 2018 17:36:17 +0200
+Subject: [PATCH] Add support of ARC architecture (#82)
+
+More info about ARC architecture is here: [1] & [2].
+We need ARC supported here for many things like:
+ - ICU (see [3])
+ - Qt5 etc
+
+[1] https://www.synopsys.com/designware-ip/processor-solutions/arc-processors.html
+[2] https://en.wikipedia.org/wiki/ARC_(processor)
+[3] https://unicode-org.atlassian.net/browse/ICU-20155
+
+Fixes #81
+
+[Retrieved from:
+https://github.com/google/double-conversion/commit/eafa625a34fd5d8bec18eddfccbca55ce77b4849]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 41c5b02..2e1be0d 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -94,7 +94,7 @@ int main(int argc, char** argv) {
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+-    defined(__or1k__)
++    defined(__or1k__) || defined(__arc__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
