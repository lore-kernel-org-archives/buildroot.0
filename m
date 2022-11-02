Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D945CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D065408D1;
	Wed,  2 Nov 2022 19:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D065408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kT12M2A71cNS; Wed,  2 Nov 2022 19:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A927C40194;
	Wed,  2 Nov 2022 19:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A927C40194
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1174F1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFB23416DE
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB23416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQ3LjsitttZm for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:45:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8429416C5
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8429416C5
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:45:55 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h18so9999381ilq.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y39w3i4bdsPboU+grPwpG8K2OdfFDYMmz7HV50mT51Q=;
 b=JrwZ7SsKZxNz+GQAjoifXcJHBC8xpm4ytHAW9fQxvLsL1nW8yZgnBqhou65kAU4QLe
 1He6PM2Al764xV+C8UEsvu9Tldsb6POxYp9bWqc/Tr9U8cjBg2JZ3VdFm3JHHL1BQcD8
 naQaQSXsOdEAkop32sg+73E2sT0/MGt3iJtecSPdUEEgv0chZViUdqboCk9ueIHJFCwD
 aTnZVLsKjvNb7RCI3MU7Q7I0gZCDowER5/fND4qVdmuHR9Y9mk7M49Gy/JXMCZUFV2jp
 lxmJjLdKO70fw1fkjgsPp0lwbIT9yKaWr0FSY0Pw07JBhyJ1HNMT5/cy+X523CM5Y8Wv
 +smQ==
X-Gm-Message-State: ACrzQf2s+03Irn8+vMN8vPzYtJAJNdyYZBEiOZMJCE1kvBystQaWwTSk
 fDvdLs9ixY7H5SjrtHmd3r+0Bp3dChjUZg==
X-Google-Smtp-Source: AMsMyM42oy8Z7L7n8GxAy2XmhTHPw6bBZ/rFNNWYSsc8HJTAVTXDPm1B6+FfQKWETR5uoJNrnFL3qw==
X-Received: by 2002:a92:9511:0:b0:300:c3b8:fa4d with SMTP id
 y17-20020a929511000000b00300c3b8fa4dmr6953758ilh.20.1667418354609; 
 Wed, 02 Nov 2022 12:45:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f24-20020a022418000000b0036ce87bfd0fsm5038267jaa.98.2022.11.02.12.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:45:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:45:52 -0600
Message-Id: <20221102194552.527449-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y39w3i4bdsPboU+grPwpG8K2OdfFDYMmz7HV50mT51Q=;
 b=Tp66gyy4N4eOfNCNHzDN0zVX7eMSBkwc5n1n9XiZ+FoAITHUTRIDWZSs9ygIElH2Qe
 sttTQlUwhh5KN3Rmgs1ATvNZnVF1DRFNtzchkhwMZ8566pIpksRfCTnhzgksdH7QaT4S
 XPYf5pPNcbLNoDgdUaUh8YaH26w2cxONoI5kwpPR94U+oOkd0trMOtXU3HspSZIHNWPy
 ea7+xhBUsXkFzUnDWzyIRcoHc3fPlSvwIzcyjWrvgxXyclXZBGcrpVBMR9gUdfmB6Ws1
 uRHyuHDamp6VTUvOPngZKW25nW3FPIVgAuSRGR3LGTNjLsyE+N01sylrGJBX7WfJO+xk
 3gFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tp66gyy4
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.55.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 380846e9f1..3edec5cc8c 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  ce5fd0d37b6d0ca57f144e22cd62bfec  DataProperty-0.54.2.tar.gz
-sha256  df2fcf00e7a57f0a6089f686f847527eb3c91ded5c419daef6d06ee4bb1187b4  DataProperty-0.54.2.tar.gz
+md5  8c8864a1dc456d25456b5c4de99a3fb6  DataProperty-0.55.0.tar.gz
+sha256  73ccf10f8b123968210438a1a1aa859ea6d5a16b4e1f4d307da7a81b838e79fa  DataProperty-0.55.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 1b07dc1bb7..0feef55310 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.54.2
+PYTHON_DATAPROPERTY_VERSION = 0.55.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/9a/03/44fb9094c4fb8032f254eaa37b3b07db82fa35779ceca097b3cde8464749
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/85/6e/627eba99858c486c5b82468e4aaf60808c2e35d1bb768ee5da712b6fe9be
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
