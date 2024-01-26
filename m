Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1572C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EE560DF9;
	Fri, 26 Jan 2024 17:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55EE560DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZsDZ_VYN1mB; Fri, 26 Jan 2024 17:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AFA060BF1;
	Fri, 26 Jan 2024 17:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AFA060BF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACF0C1BF38C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8548760BF1
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8548760BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVSmpFbX8A5o for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 17:29:27 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99F2D60BC0
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 17:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F2D60BC0
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40ee82d040dso6048445e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706290165; x=1706894965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oMNpyifNnAUCPSK/CtXMkhVIyZswiK0DR48fXrA2ieM=;
 b=IZ6lG7/qoxb9L86ShkgR83w8beKGOGC1rBYGv0KrK0out9f3Y+HUxKRjR6jl+pBUCj
 DYqvCDKYRgBRCvyqDqclZ7DX6GLyH70LWNkecDLIxM3AsWdqXcuTRJQycOr5slYx+Ege
 fSxRYjZMQTy1toLTCMsy7gxUtMFbV2Vtllf4csAY1WkKkBQt1L63rrayOVYQST2qVhcU
 VIb8SL3KYL1wcRFxUoxORiXYKyrogWwbxIGgoeybRyT/u6LmJEPe8qS2DdAzB8Vrq1x9
 x4iHuynH2MGCkfHn+jkaUKWR6qjV3vHDa7HPz5HXJ1Ftc6J5fifoSaUi2S93mlfqZ5RJ
 2bBQ==
X-Gm-Message-State: AOJu0Yz1DOydMP+CpUW2c04xEq0lzBWok/f87dGYZsKW2j25g7BPHn3k
 um+yeD2Fv9U+q3qRoxHYwfdzEbwdXC7wNZLNQ+44ZSN67R8Rf+Kf22zPI5U7eNQ=
X-Google-Smtp-Source: AGHT+IH287b8oxGI7VOgYB3rabNohuN8asxBvMOLbdnVwFuKhpHI4h5GXeVedqau4ssBPLg2jlqQyQ==
X-Received: by 2002:a05:600c:4f08:b0:40e:4e95:c3 with SMTP id
 l8-20020a05600c4f0800b0040e4e9500c3mr99559wmq.73.1706290165099; 
 Fri, 26 Jan 2024 09:29:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c444c00b0040ee7175eb1sm1118663wmn.9.2024.01.26.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 09:29:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 18:29:20 +0100
Message-ID: <20240126172920.1628617-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706290165; x=1706894965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oMNpyifNnAUCPSK/CtXMkhVIyZswiK0DR48fXrA2ieM=;
 b=gL/+DCYrbUJqt9sKarSeFQoxR4joje1re66NeI0a8EU+DK6p0DJnv01S95uuf5AhTD
 4JYAV5PlFmiZ/zUYfHB7IrwCvjEHj0cGNxFBJdSY5Opc7dTjiXb4sgdKVydPw/Kth37Q
 uS4aK+HT1XbEb8IMhsNH2379CiEQIVoUR1H/T0YqDuKjgj+vvcxBorVKNus8mkQD6rCE
 rbKkinAIxVVkYXrXvM+g77qx5A4BWDVWydNUqIEswnYxRsdfT9Y+efLCvLQ1UrHyqemL
 NdbKr1o32DrVTPBRShsIldv66ZkdsK+NMhCNLpXeUJ+Kq9sz1G6BQ8o5FQBUreEsvjdy
 aoVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gL/+DCYr
Subject: [Buildroot] [PATCH 1/1] package/brltty: disable emacs and lua
 bindings
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable lua bindings to avoid the following build failure if host-lua
and lua are built before brltty raised since bump to version 6.5 in
commit 82c6e87d5eaaf5b32aa340ab384f88539238cbe1 and
https://github.com/brltty/brltty/commit/42bf48ca010d9163652cb0a014662fa243132736:

configure: lua package: lua
configure: lua includes:
configure: lua libs: -L/home/autobuild/autobuild/instance-0/output-1/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib -llua -lm -ldl
checking for lua5.4... no
checking for lua... /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
configure: Lua shell: /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
configure: Lua library directory: /home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3

[...]

/usr/bin/install -c -d /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
/usr/bin/install -c -s --strip-program /bin/true brlapi.so /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/brltty-6.6/Bindings/Lua'

[...]

brltty: installs files in /home/autobuild/autobuild/instance-0/output-1/target//home/autobuild/autobuild/instance-0/output-1

While at it, disable emacs bindings which have also been added in
version 6.5 with
https://github.com/brltty/brltty/commit/64a487e29941df54796645229a872ecbe2a06bfe

Fixes:
 - http://autobuild.buildroot.org/results/f424e6727bbe61ea4b7703e93aae6fcab7506898
 - http://autobuild.buildroot.org/results/bf4a161fc66fb99a24f08bea3436b13738f2e383

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index f00a18cc6f..22d58ebd00 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -23,8 +23,10 @@ BRLTTY_CONF_ENV = \
 	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
 
 BRLTTY_CONF_OPTS = \
+	--disable-emacs-bindings \
 	--disable-java-bindings \
 	--disable-lisp-bindings \
+	--disable-lua-bindings \
 	--disable-ocaml-bindings \
 	--disable-python-bindings \
 	--disable-tcl-bindings \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
