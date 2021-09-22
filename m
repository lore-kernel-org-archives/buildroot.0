Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1B161156
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A1B161156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3328F40703;
	Wed, 22 Sep 2021 04:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1al8iw1GiwA; Wed, 22 Sep 2021 04:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B38406F3;
	Wed, 22 Sep 2021 04:25:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9E351BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6B9E819CC
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryz-46ZP4GMf for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:25:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D9FD819BE
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:25:12 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e82so1535255iof.5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N5Y0ZcGi0uFcjljMNV6Ybdr7yDgf1LHc2ruV9UzgVsU=;
 b=XW899OKWItG+MXjwQ2jpLx1VVbEA0axM8zl3W7QuEvhGYjWRitaFsnbz8tADlDP+Wg
 jqtAg36loD1LE0oLFTf7fiLjsggiPuSz5bZ9pY2AJjmTfbAaZjrjlefzDSfXAXCqHD8v
 ateUpMERepWiluot9EF4Z+ab/kzshaLPKswfYar7weHblJ2u0gbUK0XMRb0MCpPodBh3
 /NddD3eNeSOSePA8MVrrWLWvjq/r9voNhmEMDYaIpszUHdUJZE7d8qWZOi5MoDvxOwjr
 mmMvm6LveQpBW8+3GsIiBS+RtjfTOkWcZEs12Ecrl+RRImQotclQQFoQVo4p3ab75ybL
 K95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N5Y0ZcGi0uFcjljMNV6Ybdr7yDgf1LHc2ruV9UzgVsU=;
 b=n4CjwpoqR7oA/9rMyZpXWFb5U4/R0AzqT/iW/SDGm2OaFV72ojlD2Rc9aaolvCjWXK
 Wrp33srxlUUpdGI3dg6tcDapSneCjBtEe0ZMPwf18dXsL4xvlDe4vWlVDhJXw+cHQNvK
 mBA4ESYRtZSWVR62iOTH/DLeV4xSZBjDi1BAhxK29TEApZz2oLyrF+P3ayt4bzj62/yv
 ZPcsyCKVXE8J2IF2VVo/73fFIPN8SEcpt3bGELwO/F0u3ncOgOwtU8t+h/6KSyOqpPHr
 pebYjnSG1qRppp+DRakcE2MIWM/3Avuls31Vwb+pbQ1BNKaJ8+tQAbUYo8ufV1pbdi5W
 3LeQ==
X-Gm-Message-State: AOAM530uVawrIvXT/Dx2MeK98rm7nyoPxM4geFifjCP6jsCm1lhCQRzT
 CzHyAyDIojpkB/+p97McCxfbaQ9ChBY=
X-Google-Smtp-Source: ABdhPJzP9hR3yo2EqlLmn7IaATyPI+DvRXCl0aIwX56wW1o2xmIMW7D0ZqAM77HWrIONoIGVsP7OGQ==
X-Received: by 2002:a5d:9319:: with SMTP id l25mr2822878ion.208.1632284712001; 
 Tue, 21 Sep 2021 21:25:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id l1sm460045ilc.65.2021.09.21.21.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:25:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:25:10 -0600
Message-Id: <20210922042510.3528271-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: bump to
 version 1.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 44e2ae463f..fbf244e470 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5  d474a6440ac906a9d818a03a540830ba  aiohttp-jinja2-1.4.2.tar.gz
-sha256  9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0  aiohttp-jinja2-1.4.2.tar.gz
+md5  50f74689fd60a5bc0b0a74545277e9bc  aiohttp-jinja2-1.5.tar.gz
+sha256  7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b  aiohttp-jinja2-1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 724acdb601..371b4f0b3e 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.4.2
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.5
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/da/4f/3b1a0c7177fdb0417308a95bfa8340f19cf84b44f8f2d734cd3052f56644
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/15/d7/8bdbdb65e2926de332d3c430839d655db61d30a7b5a4a9b2edafbeb3aa20
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
