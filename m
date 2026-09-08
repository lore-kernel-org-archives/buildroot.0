Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439FAC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC846070D;
	Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnVslGQbCh4o; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F4DD606E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876788;
	b=FHIjs7nJOMJFJu1xYKW5VA0MNxM6sv705vhQTXpR/83zCRZnKLI5XTUv5pK8LwReoDdz
	 aHRikdlhTlkxHAotG6mO9bFiCWTS1vjNV5JdYKM7nL43Po/GssrAeb14Rvb8jpi011Jl8
	 EXhVqcDlpISnil81KMY8/6adwJ93fN7+CWoqSInDKZGpCKkbXAMWm2URVI5pA7IYUF+11
	 6hAOzxTxRmiUrizjiDSBUtss4trp7Wbux0SEJWPke/9vz1mdkmibdMCUwfCT6YPnw8Hgw
	 thh8QUtt0rl0Z9R8tqPA1GCTEpdJTB+rGtj90HAkF7NChiovdQfHTl9bduYe/K+YotQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KKYnhalgwBaiZt6DPcA3TJpd68H/WNjVcP65aiUvP1Y=;
	b=IR0tUn/bXw1GKCzZN9osbK5jWUujvjeGWx/dJYI6AKXvndo4MAuYDrXlYujoJLxD7PAr
	 2WkL5f/wXmNRHb8fVMXOXolwYVwReP9hHtBYWF1lG4fsqXnBsX1Il8oGIWj2A6wJRcyyC
	 KnQqWRyXBmwWIfOPWupNIR4dPr1A7wNRo/r9C4V2xHuWNWz1Miws3SdfK7wvzPxdzkijy
	 nEORQI3xAyEXmQ4jaPgcoylfNut/vcORIHfv/kAdRIrvouFpawY0MBa8K+aJjyQapGZYH
	 g41sadibQvCd34h75LcfFxwxhkZWXmRemHCDlgWxv1l70ZI6fm/GWgxbBJfUc6v5ONw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876788;
	bh=KKYnhalgwBaiZt6DPcA3TJpd68H/WNjVcP65aiUvP1Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mKOvdKpGEwUXp0EX5pLZEM0K3Lr7ZnoRo0bOnP+4ATAm3JCXoRebCwrU+RG8EXrhQ
	 HURkMq+sZAE8rG4xs3An2z0qJMJf1Y8d/XkV8wJO0IXYQb+mgiF1Od7WzvDDcbcrNT
	 eiwqUsaIhF54EDmR04I9KeR3yU+wtXKMPAktkTTXGwxb6MqXbvSreJcHzaTXTUlqaP
	 YodZIOIM7xtR3NlwMeGif8iGJoz+uFHYFb3oufRH6x06d4bj6Ox4Si0B//l6LMML60
	 +CQl0xgu7g7F90OsklVa8l09QomYcK/A8NgMDztP4wf1wQV7McIDUi0BzaU9iTCSsx
	 3OWFTkrKKgaZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4DD606E8;
	Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 522BBD5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4324180865
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na16PcGjlnCm for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9576780805
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876786;
 b=icbTXT7dWdRXhdJG7VToXJyW+JONSSsFJmOshshyXU/npBGGLJRSKx09kSTdsoK41IUi
 2yz4P++NQ7yAGINqIY6DNwZXFZ8pGeUUbiYQtZ0USYo20lXnLuDWZTYSM4mCJdB+sYz1J
 u6K6wKlLSFeCKRMe67XsITyFrpUeKBxwp1CQcz5PjxA0ec3zMPT5YbSqGybH33Q196v44
 u1DFd8icGEWxh0MVpdLogvxct8gjgHc8sNhDpnjOTnJS7qapSmGGTD6o/jmyhrBCEuQJL
 nu8jcFMKsNU+sd9l5AZPZo7QfqHsVgZnirbFb/eLa1gD0yC7MBRoGoFSf4hFcnIeD6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876786;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZAAMCLowBYnIgvk9bKi425ZYzuzloPSz+w2o3L5goN0=;
 b=jP4YsOeFGtg0aRGCeJNNmIJWUhbS/NeKpv0AySlCndLlHEvqzNcsfbh/m1dIvz/3Jf3a
 cPxTOe+ci3ecWYBxnlDR6ijuKexAjjdnlrnG/ziimbi8Z7PobD33Ys+JTTehDcfRMQbrU
 btHl/JtHbxZiN/OXLkc9uHe1MWSPwICCwtyKHX3H/ai98uW59Qq+Ro6HZDDUesAv+VIX1
 WVfX/4xCAz6M5PrNYsk+kcauXJKilBrlRlIw49FnbbIgMq74CvF31tyhXn5Z5B8HFnCVh
 0V0mFYMX5TyCvcdi7A8Xw4jxQnNYr0otwcQ2KdI0VrDCN8l3r3pAOtiNjMjYP1Deslw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WVKCt0XB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WVKCt0XB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9576780805
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-485888b3c3dso4758641f8f.2
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876783; x=1789481583;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZAAMCLowBYnIgvk9bKi425ZYzuzloPSz+w2o3L5goN0=;
 b=WVKCt0XB98zyCbrzajz9qSRx0fCktmPQMChOPd5d82lenVH/6vJgI/5a4xQ7TDYK53
 faPNGuM3brKy06hwmdam6mvBNPMsDfvI58IUcxfb12lkcZHcnijcNm5RzPtS/ZkZTeWD
 1iFtlvXzIgHvDGul5JAiaNRA9ddw0dtmozbuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876783; x=1789481583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZAAMCLowBYnIgvk9bKi425ZYzuzloPSz+w2o3L5goN0=;
 b=cgXaf97V9tl+vc/ScvdgSNiXDklOP+TyRxEJYH3b3nkubXgrxevIjDkemhJlgBO/6X
 BvPeCbSntNttv8Zd42TJ3+cHkoeW+sR2BhpNYvAid/q7l3spz2oEHUmqdT5pR+SBiYPL
 n/IdNyk6oiwAxcf/N8zej92Y5GFv/8zdiNZQsbNL8g0iHWGRe8BWSNHVCBNInxjgtas5
 uG0AOdDe184iIyZogWgQMlTz4cHw0MyDPAbBUuAHiqnUIVenhx5gIr9wQbyl3YeAhNh0
 sy0BW4t6R+YNU/kxUIjnYx/WVfkwV991wQfzROfUQXAFbGMGBAv4pwyurC+6qePBKCrr
 bZdQ==
X-Gm-Message-State: AFuF++mupMy83Gw+6Tas69f5/bMzIuM7R9szBdF5VPXbwA87Ayqzg+5x
 fN5DpIp0/ojNbi/CvPDEd0JXQsIXdQcovnJCqflDMaIdKGpZuiqeEi3G8bdA3TQxKeEVTAL87Qj
 xt6Ky3eA=
X-Gm-Gg: AYBFou167Rqz9ToEbcqhIwHqXdejepr2IWX5onl6R5jIGq4wWhssHdYjYhKADw6hg50
 tF2eBeNHejHymFaKCKkDHaMMd5+G0pCAjGTPpN770CH7zp4E2ugZxskE6dAeNZniHpCsfeX0bXX
 wly5kyoZ9OUP5kAYZ+bYLrUTe9Tdy/5i3WRDw9Q9393mVbMNYmx8au8YJyEM7Cs2axP/R89AFzK
 OQbt1z7iQmr2lgmJtm31bymkLHOjAxDvsTRUcPnq/e+JXhckAnK7c4m2m3yY/ltHZZi94yLnxek
 sUDLMYakIahclvpHpbVSk5Tj6SVzxDGrXPKWl3o81GzJe2xT0M1jaK+UsRZ4cDMsS1QPTRoN7e9
 0eyKJtkjuksV+BKv061c4byxiJQ618al3d4YjykqYA+UyMOPWAWIhmsYY+7YmpFzhUse4ahjZyC
 RHEOo5P4/Mgkxl9WY82NUylpOaD6B6YXC/20Wky/13TZHaEoG8fwjROo7ANgeSRY98H7pib8NNy
 nCTQEyv6zGA67ew1NKMt1thNlmxNkwH1yK433Ag3FOb5fg1sOIM4iKD
X-Received: by 2002:a05:6000:4b0c:b0:482:f0e4:3ef5 with SMTP id
 ffacd0b85a97d-48586e33342mr31589733f8f.0.1788876783095; 
 Tue, 08 Sep 2026 07:13:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:48 +0200
Message-ID: <20260908141253.1556634-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/6] package/qt6: Add qmake functionality
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

The qmake functionality had been missing due to the new host/target
build requirement, to get it working the main parts of the qt5 qmake
has been kept, we're still making our own device spec which we use to
run qmake with along with passing some additional device options for our
flags/cross-compiler.

A big thanks to Angelo Compagnucci for the encouragement and testing.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Richard GENOUD <richard.genoud@bootlin.com>
[dario: fix HostData and add the target install dirs in qt.conf.in,
quote QT_QMAKE_DEVICE_OPTIONS, use TARGET_CFLAGS/TARGET_CXXFLAGS,
change the commit message]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v4 -> v5:
  - Add ArchData, LibraryExecutables, Plugins and QmlImports to
    qt.conf.in
  - Quote QT_QMAKE_DEVICE_OPTIONS
  - Use TARGET_CFLAGS/TARGET_CXXFLAGS
  - Drop the redundant mkdir in QT6BASE_MAKE_BR_SPEC
  - Add Tested-by of Richard Genoud

Changes v3 -> v4:
  - Drop QT6_QT_CONF_FIXUP
  - Drop -@EGLFS_DEVICE@
  - Update the commit message

Changes v2 -> v3:
  - Drop package/qt6/qt6base/qt6base.mk.save

 package/qt6/qt6.mk                  | 12 ++++++++++
 package/qt6/qt6base/qmake.conf      | 34 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      | 11 ++++++++++
 package/qt6/qt6base/qt6base.mk      | 14 ++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index f56a9ff1fa83..bcf735c19e3b 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -12,3 +12,15 @@ QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)
 QT6_GIT = git://code.qt.io
 
 include $(sort $(wildcard package/qt6/*/*.mk))
+
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install paths
+define QT6_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+# Variable for other Qt applications to use
+QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qmake.conf b/package/qt6/qt6base/qmake.conf
new file mode 100644
index 000000000000..e0d53d755d41
--- /dev/null
+++ b/package/qt6/qt6base/qmake.conf
@@ -0,0 +1,34 @@
+# Qt6 has a mechanism to support "device" profiles, so that people can
+# specify the compiler, compiler flags and so on for a specific device.
+
+# We leverage this mechanism in the Buildroot packaging of qt6 to
+# simplify cross-compilation: we have our own "device" definition, which
+# allows us to easily pass the cross-compiler paths and flags from our
+# qt6.mk.
+
+include(../common/linux_device_pre.conf)
+
+# modifications to g++-unix.conf
+QMAKE_CC                = $${CROSS_COMPILE}gcc
+QMAKE_CXX               = $${CROSS_COMPILE}g++
+QMAKE_LINK		= $${CROSS_COMPILE}g++
+
+# modifications to gcc-base.conf
+QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
+QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
+# Remove all optimisation flags, we really only want our own.
+QMAKE_CFLAGS_OPTIMIZE       =
+QMAKE_CFLAGS_OPTIMIZE_DEBUG =
+QMAKE_CFLAGS_OPTIMIZE_FULL  =
+QMAKE_CFLAGS_OPTIMIZE_SIZE  =
+QMAKE_CFLAGS_DEBUG =
+QMAKE_CXXFLAGS_DEBUG =
+QMAKE_CFLAGS_RELEASE =
+QMAKE_CXXFLAGS_RELEASE =
+CONFIG                 += nostrip
+
+QMAKE_LIBS             += -lrt -lpthread -ldl
+QMAKE_CFLAGS_ISYSTEM   =
+
+include(../common/linux_device_post.conf)
+load(qt_config)
diff --git a/package/qt6/qt6base/qplatformdefs.h b/package/qt6/qt6base/qplatformdefs.h
new file mode 100644
index 000000000000..99e9a2792329
--- /dev/null
+++ b/package/qt6/qt6base/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
new file mode 100644
index 000000000000..d1d2d9490fbb
--- /dev/null
+++ b/package/qt6/qt6base/qt.conf.in
@@ -0,0 +1,11 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+HostData=@@STAGING_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
+ArchData=/usr/lib/qt6
+LibraryExecutables=/usr/lib/qt6/libexec
+Plugins=/usr/lib/qt6/plugins
+QmlImports=/usr/lib/qt6/qml
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 01661b7f01d4..032947417259 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -436,5 +436,19 @@ define QT6BASE_RM_SBOMS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
 
+define QT6BASE_MAKE_BR_SPEC
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+endef
+
+QT6BASE_CONF_OPTS += \
+	-DQT_QMAKE_DEVICE_OPTIONS="CROSS_COMPILE=$(TARGET_CROSS);BR_COMPILER_CFLAGS=$(TARGET_CFLAGS);BR_COMPILER_CXXFLAGS=$(TARGET_CXXFLAGS)"
+
+QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
