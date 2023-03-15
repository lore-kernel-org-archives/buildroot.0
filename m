Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8D3C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF47341750;
	Wed, 15 Mar 2023 09:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF47341750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cciDumP_9yhJ; Wed, 15 Mar 2023 09:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F4E417DF;
	Wed, 15 Mar 2023 09:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F4E417DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1D901BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB98981D35
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB98981D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVqe5th1_ZHU for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:08:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8219D812F7
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8219D812F7
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 09:08:03 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id eg48so13393702edb.13
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 02:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BORlpLLdkV3i92UbjUHKFosE5TtidJflYb0wymmcvf0=;
 b=wEBktrdbT7YZRlr2156C/KC0b8lDHROeRNpRY9XwK4rbMGXR2+TdLvEGAz5fn8jQte
 pYVaXw3iOBtHjAA7z89re1qMsGUsG2Ta+h+8p4Xkor05HYe/NzyOB6wxVwYQzvS/IEna
 vrsbMUXoCSFukLt4CckW4ozHoVbHzYuf6B72bq+w9TnkUABMVVy+MgCoDZyIqIMepe+R
 ZbrHHfo2QQ0htrDORidl4s8bnjaQ8rXc1IeajXx2rGe+DEA9uqQQjgFjdqT8hLGhDUjm
 xm8PXzoqkFlqC5W7wKnMLRli4XDtDwKaEeZO9ZpwM+RwlAJdGKP06AaLrylKzhyU12t/
 jUJg==
X-Gm-Message-State: AO0yUKVkTxI4sS1dr7V/NMd9pHne65fCuiCdgo58AN+R7gP2vBCeuIGG
 80wpFXtv1NqJZzils0YiQhkPAhTbqK4=
X-Google-Smtp-Source: AK7set9uDel5f6F7cTZ1KTzmAEzko33iAFJjLArUWM8hNPYnt7IgENCeaYGvTQU0smw/5DlvovYApA==
X-Received: by 2002:aa7:dd4f:0:b0:4fb:9fd4:6ac5 with SMTP id
 o15-20020aa7dd4f000000b004fb9fd46ac5mr2019909edw.14.1678871281532; 
 Wed, 15 Mar 2023 02:08:01 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a50d794000000b004fb30fc1dabsm2067047edi.96.2023.03.15.02.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:08:01 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Mar 2023 10:07:55 +0100
Message-Id: <20230315090755.399279-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BORlpLLdkV3i92UbjUHKFosE5TtidJflYb0wymmcvf0=;
 b=ldiuR+Rh2rJceorCz18gtPeyKahmNjUJliSwm70u5ga2S5b9+W3QWpVZfXVh+/7dxQ
 FX8q1nMvUb/nOw7VT3yeLh2Gg+SpPOgzkOnoz4JyTyAvjbjczUZrycrauxWfUTs5BhQT
 I+tOmLDxAiMhItuJnflE5d5rnQ3jr2qLpFNgbhrJTmfJOBXUchwgDkru2UrS0r0wvLsB
 dwj35PLncF75n2n1ilKszRvcg0U4VJjyQjyqMeHPBa5VmahAwGsluu5A8uBjapFwvdgQ
 pZN3j1Gy8lS0cE+xqS9y7CAUD67G7rSLiGfsunPB8lun3EpVkupIwb5Gx27XI0jhYgsl
 4rNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ldiuR+Rh
Subject: [Buildroot] [PATCH] package/lua-dkjson: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/lua-dkjson/Config.in       |  9 +++++++++
 package/lua-dkjson/lua-dkjson.hash |  5 +++++
 package/lua-dkjson/lua-dkjson.mk   | 12 ++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/lua-dkjson/Config.in
 create mode 100644 package/lua-dkjson/lua-dkjson.hash
 create mode 100644 package/lua-dkjson/lua-dkjson.mk

diff --git a/package/Config.in b/package/Config.in
index 72167e99b..52aa5dab2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -715,6 +715,7 @@ menu "Lua libraries/modules"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
 	source "package/lua-datafile/Config.in"
+	source "package/lua-dkjson/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
new file mode 100644
index 000000000..9c5dff192
--- /dev/null
+++ b/package/lua-dkjson/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_DKJSON
+	bool "lua-dkjson"
+	help
+	  David Kolf's JSON module for Lua.
+
+	  dkjson is written in Lua without any dependencies, but
+	  when LPeg is available dkjson can use it to speed up decoding.
+
+	  http://dkolf.de/src/dkjson-lua.fsl/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
new file mode 100644
index 000000000..8f1a6f6a2
--- /dev/null
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -0,0 +1,5 @@
+# computed by luarocks/buildroot
+sha256  e4ba15f2a85f84ffc7f628157a4ad16b2b04ba05eb44a2e5956fa46bd104125e  dkjson-2.6-1.src.rock
+
+# locally computed
+sha256  7fd6585e9776c1cf2930e8ce660b3116c8a9b4b676929d45078870a42f16aa65  dkjson-2.6/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
new file mode 100644
index 000000000..718c47f50
--- /dev/null
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-dkjson
+#
+################################################################################
+
+LUA_DKJSON_VERSION = 2.6-1
+LUA_DKJSON_NAME_UPSTREAM = dkjson
+LUA_DKJSON_LICENSE = MIT
+LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
+
+$(eval $(luarocks-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
