Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CA5C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 11:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF614035D;
	Sun, 17 Mar 2024 11:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZ_0xY-MhJZF; Sun, 17 Mar 2024 11:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919CB403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 919CB403B9;
	Sun, 17 Mar 2024 11:04:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55FCB1BF420
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 11:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50125403AC
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 11:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chXVMtOFhuNJ for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 11:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 421FC4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421FC4035D
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 421FC4035D
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 11:04:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so2162170e87.2
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 04:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710673489; x=1711278289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGrjukW2eL51OWlZWw/aevioNc1WVtF9hsGcAxOOww0=;
 b=PZxY9PGg2OIOMdyLGBZmQ2kedJzSbrtov3J615OSf0lWpwTggoANcSa2d6Uk9QkUN3
 GZxelPt/nYMx7mkSQRbOtmaKTVIOTbG4u5rbQSv0hpaCfK6IDB3rfe/vxglfk+E1b+Vt
 URZmkewAcIToZ0hi8VjFdcC6xK67dTSP5fQMtZ3ukgc7wM21rTa33QumU5Q3N37GFyAd
 jDHuSpFP8quE+3iy12O78HozslrT3f6RtS/fiWzc2W2RWpeFrEY15YYQN/DDc6CixEQf
 oI3zyJ4UcUBTyT3UsaIyuNqRdUiF80KhJYVIUdhYbIYep/AZgO4QM/qpPeZPmYhZ/N0r
 Lfrg==
X-Gm-Message-State: AOJu0Yxlx/5OOAl8pCtMRJyrsmfkAblB8RsR7NOzg1Zqhj0jcJywKTsW
 X8gUqiQKliQi4CXVlTlVC4SXHkRnb9b7u2uUXx73iXaXkgpthg2PYJkgcTMq
X-Google-Smtp-Source: AGHT+IHJX3zPLRSZ4wRnVtxkb6iVycKDCCKHoHYWUljs67+80zuQemCWUrDQicd8ezP8o2Emkmm9eA==
X-Received: by 2002:a19:5e5e:0:b0:513:cd70:8db0 with SMTP id
 z30-20020a195e5e000000b00513cd708db0mr5795942lfi.65.1710673488786; 
 Sun, 17 Mar 2024 04:04:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b004140e701884sm886185wmq.22.2024.03.17.04.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 04:04:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 12:04:44 +0100
Message-ID: <20240317110444.258643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710673489; x=1711278289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zGrjukW2eL51OWlZWw/aevioNc1WVtF9hsGcAxOOww0=;
 b=DFJS6EfiDJwwiJaQ3CFejc7BJ4LFQqvhOV20j6c9SlqzxnE/TCKBJ/7mywqdUH760t
 Lxyr000TB4NJWs3oMkRPLr1VkO/QuO3Gt/0qgRpIqfeTkH5p4eQvyJzCzWxB+431mNcc
 7hXlCgYbeoSvBcjH21Joz7rA5c55cl5f1ALRv41PmKHM7iBd92jzdsh7t1XqZAf4dCoy
 YphJsdmg05XHtzhQzq94FDOSxp42Nopfa2uo3QqUwJAHLSzswEusq1EuUcv/tjdu+fbH
 OczGB1+uRFsN/+WUWazO+J/nL5JmuIksb9/xaKvsVvjhfXOOzKINxg+VSDM5gzbWz6Pi
 mijQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DFJS6Efi
Subject: [Buildroot] [PATCH 1/1] package/squid: fix build with host gcc 10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass -std=c++17 to fix the following build failure with host gcc 10
raised since bump to version 6.6 in commit
c13199c9326fa2daa574f08ec8fc063a48d0eb06:

/usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
  268 |                     auto &newEntry = entries.emplace_back(name);
      |                                                               ^

Fixes:
 - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
 - https://bugs.buildroot.org/show_bug.cgi?id=15997

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3a9edac71e..6a2b522336 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
 	BUILDCXX="$(HOSTCXX)" \
-	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
+	BUILDCXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
 	--enable-linux-netfilter \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
