Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB2C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA14F82AA9;
	Sun, 31 Jul 2022 19:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA14F82AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddyxsky6nqhn; Sun, 31 Jul 2022 19:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD3282980;
	Sun, 31 Jul 2022 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD3282980
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3759C1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD9A82977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD9A82977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXChZrUB55ao for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521E58294A
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 521E58294A
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:00 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id k3so9280125vsr.9
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=d9ns2AlNvpKRMadHMt+tDbFhSdhl3nArLVZ8GoWnCIA=;
 b=QNtSaGrMa7i4mubCLWUs9C6br3nqGYWtUwTG/ECZ2quZYbYSDa9zHQJDabk+lOY8sU
 nPsxNj2VHW7YQY7t3Oru3jHCq7M42ndLxGYZH+hpYj8PGgOhdxxhR/8HMpEmLPdGx6Fu
 sD2M+ytCtojp8KFSur4rSYK2YfQrvfgBWhAc+RextNhzDJea2cZBNwlpVacE6C9CztLA
 xmfEGLa8miYG7CkO7VLo6Whrj4RWmxhM0Qgz834wvjNcI+QoUfUQ6rkTFA01JFffVg0Y
 DNJLtiwLy37U4Qn7sOSS39KS9iZ/e91EkvxoRaLEMZY+RTMo/Y4I6L+ZZXDqKOkzHrWQ
 vq8w==
X-Gm-Message-State: ACgBeo39t0uk5SykqVXNgb/FaFU1OkF4pvqBqMm8pElUB1jwDDBjtqjT
 0HlkVzrQcWTQD3vsEiBq992ozhOPjoA=
X-Google-Smtp-Source: AA6agR4Vl3jt24yRD8SNVvYCGIpaAx68bfZ3nCEBACYLAYwKDm+40CHnhNCRDMLNBIaunj1zgjtHEQ==
X-Received: by 2002:a67:d81d:0:b0:383:1d56:8a02 with SMTP id
 e29-20020a67d81d000000b003831d568a02mr832180vsj.57.1659296159174; 
 Sun, 31 Jul 2022 12:35:59 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:57 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:12 -0300
Message-Id: <20220731193521.1217825-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=d9ns2AlNvpKRMadHMt+tDbFhSdhl3nArLVZ8GoWnCIA=;
 b=aqvI7qxWh/zZ5mQy2Bw7R4NDGDh0gB8i32J2UaParb/Xo8v33P9FrNs1rPQ7l/yEyT
 pA5jK5LCdaUXpGg7NPr0AC3wVdoKStCNH/P6g5bHe/MN+W6nGZG8p4A4aj075R1OYBR+
 6OwFi1u5pYEgMgM/HaAORr1TV+fveWFwBGgg27WSRk4g14itPC+rPvocZ7mEUz2C8qka
 sIxP1Beq8yTfwQ8iTlF2aPE5Tnd+TpSyACxFkslTCVpWlrDXb+bEHwDx47yerKlGbe1H
 dcWh1pvimHvZHhWD0bIIM3bkZ2er6hT9j0lRnFopbK+x4eNrrXMDRGvGlQYTvVfZKTqK
 gNIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aqvI7qxW
Subject: [Buildroot] [PATCH v2 05/14] docs/manual: check-package before
 submitting patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'utils/docker-run make check-package' to the default workflow of
submitting patches, just after the rebase and before using format-patch.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - since the automatic run inside docker was removed from the series,
    use a 'good default' to newcomers, that ensures repdroducible
    results, by mentioning to use docker-run
  - add a small description of what check-package really does (Romain)
---
 docs/manual/contribute.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index e588c69be6..94f1c64496 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -294,6 +294,12 @@ $ git fetch --all --tags
 $ git rebase origin/master
 ---------------------
 
+Now check the coding style for the changes you committed:
+
+---------------------
+$ utils/docker-run make check-package
+---------------------
+
 Now, you are ready to generate then submit your patch set.
 
 To generate it, run:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
