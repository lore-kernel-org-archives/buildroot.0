Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0305AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CDB60FED
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99CDB60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C92240425;
	Sun, 19 Sep 2021 19:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhSCPMWp8d1j; Sun, 19 Sep 2021 19:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81727403F8;
	Sun, 19 Sep 2021 19:43:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9701BF4E4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDFBC4010C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djlBoQ2uUqNn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73C9A400DA
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:43:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x6so24792802wrv.13
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EjOKAxvBdr7NQoLxH71OmgxsCuJ3Okt9WFygBVIJwbA=;
 b=qmWVVLywxk3R+tjdvm65plsne+igElN4dKkXswgFez7PSqhZQIyQYsSIFVXAvYe93b
 DBPKjOlQ6Id1BHM+jcy4prTDf4G/EGdPj3wAdeAr5YskC6isT6IRldyGoO7QgG0lnFJX
 /Wb1LJHauB8oycJ8BcCPw8tiYslE9aHK7OJxa+c9mHaV8ok/S2ROU0Z93tNmgfE8Sq1v
 +wthVTf+5lYimy0qm1v49TU8qP/++xDldhK1DkKPlMLimnl9+BRSDeOJBOzcq/IRcsll
 gpHyARENfsxsyTpuLQZyiuzh5oPgHlDHwXnPLFlUPYylAN4J8y02tbsOTau8KRe/eFou
 T/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EjOKAxvBdr7NQoLxH71OmgxsCuJ3Okt9WFygBVIJwbA=;
 b=J3wiru19HshIDWD2XofqayJfjjXqugoZcy3KqZJsii+eekJYP7qo5z4dGKgXrl/nP0
 GYOZmjgBi/glT2jbyyp/0uJYSEB3W7ngRLZI0rjezDRe6uAuWL3wD9RK7cDdeWHDy+5W
 GQhyIXXoqnp9wDffgwbrA1dPExsDz0M1z3jYYMWBjmKVUiWly9eQDLCK+E8vbZJ/sNvb
 HZJ3BjBLr0Ot0AsmF/ifP1fqQqAzTI8SenjF8AaOJae0EfrNy+Ire5/ZYpnEq7jFu5lb
 MfoqA9QvmBupwJVYouHPdEh7BEw7gCJT4pj/8MmtAoXIRz/sS+LcmT4bBWkeBcPaDBee
 DmNw==
X-Gm-Message-State: AOAM531EmvHJeMcaujItpdkG/YgXE9Dsf310X3rU7EFEp4ptnrBmNNGs
 2nhFm5ev1ldLolZN/E9a30fr8fh/A4s=
X-Google-Smtp-Source: ABdhPJw4PwpcW8oL5270XjI3XE2P42HH2vybsNfPYMRkjetN2SClKReuBgMKTDHxbwdB9H6W35KHTw==
X-Received: by 2002:adf:aacb:: with SMTP id i11mr24695616wrc.296.1632080582358; 
 Sun, 19 Sep 2021 12:43:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id k4sm13017773wmj.30.2021.09.19.12.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:43:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 21:42:47 +0200
Message-Id: <20210919194247.4025433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: bump to version 3.15
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://dianne.skoll.ca/pipermail/rp-pppoe/2021q2/000619.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 806bab1b0f..c883322d70 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7825232f64ab4d618ef074d62d145ae43d6edc91b9a718c6130a4742bac40e2a  rp-pppoe-3.14.tar.gz
+sha256  b1f318bc7e4e5b0fd8a8e23e8803f5e6e43165245a5a10a7162a92a6cf17829a  rp-pppoe-3.15.tar.gz
 # Locally computed
 sha256  464006ba771074f4022db14f58a29a0b447b6fdde9529cf0331be396b6279162  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index ce85da11e4..698894fda9 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RP_PPPOE_VERSION = 3.14
+RP_PPPOE_VERSION = 3.15
 RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
