Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E87C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 01:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2FD8176A;
	Tue, 12 Mar 2024 01:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_7HquU67p9K; Tue, 12 Mar 2024 01:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9681B8176E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9681B8176E;
	Tue, 12 Mar 2024 01:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12ADA1BF311
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2BB64051C
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EhzLL9XDE7E for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 01:08:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D93DC404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93DC404F5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D93DC404F5
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 01:08:49 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7bed9fb159fso177763339f.1
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710205728; x=1710810528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjRlY8MjK6n7dTvro+rtapYkTMdDfj4r87sEY1v2Syk=;
 b=gtEuakEfDmoYrxsuoCS3C91Eo6rqriRi66AO17uIJZDrrPNUq2+p9QagaFChiWhhbP
 uYL8j9zKH/xCPs84zl0AQ6cayUX3nzqf4wCky6gQpnzmkLLpSQKoVhSWGxX64itPYUNt
 77E+egMZz0g68Xa7kMwxzpkRH49fFNkZNv6Vq+a/P77+1r11XGm414a6HFMzzWS27tL2
 UZC5BSy31tjbo0s3h1xtNC0rGI6BG+yVe25aFYFVxse5rZcfcpi0p3eMlcAHJ3g4izZG
 TOLIUETWMUEk9EkaRQUoomCCG3Sr5g1Pa2GwzzAksP8TDqWV5Na9SKrUWXguANQ8T5vr
 0jjQ==
X-Gm-Message-State: AOJu0YxCLzyXMaxa1FBrS+UF9LhRMdz/RVgwHdWXIBI9vjXu09Kg7aaW
 PIcucoQzP9XHoU+eEp2aoHYWR+cqPfKutNJUJ/Km1JC7J7R9l05kmSQ0yJ/4PPUhuOd34865YJv
 cxw==
X-Google-Smtp-Source: AGHT+IFK6C9iDgRbcv5bE8hLi3fOkUk1QwU62JoQcIPrHgacFJ1hFWu6SUeA/0rkd6S74/FPARFCHg==
X-Received: by 2002:a6b:c84a:0:b0:7c8:60b5:3961 with SMTP id
 y71-20020a6bc84a000000b007c860b53961mr9341905iof.16.1710205727910; 
 Mon, 11 Mar 2024 18:08:47 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 da9-20020a0566384a4900b0047469b04c35sm1999072jab.65.2024.03.11.18.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 18:08:47 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id AEB621062001; Mon, 11 Mar 2024 20:08:46 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:08:26 -0500
Message-Id: <20240312010828.1955076-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710205728;
 x=1710810528; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjRlY8MjK6n7dTvro+rtapYkTMdDfj4r87sEY1v2Syk=;
 b=YDC3PEMl1H4ifAo7chR6/wvgOpM4Cvn6BeKSvOJBu8U4mZvNPd8lSWJ53THcLNDl6B
 NM+rbkGqNm9aKCy/3J0+sDmOJVNt04f6DFi8caFes6DZS5+8Cvth4+3LZC1IIitjgiHu
 Qsssk+l9lT/n9bRQpIK7EniLSbXyZpl4Jyrh+ytTi43NZQ6mb4kGD2108Sg/+vb9P41Y
 RxOS3F+IclDqBZqZCmNbOTdqxCN7fjN/948dyamug5aHZQSjvsMQhYPi+bGByXPIoi38
 tOAvIXKjvk5ldL+wDFt9N2w8XY6+fx3KK2sGJswNO7KMusXF7skMpaAa3W/nbBudSu05
 PK3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YDC3PEMl
Subject: [Buildroot] [PATCH 1/3] package/targetcli-fb: bump version to 2.1.58
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/targetcli-fb/targetcli-fb.hash | 2 +-
 package/targetcli-fb/targetcli-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 64f68a66..1732fa99 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
+sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index d2cbf79e..64136bb0 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.54
+TARGETCLI_FB_VERSION = 2.1.56
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
