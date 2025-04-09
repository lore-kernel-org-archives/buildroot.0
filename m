Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15407C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BE460EAA;
	Wed,  9 Apr 2025 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43a2x9-OHE0q; Wed,  9 Apr 2025 20:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2456961102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2456961102;
	Wed,  9 Apr 2025 20:04:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED89201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39914123C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M48-9hmbTA5Z for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 060C641394
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 060C641394
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 060C641394
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-399749152b4so3955108f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229030; x=1744833830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+kJGaFT06JqHgnvAOyfGkXX7ZFn+4Ef/n+hGfWPRMyI=;
 b=npnOlX7sMUneMlvWfeXOfNOBXG77C29qxRpndGz4hIlfuC4QgQ5PSbljThOVWIIcI9
 iyAZHaKFTxpxJ1WFwg9LYzQSE4xJVpDElxigeov5x9ZU66dhuC9DKNV38hKLLkOfLL48
 wDoHnJrF9+IfGU2vwv8+nHfZJiPP6m1xRtSSzd/LNg3Q4E77N1bMQ7fGAVPyB0kbukXV
 tGawv8p/WsB5sTF/ouIv9+Gj46DCUB1Cao8rpk+QMkB6xvf+31J2zDwSqz1Sl2IDsezs
 FxTAq78WjEaJO5o1Xct21Xd4yROGMKCVLMwgkBdBnWaN+xHdCqNbrIgkEMAG7NLFz7V3
 f7xQ==
X-Gm-Message-State: AOJu0Yx5GHVJyla2E8jZMQycR+BTnUIG0Oz6zJQW/I0zFPHhly8NnZsp
 nP+2HvbCK5xgbbg8RJi2d2U3rX91wEdfUAGCpH6IpUM2aepLryRzbsCZiw==
X-Gm-Gg: ASbGnct/vCSzz/yKPX0Py6m7qMN2Vg5Y+4gcUUR5fmIevi7TpNXHZ7UQwdkJk1M6wy5
 v2Jocm4h6pkvpMtllxaliPXt5n0KkILHysIk/aBxqLdZxS+d26GAoBBcPJLov/8tjY6swy/xqkN
 rjvgOIeGtlB+ie9TjNyPq4s99lxIzmL9OBKXOPZvnBwxAOLJHGJRxAMMTGWCXYdpm89K9wt5/HY
 jO0OU9JsfetzvfmqDFo6XlaOdv22b4rTfGoXt6eEICmD+DkAk5bRW8ak0EMGrynFxp/+L7tg0Dw
 Ae/uHXQJplyK9BiPInB73NLoYmS2WW2f3riEQ1q5ODy9p2dPaBk=
X-Google-Smtp-Source: AGHT+IEm4on7ZgBDsF2PNlbJ/SMnVvarhLv+eOXjze6U2pkGvNlSfb3aks1PRGL0oO8gEUK+i5Q/Bg==
X-Received: by 2002:a05:6000:420d:b0:39a:c9cb:819f with SMTP id
 ffacd0b85a97d-39d8f4dd06fmr42944f8f.37.1744229029962; 
 Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Kamel Bouhara <kamel.bouhara@gmail.com>
Date: Wed,  9 Apr 2025 22:03:27 +0200
Message-ID: <3e63e5e7893e038684aa7cc8a8521e5e18dc473f.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229030; x=1744833830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kJGaFT06JqHgnvAOyfGkXX7ZFn+4Ef/n+hGfWPRMyI=;
 b=M0OA1MvEujSewgUjs7D6JM2NwTN41TvASjp8sn3lGpHSyqQDqjkiTA7yWOd/1YNVV3
 eiEsvLc+eVSmDrCTA82+7D4ZSEYzSzEBZpwG3pNjwQHV//JNF2ofyOg5o1ALVj8r2G5L
 qsA1dlORRoNEhqImvkGm1pQjBkU+h4Qjiqa/5rrLr33uBGpDAMEqddxSkh53U4FSZAVx
 KkZ3v37CnScgt0mEUmSTBSq+eYrA6ENZeVKZkfv4O6ZCZ4EbYbQ0d/qvUy3u2DLbXEpt
 9Pc+H1IDfI4juEON0SOphyO5+j7/+DuRqKsnVXyiVvmITQu78wMZv9rQ2MYDdMsUShLm
 XI7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M0OA1MvE
Subject: [Buildroot] [PATCH 12/29 v2] package/libodb-boost: afirm host-boost
 dependency for host variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

... and propagate to host-odb.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
---
 package/libodb-boost/Config.in.host | 3 +++
 package/odb/Config.in.host          | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 package/libodb-boost/Config.in.host

diff --git a/package/libodb-boost/Config.in.host b/package/libodb-boost/Config.in.host
new file mode 100644
index 0000000000..fdf2b1c25f
--- /dev/null
+++ b/package/libodb-boost/Config.in.host
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_HOST_LIBODB_BOOST
+	bool
+	select BR2_PACKAGE_HOST_BOOST
diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
index bff3142ee5..41192bc25b 100644
--- a/package/odb/Config.in.host
+++ b/package/odb/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_ODB
 	bool "host odb"
 	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	select BR2_PACKAGE_HOST_LIBODB_BOOST
 	help
 	  This is a compiler that takes a specially crafted c++ header
 	  file and auto-generates a schema that works with libodb and
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
