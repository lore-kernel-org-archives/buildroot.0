Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B3C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 17:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A2981323;
	Tue,  2 Aug 2022 17:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A2981323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgvUWSsc9JMd; Tue,  2 Aug 2022 17:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E88812EA;
	Tue,  2 Aug 2022 17:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E88812EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76D471BF5DD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E5A812EA
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E5A812EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5znUn4D-Qq_L for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 17:33:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E64812D2
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74E64812D2
 for <buildroot@busybox.net>; Tue,  2 Aug 2022 17:33:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j1so10369830wrw.1
 for <buildroot@busybox.net>; Tue, 02 Aug 2022 10:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRsFR8ZCv4LJB3/G9BPeFPVIXnFsifAZFvJ19W1IVWU=;
 b=mE0fCXCZMS0TAiy+0zM7UUCNqB2Lm5FAtoALlm25oVOWPMfHwJeQHYLdWYdOew4mvc
 ct54JwIkPrG4X3T6KoRqkBKD5qW6LY65UBuGuKVe71se8lxD5ddUcsgS10KZtaa2rXHr
 ktEqnq3L42GAiso36M+rVe/9ihSmuFyaqn0+GknhelRHHcUtxN65XtqorD6HvjC3RGyQ
 mPcZaECC0SzB4rL7v5ew0aCwNHlRLGvUhJMeufN612iFieUYkZjgYYfpC5Us7aDKb3xV
 g+LQSEZMlaUqmgov+5pjxGEJEuQTBcjEsqIkKYheCw6bPRJo9CZ9qopcLPgnzaVZNV1i
 U8kg==
X-Gm-Message-State: ACgBeo248nDXlLmLmMVH7VcJ/TYrfyhPqWy7v8Ph9kc80JgUjNTbtuv/
 /aGF72aD9/cDtmS/jZBp5XRGk/YMiU8slg==
X-Google-Smtp-Source: AA6agR7rMbZZrGxt7XcdFlWKMX6BtdBNBgEmtjqT73Mxt7NBU8yvP0sW6JXc0cu24GsDPQqW5dUovA==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr14225773wru.439.1659461624460; 
 Tue, 02 Aug 2022 10:33:44 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 ay23-20020a05600c1e1700b003a4e5f85087sm3594215wmb.38.2022.08.02.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 10:33:43 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue,  2 Aug 2022 19:33:29 +0200
Message-Id: <20220802173330.15176-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRsFR8ZCv4LJB3/G9BPeFPVIXnFsifAZFvJ19W1IVWU=;
 b=qEpRHQLDAfWHr3N/learVNe/JvBmffbOxoSZh8DsDWlJ5t5CFGqCPTYgP7QGqcnGBZ
 Gu44hfjLozcriE74A0NFMPeZxfFVlj2c8rBPkbx5N/f8a0ELwURtbaSIqcjlOipaoQQK
 Bm/5hVA0x5JDUm2ic9M7fxt5T8ABmHi4MVSoFYEXqICrLYJr23iqlMh4GpRnOuQnRpy1
 z4PVO6+5eqWuohC3i4fmgjpCg0dIk4uaMgiTLgUG0sIUyNQ76lZnCsTlcJcH7sPHQoMG
 R0cmEI8YiNpyU2v9LUaa8PBxL2IxUTM41Dg1v5a8wM9/5odoBIP4lGoFjnotMxdMGb36
 z+uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qEpRHQLD
Subject: [Buildroot] [PATCH 1/2] package/python-scipy: fix io runtime
 dependency
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need python built with the --zlib feature, for the io
module to import properly and be usable

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
I did not provide the correct BR flag here. Let's test this module anyway
with the runtime test (see the following commit).
It turns out the scipy.io module is the only one that does not work right away
---
 package/python-scipy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 0fa6c9e311..229b5997ad 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
-	select BR2_PACKAGE_ZLIB # runtime scipy::io
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime scipy::io
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
 	help
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
