Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FF5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 07:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFD0812B5;
	Mon, 26 Dec 2022 07:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFD0812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MnrET7QVWq1; Mon, 26 Dec 2022 07:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D27812B7;
	Mon, 26 Dec 2022 07:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D27812B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 802FF1BF228
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD30812B5
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD30812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5D_wMY2yxQt9 for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 07:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E496812B4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E496812B4
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 07:48:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o15so7164871wmr.4
 for <buildroot@busybox.net>; Sun, 25 Dec 2022 23:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+3UT4sP+ilcJUG7lrt1wriOWYjbVR5ET+E1flfQNeA=;
 b=VB16j/yp+cRmVMgDcvwr8vzsHgnhNaXBYMLDPetD49saYwLNK8Gov7mMbwYBZVhC3b
 MFVIb9x6PReTvNHPVEbw25X1fC6VV2dkEFSN+iM3e3ISLv1vxzxZzwn8VWHtMRpP2qm+
 KLh5UXZK5HUUo4EJSpXXMMfm43C3BjJhjfUDl+PfWFv2rxh3V5O+ly6ipkXwPRjKUR70
 yHNkm8t/a9IILH7pctAbA/qOTatAFDlP+BwHlVg1mP2Dqs3UZTJra2EYC76WsvZPnOGG
 GWTydj3xM8loLa0FlFrA5h7/gG36ZoAsbtkzhAHX/KJof1je2MnxPHKIMZ/HFD8uE/Z+
 ixcg==
X-Gm-Message-State: AFqh2krEj6VAiBOIX8dD36isv0fSJGxfhmlzyebnwYUxg+w6GvITU0BG
 AvkDOzvvGirs5T9oAsLmZuwUKY4OINY=
X-Google-Smtp-Source: AMrXdXsTekKJRrfv5BdkVcl1luKUuOg6/tYlkNu4/0H7zI/3zs0K3gmmyUX8B71IHmcPOEdo5Rx/iA==
X-Received: by 2002:a7b:c3c9:0:b0:3d2:e28:647f with SMTP id
 t9-20020a7bc3c9000000b003d20e28647fmr14456618wmj.15.1672040902732; 
 Sun, 25 Dec 2022 23:48:22 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003d1de805de5sm13036704wml.16.2022.12.25.23.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 23:48:22 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 26 Dec 2022 08:48:01 +0100
Message-Id: <20221226074801.143640-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+3UT4sP+ilcJUG7lrt1wriOWYjbVR5ET+E1flfQNeA=;
 b=A0b/8gvYST7LspRmR/sJ+iXkMtF/TgJxtF+/z07OHIPP3UX0oGLwH/e/2hu+lPEYAX
 lJEvThGgFmOG5RHqKXxYFZkoISreA+8of29WuASIkQtJHDyvNQL1wehlxWH1v56RYXOw
 yZMLvn/ZvMPIyQp3lD9lkXWFDw+L65vVXguTIVNTSsARCWBK4IeBnqNQVdVlvRDZ1ATR
 enLOkbwOQFHn2B3cXo134BRgZronx8dn4BL5/lO0xl6jHLR1WaTncczwWj6Ble6+gcnz
 WhEuiLgTetSOwVDrsTv66edqtIFWxk3PprQLFLljgKmtcdJfZkfvFLipR6p0EYTfd4I+
 PFBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A0b/8gvY
Subject: [Buildroot] [PATCH] package/lua-datafile: bump to version 0.7
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
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 07a13e7e8..e3b415ad4 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  4f7d58c50267b5ebd2145e52aaa5fb63fbf63a74ae765f08e2d0dddd570b6b6a  datafile-0.6-1.src.rock
+sha256  b511ce5a4f4072bb6c496bd42760fa92a0576d0c77828b6a2600d68fe9d7e998  datafile-0.7-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 5d30fdcf9..3b4c65d3e 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.6-1
+LUA_DATAFILE_VERSION = 0.7-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
