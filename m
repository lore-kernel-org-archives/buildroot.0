Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE1CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 18:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09F6740920;
	Sun,  8 May 2022 18:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2epf-H88lDNy; Sun,  8 May 2022 18:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE61404A8;
	Sun,  8 May 2022 18:29:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C795E1BF47D
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B646260ACD
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bX0TpdVeESNv for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 18:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C44D060797
 for <buildroot@buildroot.org>; Sun,  8 May 2022 18:29:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so7143357wme.4
 for <buildroot@buildroot.org>; Sun, 08 May 2022 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2MexmotECoXke8HBsgE8XmY2LEyJryn71jboAodqflU=;
 b=nK4SAcw3UdqWW5EYb4S/pN6I+Pd84H6Yp+zGfQbKctfkZLUcgTmDuIwMQ2lASx6c/c
 fAbhgZLhrhWFVIAl0F34gTjv9VOmeGpgwS/Fx9FdSeNk6dqRn8EqRdqUabOrx+udCUh/
 c0oqehDEHr42n/5lTF74420rG7RNZH15SmGpTmDHMBUmNAjLlrEx4KCp1mbkWN+aWV56
 6qkpQHB4ny4epN1KqLRmWMFJL7u0lLZwhavntiRe3yM6p//afnTJxo6waDc8gZ7TMWGv
 PqLJdzsztpKGY/XV/QonC9yKPFGuiHkYtEeOOTtrqI4GRi3cz91IWKOXHRyeDqCsVrJz
 k5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2MexmotECoXke8HBsgE8XmY2LEyJryn71jboAodqflU=;
 b=a95pDlIBM583a1462p9YkdBTECD/y/3mWwiYrAQZuByJLRI8AgRFYOVlcYxIBE5HDC
 uqL8WFqHVcs7ah9yelqers1lJuJGSDmny88eXqb2kVW1UoX5asbr1sRvxaChW1L6yKV7
 ywLBwQ7XIWvFtNRavTAUxljRQSOWkL1XwK5Jou/B64GQT1bR9CpcvjDItxW7z7NxVTKM
 MQnJD1UtnIzVS/l+EoJLPedHVnwxbnWw0ipCM97U5RNs2P3oGIE374gSRishw7q3yjhC
 OB8XQDegLc+g4PqSu7Qymo/PO9Sv0qNO/OfwJXd7WVa7kzzJU+nNjqG5Xes0TmGD16jy
 WQRw==
X-Gm-Message-State: AOAM530ANqc6KvCkh9VAY6jV4VBthx9iN5Q99vT3sNRuAwzpz6sLTGWm
 NRIDgxDY5nKZeoahHb2l64vkvdkwv7U=
X-Google-Smtp-Source: ABdhPJyGoKYQyPXe2AC/zOZQAFSrJ17gQews1B+/R4P/Dqqa2BnwOgZViIrrXPWm084I+clpazIQSw==
X-Received: by 2002:a05:600c:1151:b0:394:6816:d4f2 with SMTP id
 z17-20020a05600c115100b003946816d4f2mr18303971wmz.195.1652034582627; 
 Sun, 08 May 2022 11:29:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v9-20020adf8b49000000b0020c8d8252dasm9476364wra.103.2022.05.08.11.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 11:29:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 20:27:27 +0200
Message-Id: <20220508182727.888244-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bcusdk: fix build with
 argp-standalone and NLS
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:16428: /home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:190: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: argp_parse not found

Fixes:
 - http://autobuild.buildroot.org/results/9277a064b61f24ad35334b318fe4d899a4c39aa1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bcusdk/bcusdk.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index ff5becd84b..8006b265b9 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -21,9 +21,12 @@ BCUSDK_CONF_OPTS = \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr
 
-BCUSDK_DEPENDENCIES = \
-	libpthsem \
-	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+BCUSDK_DEPENDENCIES = libpthsem \
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+BCUSDK_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+endif
 
 define BCUSDK_REMOVE_EXAMPLES
 	$(RM) -rf $(TARGET_DIR)/usr/share/bcusdk
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
