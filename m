Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD2C5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 23:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A04340439;
	Mon, 11 Mar 2024 23:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id deat-KrKBHYf; Mon, 11 Mar 2024 23:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BF140B82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58BF140B82;
	Mon, 11 Mar 2024 23:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC491BF346
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 23:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3917A8197D
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 23:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuoNFgs76Vgu for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 23:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35E41818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E41818AC
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35E41818AC
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 23:12:37 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3663080b6a4so19360105ab.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 16:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710198756; x=1710803556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3ZYfdn8CRTOC9hnxqOtXCCOI471L6PBJ/y/9aJno1U=;
 b=DLl7xdkz486jcgPBcvx1rkaqjyQIbxe064BDuksg4LiuHHmny6ZYsieT+p7H/wU+19
 Lm7QX60u95rKggbNvufyi9KdXnMbMQsM/BZkEDyYfldPFQLxeZssUmSYkGYzPLmUZGg+
 6fpBIIOaCA4AfW6n9on60ILAlqYbXgj/2rouIRcbHf7NevcE7cOVZJxf6W2QoSH/a6TH
 ocGCvONXAzvDswc+H92G8R6sefhKWvPyk6usTyFNXsxDby7TipS2ioiE4a4XwA3NfGVZ
 B6e53KXpqnwZyE56CaNRPp9pjo862OUDPKAM8/WFswrT4HgNW7Kbv1u2nVvQqtSfg6z6
 vdTQ==
X-Gm-Message-State: AOJu0YyAMVhF+krPc3bLOpEdrV7RRYFYdfHuW0pl4kyt4bqX3ll+CabO
 c1tI8d6Ap8pwC/I+o/DGmX9IZ/J8Fcr6R6Te4bKUK+K6xsV8SxhKq3GW5rQHJ70=
X-Google-Smtp-Source: AGHT+IF0eB9YIZKmfAkrOzF868Mox8FKxOfkVo1+jHoi5E4iuCAROIYsS4Xd35ifZD2S5X8ninHUZg==
X-Received: by 2002:a92:ca0a:0:b0:363:d96f:6850 with SMTP id
 j10-20020a92ca0a000000b00363d96f6850mr10806048ils.12.1710198756255; 
 Mon, 11 Mar 2024 16:12:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-232-75.hlrn.qwest.net.
 [97.118.232.75]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056638260500b00474874acfe1sm1924225jat.172.2024.03.11.16.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 16:12:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 17:12:31 -0600
Message-Id: <20240311231231.3188175-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311231231.3188175-1-james.hilliard1@gmail.com>
References: <20240311231231.3188175-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710198756; x=1710803556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3ZYfdn8CRTOC9hnxqOtXCCOI471L6PBJ/y/9aJno1U=;
 b=kxqPqEANd55SXGokIahdQ/vaLjJwTeB+RWYtOuQ+gMrZISTmT1O1bgVHAALNf2rfQb
 haSN4Hn8lJVM3xF9lBbUH19gicZFNVNvsmCo6o/DawdfUtsYflnLxh33kBXeF4zmCZhO
 jSeXB4DHmz6i0Ue6U/NFtdx5nRXRNyNqc2MVwW4GFvyyKkwxzJDpLSURSz0lSmGtUFvn
 n6D/9zb8yT6hOKqczzvpjTM4x4HnAnBmRh5WlmjoUtKt+n1ZWNB8emx3fniPtaezx5gD
 6ETmir7nPe1MgMH6Vk+4H67iLb3YDsdJjI8yEp3o41QD6GdmemQ2Jp4c3Jt3UAzmyXBp
 p32g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kxqPqEAN
Subject: [Buildroot] [PATCH 2/2] package/python-fastui: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-fastui/Config.in          |  9 +++++++++
 package/python-fastui/python-fastui.hash |  5 +++++
 package/python-fastui/python-fastui.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-fastui/Config.in
 create mode 100644 package/python-fastui/python-fastui.hash
 create mode 100644 package/python-fastui/python-fastui.mk

diff --git a/package/Config.in b/package/Config.in
index 36a375e696..e9ce8a8f2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1087,6 +1087,7 @@ menu "External python modules"
 	source "package/python-falcon/Config.in"
 	source "package/python-fastapi/Config.in"
 	source "package/python-fastapi-sessions/Config.in"
+	source "package/python-fastui/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastui/Config.in b/package/python-fastui/Config.in
new file mode 100644
index 0000000000..9b73544dab
--- /dev/null
+++ b/package/python-fastui/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FASTUI
+	bool "python-fastui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_EMAIL_VALIDATOR # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Build better UIs faster.
+
+	  https://github.com/pydantic/FastUI
diff --git a/package/python-fastui/python-fastui.hash b/package/python-fastui/python-fastui.hash
new file mode 100644
index 0000000000..50f49824e0
--- /dev/null
+++ b/package/python-fastui/python-fastui.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastui/json
+md5  c8e7d060c0ad3a7ad1237dac3555b83e  fastui-0.5.2.tar.gz
+sha256  854a7a7fce4c08efd9caff1a331d222007b3708b133d996528e3f40996c96091  fastui-0.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  1c39900853b2c98a5c98e1acc10e54ef06ba2693cdf85e8b28e3ede658888d79  LICENSE
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
new file mode 100644
index 0000000000..e143c9978c
--- /dev/null
+++ b/package/python-fastui/python-fastui.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fastui
+#
+################################################################################
+
+PYTHON_FASTUI_VERSION = 0.5.2
+PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
+PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/64/11/515c9b5cb6e885f4ba8c325f75b95a754d99b8296bdc9f134dc90a79019f
+PYTHON_FASTUI_SETUP_TYPE = pep517
+PYTHON_FASTUI_LICENSE = MIT
+PYTHON_FASTUI_LICENSE_FILES = LICENSE
+PYTHON_FASTUI_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
