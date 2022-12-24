Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD42CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 09:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E5A82029;
	Sat, 24 Dec 2022 09:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E5A82029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDEVTJPDW-1I; Sat, 24 Dec 2022 09:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEB6820FB;
	Sat, 24 Dec 2022 09:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEB6820FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C79C31BF296
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A16B9408EB
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16B9408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZL9WZS0cp2tA for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 09:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96506408D5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96506408D5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 09:18:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l26so3402706wme.5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 01:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3muP+0G8Aqo97nt29VIyHfa1g+blnqbbG9xVUNo21Fs=;
 b=wkKXhVUV42YlydTeD5mn1U5tdpdz005UZvwUY7NEWo9roGgMPeteT57uHE+586TuFJ
 dlOmAk1tpaqFysJreYJenRdEstQaalhBEtOdamF2u7jSLdgGupPihxPFPwtmE6Pz9DoV
 KM995Z2PrAOWPeutO923V5ALaxTT4djddy8AeKiK3lYW8Jxc3gi4as13lsdrsFRGbS4P
 3o5zcJffmv4q3irud53JvFsTwCV8iiPTOx6YgDJeH1j9+7uE801QQCfKQpuoLWOubmyF
 5byt2/m7/fb59O6JZNH0BRQrD6vE7mHGeTvYOds67EitEa0WwVC6ozGrUJJmSxTMmzHS
 vGDQ==
X-Gm-Message-State: AFqh2koTuKvKwwbbrga8k+ggJtbni85RjBizjIVQEedtbMcI602/psvJ
 ERRFs5u71PYvEK56ghRz/e8/FffOMYs=
X-Google-Smtp-Source: AMrXdXuakyOwaTSS843iVkABxHYT/zymCV5UjJVbPq1PP1Sp1hXZRDwvm8+RUZRSYRZp3CWqVuhK+Q==
X-Received: by 2002:a05:600c:41c2:b0:3d3:5565:3617 with SMTP id
 t2-20020a05600c41c200b003d355653617mr11839228wmh.24.1671873494743; 
 Sat, 24 Dec 2022 01:18:14 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:9ce0:1380:e1bd:a6d1])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm16526202wmq.45.2022.12.24.01.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 01:18:14 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 10:18:12 +0100
Message-Id: <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3muP+0G8Aqo97nt29VIyHfa1g+blnqbbG9xVUNo21Fs=;
 b=M7heMPOVzt6z4DPSnElVecLyIUYyU2u78QI8Z/nVrlOVWOUE7ktAyAJJQ2e8ZcvVzh
 K5BtORzg8HeYwf+pvYAFta2LGhYbQ6/c7aK7OlzDPBchr09PL0Cm3BmaO33AwTeAyEK2
 eNUB6OtBpYvFL+M+p3JfyL3yfMskn5MsqctVcMCSQuibm294o/+a9IkSmlE4wYJMTQ7g
 3oHH4dD6vyH6E/gZcLqRujZNRmbspDXq+Q6MNExeluoOH6nzZf+P4EZ+ZYZNVkr4jkE1
 jGO3dT/cye6huEGUuhjwDPngMd2vWJaO8N9AB4Yw2xdaBYAi++lmWeNKGGRpQCY7gqSU
 hjYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M7heMPOV
Subject: [Buildroot] [PATCH 2/3] support/tests: allow top-level parallel
 builds
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Running tests with top-level parallel builds can speed up running some
tests, expecially those that have a lot of packages like the systemd
init tests.

Trigger TLPB when the configuration enables per-package directories.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 2 +-
 support/testing/infra/builder.py  | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 45bcd4c2e2..670c7213d6 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -52,7 +52,7 @@ class BRConfigTest(unittest.TestCase):
 
     def setUp(self):
         self.show_msg("Starting")
-        self.b = Builder(self.config, self.builddir, self.logtofile)
+        self.b = Builder(self.config, self.builddir, self.logtofile, self.jlevel)
 
         if not self.keepbuilds:
             self.b.delete()
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 922a707220..a2abb9ed89 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -6,11 +6,12 @@ import infra
 
 
 class Builder(object):
-    def __init__(self, config, builddir, logtofile):
+    def __init__(self, config, builddir, logtofile, jlevel=None):
         self.config = '\n'.join([line.lstrip() for line in
                                  config.splitlines()]) + '\n'
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
+        self.jlevel = jlevel
 
     def is_defconfig_valid(self, configfile, defconfig):
         """Check if the .config is contains all lines present in the defconfig."""
@@ -87,6 +88,8 @@ class Builder(object):
         env.update(make_extra_env)
 
         cmd = ["make", "-C", self.builddir]
+        if "BR2_PER_PACKAGE_DIRECTORIES=y" in self.config.splitlines() and self.jlevel:
+            cmd.append(f"-j{self.jlevel}")
         cmd += make_extra_opts
 
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
