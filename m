Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE5C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BCA181EC3;
	Tue,  7 Feb 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BCA181EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xH_oM5YrQT4r; Tue,  7 Feb 2023 21:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1561B81EC2;
	Tue,  7 Feb 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1561B81EC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCD491BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2FDD61044
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2FDD61044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5Tf60Rg5_W8 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E8C61042
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63E8C61042
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:33:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso68631wms.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vzaQ6K8NuKkObJB87PD0wmFheTNboEe/6IRthgpspVw=;
 b=6Hr/3+ItagP3ui35Mvkxm7IFNRPTOS5PD3DV6FyxGmdbp4BsI9i/V92ZDeakykwBlj
 S/Cs4sdn8+iQoEgZC8mxwJEN+0wvbRtFy/ju5uf3URCusToJEzD4Q1N7kb+OLd/Sb0q+
 IRlgDXKxiIw0xpI2KGsSAWIAkVFOzZdgabbByt/u3JYuEWMp+7hwtaQ20fEqRpk0ft9J
 FQ+kyXEDQ4UuGaN1WQQGT4dHmaIfP9h9cskTtJznmCAnETuxyLcv5GKb6YfhWja1V95U
 /6kTCOSlkhVIIgE/oQs2da1Tp5dvaWJEzy1nmZ2eVRvRUgK8EsjWXP9TOC6sXeBkg+cj
 g/wg==
X-Gm-Message-State: AO0yUKUZNwOg2Tf8ikRHIeg9P4/Le+LM/PLMS5D8L5v0fe9TcbdWTHEw
 YJ0WZdEIaZMO+JP3kyaam83gw7j0hrjJXw==
X-Google-Smtp-Source: AK7set9iItUyvQLTlhXJi31lrOXqzpUu3fpdPovZW/HyjfctIfsxiAgcJ3Cp+yM3JafjaHwtE7b78g==
X-Received: by 2002:a05:600c:4d8a:b0:3dc:40a0:3853 with SMTP id
 v10-20020a05600c4d8a00b003dc40a03853mr275299wmp.11.1675805590480; 
 Tue, 07 Feb 2023 13:33:10 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-98.mobile.abo.orange.fr.
 [92.184.112.98]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c16c400b003df245cd853sm14361903wmn.44.2023.02.07.13.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:33:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 22:33:07 +0100
Message-Id: <cover.1675805584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vzaQ6K8NuKkObJB87PD0wmFheTNboEe/6IRthgpspVw=;
 b=qY5NrtvHyS/q/Wny6LGyg9W7+BTXmL/62nOi4ZTUd3YrEtE/mEZqlz/5Frf4AgD0kl
 LVI6EisKefXNPiYmBDR4yrzrY++9FDpV2oaQRQ01QNuNvxDRkUfXs+6ypScmM7leChir
 SxH6tzdTA6SdVEgBgn9oPbzqKqlsb2Ja29rG17WMDQ5Qcu1YgTjwXJwbmOdd/haybINn
 YRFg23C09DFnefYhIgYNoLuerPZDtttcm0fGdTQ3T41HocfiFf6nMHW2iPx8QzsqW+uX
 Xy9yqcD0PcyERTuQxIXGsuPmpXSbsYOqz1DbugMiqPMYYr8E42oaGNxrkNX3fj9ns6VX
 n7FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qY5NrtvH
Subject: [Buildroot] [PATCH 0/2] gitlab-ci: fix pipelines with the newer
 docker image (branch yem/pipelines)
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

TL;DR: the newer docker image we use in our pipelines uses a newer git
version that is more strict with the ownership of the files in the git
repository checkout, which makes our check jobs fail.

Long story: see the individual commits. ;-)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      gitlab-ci: don't use before_script in job templates
      gitlab-ci: fix pipelines

 support/misc/gitlab-ci.yml.in | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
