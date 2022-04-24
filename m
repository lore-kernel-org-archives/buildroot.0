Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEADC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 21:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F3681BB4;
	Sun, 24 Apr 2022 21:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVPxYyyxAAWD; Sun, 24 Apr 2022 21:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A2881B72;
	Sun, 24 Apr 2022 21:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5FF1BF470
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C0740196
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ns2u0WBObw7C for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8522C40179
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m13so431831iob.4
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tn8n+1hjcwsOcAzeQ/cfPd3vR7pG2AUyBP7qWHq3hm4=;
 b=Tw2Sd1m9AbWSJhuJkjqWUko5HDAtZUg4D+iSj7wBYwjrSnx7IyCZSXuIM1DSE67uJ1
 UBz+/mE608UgvKA0rJd3BVxfzQ6PN21xlLFZjB0wV/AAEuJ064oWMK86O1UzuR/ftYxD
 XKQ9ZB5WQpZdWhUvMeSJGZrGRdYY6cRCGGxiNZbGnayk7eNfp13cF0a0V/UW3TqKenJS
 5s3wAMl0d19H8I80LUXTg6mgfxhzqdHy2d7mwy6N8wIFttK/n52vapK0jwORb0isq0AS
 6bA46baEjhN4mw734mwDv/FdWo6Qr8q/EuIG40+NmwqSD76iWrLPGLNCErLoag96/W5Y
 /QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tn8n+1hjcwsOcAzeQ/cfPd3vR7pG2AUyBP7qWHq3hm4=;
 b=UaGKrK4y2jDMXUVdhhnHAitUL07vrgAEJAwIehtk/+EV9hwEV2jVuwBt3RpjkrRGAv
 Y9NXmVF/WittuT6/zerK8FZRTv0kwVnHiMs4lEA0fLwzDBj5JNCHSURQBD5OcIJqtzl5
 rOLLSkHwKwDX11Zrnlks79g3g7p7ONUra5Z3PnKV5AbK70SIZN9cHBbd3pdZVOxun96y
 GrrvRjWTYKCDJMcJoOEBFskaGQFcpMTc3oO2VUB7oYviGoB7mZbEN7sh74D6TuQomJlD
 zzRfR5noWvV3bME3WTcCytgsz9rxfDAPWwbzANSNU3nTcPZsUyjpK4fMt8dlWhed0arQ
 jeEw==
X-Gm-Message-State: AOAM532zxQq/wrxVeSFbaC2K6SSinamMR7Inybbvz3f0pHJq0PRIhOiW
 ORqzBBxzdL3KoEycTaD0qzBtAyc2GTn98Q==
X-Google-Smtp-Source: ABdhPJyHHKSomIVdz/oMXjcF9JOAYax01u0ID6c1a74DQXqdgSqRmwBdCX/CLpKlNcNcX/uRk8oPoQ==
X-Received: by 2002:a05:6638:62d:b0:32a:ef65:fc85 with SMTP id
 h13-20020a056638062d00b0032aef65fc85mr685782jar.176.1650836407535; 
 Sun, 24 Apr 2022 14:40:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm5385084ilk.30.2022.04.24.14.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:40:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 15:39:58 -0600
Message-Id: <20220424213958.1747120-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424213958.1747120-1-james.hilliard1@gmail.com>
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 5/5] package/python-pyparsing: bump to
 version 3.0.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires flit and must use the flit-bootstrap setup
type for the host build since it is a dependency of
host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - only use flit-boostrap for host-python-pyparsing
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 1e56e878a1..e7137d55c9 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
-sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
+md5  971252e99e1e02a4c27f001894e0422d  pyparsing-3.0.8.tar.gz
+sha256  7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954  pyparsing-3.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 2fb705bc7a..7e458042f5 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.7
+PYTHON_PYPARSING_VERSION = 3.0.8
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE = setuptools
+PYTHON_PYPARSING_SETUP_TYPE = flit
+HOST_PYTHON_PYPARSING_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
