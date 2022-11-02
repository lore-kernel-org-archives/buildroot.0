Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84365C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28EB740930;
	Wed,  2 Nov 2022 20:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28EB740930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eq6xW4RvUE41; Wed,  2 Nov 2022 20:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45AF840A92;
	Wed,  2 Nov 2022 20:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45AF840A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9E5A1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19D14168D
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19D14168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHgezuwSPxFY for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:44:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C02C04151F
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C02C04151F
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:44:55 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r2so57811ilg.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EyJGuxQz2MBk/DBTdhBpHhiLyL27qpKRWYUsOWwrVEU=;
 b=mww35y1OCDmtqRThRdNijGbZFHll311M3W2doQn+YhQHugSOjN72pwR8IreaxQwe2r
 36TPTNk+7qMzSTNRCwJ3Ya3XthZQWcTxJTDsqRRtvlFjMZEb5ioz0aHk3YKKbyEuTnG7
 CleiOgsj7McqB7vooE7wTh5WqhlcfmmAtM7aXo/GQBcwHpS/2L2m6edACP+5KuXiM6NX
 oIG/DWj2zuduea0LtfLdKUogPPSsNbioQkn7Xid8zgojBewYvRwxfHBSqSFoNLplbZ6q
 fGWDXg1JwEbVW96uFBTgR1gUkKCj5k+tYQhbASiY6gvOWjM/+VuoHYn4B3QBh82lEkAO
 /gRg==
X-Gm-Message-State: ACrzQf09bXSWIyL0iyChhCugiwh7o59UmORmMr1JgeCQG7CamOxx/mNw
 t0jN1rCAIQ5KLRQvKb7yBtPiCwPcdaDZ5Q==
X-Google-Smtp-Source: AMsMyM6uq00FEp8Ph0WZmdnQ2MPIedhGtWD8FC6pXfAOh+mhQL7I7Z6G9Ks9tpF7zTLayHAflsALkg==
X-Received: by 2002:a05:6e02:20cd:b0:300:716f:7dbf with SMTP id
 13-20020a056e0220cd00b00300716f7dbfmr15884653ilq.280.1667421894594; 
 Wed, 02 Nov 2022 13:44:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05663810e900b0037477c3d04asm5040489jae.130.2022.11.02.13.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:44:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:44:52 -0600
Message-Id: <20221102204452.425914-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EyJGuxQz2MBk/DBTdhBpHhiLyL27qpKRWYUsOWwrVEU=;
 b=lyfWkrTBgtSsz30jGOpg/CDojuvOIWRiR0UfBTTHLLERiNMD+RJkQo7POnrsZubbff
 2AuAZeuUgWZbrEvhRWI3hd8xYo12ywbZ9TVk2rv1K7jAix/dc7jedZzMq+EebMC05gKs
 d1NtMcYIDwoMqoJb6zBCGploitujdq6XElmDR0nm0fjDW38RjCaH/SeDI0tvwCJ/4li+
 ZAl5Zhl4Mi8gA88DeYS8CzIy5ox6E6eEuQnACcjcV2s0gCe/25ju+R+fluoGkARAo2aH
 d3daCm0ugYaH1TOcT4MpfQMcsHFq9PSatgIUI9JuVGGQvDzbfAyJ8TtGcWWg7RuBduq6
 GCqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lyfWkrTB
Subject: [Buildroot] [PATCH 1/1] package/python-httplib2: bump to version
 0.21.0
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
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 2c5914c5f6..4da8f26e43 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  de7f5e3a4adb3105889867327bdd39dc  httplib2-0.19.1.tar.gz
-sha256  0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d  httplib2-0.19.1.tar.gz
+md5  b42f508585d988e77eac3980db1fd967  httplib2-0.21.0.tar.gz
+sha256  fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34  httplib2-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index a259c33c73..1093ecab39 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.19.1
+PYTHON_HTTPLIB2_VERSION = 0.21.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/ed/cd/533a1e9e04671bcee5d2854b4f651a3fab9586d698de769d93b05ee2bff1
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c2/37/a093aaa902f6b2301f0f2cff5285548dbc4ab9b9a29215eb440381cbb32b
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
