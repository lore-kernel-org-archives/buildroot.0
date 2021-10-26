Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401B0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 22:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2D261002
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 22:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D2D261002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3276280DF8;
	Tue, 26 Oct 2021 22:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWoO1SVST84b; Tue, 26 Oct 2021 22:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBC280CFC;
	Tue, 26 Oct 2021 22:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9060F1BF304
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 22:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D76580CFA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 22:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwH97Tb4_90X for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 22:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B22C780CF9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 22:19:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e4so726359wrc.7
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEBw9qeyTEMz3jhid99BUZ0GUXCwRtp/9tQ54J4C6Dc=;
 b=Ebs0yy65Ib9iyxzSKF4AxcQaUHuqn418XI8uYZzj6ANWzUX8beAcENz8ANfQjzRrzt
 /Ap9V89h6nU2khZi5Cjg3PoMjwysAhC0kKqgEe92kIK5i1kxas9BsOUmlQFEhz8/xoUo
 t/D1vM2FGsgUC4D04Gp85RI3Da7t4oOEGqtNwlyoTVrLzaaMY7vaYJtbiypUo269ckMY
 nwk/188oMCy3YaY3d9ZU839jQ63B/n7aG4sskClawiwlnQ3CvD1UaRVY8r92JAWPINqT
 oPL20QYRDFgTs5J6cSyCR5JrlDSdrqcvpKtQc3j1TtBJN+acSjrtXiW1fgzL87OJMCA/
 T1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEBw9qeyTEMz3jhid99BUZ0GUXCwRtp/9tQ54J4C6Dc=;
 b=sxOP9rPnom6y6Lo/gdllw0gbN1DrnXPLxE1MRXKRlu1E9f5AwcFP5A/ypbJTiA909m
 w3J1XoAqRH5/Zexk5QE1/EsxsASlIW85ETLosaeHwCz/ZUNNS8pHeQyE9vp8naD91u14
 tjOml6Hb3aWFz6USN6EeZ8kdyEqHTlWlfmHnLkXYSjaHSE/luU+fKgNRoNbk2E6LWm9q
 0j6doN7T4yA9a7VlewVOrDnyOlfvowg1lkTAbjIrat/vWA5orc9o9wNqAirca9o/Ehpp
 GibwlztlUUJgo5XTYJbJVj67W5y6DFW57x1nWv2vOfMy8kJlQ2lX0q1etezCvwrlzIhX
 5KOw==
X-Gm-Message-State: AOAM532oj2C+l/nFMurx+04us/mBeisnBnHy1TMSsJZcesd7ChZcnVVq
 HYvVMgt5Zi73MvZR8DV/8GNV2PvDYbw=
X-Google-Smtp-Source: ABdhPJwYEZkclw7kLOUX/COnuFspaU4cD4dF4jZfxyqSgxw7ECbRB2M4EC566oqLpZvxgEtt/Ro1Eg==
X-Received: by 2002:adf:ca09:: with SMTP id o9mr34613979wrh.303.1635286796760; 
 Tue, 26 Oct 2021 15:19:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o11sm29142359wry.0.2021.10.26.15.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 15:19:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 00:18:19 +0200
Message-Id: <20211026221819.4191432-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyndiff: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python3 is needed since the addition of the package in commit
1665e0a79b617b4e6315ac5989e9ffa66eb0310f to avoid the following build
failure:

error:   File "/usr/lib/python2.7/site-packages/pyndiff/core.py", line 48
    nmap_service_name = f"{service_name} {service_product} {service_version} {service_extrainfo}".replace(
                                                                                                ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/9f283774ca2c89540753bbd62fdbddb1f9d4e392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyndiff/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyndiff/Config.in b/package/python-pyndiff/Config.in
index 58ca35ba97..cd13056d79 100644
--- a/package/python-pyndiff/Config.in
+++ b/package/python-pyndiff/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYNDIFF
 	bool "python-pyndiff"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_XMLJSON # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
