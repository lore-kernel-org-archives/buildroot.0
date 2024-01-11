Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E85C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C00840549;
	Thu, 11 Jan 2024 07:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C00840549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv3XmP2TmIL5; Thu, 11 Jan 2024 07:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFFB43809;
	Thu, 11 Jan 2024 07:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFFB43809
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7498F1BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D1A041F82
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1A041F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzX9I7zdGNdm for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:09:14 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 409E741E88
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409E741E88
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3606f3b8069so22992915ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704956953; x=1705561753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Un/OuzTg0SmprKQkzZgU4hIgu+WOo3BGmgoPTfzwKkg=;
 b=QTQcB3FutrhWELYh5WKtuN6F5JJew1UEAlp5Kaw2GKe28QlsDvnY4vSJX8GZEt1ZlV
 5ud3NxJBiJo2W2y3cdpe+ssg9x9ddoss3Dsfl6WB408zu+ilu2xPU3Z80jsgCKwqRyEE
 cfC2TKGqIF3o6z/w83j+lF8Zj2ZL0oo/TTlRM30BB9KkaqXRJVNcC2G0wsYQDhi+ay2c
 7XUhn3fBgSsiqFEBOqldKqlPYgOfYVLXorSBOhxDd7nYGdsXDYRmBrIn4TwFHSQJ+TsR
 TyUi47wRR0Dxzja6EWpsWqqGVEPBBEhKU1vKZo9q1YcYSQNU7hx8wA5DJfqdwLWTPEzZ
 y2nw==
X-Gm-Message-State: AOJu0Ywg2caYBrvPU645N8DfHn5LWej4Ga+rrhRA9OLR7ad4/LVg3hkl
 5sfzWIUmyQvShtO+fUbc7GtFQ3vNO1hyxw==
X-Google-Smtp-Source: AGHT+IHbuxWF6PhPEbVHH+t/FlyrN6oe3am2ADziWqnDKneoLqyWlHb7fLhhsYyoefXrkxwO8fRo5w==
X-Received: by 2002:a92:c205:0:b0:360:8cf5:7d81 with SMTP id
 j5-20020a92c205000000b003608cf57d81mr833416ilo.49.1704956952942; 
 Wed, 10 Jan 2024 23:09:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 8-20020a056e020ca800b0035f75e80d1esm117929ilg.52.2024.01.10.23.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:09:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:09:10 -0700
Message-Id: <20240111070910.3068587-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704956953; x=1705561753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Un/OuzTg0SmprKQkzZgU4hIgu+WOo3BGmgoPTfzwKkg=;
 b=R8ua32gH9Df8TlEiDFiEIqoLXFmf+JAnIXeMxh0/9CgeccPXYh5OYhVGeWhMo4sQa9
 noTWmxkJ6nADjhU4dRGSzu/iYn2F9h3tuC18VZFUvvTX4BfxDoTaRTLXUWMJoYrUyaB7
 zOtbgUVuPG/I9DYb/geAUv+L1T+VEvh/FQfKK0QPQgFSuB99UoKx13X871mtFScobIef
 Bu3ZR3NHnWdahiQRLd19WabaPoGJG3e6m4XmxnWtmj+LjfLHuNhYumO1KYU9Mn4ugAgG
 xXglUSYqmKdV1B0rxFRAE1oWJPVJ0VcD2/LecMW20b1uftZQJ4o16yXWTEEf+jwxoR6Q
 yqaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R8ua32gH
Subject: [Buildroot] [PATCH 1/1] package/python-socketio: bump to version
 5.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index abdcc3a5b7..a7756eb39d 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  e63369252a9d383cbfc503337b864733  python-socketio-5.7.2.tar.gz
-sha256  92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097  python-socketio-5.7.2.tar.gz
+md5  207c7452bf6f1f444d8b70cac8801647  python-socketio-5.11.0.tar.gz
+sha256  b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f  python-socketio-5.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index aecff55ef4..dc0c24fef5 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.7.2
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ee/56/294629986bf6cea96e0edb3933a7f2fac7a079d12909e893903a2effc670
+PYTHON_SOCKETIO_VERSION = 5.11.0
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/7a/e1/2817819a5635a099fda9fc758c51dc2f07996d6928d744639afcf5c5ddbb
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
