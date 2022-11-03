Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C67560E16;
	Thu,  3 Nov 2022 00:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C67560E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVyqWEhtd8bq; Thu,  3 Nov 2022 00:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832B060AA4;
	Thu,  3 Nov 2022 00:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832B060AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDD9D1BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8BCE81E86
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BCE81E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJ87UZeh0zJh for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:23:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF3881CAF
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDF3881CAF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:23:53 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id g13so335992ile.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBkyRvelw/3hi2+Q8ZRfIbSi5cxoc2W45Tbg2fTmzJY=;
 b=g8rNnJc26btPQZPYy0rxfo6TNZiaL0NLgQ3FT1N8y15Iv3lSGEuCfjdvYSr/T+kUkl
 2eEYR9oE6Rj0zF4dB0HetrdAW+9ywqvtt69duPR65SXa5M5aNwDthQtRc9MfU+yqjSbu
 z9IRjAVkUd07Rq2dhkp9awjbPNdvFAHQDQLDVnWzS2og13n486TlRXHdku0s/Nm0PA4i
 6TQtPYPZuBN9DrILXoiARfGbhFD2aYHysTP+idrh8JeWl9k9e0fw+z20toQWeWtt2Lv2
 fBxJAKyj1q0DVJyeBYF1apvDA1j8Na9QZDnTo705e4wUCPSjCU1INPhhT7Ao9fsik0pS
 K0kQ==
X-Gm-Message-State: ACrzQf2xRCnC04Ix/HrT/j7aO3TRAeUVoeMPcrZUP/aajpLosET+VWy/
 yaTtA7bJoonpgXaZwlktfMTyj0lxFfqdr0TQ
X-Google-Smtp-Source: AMsMyM6Ej423XH8viioFKIXL30HYXWmVmk2wWk+Ksorbu7QMyuxrkM5+aBsuZyUOBQHmHccuTBc77g==
X-Received: by 2002:a05:6e02:588:b0:2ff:d4bc:6744 with SMTP id
 c8-20020a056e02058800b002ffd4bc6744mr15505174ils.222.1667435032548; 
 Wed, 02 Nov 2022 17:23:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i66-20020a6bb845000000b006bb5af55ddfsm5707544iof.19.2022.11.02.17.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:23:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:23:50 -0600
Message-Id: <20221103002350.2425582-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BBkyRvelw/3hi2+Q8ZRfIbSi5cxoc2W45Tbg2fTmzJY=;
 b=oS01VFcGcoM0JRjqh3WLy1kx/M9sgTVtA69LiRZI1YdXSPGNQRhQrPJ3wagM9faCNY
 X40WkeWdTJIDYdVZ7wBopfKKCZgsOtL50w0JXBo+zUOcENXTfYNE4vrQKV7ihQcS2ckR
 +KAGrsy3nnec+2HGS00cI8IYQQM2u6rT6qTC154Lr+kv3BCZBVbzXiXU+jL0FLFgmuTy
 omYzlrGRCjKO79fNT5r907As4yywYPpiIstFGGPEhZ9zqSbJ45SExhri/a5EoAkRJ1zF
 H/uez9nQRpoomFp0ivDQNnBui/fuJdds0b2WALj9EkXzX1euyCOkwkXBagNdIn0sSt/K
 e3Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oS01VFcG
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.2.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/sqlalchemy/mako/commit/36e10468c1e159803147bfbc7fffc930a9bd368c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index f5b5daf06d..4bacafafde 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  409bdc38e9ddda5eada61fb092cb12fd  Mako-1.1.5.tar.gz
-sha256  169fa52af22a91900d852e937400e79f535496191c63712e3b9fda5a9bed6fc3  Mako-1.1.5.tar.gz
+md5  4fa0a489a247c59b36fe3e0de5514fed  Mako-1.2.3.tar.gz
+sha256  7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd  Mako-1.2.3.tar.gz
 # Locally computed sha256 checksums
-sha256  47cd0d41b1092f9161cfb629ed15e5cea185144710ff4633a4281ef088ff5de7  LICENSE
+sha256  760f22b3e9ea4a50eb99201bd8dd118869f28108cfb64ccce6d1b305cf9ae9fa  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 553c4a5339..a663b7dbda 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.1.5
+PYTHON_MAKO_VERSION = 1.2.3
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/d1/42/ff293411e980debfc647be9306d89840c8b82ea24571b014f1a35b2ad80f
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/b9/38/c25f0874ea71802fc6f1e9f0f88a7e9666818121b28991bbc1d8eddbcdb1
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
