Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD452C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 13:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8446440DE5;
	Thu, 24 Sep 2026 13:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxlAjn-q-QuH; Thu, 24 Sep 2026 13:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B01E40D82
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790255739;
	b=hNVX4F2oWyTqPIuj6Vx4zl2X4LMOb+AsexPjPoCVIhqAlq6PsNFcA5XQe0XcprHBJ7Po
	 KJNDsIfjZ5LTR7x2UbAXTuLDhjs69qxeKIXUmSyfX9PXvyUuIJG4PyBHK36J2FyujBWmj
	 n29A6LsE0IzgZQyK44YZZXkqY9Q2664HtmWGB0nD8PFDJDKyCwhrKrs4+oUn2EqK6HOGu
	 ZOdNDR3jiyyW5X0Pkhco6UCSZVJGNNx/AmRXvANNBBeh5sex6oPwvYxWyMZNyZNwT3CSA
	 di8yz2OqhpY+DXwrwczW5ojY2x0Jeis4lFyfuzdGQG0WgeuFFjdOCnucdcfvRW+CUzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790255739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+2ud7fxbV2vzFghRQLWxRcmjkHVLe94EAiZ865Uparw=;
	b=EAA5caVBisCDgM8FOEZljVVilGkeiZti8z/OYVP9PtF/d6fyLiJMhCiUVbGEobRQJT1Z
	 Ud0JJvIq2FqDpEQmFxNOnn9vO0iXm6ttpUWo6NR3pWQzXpLMq8I9i68GQBueNujzIRHh9
	 Je1ajmtktZWOh/zvbePVUMGcjqZFfgwa3bG1IXxLI4H34fV6HWBJr7SPbh0xPk6ONskwf
	 ThCXxZizhuMyRCe+9GLbXDm+up+k7SPXODJa+1+oQQYDFp/0PmL1Lc8M3AzPF71Gynkeo
	 zVFO0KLAH+hZ04TqAUbcf5mMdK9K+g/Br3eGb/3Ts3dSRQRT9Ee5QQV1KKk0yrBy6hA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790255739;
	bh=+2ud7fxbV2vzFghRQLWxRcmjkHVLe94EAiZ865Uparw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Py7uTtWAlOkdwrFHprCjuuA4j0nF2VpA4dzBWk9N915R3UeuGLRXHabYN5tdTh5WK
	 xRyQCShHh4lmBCyS1rJdKirqep8Lm9aR9h7oqINCAr5rrMz8THd5mPVsgVqXeT0BKU
	 C2xvOnMNRXL7MhDfTzPuaa6ZBr7W18zw8XJdEZM/CEy0Iu3BzM1CwqFXhXA/0qth0w
	 fTA4CYdwuw3+7ppujyHOvNjDVc9xP3DagMTxP5MIfLBqXWJ9qtxdoFh0YO0UTBuLW+
	 X1wQr2TmL1jxaSJEgF8lsFXHIiIZTVPfYSVsR96WCwQ/dflJTwpUKC4nqaqFKiHJwM
	 KggQn0X6Os+6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B01E40D82;
	Thu, 24 Sep 2026 13:15:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05678194
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF62060824
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxLaJF0N3suS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 13:15:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB7D4607B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790255737;
 b=R0XpOqmFi/CNixGKMYi2XqXc0vdg+dfEDwkuC2lSRZKV5W+5+faD8s+fFG2sH+Wb3w+w
 fec+NbCscAtPr8N/46NFn3BL3Cm51jrmgGcsFVn5AXWwJnu84NiQPPFzukzpWoPHGl5Q8
 O6QO+ZQoHc6es9j5REMUdm+SFhAf2WpCSoINf0iVLxVODeM7MJe65DZeR86+QsQui5Vt+
 LKZDjGRxfJKavLu4XVLS2TJnUtJFJ8zj0Ek3QGVHPh6jjNEoMNTaHG5TRDZPqw3X6tOLE
 cAZUCtMX8rs/cBVoNpjoWNRNQtRESlMfr29evRARLCBObZb3MWjF44dOJEF+/Wokinw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790255737;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=iui+h39nDw0Wg27ylzdO5VLjsdBQdnEGwjcgmvRdna4=;
 b=KujU2drdztn/1EIaHUnkF6qjITHZ2OW7UMHRtizaVLmuta5jDTrdfMJtRuarpFmaBM8n
 VhM5woYIwcQEHdMxnuzuz+0l1cDXpF1im4+SoOseJ4SKJDBkFKN/RTla6C2SxzJsx7eg7
 UtRbf68Iw5Y5vztWtNS2LSWKt2qCwS3qlkbj/tHjf/7fZneH3J6ctGOZ7/ySG/zPIJN62
 ZS00pzFxiJaXZhkJ3ONw6MWZdUXu2vSN8Z8Hle1BS+zU+cApegViOvxq6Hc14MsAWb1vP
 VeJSn8LgXECvcMm9UYfhfr9mjMVqJQ3WJ115waHVHNSa+CP7COd5tNzbXpeoB275Z+g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=pAfPE+qI; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB7D4607B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:15:36 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c2940ef15c1so257715766b.1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 06:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790255734; x=1790860534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iui+h39nDw0Wg27ylzdO5VLjsdBQdnEGwjcgmvRdna4=;
 b=lzgk3ZQKJC1Tm437miSi/lvyPmy4+rzYGHkeU2uUkUh+AHjAHfSmnSINvExzAnJ9aA
 impa+8iTN6NmCHZweNaKAafykv8OYkROmRWHnCGDh3OneBLiY1FKp8pH/ZspO3dIOWDC
 x2rKZQRlV7HagaurpB67leQa2uBM6Z+27/CcKbTv6NuWSOE0XNTC9tH7Bp4yjJw9PSq2
 4wVNbYFik0a4JO7JMxSgla2PID/VPy/QfF1os77OOV9hrvuSSy1gfeqfIsYIAi+0PBX1
 LJ3rViTR9i1okkxAymL26yckHyBxzh9m8JaeZsLCLLrdtjDyLNiB5rM/9fhiB/JCig0A
 qRDQ==
X-Gm-Message-State: AFuF++mKonzjoUxMRG1dpBqKj+6oBO4BUQseFstnmgH1sjgLPevJJ3wu
 FaKtfMTNvM+I5g2S2IBfMV+RL80flt99qzrCLgklC2b7Wuq6e1sB0t+3BJz/5g==
X-Gm-Gg: AYBFou0AK/qtaNhAF/GxER928WZOfD3jseYLTHm2w6to2EZEezlH3WNVyH80BsULtWL
 HPBabAsXCWueAeFoXhmQipcpJO1Qnn6DVKKZFPqdntNVlXlaD9iVee5C3wY9mq/xfA5RnAmVmnI
 qARwmfHL7qjjepWd5fVN/ynSt9WBnOOJnTRvai8AhI/RsiEKvjYNI78hIiWSu0WnZ6emDfCX+QW
 Hc79kj5DJ/Fn8Hvk3TWwcqsNaJxvoxubVNbMQBsz3zwIvJN/0kjesM7ZpRwWZD4rTvpsTlxcoBV
 hGbzNHCZbL0fSDPsfscYBY96VmZO3nXPnLlSss0+i2mkI4RTAXl8bcJUGDmKCqAUX5lTJBev0WC
 +m4m6TRk2viFGPv+x6cuz2o4zi5TVpxmg1r/c7w3DQAiSg0PVXYk1VCLaoU+hqtn2Px2+XXgxVq
 XId25M5+TWziHzvkysNgnlS3o3nRgwS4CSlK/eVcIwLvq06VpJcImmAHyeYJ8Jr7DjJfxzbf4EH
 XHYx9dKU6Ly6+1dulkZLbjqb6lDDXfF5m9MV/kT0EOzrfN22vntPWSjlRSnpDYm
X-Received: by 2002:a17:906:9c82:b0:c29:49fd:c98 with SMTP id
 a640c23a62f3a-c2ac24c4c6dmr197903466b.32.1790255734315; 
 Thu, 24 Sep 2026 06:15:34 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aab386e7bcsm3614518a12.10.2026.09.24.06.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 06:15:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 24 Sep 2026 15:15:33 +0200
Message-Id: <20260924131533.2302137-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/swig: also create a swig4.0 symlink
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
tries plain swig, and it searches the whole PATH for one name before
moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
(swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
precedence over our host-swig for every CMake package that does not pass
SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
bindings ends up with

  -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)

Also create a swig4.0 symlink, and update the comment accordingly.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/swig/swig.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index e277f5049a..4dac64dadc 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -30,18 +30,19 @@ endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
 
-# CMake looks first at swig3.0, then swig2.0 and then swig. However,
-# when doing the search, it will look into the PATH for swig2.0 first,
-# and then for swig.
+# CMake looks first for swig4.0, then swig3.0 and swig2.0, and only
+# then for swig. However, it searches the whole PATH for one name before
+# trying the next one.
 # While the PATH contains first our $(HOST_DIR)/bin, it also contains
 # /usr/bin and other system directories. Therefore, if there is an
-# installed swig3.0 on the system, it will get the preference over the
-# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
-# this from happening we create a symbolic link swig3.0 -> swig, so that
-# our swig always gets used.
+# installed swig4.0 or swig3.0 on the system, it will get the preference
+# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
+# this from happening we create swig4.0 and swig3.0 symbolic links to
+# swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig4.0
 	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
