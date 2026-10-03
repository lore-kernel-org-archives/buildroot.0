Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E9CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9538440F88;
	Sat,  3 Oct 2026 08:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7Mf0GtLXiyq; Sat,  3 Oct 2026 08:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE2DA40FCB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017117;
	b=KPmKb06oCH/P/9JB1C6LoKbCoIAEmZDpC/aGJy81lJ9HLhjBWjiKmGIGgs/EUlCeSuGs
	 3dXDwJ9T6zzhgBAl4vza0IOGEvdwco+1TkvRbyRLoW1ZfpcrTW9rVreO432bbP9cAiu52
	 uFcPuTAD24Cq8ipj3J9cFbAVYAxMliDjW8Q4nPSyzq1adtT9LFaKNwuDaibtUC/w9CGJW
	 fsA1ZmqWViRl+L5bhCqZ2pvsvmCU+jcKYM+qvZ8W7n7BRlGJl549RELGqAv9FZCW90p5r
	 1IWMiPJGX1D6H1IHKqwQ7ptTsLtE9KxnmsxYk7z4qVH/v/3yGENdrjTFWKTCX6Hg0Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fuN4u+sFTZFrOD1k85L4dfldeL1vEtSwwR9c9ctIDP8=;
	b=UPEcPMltD00rovd/0FaQ9p7+LNJt4Ks+z9fLzIBC5339Pa/5prtA4JfMQV+amD49ZDE8
	 LyMr8bLzVaJn55zIz1UAALq3wUTkCUap2Fsl1IIQMgbL4zcTO875jpIRD2My7mu4qHkGN
	 Uq1ExGFd74AzmujCqfor1CRCq4ayhE0BMIMbgczI73m5U19ftxpZQZJeclCslBzfvLDD7
	 G+NgvLQV9g/bySNLthv2VwiykZZJ6tcm2pb8de+86uDZxiaRCpNuvdeALmAVYP+dVaoz4
	 aDxr21sfOhmyCPWqJiwNymH7wFjraGHTR+Uduo/vWiLMXKSUi6EhYk87vcRKVXrdoPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z7ITaqYZ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017117;
	bh=fuN4u+sFTZFrOD1k85L4dfldeL1vEtSwwR9c9ctIDP8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LqaffMPhNnOxieRSGVCqgQIpMlStWPox3iI5DmihjLO33+03ZrZvE/x9hDsGmDDKH
	 tOXh1PDwc/haRrHQUc+O882A/26r8DSnifmS67yLp+CINFya8ERC/XLRnA6jnhZurM
	 PhFFPHfw8vHbBQJEfrzfk/YZFRTP2zsxxVg7z20e2QYVeZ4FzIdoPPHSbQWimMabSY
	 za1KiA/XJWam+BjBra3IL8BoNfboVuTWWfnnR/kWcnItzF3I0SPxaMQhqHwrHwB8Fa
	 MSgr4MYTBAjFoVR9sYyG4GnkiAczhJ48xG0SithEUZicVsC4WFHr6Y91+b0zqhrD0k
	 E8DDS93Cske+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2DA40FCB;
	Sat,  3 Oct 2026 08:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B492E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0058C40FC1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNTBDSpoXZIG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BE7740FC5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017115;
 b=s7YqIx2okDrSjSas0iQeWkl1uRNio16ErAoajn4aDubyCop7RhduVgZ04pi6Ae2liaNN
 dvbypmnY7zLvf/cziA35868HjkAM8ApLqmApukYf/O08b0R1+l/e76gCCI0viwqWXn0I5
 wnZHU1Nue5q3CZsD7wYUbk6qhUE7ry5Fzm9DeECFEaw4E4TN0VItKYhQSkzJOE4m7STFU
 0tbRAd+ecwaVHGdsJ2eu1NLW6KaqEYCCJNjQAHqGHVU3WBhrk8mjRlzreWdV55upcbVfs
 at0yxPDMPytCJqGxEiHlTA+tkaKMoq3r9b/mEUcviyzB/m/6sL8fwS3INElAK3QYyLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017115;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Siv0/d3w5w7a/goGCqnZXUVJ8x32XofQLYu3kh8rYt0=;
 b=sb5BGRoO2KAXAO7Ohi1oGC101nh0mOSusSNswlKksRBe7bVeesbL12SBTwZ6bLe52opc
 VrzLXv2fGPf9NnLyR2P1DduiVOxiK2QZ/ujOMTrhAcbtlnN56JAON0V/XkYRBTmAXM7im
 K2MWMGH3+r++OpARbExvxB0+93Yz6Dsok72XjxeHzctQB9HOHqoHJktZILaV9T/e7edsH
 RUXaxppkzZNERMHs9tQGFn8nEhjdQk7K4u3QaxYGwuxHzdqEd29C8Wl73yPFJTmXDebj5
 KDTp6nLHrtCRx+sXbQmKqcnsXsvTPGANyQjTIgEiTovHq5QtB6cXq6POK9BtG7uHI1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Z7ITaqYZ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Z7ITaqYZ
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BE7740FC5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:14 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-82395ae2ea8so506523a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017113; x=1791621913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Siv0/d3w5w7a/goGCqnZXUVJ8x32XofQLYu3kh8rYt0=;
 b=Z7ITaqYZ1Bpg2U+zArqdW+1fg/pt8bndWA9vhFe6Lp/FCxbAio34g2s7gJHNqn/Ral
 K04bSjPHD/61KVgNLlIyMEsKcPq/XlKsgQRVy+C+nlqAw5cclpKD4vSMamIHihoLeXbJ
 /YI1B7rDa6MO/4rCWKCdJmarkkpHFYKMvtYENKAF88nHKIpjIVHnbcHplwSNf3GuMZBa
 JvdT/lbXhbFCCLvZkvUNp0a3LKlV25WlxGhtQw9mGMzGro7PBlFL1fHJ0Mn0gDKqyePu
 IUG+8TMeaZNoHTdW/q6ympJRTVs6nk0o3LWqoRSugg0PPr2Vg8ZSakgEfyDV47gUgrY6
 Mb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017113; x=1791621913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Siv0/d3w5w7a/goGCqnZXUVJ8x32XofQLYu3kh8rYt0=;
 b=ohgx3nXLP3RrJ+y+zsucr3bugPuBV5+Gia7rbxsZrpqvSi8ZI28tbpj1k1GdIa9xZb
 yLfL7WuCmflYzNi4ZXFXWUvVlzbSnEl6u11pbv6z4zAzcMWQY/QfIMwazls8c+GZblLw
 RchE9SsrqVZ9KvTKa/WXUFMQAPuctxFNRMy50MTYETSxbVihV8tW9Y+EpVCfH8BMYc/h
 abpOLiznY2EeJPagvaoPzemBBBEXFgtOM9SQ3aMhaZlHNNW6qt6791tiM2yFBGOqd3BJ
 maQwVD/Sj5MsntfCjaktqwv6sCQl1ZCmkZrMoG5OZrKkrUtUWq1uBgDsBg17NaJ66Ks/
 sJ0w==
X-Gm-Message-State: AFuF++moToLvWaRm3c5vs4Ggo4bnpmdRbjHlOSfQOPs8NK+M1J7EfIQV
 e2oT43aNgqgKWCmHqx/+Mv3l028z8sZXybdML/GL+54uWA8DExE8roehLGk/CA==
X-Gm-Gg: AYBFou2fy6AawpNhXccR0BFEhnrnxl4TVgBDCUdaEqTq+aOncGA3EzziucdL1mgZ8wd
 7rTrw7Wm6FtsEMVIa03QCztDqh6xpbI+/9IfDl8d3L5kojU8oGfKMmfUK1J0dcapo2lsfEfxbLM
 1wTbySoe7qCpMokeay8zIlqQYu+AS9pcThncWM0T3ykYGCuTepRL+ng5X90yqgvx0fmI4W/LxqF
 55IHXRhcTTNNuot7Myd3hOWTWAKyvevDAAyrv0hTvUphpse7OFBbUzifJVW+wDwPK9lzpZdc8Re
 wVKNb8WC8YTatMGyVjH9pzi6xte6V9RAGHVdaaG1BNse+g0uvQc8XSjjeSZFXGsh+ZPJk4+MHb+
 b4AX0BrVSqJcWg/sTDx/G0mUNUDBXZnDBwP6nmo1Mh5mxngghNBBCvtOuXn0FbJW8BtdKeHScOA
 GEUsK0o8WvgqggXqiXkpm+UzQcTSA6cM2kV6nMuWQpzmm+xhWgx+HaGxVesyazCiQURUJ4qaFyf
 t5B26oJUMgRgOVbBtijv9uHkiUjrJ7HVdWfkkDmEPJygo6MpgaWGNEucH0xV/1LIzEXFAqMC6S9
 oKJegHfTgftC5ranJIs7C/2bGX2nt5M3GEJxVFD8NvEhFtXvstV+3ZHX5M6UsUPFkZ837JbhoMa
 yIpYQggssroa4luvx/aYj5ANY8f+0+Vgl1H4WDV62aA==
X-Received: by 2002:a05:6830:4907:b0:814:57a9:423c with SMTP id
 46e09a7af769-823fe317225mr2045394a34.30.1791017113567; 
 Sat, 03 Oct 2026 01:45:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:55 -0600
Message-ID: <20261003084453.545653-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Skip the dependency check to ignore the upper version bound on
setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 5b0c450a76..13094024f4 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  faf076013aa2e25a8424f29b49c1b75b  python_gnupg-0.5.6.tar.gz
-sha256  5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac  python_gnupg-0.5.6.tar.gz
+md5  bd6ac6330980ff56960afca0c18de7c9  python_gnupg-0.5.7.tar.gz
+sha256  73ea46219f992b361eb1ce54cb0968101670654454916a3ee5df8bb9bf0cc8cc  python_gnupg-0.5.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index 55c57cb702..52a3f3e363 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.6
+PYTHON_GNUPG_VERSION = 0.5.7
 PYTHON_GNUPG_SOURCE = python_gnupg-$(PYTHON_GNUPG_VERSION).tar.gz
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/2c/6cd2c7cff4bdbb434be5429ef6b8e96ee6b50155551361f30a1bb2ea3c1d
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/bb/d4/47aa0f34b6a06a976063e3e0bf1512b140ec1e6efda83bc717fac58071db
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
 PYTHON_GNUPG_SETUP_TYPE = setuptools
+PYTHON_GNUPG_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
