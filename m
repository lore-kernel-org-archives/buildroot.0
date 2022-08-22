Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F2AC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3D44054E;
	Mon, 22 Aug 2022 08:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3D44054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mn5nFMje_SF4; Mon, 22 Aug 2022 08:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4C1404E7;
	Mon, 22 Aug 2022 08:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4C1404E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50D4B1BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B429408F1
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B429408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHFosuwI8UVv for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:49:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6686408E5
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6686408E5
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:49:02 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 53-20020a9d0838000000b006371d896343so7235814oty.10
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 01:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=6fxTWnbJsAPnteZqlswYxMwLK/V1Nby/5FzNu6DK4qg=;
 b=lzRatQtYkHgMOAsI38Wcvne+jFRBB3UPbnBSeG6nA5rrbw6N4tQ17kiDwQFtNpW8ZA
 f7jhHw3J/ZEi28aEpm6Kzx0QcK/3IWmx6i/uLIEisBqh3kpv1i8FHAtemBqr6sGR8Li/
 vn+dcRy8HSFi34296F071V9uZzjCLnx8EDRk37qMrTZ5QOA1CxZseoDrFTcG7lCzQlOW
 wkTCvrmm3/AWdzs/4V9yHxNg63s5VAVdMnGSsdZmrmHuNd/NABwxO11/C79EEgabcdo/
 btMPtJm0JylfiC598Ob5S+UVECZvOXPdJnc8CcGkxvQkKsEIwhxCinFxgTDSswMZV5Eu
 WT8A==
X-Gm-Message-State: ACgBeo1QaGUypD67U8lmJ16rsdcsxo8L16itpd7SFcINSvDu3ydLZrs1
 dLsJPAFEhYKcswiOODq7FqmBLv9zjZ4=
X-Google-Smtp-Source: AA6agR5hUGBO4hCwjq1wov4Fic/YRoxsKYEr+G8dqMGganESYGwzYSt1TARFJxYY3lKyZvzaQ+H4LQ==
X-Received: by 2002:a05:6830:168b:b0:638:a825:d290 with SMTP id
 k11-20020a056830168b00b00638a825d290mr7287424otr.372.1661158141360; 
 Mon, 22 Aug 2022 01:49:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 s128-20020acadb86000000b00344adbc3492sm2522782oig.24.2022.08.22.01.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:49:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 02:48:58 -0600
Message-Id: <20220822084858.18574-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=6fxTWnbJsAPnteZqlswYxMwLK/V1Nby/5FzNu6DK4qg=;
 b=lGXEwi16XAXmP5YX/ZXb/gb0bK4Uc40jlQeue6WxBIL2+EmwQn1PD13FghsRnyREmx
 fimHQeKqSvTYnGx3DT6zLce0Jm+lSsCgwSRAjfEsjwHxTV0ffsPRp658cXLq0kex0QaB
 gFbnOrctInMwfq8ftgpUfDZp54f6GNJdhI261y0Y7vC5xf/AO0MgmkMBtkrol95zxPkw
 rr/DtAvflr9m8nTsage7a9UaMhm7MHHWb7/s1W7SWt4Dsy2WDvW49f5gvUprrpkWr/9Y
 0cyRtFrG9XNJKvqVkvtwEDJigeqG4V2GrSFj2r1Ht9vqNN+e7gEbnWBx91XxcAnEtFaZ
 +dLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lGXEwi16
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 56.1
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 70c4e19832..68b895361b 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  8891a483640daf4f9f234f96437fc056  weasyprint-55.0.tar.gz
-sha256  ea5d5f2f159262e38b6e85939d8510e9735a47751a9647c9eaa93c22ced86230  weasyprint-55.0.tar.gz
+md5  0a339942d1d238aa0b974c1ec1580c03  weasyprint-56.1.tar.gz
+sha256  27f796abce8edebc9e5b3cff2d095a9fa2b0af5766801431659db51203c70b38  weasyprint-56.1.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index d6e6895f00..aff9a31a43 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 55.0
+PYTHON_WEASYPRINT_VERSION = 56.1
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/8c/a5/1a0f1f60a0dabd475d3c36739eeb43bec2da2d9d57f4a6cd95964f8b34b7
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/30/2c/9c29989bf03bb573bd963c2cf167839099bdaff05aff1f0eff2ccbd1b509
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
