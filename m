Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DBDC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96BF740FE2;
	Sun, 31 Jul 2022 19:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96BF740FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSmgyKgH3anj; Sun, 31 Jul 2022 19:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6174240FEB;
	Sun, 31 Jul 2022 19:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6174240FEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36CA1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB6561091
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB6561091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03HhC54WeHwx for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E4760773
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E4760773
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:15 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id f10so3793191uap.2
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vLTXew5MtrVXHnUIxiUmhppFqq0MHOzuwytwSTr8utY=;
 b=UUhfs4dHh29iP3wQVVY3wQpDSzNfwib50OhvHlUYR6df9yxgIRWbVVhj+Pr6dqqHY0
 ML+pFfe9z6199OTm8QscSnNAav6lty2Lv/1mQJcouNUBpPwC5ructk816xNsr2DKUwXh
 CkomWFTAiD8hRFDKs15e8SQ2CUVehuDIsaSeZvGNUYtVJOIMBq1olpg1vGDOHG9JWYvl
 OgKF3Ni5eQJRfrnzHV3jV5AeJabK4ONhTqAzEdeGLk8I2XWpSB3xeBC5/jxnmIBTumya
 NBED6zlzDsMxp8ZOF+u+0IzsZnIJiZT3SxI2pBLjWjN36Rp4iKqQF1rg6r0qKnRbJA+1
 zYaw==
X-Gm-Message-State: ACgBeo2yjwgBFKkJMMOGzNoms9M59g+YYyv1RQiGKTiyZrbtm8EdDc/M
 8oJhva30GANNr06Ld2MBLMMelafM3Ug=
X-Google-Smtp-Source: AA6agR5ZrEm04Rz+xSTtUSQgrJFxgH67WE97CdkMIiwWzRqmOfu43Q6ArBChECRlXf2A+E6kmeS8Fg==
X-Received: by 2002:ab0:69c5:0:b0:383:4295:fc9d with SMTP id
 u5-20020ab069c5000000b003834295fc9dmr4727160uaq.92.1659296174616; 
 Sun, 31 Jul 2022 12:36:14 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:12 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:17 -0300
Message-Id: <20220731193521.1217825-11-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vLTXew5MtrVXHnUIxiUmhppFqq0MHOzuwytwSTr8utY=;
 b=T/k8w9AjAuuZvD/b4/HeM6LmmtozzJo3+xFrFeW8U46f6iA70v3p18c1N6qeuelv/j
 raVwoBHiuN+Ju89MeKWsXARyBGBMppIjcl2BpH13KNfy+DTGMLbZTr368+KLBlIpHkLR
 0E1JvAQTk35CncRAgg+4Lsxu1dIIVrjR9hT6RXsuVEOMmn9akYTkrAfhAOUeuugNLJKP
 c9zvH703mABbZrq8AM8udsdYtxAlgGexQeeCkibFm8hEv+ZWRqB1UKstNVbEpFBYlPR9
 zNGzo3yHtqx0BYL/JUhqKQ7BBnaHx06l3pHKcPzVtuDM3LeZLBSK2jMvwIcyb4ylJJ+9
 sWEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T/k8w9Aj
Subject: [Buildroot] [PATCH v2 10/14] utils/check-package: check files in
 support/
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The .mk files inside both support/dependencies and support/misc are not
package recipes, they are makefiles, so check-package doesn't understand
them. Therefore ignore such files.

In the test infra, some br2-externals are used as fixtures to provide
(sometimes) failure cases, so ignore files in these directories.

Files inside support/kconfig are files copied from linux upstream, so do
not generate warnings for them.

support/gnuconfig contains auto-generated config.{guess,sub} files,
so do not generate shellcheck warnings for them.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ utils/docker-run make .checkpackageignore
---
 .checkpackageignore | 41 +++++++++++++++++++++++++++++++++++++++++
 utils/check-package |  6 ++++++
 2 files changed, 47 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index d528b0122e..91efb7fa1a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -294,6 +294,47 @@ package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
 package/xl2tp/xl2tpd TrailingSpace
+support/dependencies/check-host-asciidoc.sh Shellcheck
+support/dependencies/check-host-cmake.sh Shellcheck
+support/dependencies/check-host-gzip.sh Shellcheck
+support/dependencies/check-host-lzip.sh Shellcheck
+support/dependencies/check-host-make.sh Shellcheck
+support/dependencies/check-host-python3.sh Shellcheck
+support/dependencies/check-host-tar.sh Shellcheck
+support/dependencies/check-host-xzcat.sh Shellcheck
+support/dependencies/dependencies.sh Shellcheck
+support/download/bzr ConsecutiveEmptyLines Shellcheck
+support/download/cargo-post-process Shellcheck
+support/download/check-hash Shellcheck
+support/download/cvs Shellcheck
+support/download/dl-wrapper Shellcheck
+support/download/file Shellcheck
+support/download/git Shellcheck
+support/download/go-post-process Shellcheck
+support/download/hg Shellcheck
+support/download/scp Shellcheck
+support/download/sftp Shellcheck
+support/download/svn Shellcheck
+support/download/wget Shellcheck
+support/gnuconfig/update Shellcheck
+support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.2.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.4.4.patch ApplyOrder
+support/libtool/buildroot-libtool-v2.4.patch ApplyOrder Sob
+support/misc/relocate-sdk.sh Shellcheck
+support/scripts/apply-patches.sh Shellcheck
+support/scripts/br2-external Shellcheck
+support/scripts/check-bin-arch Shellcheck
+support/scripts/check-host-rpath Shellcheck
+support/scripts/fix-configure-powerpc64.sh EmptyLastLine
+support/scripts/fix-rpath Shellcheck
+support/scripts/generate-gitlab-ci-yml Shellcheck
+support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
+support/scripts/mkusers Shellcheck
+support/scripts/setlocalversion Shellcheck
+support/testing/tests/core/post-build.sh Shellcheck
+support/testing/tests/package/test_opkg/post-build.sh Shellcheck
+support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject
 utils/brmake Shellcheck
 utils/config Shellcheck
 utils/docker-run Shellcheck
diff --git a/utils/check-package b/utils/check-package
index 004352261b..423b53ffb8 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -106,6 +106,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"fs/",
     r"linux/",
     r"package/",
+    r"support/",
     r"system/",
     r"toolchain/",
     r"utils/",
@@ -115,6 +116,11 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"fs/common\.mk$",
     r"package/doc-asciidoc\.mk$",
     r"package/pkg-\S*\.mk$",
+    r"support/dependencies/[^/]+\.mk$",
+    r"support/gnuconfig/config\.",
+    r"support/kconfig/",
+    r"support/misc/[^/]+\.mk$",
+    r"support/testing/tests/.*br2-external/",
     r"toolchain/helpers\.mk$",
     r"toolchain/toolchain-external/pkg-toolchain-external\.mk$",
     ]))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
