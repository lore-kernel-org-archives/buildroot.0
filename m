Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE3C5479D
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 01:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8564A60AA5;
	Tue, 10 Jan 2023 01:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8564A60AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXo8UCDtWYzG; Tue, 10 Jan 2023 01:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF1B60812;
	Tue, 10 Jan 2023 01:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF1B60812
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDC61BF37E
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 01:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43F72401F3
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 01:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F72401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOHg-mMNG_Mn for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 01:57:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02ABF400C0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02ABF400C0
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 01:57:01 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d6so40767iof.6
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 17:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFszaJEAuB8K7cKJzUXGtb9lAbNEsauEqoUMc1q+HNg=;
 b=M4q9zSXY6IHJl3X7IiqCl+mvBlbP6ceLdq/gAW1YjbAD5qOYHMMO/r3jPBjsMb4j3Q
 4dAC3mXg0ghGpBHUSoyB7vI2smTQwEPedtvmrLCsm67fDggqysxXKGy45YAK0ActwiUz
 YWDnW7O3pOxXu9HgJBW7bcgU+q5onjwmN2babz6FnrBgKgPUIW12sTfa6Lv16CDO96xk
 6edbq6/Z+B00w6xyMV94GFLu204fyzYELwPtG6UvycH/nAWVHu6Jt3FPJ0M3H5pGLj0s
 Mt1reT62U93+4obHWhH6g3JqJZ9H+dPwsMheYTzcF7PPsLBa6OTiafxEnR5mHYsqT9zl
 kEsA==
X-Gm-Message-State: AFqh2kocuJXh8Z3yxBJx4H8eCTO8c5ZlmZErvca4WSy3gBvZLQAWk2jl
 qMqzjX8JsrhFW0J0tSljDnf7xtiPFX7gdAPR
X-Google-Smtp-Source: AMrXdXsN+YZfUuZSC2scZ5fB9IF8YJlYb1VhPYv67RYxmQTM9WApU0jMeJVOKgvF/mDKf5AVeSg+gw==
X-Received: by 2002:a6b:770d:0:b0:6e2:d23a:6296 with SMTP id
 n13-20020a6b770d000000b006e2d23a6296mr44568898iom.20.1673315820758; 
 Mon, 09 Jan 2023 17:57:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f24-20020a056602071800b0067b75781af9sm3820097iox.37.2023.01.09.17.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 17:57:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 18:56:58 -0700
Message-Id: <20230110015658.3249549-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rFszaJEAuB8K7cKJzUXGtb9lAbNEsauEqoUMc1q+HNg=;
 b=hCodWYkb5dTqrreontWhoEQAP+XeWflSWq+6Vs5v+fCMyA/sDyyqKb3duKZQYkY9kI
 EXnANIsPEJofKN4JnNzaMwsRD+QUG+tD69iFk8TECFkGsKk2eiRYA3GZru1nns4Mw0lW
 a4CV8Irt3D/iNltpjPsVJcLt6HypBPGwc4QQLD8+wW4PhSAc2tUeVlh4rK9xoq+SAmcr
 7KcN146+ssWA/8UMzFU+atLD3ZZi8erotilOw5wWrET9c8ZMi1JfxF9Ix7M0Kvx+Jcy4
 p4plE5DaIla122gcyK2+nysf+OkSd0d2zOt0wREUv6vYKyy38hzLm/3F6btoIA11BBnL
 AG1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hCodWYkb
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use install-bin for installation instead of install as we don't
want bash-completion files to be installed.

Set empty host installation prefix so that we install to:
$(HOST_DIR)/sbin/bpftool

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 92b9359fe3..cfd3c54515 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  465a50fea4afbacd326f2209d81ae0dcff637fbb2c9d1a315e94f79a788ce960  bpftool-v7.0.0-br1.tar.gz
+sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 3b27698130..cd68d89799 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v7.0.0
+BPFTOOL_VERSION = v7.1.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
@@ -33,12 +33,12 @@ endef
 
 define BPFTOOL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/src install DESTDIR="$(TARGET_DIR)" prefix=/usr
+		-C $(@D)/src install-bin DESTDIR="$(TARGET_DIR)" prefix=/usr
 endef
 
 define HOST_BPFTOOL_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
+		-C $(@D)/src install-bin DESTDIR="$(HOST_DIR)" prefix=
 endef
 
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
