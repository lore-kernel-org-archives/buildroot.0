Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F71C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E871040C0E;
	Mon, 25 Jul 2022 12:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E871040C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCmpEI__8Vih; Mon, 25 Jul 2022 12:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC9CD4064C;
	Mon, 25 Jul 2022 12:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC9CD4064C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73BC11BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BC70408E8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC70408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_zLnDTnQItc for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:43:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19F8408DD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F19F8408DD
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:43:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k11so15329334wrx.5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 05:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OqqhL97QTC+yTqmi6O+tlKVbkGJ5hdz0azz688xkiLk=;
 b=ACwq4TS4SYHcV67ljYcJF8OqHKo/NTy7kFt/vWGOiFC8sQ/HUPi6HUjQWNmEUvPBjd
 MpAkvMDhTuMCdeC9zo6jP9QABj+wCqPGXWwFFCBPJxielZ1UZyuoIQp6WqgMJUJuzu7a
 IaLjAk6nZ29yvP1rPjtpMhXdmY0vPkFslwxJy6ZKVJjcXAnb2hnTDUo6CovUGb8vN0Hy
 M2mndjjJmbXyYMXU+RoDa0bVXIKm0zaUgjZplYVC78X7yN+NujDH/9JGaOp07F6EpeUT
 xCQRI0HSEB0h72yjr4dRYwZ5lGcSkIyI/iQz4hcMDPAAlOdfaaM2lLQjvgjqERJ40Jyf
 vsaQ==
X-Gm-Message-State: AJIora+LCsuPJilyU2YGubOr/ptW2lVgdfZZIozhThAXQyxTvqoch0ob
 tbU7zgXxfHif8mgxc2UKe4HaF1v0kKc=
X-Google-Smtp-Source: AGRyM1sjdJAzirM03BQ+YdnD3bHmtTqBp3T0c7c8ouuPXe8v4vriK/E1W/U8EpwJfuhVGs/rp06rAg==
X-Received: by 2002:a5d:4f85:0:b0:21e:8234:3636 with SMTP id
 d5-20020a5d4f85000000b0021e82343636mr4738297wru.175.1658752990914; 
 Mon, 25 Jul 2022 05:43:10 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adfec0a000000b0021d6c7a9f50sm12066452wrn.41.2022.07.25.05.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:43:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 14:43:03 +0200
Message-Id: <20220725124303.3986-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OqqhL97QTC+yTqmi6O+tlKVbkGJ5hdz0azz688xkiLk=;
 b=H9Mx4QeHbbJJkJ7v+7gXjdCfuHM/geO6blvW6jCQeRg3dO68oAKoFTTiqjbRkq+f50
 uLvUZfHWgqVebfTYCtp+qPYN2qCbk1i2atZ0q9sVSqCRTXATQYTCaKHTvtfYvHSc1SET
 GdkxthEEvTQA2BVLGPDKyGnKXRFaIxxPcSmYqlQP3feawe4kmuikqTHi7nyfVyAVGUQb
 63U7BCIU6YfxjQ5zOO3tmMVYErLpgq+D30QL+Q6RAyX8X+ZL6YBpJymbRWlkGNxYmSrD
 tQiVy2WRlmcw5H23/jQ4XLGJXxK1AEUeDIWK+BdAcQ68IO3ipUiGfp9IHxS9FCs+KQ52
 CEyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H9Mx4QeH
Subject: [Buildroot] [PATCH 1/1] package/opensc: add OPENSC_CPE_ID_VENDOR
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:opensc_project:opensc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensc_project%3Aopensc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/opensc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 538151c12a..e1ad5d61b0 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -8,6 +8,7 @@ OPENSC_VERSION = 0.22.0
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
+OPENSC_CPE_ID_VENDOR = opensc_project
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-strict
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
