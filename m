Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2154C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5317781DAB;
	Sun, 31 Jul 2022 19:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5317781DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjFMQIbv0N8C; Sun, 31 Jul 2022 19:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BD981C58;
	Sun, 31 Jul 2022 19:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BD981C58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6E01BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45EDC400E2
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45EDC400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fF5blXXSRj3 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E038400CE
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E038400CE
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:24 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id q191so2333443vkb.6
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MtsjwRYSjwtCJWdNADi03FrjooBpRMxXA8o3FHuAP18=;
 b=lVaZJ8xzy5OZLo7Xz1bZ6axExSfLpCF/jlU54rhqcCXQ8JJDaQJ4yJgmA/7hgps2Em
 DH+qbLqqe+tVuT4wq5gCJVOyw9M8P1U5w2h7oUivzszC2tivIZzPTorJ+D79ZDG7Cwa4
 bzFWovNQriwZF+z8Dpmqa1SMYREX5J6yA+IYxk86D8OXBi+lI0zinAsEh7tevpKvTL1X
 Ct8qbPRX2WPR/m4DAPBZ3p76CH9YWeVy7wEyI6wKaUD/zOt9HwE2eSZJpO9wMxQ/DISl
 c9JDZXXg2Smj2orfeWgZ9AjSS4NCF62werp494tAe1noCrrDUMZVZbROHxPSZyTUTK2T
 9NVg==
X-Gm-Message-State: AJIora++PCvtWL9hY/zMvX2LmeDJ0yvS8Zg04F0X28NoeZAJiwLoVCSf
 qwZb5X9SQ3BcqdzJL2JfPeOuB5Pmblo=
X-Google-Smtp-Source: AGRyM1snQK9vZaQPOGgeFbg/eyGTDeJ+VsEIwlvSCYadpP6QVzU/oO7rRoO3Ayne/iNu1aNVvfuDPw==
X-Received: by 2002:a1f:9fd6:0:b0:377:39e:5dec with SMTP id
 i205-20020a1f9fd6000000b00377039e5decmr4870207vke.0.1659296183488; 
 Sun, 31 Jul 2022 12:36:23 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:22 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:20 -0300
Message-Id: <20220731193521.1217825-14-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MtsjwRYSjwtCJWdNADi03FrjooBpRMxXA8o3FHuAP18=;
 b=B5sZ8NJzfFrxdAH91CFZtTrgsBxlxwu5C+r+nWaV91X9eObffFVrfEM42VADOKo6pr
 hj1kU92SXDLjS1VvdmSNpXrx0nbjpEm7U87UG+2DgQC+cv5q/s9vB72kUMmBQ6BYFB1n
 OV/4rEknH0Io++loSGRRIvUFA2+76uwAx9gwcDkGyPt1UeU8izg690uhOAxdGgd7M3ri
 owSF4Nbz9yVRTMPDFqN4qH35MisCtgFY5bE7EVSE3wEomIjv+aMBhWtiv3K7NczVkUTD
 DpLiUQVUfvHDo9DxK2K49iEMead9XqtU/Lxbt7zEwDYe4HF4wPn3WIiLjaMl1TC2qIvi
 Uu4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B5sZ8NJz
Subject: [Buildroot] [PATCH v2 13/14] utils/checkpackagelib: warn about
 $(HOST_DIR)/usr
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been ages (5 years at the next release) that we've not installed
host packages in $(HOST_DIR)/usr, but we still have a few packages that
reference it or install things in there. See [1]

Add a new check_function that warns when a file is added installing to
or referencing $(HOST_DIR)/usr .

[1] "d9ff62c4cd pacakge: drop remnants of $(HOST_DIR)/usr"

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - update commit message, the patch was applied

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ utils/docker-run make .checkpackageignore
---
 utils/checkpackagelib/lib_mk.py      | 12 ++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b50a19ac62..eaef19b2ec 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,18 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+class DoNotInstallToHostdirUsr(_CheckFunction):
+    INSTALL_TO_HOSTDIR_USR = re.compile(r"^[^#].*\$\(HOST_DIR\)/usr")
+
+    def check_line(self, lineno, text):
+        if self.INSTALL_TO_HOSTDIR_USR.match(text.rstrip()):
+            if self.filename in ['package/skeleton/skeleton.mk']:
+                return
+            return ["{}:{}: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 49fa216fcd..db6641f14c 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,29 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+DoNotInstallToHostdirUsr = [
+    ('real case',
+     'libapparmor.mk',
+     'LIBAPPARMOR_CONF_OPTS += \\\n'
+     '\t--with-python \\\n'
+     '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n'
+     '\tPYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config \\\n'
+     '\tSWIG=$(SWIG)\n',
+     [['libapparmor.mk:3: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/',
+       '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n']]),
+    ('ignore comment',
+     'any',
+     '# following code do not install to $(HOST_DIR)/usr/\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', DoNotInstallToHostdirUsr)
+def test_DoNotInstallToHostdirUsr(testname, filename, string, expected):
+    warnings = util.check_file(m.DoNotInstallToHostdirUsr, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
