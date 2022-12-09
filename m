Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5452EC4167B
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 10:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E356F82021;
	Fri,  9 Dec 2022 10:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E356F82021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJ5L7439KJvl; Fri,  9 Dec 2022 10:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CC482029;
	Fri,  9 Dec 2022 10:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CC482029
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5D61BF34F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 10:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5A3E41A2A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 10:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5A3E41A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvWpDyNJ4dgG for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 10:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C57B4154A
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C57B4154A
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 10:27:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id b2so10433561eja.7
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 02:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slQy4nujmGO1u51obxkBR6Czgdbl1825K7NVxW9fnX4=;
 b=4f2JzVaVAoGhVtfI1jd7DxUjCzSETNy2VwDU2K5Gjnws+pn3cdu7KRD4OiBzwc6zp4
 my2qLBSNZ6AGg26ecy5qUefl9r+qb41SkVma6mYvo0ascolK21sqewbbkqgGSA67pm2k
 qNmEgiFSDNDACufTLMupxSyka2qnUtRtpHGfeOA3twU74n+g03O1LaCEv+7nP3rOomwL
 CWhQZz+9P+SZKWqswn5rHOlz5H5qiRDqhlykNkiZASDrNAcf/m7/CNRnkcfTMzQfbnx0
 n4+P8un9BHIzop3wvOIB66xUH2jjXZTuzhpIBDwVtwiZKmOcFpm4fF5FBJbslJwPsLer
 zAlw==
X-Gm-Message-State: ANoB5pkt63vI4/wmFJGttL7qtdWbInSzeJFxS7AjTNXZWJNTEuHnkeWw
 p/Wsx0a0MprYIxBa1LHxvaQnyG6y5uk=
X-Google-Smtp-Source: AA0mqf7oGgk4d2/o6fCTbAMw4NTsRA0QoUDfa1fHmGf+KJZ9bGNufxoyyyqxAC2jjWw4iGs9AO2D5w==
X-Received: by 2002:a17:907:a803:b0:78d:f454:3762 with SMTP id
 vo3-20020a170907a80300b0078df4543762mr5554323ejc.5.1670581671236; 
 Fri, 09 Dec 2022 02:27:51 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170906830600b007c10fe64c5dsm396393ejx.86.2022.12.09.02.27.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Dec 2022 02:27:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 11:27:42 +0100
Message-Id: <20221209102742.23798-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slQy4nujmGO1u51obxkBR6Czgdbl1825K7NVxW9fnX4=;
 b=M5oIhaMYFcZ+rKc7OsKn05zNcHsNGfw9q0wS6vLt9khpDUVP0zYma5cIc6DopXHxNg
 dfIdZdz6px/gnM1kaKjHN7dXnEYXH+ylqbSKCh0up1+sd2AhJNrtVIxtmFdLIxDAATqJ
 jKNhOpMT/o9FsxJ2xClHC3I3iDquYpQq5ud5EMvia9LPeApuWGsrZINprz3X231svqqf
 rtpWWTWuGWgkIfLFlWQdvkWj6yDcaVzZEwH92BGQ5XWk7dih3UwZOa9KrERe3ReTTqfX
 2nsVNqP61xAH7fFY92jExyGuUgU2wYsygnv8MU5catf+RO6hnaNnCfg4eNblXzEtqjpZ
 cHVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M5oIhaMY
Subject: [Buildroot] [PATCH] package/python-munch: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |  1 +
 package/python-munch/Config.in         |  7 +++++++
 package/python-munch/python-munch.hash |  5 +++++
 package/python-munch/python-munch.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-munch/Config.in
 create mode 100644 package/python-munch/python-munch.hash
 create mode 100644 package/python-munch/python-munch.mk

diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..d5a673295d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
+	source "package/python-munch/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
diff --git a/package/python-munch/Config.in b/package/python-munch/Config.in
new file mode 100644
index 0000000000..9db2623674
--- /dev/null
+++ b/package/python-munch/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MUNCH
+	bool "python-munch"
+	help
+	  Munch is a dictionary that supports attribute-style access,
+	  a la JavaScript.
+
+	  https://github.com/Infinidat/munch
diff --git a/package/python-munch/python-munch.hash b/package/python-munch/python-munch.hash
new file mode 100644
index 0000000000..7e32282833
--- /dev/null
+++ b/package/python-munch/python-munch.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/munch/json
+md5  ed84c3718416c8d4d03d0a6ef46e8e0c  munch-2.5.0.tar.gz
+sha256  2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2  munch-2.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
new file mode 100644
index 0000000000..85f6803f07
--- /dev/null
+++ b/package/python-munch/python-munch.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-munch
+#
+################################################################################
+
+PYTHON_MUNCH_VERSION = 2.5.0
+PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
+PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/43/a1/ec48010724eedfe2add68eb7592a0d238590e14e08b95a4ffb3c7b2f0808
+PYTHON_MUNCH_SETUP_TYPE = setuptools
+PYTHON_MUNCH_LICENSE = MIT
+PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
+PYTHON_MUNCH_DEPENDENCIES = host-python-pbr
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
