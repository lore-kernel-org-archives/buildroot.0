Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9E4C4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6D561002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA6D561002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA40A400F8;
	Wed,  4 Aug 2021 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkBoYT1uq505; Wed,  4 Aug 2021 09:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EEC84011B;
	Wed,  4 Aug 2021 09:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3955D1BF4DA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28CDA60585
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qyq3OEt3a5LS for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 09:45:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75B3E600D1
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 09:45:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso3470525wmg.4
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiAKapjMU7COtgeIEiWcXD52ZqMDSozdA579A/Zp4SU=;
 b=jMeRQBeKprk8YohkwhPi1NXXkWgkE/UUiowyb1d34NuqO8bcuDD9yICGgG6MH6E29i
 r6gqgj24JeNidH81eQNnrJjm6wLbt0VRgCy9xtNiU/PbpORuHEAfudZHSYHgOP0wvZ+J
 /1pExfp2a2t/lpAthbDAapItYipM29HXEXJv/XZRbyCiluskkMH0oE6w1b+jRkcS0ExK
 mc+O5aqOg+kZ1CI1gg3j2WlQWAIGvBtSEsQOs7WLOjJVZhZM0nkop0frCO4aSnMKT7ad
 B8NgXC24wcx3dAmhsj0DzCBlp0plFLiomEbMc+NAwXTyQr4e07w9Ke5x5xb626uQ12Fo
 z8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiAKapjMU7COtgeIEiWcXD52ZqMDSozdA579A/Zp4SU=;
 b=ZARsoTPciRxsOQEaB1qe+PV8wpQBETpPrBJ93a8wr29b7EEh0iteirrf4ljCl05EvH
 xGeiD206yy8WQU+//H0q4R7SeEWPSZ2JctBLwvZttZIapaHtn31i1mOWfTz5u+s/i4tf
 ETd5OFD1C6zRfgOWbY6BgFYMYDGtA25yk0asWLGDDspH8Z5GZU7qT1uUg7gk6xvn2ywI
 ELGMUe+GOEhRwT8fDjhdAl8NTZFDJR9HgZ9PPwBC9/m2xmHXvVSZOKckVU4KE5128Ha7
 UAW12DrAWENFAMUE2Yp/URIAclwUajYSwPPTXRyrBbQ4fIjaM59sOPTMMHRGK4VF9Ih6
 4gYA==
X-Gm-Message-State: AOAM532cXL4RS9Bj5w4zOfx/KAeEp7fDHeQd2/Q4m+KOOY9FGS5Cie9U
 Dyd0j4x270EK3C2bgsOYKX0hLWD7Y0e/Gg==
X-Google-Smtp-Source: ABdhPJxq/VXrArHhEmvipP+y0nvjKOtXjysBvqUM+yA+/RUAK+FOhnwLmKIrV43erhA7JuclxP8dgw==
X-Received: by 2002:a1c:7509:: with SMTP id o9mr26805884wmc.32.1628070312512; 
 Wed, 04 Aug 2021 02:45:12 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id k1sm1962931wrz.61.2021.08.04.02.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 02:45:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 11:45:05 +0200
Message-Id: <20210804094505.930847-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c: In function 'uwsc_lua_on':
/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:177:5: error: this 'else' clause does not guard... [-Werror=misleading-indentation]
  177 |     else
      |     ^~~~
/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:180:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
  180 |         return 0;
      |         ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1b031667e6d184493ea55ea6630272af4e475375

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libuwsc/0002-fix-bad-indentation.patch    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libuwsc/0002-fix-bad-indentation.patch

diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
new file mode 100644
index 0000000000..f33f944d06
--- /dev/null
+++ b/package/libuwsc/0002-fix-bad-indentation.patch
@@ -0,0 +1,27 @@
+From 8cb416140741a596235b8acc46b2b119b13ebfab Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 6 Jul 2021 21:01:52 -0700
+Subject: [PATCH] fix bad indentation
+
+Fixes error with GCC11.
+
+[Retrieved from:
+https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lua/uwsc_lua.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lua/uwsc_lua.c b/src/lua/uwsc_lua.c
+index de6932e..84689fe 100644
+--- a/src/lua/uwsc_lua.c
++++ b/src/lua/uwsc_lua.c
+@@ -178,7 +178,7 @@ static int uwsc_lua_on(lua_State *L)
+     else
+         luaL_argcheck(L, false, 2, "available event name: open message error close");
+ 
+-	return 0;
++    return 0;
+ }
+ 
+ static int __uwsc_lua_send(lua_State *L, int op)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
