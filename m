Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9970C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 09:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4B1605E6;
	Tue, 15 Sep 2026 09:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tr8Ep5SJgfx; Tue, 15 Sep 2026 09:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5F51C60681
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789466222;
	b=qmN9uTLxmcV+gLS0+e+IwwyUj59ChnLq+YdjckhJZVHjKuJlm5/fVbRXk0/HW5byiZJS
	 Nohtg2BJhlDolRTyEjKe0PBBniK5wYYiNABDcuUa5A5ddCQfn0wSOQhfw+1tJ6XlrDxih
	 kbIcfugtYnVYDxuG445aQaGj1dbnAnLxH115qFHy8qUwZrVGnjTWRiWldZflmKDk7mCgk
	 mo9ZP8qGezNNu42VyD1NC8MoY7rzkKyjpqcKkMnfkrL1N8pBGr5yaQc/e3TfrFyVvZixr
	 7/xEQQHilpdMYaMyX2kXHovhkJDX/0TsD+YRl3dAuPU741rJss8j63sAHA3VuxaQZWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789466222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Le6Hr0QBl6Z+iwqPQGLEJJ7J138xn+YbEwEAkp3z+3U=;
	b=POPCcwhiNHDkIIP36TMzdDaq7kCs+97KG2Fk0eJTEZUjbsx1EaEoOazMqoDKT/1bX79r
	 /HDUYBpITt/qeNMHPVBCOXGpwTiTwnYQsrxeA9PYstPftg5xhZAWFThc0Bve9C7lUBA4k
	 6gTJ80zSvDFxlnACXzxadX0es6cGWw/kIlwYdDKUBOLZHTfDiTxRpli/JmyWnvczs9WUz
	 LLdmTvOpc0E9e9ZoTq3jgBdI1tlevMJN93UEJzcaLX33TWQwYPMdBktqW72IBNtPpB9JD
	 47DiXmvC4s7Rrp97U89b1jGWNMTwIrPV+Yzg9oLuH4lKT0Jap+PCSHieICoJVLpXi4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789466222;
	bh=Le6Hr0QBl6Z+iwqPQGLEJJ7J138xn+YbEwEAkp3z+3U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VLXUt6BxKn/RAP5sE7PXXwqMvDdKAlW8hDXOp1OVZJQCfqanIcHfou+rslhFxVAzv
	 qEdYOAI1c3B7i+JawQACGQ+pgV5cDEpOD+JHJcdw4whpSy4+sSI+BneDq+psw3aGQo
	 YZB9t5tbje/XpS46Gm23X/modASv5GiDj1oS9TsTFP0HaGRqHddweF/Zb2mjTBje4h
	 BnbfA2MW+CJ3u+I6364fhZ/PToH/1emzAR9GaoNjCuPzmtzkf17+DOOfzaPS9AjKoc
	 Gs6VnH2XuposBVQUMdGkCuPbBnb4MXhGujL/RXXam/kdex+aw6UfGpFKWCwTTOVvYT
	 Wl44xl+a8+22A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F51C60681;
	Tue, 15 Sep 2026 09:57:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5983FDCF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F99540568
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPiGvZyMvZWW for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 09:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB8AE40532
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789466218;
 b=DmjVBiwDmxUviiZyKyJXmk7WWiwX37d6JpM0bWHdrTyASFiywg5zWuIul/xH7xhf8FW2
 eickV+5zLBbiLOnUwmUiwnaR8LwmyAwwwF6MabjLHP/Wlaot8YwPxephz8L8eQM2A6mur
 QVxtsASSi80L4yQTM0Au8EA4R0HjSsp7B7TGtkUiM3EFPO65pnZMqEmTTWGCR8xCqmQG6
 DCU9KWp77aJ0NzwiaPGFXJ6uQRt5iaSuaEgC11tNRcHI5VReBO47vBcG/s/FV5WPPmUtX
 vpr+1mnf9PJtcgER22C3+M+14Zw50mKHavuwqBJDKE29V7tV6pIwGLqVwyrNrrabfGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789466218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6r1x3v87EAdfTvA9G5xOjU1/Kk6l425Zc1qt629x6fY=;
 b=MvfWTBqlDX1251GQ9GigYdi26Fi/bKnHWefv0khRNbp/N7SVGkNzZze0vI0/BcIC10pp
 nzKZayYDKvTZTuFdgUqlm6cpt5wBVmHwOQFcRbt/BrXrs/4xyX+EfZeOZZtguHkWddT5V
 qLF8ztKlJV91Jps5l+0UC4UGcQE8xThjjL499154Nj24TLrISuczU3+BbtICO5arPSqiD
 BWKIMiWGTQ35tnA32MKyb2+Znyt7pV1Ca/FSxwz0Eyq9tZgWe+TI9jxYswK6fcRjly26J
 ea3scqKpgljarG1jhGCnAgM7GPvb3R/4sw2lOsA3HnwOmtM5kRxXVwediTmi0vH3pUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GldAOuOa; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB8AE40532
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:57 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so1440462f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789466215; x=1790071015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6r1x3v87EAdfTvA9G5xOjU1/Kk6l425Zc1qt629x6fY=;
 b=SuX87nzwvLWysJHAVg6odeW9tJMu1PXwklVnSyM9+zvI23RwDj53ZjxWZyBQ3Uw13g
 ukG4GlEuRlZX2bxBo6LgXUMsNS+jxA6+TK362ZCRraA0Uzu26Oqfknt/azLXUhy33pcj
 kupzPA8GNmeGZFp3VZExUOTCpvI7bQQiU/AcXe0O832BVCqFd5w2OrtXjhvMe9i0dStG
 HuWOWolgcIRbwGaxd3XvmWcmRxx+rREx4g+19WQ4I3ikfl63iPXZ8XrF/7y3LwyZVxO7
 c2F8G1SmFPLK7hu/KmZExpn0xEvPwSz+RprkxTLgbmKS45e+uwtWwKuQHx1Lmkk0jVRZ
 1eWg==
X-Gm-Message-State: AFuF++nezV0q8KjRasnnhP6OL6k0mN1z5/9abHdL+vZhgaZRrT4ZVUsP
 gGxy6bajxINam5Q5l5WuUxjnVfhbOIn0CdHavuIYdd7ZLM4nEpdlkLtE4FZOmrqpyAk7A6pdUZV
 HUDHw
X-Gm-Gg: AYBFou3t7kymylo6cdSZrXgvz9ZB6GSLwZKaUYPwbKHrpc3AdrkmmRDZt/6gj9wg9iN
 Qnl8GdeUfGxV2O7cG9E5jpdq0q7NGd2uMxgjAKRJsl0ZWbwM7acDRfTZwqEHcQT3BEyD2QpclQy
 U/2zUloCpkrtIztVYhhb/7Qwc8idK4SSYSYNc+tn1Ici3y5795vSJGm+wDspUGxsK47HXfZfPJC
 NCeqaiXYXUbA8685x2iJxNmUoRCc/XgVLERH2viUB1M6p3HmE7fj/H+FdBK5yRk/oS9dhBM0MLs
 VlQDohks5A32IwIJtIVItewezu/F30NQ0pRAWtdW+G4lrj200NlBQa8PACnk7St+TvWTiRfsHZ4
 M8rqGCt6krCmRqppQe8oNx7RKDytjUqR+SicJSGR34fE/rrkopg5oc7oihKWyUNNDBhfJtw8TNq
 K2YSk7OQeQ7T0PWZtqrih3tXfKQeTSTMZCJ/Qp2xYmBmxfH5VNowcan/9c4WYBiypXBx0iz1910
 sI=
X-Received: by 2002:a05:6000:605:b0:486:f908:14c with SMTP id
 ffacd0b85a97d-48702b6d25bmr7765790f8f.47.1789466215548; 
 Tue, 15 Sep 2026 02:56:55 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecfc3sm31841411f8f.4.2026.09.15.02.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 02:56:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Tue, 15 Sep 2026 11:56:53 +0200
Message-ID: <20260915095653.279455-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915095653.279455-1-thomas.perale@mind.be>
References: <20260915095653.279455-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zabbix: fix build without libcurl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building zabbix without libcurl enabled would lead to the following
error:

/usr/bin/ld: .../src/libs/zbxxml/xml.c:515:(.text+0x1c64): undefined reference to `zbx_vector_str_append'

This issue has been addressed in the upstream commit [1] and backported
as a patch in Buildroot.
For more information see the upstream issue [2].

This error is reproducible with the following defconfig:

cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_ZABBIX=y
BR2_PACKAGE_ZABBIX_SERVER=y
BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND=y
EOF
make oldefconfig
make zabbix

[1] https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/e8333ca2128
[2] https://support.zabbix.com/browse/ZBX-27635

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rver-and-proxy-build-without-libcurl.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch

diff --git a/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
new file mode 100644
index 0000000000..b90c7536da
--- /dev/null
+++ b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
@@ -0,0 +1,69 @@
+From 0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8 Mon Sep 17 00:00:00 2001
+From: Artjoms Rimdjonoks <artjoms.rimdjonoks@zabbix.com>
+Date: Mon, 27 Apr 2026 12:36:47 +0300
+Subject: [PATCH] .......PS. [ZBX-27635] fixed Zabbix server and proxy build
+ without libcurl
+
+Merge in ZBX/zabbix from feature/ZBX-27635-7.5 to master
+
+* commit '142cefe8703dd25afaf8c7f05379d61136e773fd':
+  .......PS. [ZBX-27635] fixed or includes
+  .......PS. [ZBX-27635] updated include
+  .......PS. [ZBX-27635] added Changelog
+  .......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl
+
+(cherry picked from commit e8333ca2128bf9ac2ab50ee1ee06445766b6192c)
+Upstream: https://github.com/zabbix/zabbix/commit/0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ChangeLog.d/bugfix/ZBX-27635        | 1 +
+ src/libs/zbxsysinfo/simple/simple.c | 5 ++++-
+ src/zabbix_js/Makefile.am           | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+ create mode 100644 ChangeLog.d/bugfix/ZBX-27635
+
+diff --git a/ChangeLog.d/bugfix/ZBX-27635 b/ChangeLog.d/bugfix/ZBX-27635
+new file mode 100644
+index 000000000000..a8b07470a37d
+--- /dev/null
++++ b/ChangeLog.d/bugfix/ZBX-27635
+@@ -0,0 +1 @@
++.......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl (arimdjonoks)
+diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
+index 599816c517a1..3bc324a08b1a 100644
+--- a/src/libs/zbxsysinfo/simple/simple.c
++++ b/src/libs/zbxsysinfo/simple/simple.c
+@@ -25,9 +25,12 @@
+ #include "zbxcomms.h"
+ #include "zbx_discoverer_constants.h"
+ 
++#if defined(HAVE_LIBCURL) || defined(HAVE_LDAP)
++#	include "zbxip.h"
++#endif
++
+ #ifdef HAVE_LIBCURL
+ #	include "zbxcurl.h"
+-#	include "zbxip.h"
+ #endif
+ 
+ #ifdef HAVE_LDAP
+diff --git a/src/zabbix_js/Makefile.am b/src/zabbix_js/Makefile.am
+index 1e4fd93d9fd2..2ef20fb9f911 100644
+--- a/src/zabbix_js/Makefile.am
++++ b/src/zabbix_js/Makefile.am
+@@ -9,7 +9,6 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxembed/libzbxembed.a \
+ 	$(top_srcdir)/src/libs/zbxjson/libzbxjson.a \
+ 	$(top_srcdir)/src/libs/zbxregexp/libzbxregexp.a \
+-	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxthreads/libzbxthreads.a \
+ 	$(top_srcdir)/src/libs/zbxmutexs/libzbxmutexs.a \
+ 	$(top_srcdir)/src/libs/zbxprof/libzbxprof.a \
+@@ -23,6 +22,7 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxhttp/libzbxhttp.a \
+ 	$(top_srcdir)/src/libs/zbxvariant/libzbxvariant.a \
+ 	$(top_srcdir)/src/libs/zbxxml/libzbxxml.a \
++	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxstr/libzbxstr.a \
+ 	$(top_srcdir)/src/libs/zbxnum/libzbxnum.a \
+ 	$(top_srcdir)/src/libs/zbxtime/libzbxtime.a \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
