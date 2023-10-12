Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2191CCDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D326260FC6;
	Thu, 12 Oct 2023 10:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D326260FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2qCRTaWF1xC; Thu, 12 Oct 2023 10:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2039660A81;
	Thu, 12 Oct 2023 10:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2039660A81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 466611BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE09760FE7
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE09760FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDoZYlgs9B5E for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:39 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C7A60E2F
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C7A60E2F
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso124530666b.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106757; x=1697711557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYqCBzHNDt7VP1aifp2wCGQdoi4zUFX27k/TBjFgzFY=;
 b=LEeKO1wEMmawNqYsO1CMhuSs4KLOGJ1/4bK8PglkdI2RjUnWPJD+d5RYOyKM1vlkTp
 ss/VBmaIo7pwsAkRUI9HwysODioyrvNHZka/0paBkPlo2j0mQ/+Ya+UMpXUYr+iUDNNY
 wQq11SPrhdJJ9BZBNyQfp8goawnhITVZIj8SilWecSLrI7dTsGlKix6wGhrfaamRvDQx
 SVuCX4U82pWww+hQDj1pe3VHV5DNlnphH09F2guffr5ZxytuACwkCvimP55xorkgB6nj
 uw+blrds3Zax+gbUmy7giKQ1ThwgfmDyNQ2ARLzBTgpJ/+d8+mCpDGX6BIz7h8vSrjgu
 /OHw==
X-Gm-Message-State: AOJu0YxTt2FYi/L08qDQmZO9o3LKBGpg2AeMIsmf3cHwE6RToFdTnEWX
 73hx8G+ttIY3waLDUQbA5JuGR30VTxPlhS7yIDYW3g==
X-Google-Smtp-Source: AGHT+IEbfk1EjOf3PCzAr19XWU5ivd7oHufXxnfmdU0OvRVtUFlHPz/8czuKACLYNaKEpdUHbvFoOA==
X-Received: by 2002:a17:906:55:b0:9ae:68bf:bec with SMTP id
 21-20020a170906005500b009ae68bf0becmr22166854ejg.75.1697106757373; 
 Thu, 12 Oct 2023 03:32:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:37 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:02 +0200
Message-ID: <20231012103210.2915871-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106757; x=1697711557;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYqCBzHNDt7VP1aifp2wCGQdoi4zUFX27k/TBjFgzFY=;
 b=ghLw1+tRiXOGIkcD3yQV+CUR/NW5byS5TI4GGqMZb4AbB/CJORpUCFMfD2UsZyUw4l
 tr2vzQSn3V/PnlAXsayT/arnq8oVnqeRp/4aKBzdCZQR0qdIeolwY40SSxgK0zd/xp3E
 Dtm2xjO4cBx8yUUQTKm64UEJwWSwVO/W90shQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ghLw1+tR
Subject: [Buildroot] [PATCH 05/12] package/openssh/selinux: Add buildroot
 openssh policy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a basic policy necessary for OpenSSH to work properly in enforcing
mode without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/openssh/selinux/buildroot-openssh.fc |  0
 package/openssh/selinux/buildroot-openssh.if |  1 +
 package/openssh/selinux/buildroot-openssh.te | 23 ++++++++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/openssh/selinux/buildroot-openssh.fc
 create mode 100644 package/openssh/selinux/buildroot-openssh.if
 create mode 100644 package/openssh/selinux/buildroot-openssh.te

diff --git a/DEVELOPERS b/DEVELOPERS
index e49960f572..a90f453261 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/openssh/selinux/
 F:	package/refpolicy/selinux/
 F:	package/systemd/selinux/
 F:	package/sysvinit/selinux/
diff --git a/package/openssh/selinux/buildroot-openssh.fc b/package/openssh/selinux/buildroot-openssh.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/openssh/selinux/buildroot-openssh.if b/package/openssh/selinux/buildroot-openssh.if
new file mode 100644
index 0000000000..1969c20a4b
--- /dev/null
+++ b/package/openssh/selinux/buildroot-openssh.if
@@ -0,0 +1 @@
+## <summary>Buildroot openssh rules</summary>
diff --git a/package/openssh/selinux/buildroot-openssh.te b/package/openssh/selinux/buildroot-openssh.te
new file mode 100644
index 0000000000..5dc8945c3e
--- /dev/null
+++ b/package/openssh/selinux/buildroot-openssh.te
@@ -0,0 +1,23 @@
+policy_module(buildroot-openssh, 1.0.0)
+
+#============= sshd_t ==============
+allow sshd_t device_t:chr_file { getattr open read write };
+allow sshd_t kernel_t:fd use;
+allow sshd_t root_t:chr_file { read write };
+allow sshd_t sysadm_t:process { noatsecure rlimitinh siginh };
+allow sshd_t sysadm_t:process transition;
+allow sshd_t var_t:lnk_file read;
+
+#============= ssh_keygen_t ==============
+allow ssh_keygen_t cert_t:dir search;
+allow ssh_keygen_t cert_t:file { getattr open read };
+allow ssh_keygen_t device_t:chr_file { open read write };
+allow ssh_keygen_t kernel_t:fd use;
+allow ssh_keygen_t root_t:chr_file { getattr ioctl read write };
+allow ssh_keygen_t security_t:filesystem getattr;
+allow ssh_keygen_t selinux_config_t:dir search;
+allow ssh_keygen_t tmpfs_t:dir search;
+
+#============= restorecond_t ==============
+allow restorecond_t ssh_home_t:dir watch;
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
