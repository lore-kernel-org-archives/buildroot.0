Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C4C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701E341714;
	Wed, 15 Mar 2023 09:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701E341714
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKus-kETqnyh; Wed, 15 Mar 2023 09:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6302041773;
	Wed, 15 Mar 2023 09:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6302041773
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1491BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB55441797
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB55441797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5Z2x-t4Te6b for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E231F4174F
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E231F4174F
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 09:18:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso3024002pjc.1
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 02:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SP8i8ZWgBen87mwbLnGEYZVQO2EuAkr1gzL3TN8zKHI=;
 b=ANOX/iVobdw28tfBl8Q1hEVeWFy0zpJ/J/SzQXmnwQ1xPu4wWQAR/Txtda8qJfVMw2
 SbXOCTaJRipcuCVYXLvpeyrFBX34jPH/IBBF5I6QNSLXp6PMSobytQCHxGw7kDYWR+5e
 YzHosBMWXdgb2vw0cVzcu7jLvE91gNU95yJrvmL1imkvi7+2JtZsX6GKSWClOHdZEOyG
 HWHmxsRI5kzPhd9oKQgJFUoGddwajWVbG1bqNv61+QMHHu2emig5lSlqWRzqvtSjO9L1
 Lbo43vmPK/FFwEyt37kyHmUbT3xaov4w9cPCFeEb60j7Zdf4JW26iue1z4WXKNeN/dco
 rJfg==
X-Gm-Message-State: AO0yUKVqX/0UDXN8I8f7l5jegdZ/WpXcjj+v/kpGXfwBcegJDEhyWITt
 LB0mIc5HJxZV6p50dCFCi9154K2FYovWMGaz6kA=
X-Google-Smtp-Source: AK7set/TIVMcteoThoL1arCJa/ecxXo0v2y8Bl8/BEb/jxA+UdUaq5UnEVmbRTE5P4x3fhaCMptpvQ==
X-Received: by 2002:a05:6a20:430f:b0:cd:1367:3b69 with SMTP id
 h15-20020a056a20430f00b000cd13673b69mr41981573pzk.17.1678871887613; 
 Wed, 15 Mar 2023 02:18:07 -0700 (PDT)
Received: from localhost.localdomain ([193.37.32.210])
 by smtp.gmail.com with ESMTPSA id
 h35-20020a631223000000b0050301521335sm2872100pgl.11.2023.03.15.02.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:18:07 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 12:47:29 +0330
Message-Id: <20230315091729.1771792-3-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315091729.1771792-1-javad321javad@gmail.com>
References: <20230315091729.1771792-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SP8i8ZWgBen87mwbLnGEYZVQO2EuAkr1gzL3TN8zKHI=;
 b=JK37UXkl/wz5EU5IZOvW/O46OeqbS3zK/fbFLcYzURms6GDLB6NEqnt4WH3fpAiwcL
 eyyPU6ovUEnwvloxyUKy4oof0SQRWYGtV7m9vaEd9dlY1NA4WfMFd/Ed5ON61jyhm5oH
 /W+I25SzAhOTM07YX4ym+Uw6dzliUhIkx2U4LnBO392fu0scGY4S7NykBCyc1VBbX0c+
 WY/wBsBxjYK8x0t5rgszq0fzsvljiUUFsIFM+2+8C0v0e3Ke06RlgGhPP2F5JwBVMKcH
 biVepE8IRapKOXJHHcuF+RWAOY5cjxa6duKJTRgkxOMv8UaamUfAnT1dV/t/TsH73910
 o3eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JK37UXkl
Subject: [Buildroot] [PATCH 3/3] Developers: add new maintainer for OrangePi
 PC2
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
Cc: Javad Rahimi <javad321javad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..42001cf4d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1478,6 +1478,10 @@ F:	package/quota/
 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
 
+N:	Javad Rahimi <javad321javad@gmail.com>
+F:	board/orangepi/orangepi-pc2
+F:	configs/orangepi_pc2_defconfig
+
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
