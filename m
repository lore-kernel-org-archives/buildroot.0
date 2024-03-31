Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2240CC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F4D82234;
	Sun, 31 Mar 2024 00:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTyQ7BKpbOeJ; Sun, 31 Mar 2024 00:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BFDE82235
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFDE82235;
	Sun, 31 Mar 2024 00:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622011BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E119E4064C
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Wl8WhduJHhn for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB12740643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB12740643
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB12740643
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:06 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7d031abe8f8so104684339f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845725; x=1712450525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/ea4G80Bn+tzKw2w6IunQDRqdrtOFXuuAAC6fXvp7M=;
 b=Tesum6Otx8r/guKZBPQWVlHSHUFpmqvG5TLIHbPh9mR9a8mmwd2k6MoyFPPAm6TF4/
 bhfqMvO5lobfD8BMvBWVt22TtwZhXNpc/4ZiRtF4iC74Ks0KvSbdh8gTLoRS10XxrNVU
 zYF6m/BBPzM5JqT9RsS+D6+QvwGJKKREAnUQ+6WN7Ac+nn0FHl1tT4jRWPKWxrzW8jC2
 prTMzzV0/rgtqtylv2Z7wYWBw5GKvcmGA9QYJca5LwDtMJcfRivXOUJ1gKePnvHvI6oe
 UrMISQk6Zm0dvOJejODPGrFriZr5SJAev9WJsXsoEiJkwP0xOUwpfz8FDebLBLdDfCLt
 oeOQ==
X-Gm-Message-State: AOJu0YyuDv1PuZgtpB+lPch22F7Rvf06oQvvXyH0snSW2Zas4hay2YNe
 B/8GvOQwYfVSU8CFDe+9uEtg6S3jny9qgCTST4i68dmPSBP5is0dwkp53tCegmYkQA==
X-Google-Smtp-Source: AGHT+IHogajFGy39+18KoMJmojmZTWvYG8EuoAlRW59079dkH5AzPURCsNoxzy0loUfKCX7uTwnELQ==
X-Received: by 2002:a05:6602:3282:b0:7d0:665e:9af6 with SMTP id
 d2-20020a056602328200b007d0665e9af6mr6451264ioz.9.1711845725583; 
 Sat, 30 Mar 2024 17:42:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:27 -0600
Message-Id: <20240331004133.636618-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845725; x=1712450525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/ea4G80Bn+tzKw2w6IunQDRqdrtOFXuuAAC6fXvp7M=;
 b=g15DzqCeKtPDSOC/jsyn/ToH1g40l0xFP6RYqWm86ZR4js+SNWnc6TOhQEyMqCF9uo
 EZbd9fXZrCcf8A7FWulJNC6g2V3/P7P2bUyKTbXo4BaM+qbGifjATlPfovYmQf+qWxs3
 WuwclL883Ma5Pfh4Eh7oEz0Vu6Xf5+arFjN31I9pIuy5vxUareYnmDVzNsZAmjuuU6XA
 dsCEAQFFgUsDAATrDdTEIQuqMjGIv/4wyanL6xYlhu/slDDQ53Efkm+EYhGjdusVmj7q
 NBb7FZeCP6CdlXbdWqhde/MbBKmPJdzSIe9b5xeP12ZNc7nqVLfcWBahEBEJvenbLrNY
 9gQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g15DzqCe
Subject: [Buildroot] [PATCH v9 12/18] package/python-sip: add missing
 setuptools dependency
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-sip package requires distutils which is no longer included
with python but is now part of setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sip/python-sip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 3e015fa16c..392928f01e 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -9,8 +9,8 @@ PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = https://www.riverbankcomputing.com/static/Downloads/sip/$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
-PYTHON_SIP_DEPENDENCIES = python3 qt5base
-HOST_PYTHON_SIP_DEPENDENCIES = host-python3
+PYTHON_SIP_DEPENDENCIES = host-python-setuptools python3 qt5base
+HOST_PYTHON_SIP_DEPENDENCIES = host-python3 host-python-setuptools
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
