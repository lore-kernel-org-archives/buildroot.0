Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26EBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5758660E9A;
	Sun, 24 Jul 2022 05:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5758660E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVlaeLRMRqYy; Sun, 24 Jul 2022 05:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6286E60AD8;
	Sun, 24 Jul 2022 05:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6286E60AD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF081BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1644741730
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1644741730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdxO6KKQB2Wg for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8E5416ED
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB8E5416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:57 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 n16-20020a4a9550000000b0043568f1343bso1587820ooi.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yJ/t7Xw9CP3HFX4Wrv2IooGK+ivq05QYuGCYaC+UM9Y=;
 b=s9u230xentHRmvWTO7QbGF8jBQMmSBjoXSbKZnIjGWINTl0zfBXar0+grn7fL1PtZv
 bEz/0FHVnw1nCkOnguvl1mJ9HjwYrlGA2INtBwYtpUNiksCw7OspFAwmzcZrBPYvfB4J
 EwXU+i6SvOuIIyQ8zStXYjnQYJEgX8yN9tGUka8kFlJg2B25ZuUSMJNROekSpw7XmVfJ
 zta93B4WVpAPL7iSNkewExiRv2x5n/rwtMtW0ZKAcC1D6M2h/uQ1AankB13DANxOyzXs
 vb4SxiqYklKuNAtzfs/kCQur0BMAiQJxI3HVgSSCfPIO+aNHgv2JKeBkUt4t6XCYqlAm
 zlWQ==
X-Gm-Message-State: AJIora+anK/BlJaQbhrWpsVO39A5gOXZClez5AyZKLGIhaNostzL/Wu9
 9E8ZfM6yRch8T8fHzKP+4TIOPQgPdcY=
X-Google-Smtp-Source: AGRyM1tPPjy3qsVQymlXA3asyuAJlK6YhUrRcqjj8BlyW6fAe3slldjITxuZ9CUaCI1G89wBcdqxFQ==
X-Received: by 2002:a4a:8e54:0:b0:435:76f2:2ab7 with SMTP id
 z20-20020a4a8e54000000b0043576f22ab7mr2470580ook.60.1658641856645; 
 Sat, 23 Jul 2022 22:50:56 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:55 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:09 -0300
Message-Id: <20220724054912.2354219-14-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yJ/t7Xw9CP3HFX4Wrv2IooGK+ivq05QYuGCYaC+UM9Y=;
 b=dPmfP1925xEnCHAPqJ3x78CMkp6K5+ZiHBM7q93+3dE2uKrr+haG6uvG3R49MXXAoP
 dO77xWL+TrOr5+zn5SFIWEy2UDr4oyeh6N1yk1DAzoCK9TPNfczkdJGeYvOlbrUUDUj0
 efIMtHKg/EiubyMT6JVGEdSsrHzRhfibogfveBioxUxJCn0sRWHbHtm0QvJucEltkKs+
 9Mxd5ZyxdXOXceElS0lGce8xjGLSBpLH/YV0qVGPbX0nFxq3pnGm/2FnbCR3Gzrb2CI8
 JI0beTdH0Fk2cN9tjR36eVKXhXIAhvVyE0EGRiJQjf+YCWCgIDT6OGvzCvrqMtM80xeV
 Djow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dPmfP192
Subject: [Buildroot] [PATCH 13/16] utils/check-package: check files in
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
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore
---
 .checkpackageignore | 43 +++++++++++++++++++++++++++++++++++++++++++
 utils/check-package |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 58c05416c4..8f9ab48674 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1021,6 +1021,49 @@ package/yad/yad.hash HashSpaces
 package/zip/zip.hash HashSpaces
 package/zmqpp/zmqpp.hash HashSpaces
 package/zxing-cpp/zxing-cpp.hash HashSpaces
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
+support/legal-info/buildroot.hash HashSpaces
+support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.2.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.4.4.patch ApplyOrder
+support/libtool/buildroot-libtool-v2.4.patch ApplyOrder Sob
+support/misc/relocate-sdk.sh Shellcheck
+support/scripts/apply-patches.sh Shellcheck
+support/scripts/br2-external Shellcheck
+support/scripts/check-bin-arch Shellcheck
+support/scripts/check-host-rpath Shellcheck
+support/scripts/eclipse-register-toolchain Shellcheck
+support/scripts/fix-configure-powerpc64.sh EmptyLastLine
+support/scripts/fix-rpath Shellcheck
+support/scripts/generate-gitlab-ci-yml Shellcheck
+support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
+support/scripts/mkusers Shellcheck
+support/scripts/setlocalversion Shellcheck
+support/testing/tests/core/post-build.sh Shellcheck
+support/testing/tests/package/test_opkg/post-build.sh Shellcheck
+support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject
 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash HashSpaces
 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash HashSpaces
 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash HashSpaces
diff --git a/utils/check-package b/utils/check-package
index 874f58e0d2..601d899d3d 100755
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
