Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA2C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4926460A8B;
	Tue, 12 Mar 2024 19:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoHrvc3mGyhb; Tue, 12 Mar 2024 19:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4768D60A94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4768D60A94;
	Tue, 12 Mar 2024 19:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4434D1BF95F
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 308B340654
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cibPTqmj33lS for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:35:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2476040562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2476040562
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2476040562
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:35:45 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-36576b35951so32915915ab.3
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710272144; x=1710876944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ohqyQQX79zFxl+v75fIZljtDV5T+yuwV8JcCutkslk=;
 b=SN86C7qksUZ42GY84iblA6zVJQc7Am+hHdspiLSW/MbWtxmbxGa41BiCPYC2WGvPNt
 Yc9cWpcXepWB1kKaEz3I1lcitpe1Wkh4jBzb+h8NTcH495dQC6lJTf9FMYYgulgIUM4u
 zpoC5WzY/DyoAec93HUu/6usPgkBQ3sKjANn/2N5lOgpVWozChVv+wk7HfY55Bzii+Z7
 WU7IwKWrhKIa9aIK8K1/2HB0Kw+K6DNaBMO8KsATvRH1MoYhkMMKoFtASk/nGDeQbuqL
 ftwpDqMdRoZ2NP2HBu9UD0pm7X/R0Ntbmxbe0jShfYn1RMXZHMunR0tra0T5AVdxl9et
 CR7Q==
X-Gm-Message-State: AOJu0YxaGoaYU1Zm2jeCm11TNaOM0FK2xfVQD/nKI9RCML8yoaJ0bZfc
 Qd247Qnt+PjKABcOQzUpvVf5E6QIo2saG+8VX24WQ5Cd+ynqVA+2QLYj8TdGTDFLw7D6XYG+Ll9
 qWg==
X-Google-Smtp-Source: AGHT+IFqjAcBx0JtRy5cmHUJCq5ISfWNzMOxKiXqPsaeCBN4y4uK920/9a4vZ+jYGRYbZnFJnvKIsQ==
X-Received: by 2002:a05:6e02:1986:b0:365:fe9f:6b24 with SMTP id
 g6-20020a056e02198600b00365fe9f6b24mr3139709ilf.13.1710272144580; 
 Tue, 12 Mar 2024 12:35:44 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056e021d8500b00365c96b8afesm2483467ila.46.2024.03.12.12.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 12:35:44 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 9561C1060DED; Tue, 12 Mar 2024 14:35:43 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 14:35:26 -0500
Message-Id: <20240312193528.664465-2-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312193528.664465-1-jeremy@jeremypeper.com>
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710272144;
 x=1710876944; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ohqyQQX79zFxl+v75fIZljtDV5T+yuwV8JcCutkslk=;
 b=ubkk57/4rFsvrScc9neqwbgwibm3OvK5iK5GbqyADhepORrMnI425SF2pFkx3H9ugs
 /0/oUegPjJNJW6ciXszyMK6tqxCaEwAyHtndbDpffxM4tAskwwO59hFLzzAVpbgxeABU
 0ZW7kuOK8jTGjp3ShupHc/LUDtsGPjng6HetiHYWv7Tj5qi4FfSSP0Dybrxi+8E9DsE0
 5PqSbmEpKzJ2gHSk6SNsk1m2VQGOHYxyN0vNT0K9IoJpDHDmJg3geJgnN7Sump67IGdn
 Xl/yphLZ1gAWMpbJ7RqJsMDkObogNh6OoK/GGzYhtih4roJc9lBMb5OwA/YTvQg0APhi
 zQqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ubkk57/4
Subject: [Buildroot] [PATCH v2 2/3] package/python-configshell-fb: bump
 version to 1.1.30
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
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
