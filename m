Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA9CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67DC780E01;
	Tue, 13 Oct 2026 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBGTJR2LoLZB; Tue, 13 Oct 2026 16:44:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4111180F14
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909841;
	b=F2zfDlZ7e+PoC+h4h748SQt/9eE84XOAuC3OZatDvd6Iond26Qswpx9EG79tycs7JDZ2
	 ow/cgFnAMxak44M+Oanlbiz0j98TtFEDBI9hG956224DO8ZMYJ8GIcxAxveB99aQyegVu
	 7kiJosmBai09X0ouxxUFtmYIESRvUdm9p8tmouecz3r7PYjZMCSJIqJXgtfuWz+9SLi8D
	 9YULxQ945lA8h/HO24OVYAxB1gnQdVbH2LcON8y44JHc+4ZATPaaamv/Ac4gDoFk/FGG8
	 o3OOfV1KPzGKg7qAnuqvjeAm/hH6msMXcUVw7zZtoX6axIwfiTqbC5JAoFpPHyZySdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Dk3Nw5QubWATLa+RaLG4KwgDcTmrBuHtHU5DgyO5a4U=;
	b=ew3x0vIQLHZ/MwKmYnCnWMBADCxXKuydZNodL4QXJqV6HpkCZnmPsq4GM2R/YqYw5E0d
	 mr/lkILEUZt1x2XrzkZCnEj0u1Mgb1Y75rBOVsN8gDHmXW23Fw6KinuVr1s7BOkzNuIgB
	 NLSzbn8M9aK/tviuA5gVHsEjqXIOLAr1w4iPv88SGs2McoIvC+Eb1M6ey7PbkuT2WSTAO
	 9DY1yIH3Ygd1eJsux+VKwbkp5sE27qkFQIrEcSxmGeiRrjCCGHAgwuXtO6IAf0b4qQdnc
	 PLH90zm8wkh2KLoBqPaiOQs9c0L/mM3hlRaJBfFa6Uw8AcrPBe//tBzlCC3xNRX5WOA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxqY7ke7;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909841;
	bh=Dk3Nw5QubWATLa+RaLG4KwgDcTmrBuHtHU5DgyO5a4U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JtOVHm9ep+e1CV6bQtemfCb7j9kOYdszf9KupUrFnpaBz2qZBufpsoI723+SMt6fO
	 ThwoqGjNlvwQlP3+jcnx2kd6Ac59jIiIe39BP/Iquxuq4hqWfY3Iu/4RDtxt6lovu3
	 URgotelEL/6DcbnpUo1MlotJ+dHLQuAUsn+/vJJXu/aatl7zW2MhL+E/+lShU3oktw
	 6rL2+8UdL4EF4odN7pOV/cZ3l4EVeVc+/a4rn4sS5wGNma7oh2gCAEef3OOkqysJO7
	 MNmOjyVX4Wt3YqFs6qSiIlnG3yEsI2u0grZ0nLtqXD3bNHSphWBcZzyUBkyMFNFwAL
	 k1Mgq7chQss5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4111180F14;
	Tue, 13 Oct 2026 16:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9B341DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF8580CB1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN3cEDkEcHVv for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C030A80E25
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909834;
 b=nJd/kRYAp0A2cBjk1othkVaJcz2s04mKPP6FLCSpqivzH8fV2QaeF7Ms0E5628I/HFPM
 +jrEhRdOD/oaUVCyxYIyxDOfeH+keGlMf2Yc5M/p8sALjROhQbTjz8eBw+SC/Z5wVCLs9
 aiH2xvABL7sJfWQuhZ7D9daZy3bodDDDUB9cLJn501bOKECnj9PzZhTCZ5VBC0ucejaIi
 F/r6sbWpA4YmWDCOmZZm8CTV4DlmEyrkbCh2EOGJbb4aslypU+eo05xIkMcddlFO5vzRW
 IbJoKigsfQKdxIh96GvPpDtFLU2CBxQ3aJez1ye2f8EEdqyjryzLv++XWcHQ3vPQAPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909834;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HzMWkgCzYte3//2B38Y7+r3kME4efhWEVWiCDwN+UvI=;
 b=gVCR4GXze0kUD6MDu/P02AqjQn6as4pLP+G2xmcvzQWn4OYmkEnnWD8494SIKqzyWii8
 BUngDRlIqloSDbuQnhE11KB+QcQ+N3/IIlJEukvzdiS+IBVxiKPNQUaAzUm7qqUKLLm+F
 ttPJAc0JhVPrgaf8C+QtkrGAz3utRGBWweSZnUgfZNdF7RO9T74mLe5ZnIE0UbiWjKVe2
 PB0j6bRf3WP9fLYY3tZjcfck4/MrXsdAyjNstnU9TWP6bbKm8mA/XgqHkMHRnkAFYgnYK
 h+GD5AuKnCnZq6yOMJ4qpXqxDfJkJD3caL/XN9gao/btASjDEi8tizd2cOYlIc27Dbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OxqY7ke7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OxqY7ke7
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C030A80E25
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:54 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6e560e00a86so2460976eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909833; x=1792514633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HzMWkgCzYte3//2B38Y7+r3kME4efhWEVWiCDwN+UvI=;
 b=OxqY7ke7KHFQirPOd4E8rocAej9JEeLDp2yuJ/53KnrDDPqRcXk5JcxfMPTXOcbDYe
 EMDe9IyRbQuoAQcm2Xp801b/O4tKWicjCYu9mLQcUzVpsjrigxb4HzR7ii6E1wWCuch4
 3BOf4Q7HzVP3PFGobo2GJwq0d9almeOjignF80CHwM369Tb907ooLVd9HtKQ7C7UbMVk
 yALUVvF3gWRRYif4VGMvEj5uTKg2lfaTCZFOwgcFrN2JrVpK/ZWzR20Kewb5Eig0Mh/m
 AgMWLLvcjw+UPgrLoE0e/K3PE71FdUMOk7LvctzTdEsX1iuA3ktL//0cPj/Is/MHYM92
 T/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909833; x=1792514633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HzMWkgCzYte3//2B38Y7+r3kME4efhWEVWiCDwN+UvI=;
 b=0pSDNzKF0CZDUvGV1Se84XK5lXwvUccMO+bSb5Q0eD1+ZGT5tOEid4mJZ8lfdcJbzf
 wGpwL1z/aPC1XQMceU+ZOO+GXRVydDP5Pk7KSa7VFl49OnAX5yZCFWNmQeeCZDCY9w8g
 Z1BAklWkBTvkMTLzQeCosd8aBsUx1Mkth3nkVTba5EgMu8syA3+AUSXH/9AnHtZX67QF
 XPDSRUim9Ngr/7imD1zp3QfNX7cZDPjugQqmW1WwQmTqTm+SWptG5qZFaaG3dAmQcm9D
 tWcKTmdZY1mxriwhJqKW6UQ4eppoqpLLYmx8Pspf5IkdwSYf1IKA8dEyQjB41FqbjRJL
 x71Q==
X-Gm-Message-State: AFq9FYIxEV93z5fAfoULOiQuzJrl8Xc6FcPeOdJl9MhwrR+en9shGStq
 zcLTEUJwTFLX39/X7l6Kf+DkP/Y4rFUPhOsmFGqzo+GDgt+n4sJkTVkbC8m6TQ==
X-Gm-Gg: AYBFou16VaDNysNzbgv4Fi6nUDbquTvEHa7+vpjZ2sermOlmb5KPSfQhdbyB88DS368
 hJMj4XkqQng/+W1SkPUi3/gTHIkBKoPlSzri7d4JM24uGK5Km3X1x3RvaSMf94NbdTgzzfzUIPN
 nvhfpgcxi7GHKZmnNVAW75sAbcDsjwiEcQOH+Dzc+nEXVKcVtVQbcWnJxqUr3jt3mjPgyBGU411
 k/i3a7seW03ZVbATSU2NDAzh9MidrUn+wHRc2O0evzs/TDMEKdBQtIH//wuUoxcvc5aYOjnbDJC
 mcXbVCA0f+LrOpFxunNHeXT1a7y8RDBnTpFiEurGBsTER7W+NDP6zS6v7wcH7OyzOJhlov6XARo
 uyTFC+tJniansboc5SjhX7wev4qR0qE+zo64mUgPcMQeNdqQNiAQDDXWczG8tCinTgQ8XYjAQM9
 NcI1L6LnMvmmd4WgquVkuOXrIizJutXGN22jKEi2xaF/ZVJF2VFSGCNfn28/WO1kV01m1rhIyY4
 KjOT0oCY/dcFC7NJHnLk7vyEaJEs7ezJjbJrsvYtikCdrjEwXdQR09uqEorm+G/IhdCzfE0n4nN
 vN/8IBjpxghTJgAidWcIGtPAhS2x3hFKFfDOuLTyfuO0Y0Q+N4BYRM9PeoCrspkJoUx2SjgOCVd
 E56jjq3JJsxtbXZ/7KNGMfFgl5cEl4Vd5979lgA/8FoQ=
X-Received: by 2002:a05:6820:2d09:b0:6cd:3fdb:fa68 with SMTP id
 006d021491bc7-6ef125f787amr8530380eaf.83.1791909833117; 
 Tue, 13 Oct 2026 09:43:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:21 -0600
Message-ID: <20261013164254.1476592-35-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-validators: bump to version
 0.36.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the license hash for the copyright year change:
https://github.com/python-validators/validators/commit/d3f0048e2831fba85e642cdc30c205639db872af

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 94825df32f..ba6d405e84 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  8376f37ec2028053cee8f4789dadd947  validators-0.35.0.tar.gz
-sha256  992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a  validators-0.35.0.tar.gz
+md5  9759d46d9816b23612196f0972818bbb  validators-0.36.0.tar.gz
+sha256  92ad9ed00bbed320b784cec0ea90b213cf08904cf605b3d0852cfa4108e32a2c  validators-0.36.0.tar.gz
 # Locally computed sha256 checksums
-sha256  43f5c5d4ed194818baae8b6e2d2d09e9630752392efaa4b3f8da673d9a1a844a  LICENSE.txt
+sha256  9567be0573324442d69eaf0b3e1e91c3f05fb4736b3202ab83eadbb4aff2f0b5  LICENSE.txt
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 3135b288ee..f9b208990e 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.35.0
+PYTHON_VALIDATORS_VERSION = 0.36.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/53/66/a435d9ae49850b2f071f7ebd8119dd4e84872b01630d6736761e6e7fd847
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/7b/3f/4fe7905f73ba0e768baa102a09ba9458f2f0bb4a676102e1fd7a3cb55c2b
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
