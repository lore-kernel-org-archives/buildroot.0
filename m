Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BA5CAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D82B61130;
	Tue, 17 Sep 2024 18:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU8Wl-7emUmZ; Tue, 17 Sep 2024 18:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9C460B5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9C460B5A;
	Tue, 17 Sep 2024 18:21:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 980E71BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8665440139
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niBHEnkEpD8t for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46C2F4033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C2F4033A
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C2F4033A
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:20:59 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82d24e18dfcso233556239f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726597258; x=1727202058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQh+G//3sDJ+a3DA+p9J/9HPzsUFe2Fhh6H493taF1M=;
 b=jOT0vP8sGMP/paSa5oVT0SZORsWZFReskte9BVuPOSc8a3ZFCny4rAVEhmXmefSps0
 JwKzUcX/PSV1GJsc3FhCSyNQFcbdNzqHaQiscrKH3RUA4rHi8TLQdYuBiEFzR1vnZgQi
 sddQsMnr1+CuMLU32aW+SpFFcyrfA0JThsZC84PGrOV5lJqy8cIlEWHttWzCbV2gxa/B
 MrsebTtsXhqzfVvcTuK8ePTpsIRjgT9+09y2RwMrUk4dk8qtEFETDbNP7F5zL3M3zBfT
 BYkkkaAXLRSowQP34wpCi1lh8Tkc8t3L4VhwWSo4cbCo/4N/eAaeeNwOusm6fbaF3dxz
 1MxA==
X-Gm-Message-State: AOJu0Yy/gMZMTg2E3LBF6qLBF5tsWakObYW5QnQoBRRBoUGHeiRVNVTD
 9bYkDNdwpCHyxYVkpZlsCii5Nk4aFt8vOQAJA591rZDoouLN9T9BMGuKUQ==
X-Google-Smtp-Source: AGHT+IGgaK9qN8M4xpIw28VmASb36bxIKUsE+eQUupUtuxxvHIUEgX58ffPoyFPht1eIY0UtWHz7cg==
X-Received: by 2002:a05:6602:13c7:b0:82c:d67d:aa91 with SMTP id
 ca18e2360f4ac-82d1f8a7fa9mr2243835339f.1.1726597258034; 
 Tue, 17 Sep 2024 11:20:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed4b52bsm2100141173.154.2024.09.17.11.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:20:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:20:56 -0600
Message-Id: <20240917182056.3870161-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726597258; x=1727202058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FQh+G//3sDJ+a3DA+p9J/9HPzsUFe2Fhh6H493taF1M=;
 b=Hy5CZTWx8djOByVxbiwCKh0jWsnuzPf4ivFBhaw0RJhUv/zMrBMMob3uaWIuMYVKY9
 xo65Zb4zgSt/xvVw8NHYvmhExDecMz6Ne3nxUfHiFJ0SIoUIVgHpSbtNfNbLgs848Rg9
 KzOOFGCI42I8OU0rBrhcdoB6VRkhbBcZLneaGlq1Dh3u/ghb60c4MAV5jkIvIbufvINr
 IN9BHwB7hOx4Ng9+DIy1LFrDxAYJYSd2cQWcq77DTeosZFfNXD/TLS401WEdSLoJZ1QX
 sz/wzMa9CxBxSva98pjgQC6Srxt/BH3jPrq//XdVOxKNj/hlGiqMnd1loqSLJW2Ftnb+
 tNiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hy5CZTWx
Subject: [Buildroot] [PATCH 1/1] package/python-parso: bump to version 0.8.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index 67e77a162e..83224a28bf 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  7ee251113f31f8d851c4a5d9e98977cb  parso-0.8.3.tar.gz
-sha256  8c07be290bb59f03588915921e29e8a50002acaf2cdc5fa0e0114f91709fafa0  parso-0.8.3.tar.gz
+md5  f83b2e4164f6589ccae39b16c30ed5de  parso-0.8.4.tar.gz
+sha256  eb3a7b58240fb99099a345571deecc0f9540ea5f4dd2fe14c2a99d6b281ab92d  parso-0.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index ce1d3401ff..65d10ebfc0 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.8.3
+PYTHON_PARSO_VERSION = 0.8.4
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/a2/0e/41f0cca4b85a6ea74d66d2226a7cda8e41206a624f5b330b958ef48e2e52
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/66/94/68e2e17afaa9169cf6412ab0f28623903be73d1b32e208d9e8e541bb086d
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
