Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0EEC5475B
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 01:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F097A81CFE;
	Tue, 12 Mar 2024 01:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zERD0x0kvUBX; Tue, 12 Mar 2024 01:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67C081ABA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67C081ABA;
	Tue, 12 Mar 2024 01:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D517B1BF311
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C17E24051C
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfDGtQmhfE1y for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 01:08:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5F55404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F55404F5
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5F55404F5
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 01:08:51 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-36668066e0aso1057135ab.2
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710205730; x=1710810530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ohqyQQX79zFxl+v75fIZljtDV5T+yuwV8JcCutkslk=;
 b=UzlrAfLVGgoBRP0bt8LDJ5TPIByA2rcazZBVV8StHNE4695G0hswWlzXFGO4qim6xh
 TtcIIr3RsdsM8zaL/hlH2QAynkldbTqMRTi522aqhD6qw+wCBCr5cRHntJzlRvcAq6sB
 oyE8wQBk8yR56fkI2rBbaDk8360AS19dotVSlc8jTEXw8RzRPS+6bafhTTi2JxXhL1aU
 dEMVvV29TroPfXhBfDLfSssKjZKUVpy4EMO0MUCHrEUXlL/swunWplNaF6HdjupsbEUh
 KnIfwiTSx1gjrF62gZjqDuRCEyNpN0+YRDdC++atl0eJxI9rKc797f68QPdxU+RjwFrl
 ggfQ==
X-Gm-Message-State: AOJu0YymmwLaotZr+ifeix2tsusSL4fuAHfqVtAQdOSz+JXvlaNoUnNr
 tAmLlyEux5NY2g02z2jAOE8IIJW1Gvvczr9ACMetrwW0dJfnZT3TEw+QfGm/R0brFrgjWLUImx2
 UKA==
X-Google-Smtp-Source: AGHT+IHoEyh6fkNUJNLOQjGanwIMHPE5M1T3hBW751OAMXc9BxcRlsjDuvvBFanr+RDslkkfozhppw==
X-Received: by 2002:a05:6e02:1b04:b0:365:da4:ec9d with SMTP id
 i4-20020a056e021b0400b003650da4ec9dmr9966730ilv.15.1710205728265; 
 Mon, 11 Mar 2024 18:08:48 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 gq1-20020a0566382d0100b00474d209c6dbsm1980387jab.44.2024.03.11.18.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 18:08:47 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 13D93106353E; Mon, 11 Mar 2024 20:08:47 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:08:27 -0500
Message-Id: <20240312010828.1955076-2-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312010828.1955076-1-jeremy@jeremypeper.com>
References: <20240312010828.1955076-1-jeremy@jeremypeper.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710205730;
 x=1710810530; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ohqyQQX79zFxl+v75fIZljtDV5T+yuwV8JcCutkslk=;
 b=AMgsDfidecnfVaUv6tdNgJFVlumKyBvKeBqXefXVFPVaLAv7wTA4OAUQye0fUKULO3
 gJ4FrU/Fp7XSD2yt3qD8onHjqMkWHRUgZrthQAgUwXSCGRRYxFQDNjFBYZ1Uyjs1H/Nv
 wMxUyQ/o/UsjqmKiclChLgJOczu5Abc8wpRtjiRjJiR89BzRzBz9CjZhpWtaeSpTuvp4
 T2vSPYlxjx06KODT9kV8AVvp5vVoxVpvPFtQJ3habeHELVMLhhvIKXwhEqnaMZthD3Qx
 Vi93A1SpRNNo0vqDhZixWpMUumvfqNagQJJN3bluiMfLWoWG5BRs+x70V6HKKWKtrsx4
 G4QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AMgsDfid
Subject: [Buildroot] [PATCH 2/3] package/python-configshell-fb: bump version
 to 1.1.30
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
 James Hilliard <james.hilliard1@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/python-configshell-fb/python-configshell-fb.hash | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 8fc38f61..e0905010 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  24b47284b463dcfb9ee0c1558827e13442127e62fa279b6e0253f136cf49058c  python-configshell-fb-1.1.29.tar.gz
+sha256  44696b92bea2b44c1d0bf2828477dddeb3b4dfb312ad82ce06d7b704c0985e27  python-configshell-fb-1.1.30.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index d0dd421e..3446a86e 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.29
+PYTHON_CONFIGSHELL_FB_VERSION = 1.1.30
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
