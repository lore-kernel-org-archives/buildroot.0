Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B4BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0DE240481;
	Sat, 10 Dec 2022 17:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0DE240481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lsb5xBFFwuM; Sat, 10 Dec 2022 17:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C2C40436;
	Sat, 10 Dec 2022 17:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1C2C40436
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF1691BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAB0E40436
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB0E40436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PE7yH1zeOxOy for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18BF40376
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F18BF40376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:57:36 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id b192so2384445iof.8
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9yC/abCsx5dmEJ82/MdpOeME49VYNnH7PKNFnohgoA=;
 b=VXZvIMYQlQ10POLlwUHZE8LXerNxSwSzUMwj/SfR1XBCeq3y54VTLKKQm+0AIAsH57
 fa3S2BHU0j4Mc8BWKbTW87NosWiY5thnaIKMsFQzmf5wAPUtPVoclxqut196G7QDzE3/
 Net5szNQz6rvnhCuX0BBaILx6CAZY1uJLscoXDkIjHpCX9kIa7ttBVQBDTeuBDG6mEz0
 mgo796Cp1g8Dv2aq1slgo0QJcXPZOMoFEcrgLvjl1VsDV/a5QdGTeFZ7OD99GotSe7dZ
 BfAhxU87l7RD3Mq2kUf5nz07v9lxvxHMaC0cU+NInkasVJblamah0Vnvz3dficWSGmwi
 9KrQ==
X-Gm-Message-State: ANoB5plBFXYxaJxZE3/5oqlwP+2A2qAuNkm98v5llPSU06Va9TPufowx
 FfeVfAWaYgrZLaMLYpkl+Bo0CsdLiYuqUg==
X-Google-Smtp-Source: AA0mqf7Srt42LGFXhw9rzvlNVQAw+qaHKLPgMHucBNQajbaUhWQZH+flqE6Zey/ztCx2kglNEeJJPQ==
X-Received: by 2002:a6b:cf0f:0:b0:6ca:6cbb:93f8 with SMTP id
 o15-20020a6bcf0f000000b006ca6cbb93f8mr5712534ioa.14.1670695055924; 
 Sat, 10 Dec 2022 09:57:35 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y7-20020a056602178700b006dfa5af69f5sm2041390iox.0.2022.12.10.09.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:57:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:57:33 -0700
Message-Id: <20221210175733.2816483-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9yC/abCsx5dmEJ82/MdpOeME49VYNnH7PKNFnohgoA=;
 b=GbV7clnVkPQORQAhuYMkVQywjf8YOrEPPP6rdbGQ4u6agKK67QNOFUdU/HlaciKtOJ
 rkUh5eeP3xg6PwSvUBIWVIbwtWd/9gnUZ/dEkDrPY4Gj1hz5NSDh3r5P7GlCjPzjczlL
 KHR5u2dF9o8sgHTJXsQy+HfVXrlNoxKLtmuLQM6aO2OPClnYLHI27LdUYDh5LYrxtiKl
 mf7gIhtipMJ9AoWa7zD1YcK99++fe0juKAt2lUK76Dhe1qVGgyxExOC1GwWMAvriXZja
 L5NgSKxThcy0CQmMausbEthSTBLE8nNiVDKNb0gnIbQdbhh3rr8Kzs0nrQ/4f8x7filg
 S6RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GbV7clnV
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 2.0.1
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index b5fd1fd7b2..4e9e96398a 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  1d73a38c1c0b0c7e16ec17d6a19f3652  greenlet-2.0.0.tar.gz
-sha256  6c66f0da8049ee3c126b762768179820d4c0ae0ca46ae489039e4da2fae39a52  greenlet-2.0.0.tar.gz
+md5  8d0f10b807144a86b54841cfab2620a9  greenlet-2.0.1.tar.gz
+sha256  42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67  greenlet-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 42bf7970d8..232e2820f8 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 2.0.0
+PYTHON_GREENLET_VERSION = 2.0.1
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/23/6f/f72865c589d0c79f03b51520a4cdd65647de0513e9ad107a5731df89c235
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/fd/6a/f07b0028baff9bca61ecfcd9ee021e7e33369da8094f00eff409f2ff32be
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
