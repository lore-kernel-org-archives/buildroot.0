Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD4FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0541681F1A;
	Fri,  2 Jan 2026 22:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-aapDx4p_LB; Fri,  2 Jan 2026 22:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2229F81F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392565;
	bh=47/W4mdHEF0KQZhJRv/T4zUmMcDYtxUKoPZMcQmxQfM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M+B5i1e9VwUCOGgjwmx2/HlKwsaXSAqNpRY5hCnIpvhR0ABDCtpwT+e7QME8P3ik0
	 nUG8/G9ro+TLFKJttEK8iqRG0OuuhQk167/OejrzRXy56GizB6hs8LWqEoinq8zqrK
	 fp7Lme2fkXf+OJJ34j39mkRH3vUQD8bSg3Kr8Mc7CKw6DRV3bocriA+Ovw0Z7PxwoS
	 /ga4DfdIFr+dch+Rh37R3BeNQ1OPsFLDcL/HzBFpLkFGPJqxd9mN9ymZt28r4g9JXd
	 g0CWZMBxeWzqBGkIGdNcdhEoIJwtmUPTzdOXvYFl1GNihoYqoKjRd0OthUpjh3FVCG
	 utwP9TofertUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2229F81F1F;
	Fri,  2 Jan 2026 22:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8B4F249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F93240151
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liapNsa1GZDb for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A90A840072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A90A840072
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A90A840072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:22:42 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3f0d1a39cabso8035767fac.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767392561; x=1767997361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wz8eee+mjd/K2NtFztGVrC022NHmk+myu+yFj0Bb5gE=;
 b=l3Ep2KjVO9oIiIps3BA0iXVruYQoOjKKxmL45RYibS+Smly/5nomHVSXO/LZZ4+TMm
 M6THjLQwQA/kpS9WUQJJMMY/lzFj5C+SXrCaSY6KXJOCdb4WDFx7u7hLh0+2HkVnupsn
 EbG72k0Q3y4KpMG2uH/0+WGQGKlT5pL4uoD1isipjQq5O3Xy6ADyHR0AjvWh9ileKy4E
 3TSn3RsD26hPqF+CnZTI62Ehkf3SqtW5EP3z02j9HNw0pnkfF030/YwWk/dwfrdSVkhi
 hnYW4CTlYqWoDa+SL5FZmr0KLS8knGSpsahsUxwv27oA2uxpip5Mw5NBTwtfMqgsyxlT
 lOBA==
X-Gm-Message-State: AOJu0Yz0rImBj8bWD3lb1ouUXV8lNUgVNHs6xW+tRntk48SKWrnUKeu8
 EYpdSWyG0lBG47/P5M40mbTzQrafHB5unbhuBenNsp/SV43lg9keHJf2tFiP7vmqk8Y=
X-Gm-Gg: AY/fxX5ivcG6bI2nveAB7lq6il5UL2h7X1ano/drKwp6xaVG/Tsa7jkBEtkoFKsutZM
 LhQ05no85HZWOkIYa7NyQeVjORNx+rwQehoMTSVDT6ABEynfGSXDVsIFAW5wE4TYi7m/7GyD/nO
 1/U5VJTAimMXC0aJCNAl7g0Sp2uMW1UVADfPxzaTe6B/X9tzY01DQqE50NLAeeS8ZfiLDrnlzF7
 dM2N7T4phZR2XhSki9KCwa7kKnQBcKbG1epz3inZSVWacqzsYRUvo8DopawSx90zkUa2WCDLhgK
 k8LbzQhj5wJ80PpZVCSjO55oNQ0ohm1bB0CDc4nD54eUUdaRqh8/yU7RY6uPXZWFn5j/MXGHgrq
 xfQNI1tNE7LQOdwOX1FL0KpzXOc2RIb/StaO4t76mQsKpihiTgvxe+fOOKAD861ebT04PT24rc7
 stz5KtnAAUAsOAIOma3Vn9Q/mhZ90oKzizZLRMhUVS6RHQNDk4vjqO87XmGlnyNdEHAHg2t4OHv
 YcLKmHDU1lrCXpExoRXYqPfhGLWxORTIGMeRL8IQLwhR4w6YDTcSdg=
X-Google-Smtp-Source: AGHT+IG9g3duA/L3wMroRHjp2+D0/vG0KbFEZWWK08ukjGJR8jd6SRU6ojwd5LLyFfrfIE0jMt61Sg==
X-Received: by 2002:a05:6871:230d:b0:3d2:5173:7022 with SMTP id
 586e51a60fabf-3fda51ee0e2mr20561736fac.9.1767392561262; 
 Fri, 02 Jan 2026 14:22:41 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbd472sm25554029fac.16.2026.01.02.14.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:22:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:22:38 -0700
Message-ID: <20260102222238.458970-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767392561; x=1767997361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wz8eee+mjd/K2NtFztGVrC022NHmk+myu+yFj0Bb5gE=;
 b=Ofj/yHtLxiL33ynq0va50Zy4qRzGGyRaXkS0E3uFcetDf7KdvNwsiJxkmFJyswlqad
 mJdkpcdTv28n5VZi8DPFtgLwMnr1iRMYisf+0RIQPxivRquzJjtnmGJCWwQ0IyNVTwd/
 WEqwnTVPqDI7q0j1vY+xLtOTv47bWvU9kPi03U/hvOirpDO4OF15l2myAgz8lsrPyB37
 RZnOx5AfEN+VWHxK3nJCjxiFuVqQUnYQWRgM1wPNANhMRsfgHwA+eJbNdAyp4jyq2NUw
 9o9+PqMFo4C3tH2PeBHKsmVnpQKIZD7AY/cpfHEQHYHt+101Xv19KBalSW9bcLSWJ1JY
 3YVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ofj/yHtL
Subject: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to version
 1.4.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Esben Haabendal <esben@haabendal.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/nucleic/kiwi/commit/728f5661fdd021c68dac1b914b3c8610a46b2e7e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
 package/python-kiwisolver/python-kiwisolver.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index ded337b823..636d339739 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  2eb55aab42272292a732411bb6c79dee  kiwisolver-1.4.8.tar.gz
-sha256  23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e  kiwisolver-1.4.8.tar.gz
+md5  63d13da80a2420278c695d5784dc0b78  kiwisolver-1.4.9.tar.gz
+sha256  c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d  kiwisolver-1.4.9.tar.gz
 # Locally computed sha256 checksums
-sha256  238e69906d7e507a94832b9831131862c4176d58c002b388e2e99db5d83677d2  LICENSE
+sha256  cf20799d32de0eefa2ea904e3ac5122f47aed5d352930751eb61724762c49d90  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index cbdb5c3aee..2b81c60688 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.8
+PYTHON_KIWISOLVER_VERSION = 1.4.9
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/82/59/7c91426a8ac292e1cdd53a63b6d9439abd573c875c3f92c146767dd33faf
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy
+PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
