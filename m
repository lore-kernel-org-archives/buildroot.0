Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A4A40483;
	Sat, 10 Dec 2022 18:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A4A40483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQ95JZrzpOyJ; Sat, 10 Dec 2022 18:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A32140436;
	Sat, 10 Dec 2022 18:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A32140436
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43681BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BAA640436
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BAA640436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nOGe3xjvJ12 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:31:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F6640239
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F6640239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:31:06 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id i83so3751296ioa.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5YjEepZiwof+WwkaAghEboa63yTjnnNLnwNWL2KoVIE=;
 b=V/prszlPjH/HfEWZmekrA3LYsqR4lFoFCndzXdyZ5WU7UwQ+L7GK2kWajZ9DhyiZk0
 m0+MGlin7bfZfpQS17Z7hqGWtlKhN77S8xmKsyVpO4wlvcvoSzkg8HNNxzQKpEkQsWkq
 MZFRu30Zh0A0sMyfWoEndL711d0TR6/9eRZs3S0IWu6rU1ylcbuDzByLU3aHprShsW25
 G19rej+bJtt3ouDQv5ZcB+Fl8LyCNZr4ED30Se/3cGyvafbR4XmuYyVQuLHonpjdVA3D
 5Sv7B4uZVKqORW+BTxV7H/MazBxgp0wq4NuvBWYCQ60CMtg9mpZW8b51QZMPC9egbyIT
 hQxg==
X-Gm-Message-State: ANoB5pldyWfH6/3oDVi/EWmF77Uvr+DFn1J1THpySqSCHO0/9KCpJt9O
 Yhueqo5akwUsgOEgXNE2NZwaxzb4I62n1g==
X-Google-Smtp-Source: AA0mqf45AgKxZkGXBpIP6DKU+XGw3b4WqukBsZoeY850vhkH03QtiTmhN+4FM6NkM19NIcop+s2qng==
X-Received: by 2002:a5e:d91a:0:b0:6df:ed05:c6fd with SMTP id
 n26-20020a5ed91a000000b006dfed05c6fdmr5707381iop.10.1670697065549; 
 Sat, 10 Dec 2022 10:31:05 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x5-20020a056602160500b006e2f034e7d9sm522280iow.36.2022.12.10.10.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:31:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:31:03 -0700
Message-Id: <20221210183103.2907564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5YjEepZiwof+WwkaAghEboa63yTjnnNLnwNWL2KoVIE=;
 b=aFjL87dOwbrV7eXJ1thmoTZ+1LQZNpSzqjeRMA68E192C2SS99fbtUopPmlJldejAU
 fTBlimIPlUAwBpongLfnswiPiVjRRni+63pExYagKMEEUOTNZ8xXzxlCb2lMJowcg5X8
 QoF5H3wgi+ujmcKEaM0FeqmgsYlDJK/W6A4rvrp/0fodVu/LOjuXfdN6xT2o0l5gpQ7y
 fATYiY3HL3OMBaH/YXsdSZi49hageeDBbwOEg3EwjC1AHSEe6tDWv7A4gh/627z4B+AU
 M6rfZNR1W6N82e7MVFC52JwtU1QBnePmNb5ycnrg0kZE0tgCltcl987PTo8sRDCC45PH
 7S5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aFjL87dO
Subject: [Buildroot] [PATCH 1/1] package/python-m2r: bump to version 0.3.1
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
 package/python-m2r/python-m2r.hash | 4 ++--
 package/python-m2r/python-m2r.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
index 0770e0d1b1..4bdd7160d8 100644
--- a/package/python-m2r/python-m2r.hash
+++ b/package/python-m2r/python-m2r.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2r/json
-md5  8bdb45c19e2b59bb5ffb9a0348e81ad8  m2r-0.2.1.tar.gz
-sha256  bf90bad66cda1164b17e5ba4a037806d2443f2a4d5ddc9f6a5554a0322aaed99  m2r-0.2.1.tar.gz
+md5  255d080f56eb3d3a82d95194850c99c3  m2r-0.3.1.tar.gz
+sha256  aafb67fc49cfb1d89e46a3443ac747e15f4bb42df20ed04f067ad9efbee256ab  m2r-0.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
index 47fb154c68..8a4708f128 100644
--- a/package/python-m2r/python-m2r.mk
+++ b/package/python-m2r/python-m2r.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2R_VERSION = 0.2.1
+PYTHON_M2R_VERSION = 0.3.1
 PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
-PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/39/e7/9fae11a45f5e1a3a21d8a98d02948e597c4afd7848a0dbe1a1ebd235f13e
+PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/94/65/fd40fbdc608298e760affb95869c3baed237dfe5649d62da1eaa1deca8f3
 PYTHON_M2R_SETUP_TYPE = setuptools
 PYTHON_M2R_LICENSE = MIT
 PYTHON_M2R_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
