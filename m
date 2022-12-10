Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB22C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3385B404B2;
	Sat, 10 Dec 2022 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3385B404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXm8MkH9m3d4; Sat, 10 Dec 2022 21:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77C97404B5;
	Sat, 10 Dec 2022 21:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C97404B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 649D71BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E8974091F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8974091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxIeV00Q0ZOr for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:01:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D274071B
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27D274071B
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:01:16 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id z144so3890395iof.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VgFdLIZcd1nggDn+1esbzjYs7LvcQqEuZBLXaU+os4c=;
 b=mds/ViUWZbvFI6Qz3UfwA/SrZ5vhSM+byF9osAOvPd/bWzH8uM71SOrQoPcahDmG2j
 vIsxQhhLKdXqUnEE/lNA7EH7vTzvBSY1mMP34J8BWyElyIH3rp73lsPu7JFwsEU8dWWu
 OlSokgQ1RkUQ6EIpd1W6IOj7uchYKpUd3VV5EhN7lhWMnRB7cuf/cBke2F8nK3Dm5aff
 Yz90vGCf5jVrQxoMYgXTZ0slUyxeZGrj7+ji+IYwyY2RTwR+YAujynIRNaLul8LMXOlc
 TPF19ryetUXr6KfHsY9JqbIYjLeSTaFZDp6U51JH38MEOK5HV3rBUCHscFZub8/BzaaR
 kOtw==
X-Gm-Message-State: ANoB5pn5cS0gXSXnkgR2+ahhkh7rt167jm2YqyuwXRAGBLSDjT5Q6xA3
 riPMjzrKRHHk0l+22YO0YnIVpMd75Hzrqd4U
X-Google-Smtp-Source: AA0mqf4nSlzmet6LBtXixZjf85PdEu+SFZbQNh+TxnNPTHNHxsPrtav3Mapzi8/0DkTlejZaO6hlYw==
X-Received: by 2002:a5e:9412:0:b0:6e0:2342:a401 with SMTP id
 q18-20020a5e9412000000b006e02342a401mr6243778ioj.5.1670706074988; 
 Sat, 10 Dec 2022 13:01:14 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p11-20020a5d8b8b000000b006dffde23fa9sm2153951iol.24.2022.12.10.13.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:01:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:01:13 -0700
Message-Id: <20221210210113.3642706-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VgFdLIZcd1nggDn+1esbzjYs7LvcQqEuZBLXaU+os4c=;
 b=EOZU4xqZdg0GsVsq2UAvBpyY5pNc4SYNwTo9CN3S9JS5TEr5hsJhqIJwYMxOzys7/d
 YtwzX5f4JoZDDhEtOK2GI5UB4xZS91PvRdKeD0coYWnNpRE2S8LI62/pGxBXN0iCh96r
 tgV+pKTwyYAYqG2JE85iFzVEPFqGaGQDL4MF1xsqInmdfmPhop0+WiyDs0jKBgo7FAba
 Ez7/Xoel0bRGjkhBiLgazDWciONRKFf0yWYRWDrvShNSFsXbbSreRxfUcEBC0yBBPQGQ
 3Vij0+6kQXdCQ28S8d2IHymVtDwHGWLZ056yfIDIlnIxNknhpQ+G4L9E9P0Wfduc0Dmw
 FGLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EOZU4xqZ
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 5.6.0
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 27df5aa355..3dfc681167 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  73b42e3f4bf3130073cfffbd82608275  ujson-5.5.0.tar.gz
-sha256  b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780  ujson-5.5.0.tar.gz
+md5  45a74680e2936470821bf74a8f043a71  ujson-5.6.0.tar.gz
+sha256  f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04  ujson-5.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 95cb0ebad1..24ad4822b8 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.5.0
+PYTHON_UJSON_VERSION = 5.6.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/6e/4a/03ddad85a10dd52e209993a14afa0cb0dc5c348e4647329f1c53856ad9e6
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/45/48/466d672c53fcb93d64a2817e3a0306214103e3baba109821c88e1150c100
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
