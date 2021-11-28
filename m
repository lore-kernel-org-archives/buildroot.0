Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 15:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6D8606EE;
	Sun, 28 Nov 2021 15:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qcTXAdpN1Ev; Sun, 28 Nov 2021 15:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA69606EF;
	Sun, 28 Nov 2021 15:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF5E1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 15:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D4F882F57
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 15:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3I7ZcQfwPlV for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 15:17:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D15E482F50
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 15:17:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id i12so12538721wmq.4
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 07:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sCaWXqlmpxP+r5Hpv860o34R6b9UofmCkU2wDqH7/9M=;
 b=qk6krXKVFW6FfQ4zKfXezc6C03NlS9aDhi4AJanQ/4qTRC6b/CWcw6IBebPJ7gnL7R
 hCmjEnmPLFDiMOLs02ufuHonQ4bOFVVHbm5W0Q3K2AHCmbGQFshYwYJliB6U3Lu9oxeM
 AhDcZpdWl+hRK+PnSFYM9Vg2o39TaBufXZyUVe4XjP0lQxddZlQ6h8jQ+0v5kHIjqSJv
 CSBO1P2VGNoSZkOgykRJpEqvEr/IV1QhyrJD6AVijAG90uIdv9CH4M9x+lp42Q/hPUHM
 zliXrrGEqkGrCRj74i8z2NtZtuFCf8uoDTe4uTluSSWBX/+4Io17T+OlT3CbvU7mReqi
 yYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sCaWXqlmpxP+r5Hpv860o34R6b9UofmCkU2wDqH7/9M=;
 b=hw0TN3iMQAUEirXSsAvTlu5IcDhAotjo8ery2xN7TPO6J2nsrv3aBSVuPBq4pOs2Do
 svbpBvdd9RtBW9Tx+W8SSATIvO2mFFzXRlYpSgDKlTgAi1aSH/x7kwr8QiGgUoaNKITF
 ZSHFnh5ydj8YeFTRi6VqAvo15HBeR1v7PhzGctmvPCv4IXcu0hAovwK9vymVFwZEturR
 nPH5y7c2KqtgbnEVVv2hYmZS8B/vx8J2+v520ztkpuk0Emn2YuofVt8qEZRghlJYPIvR
 9E0wgS/RtM3HUPhylK1MlkCAkjzrk88cn/NGfHBdyM1xQMFkK+s0HyojKb/17chgXCLR
 rIaQ==
X-Gm-Message-State: AOAM53014l7fUZyLqSQCR3dyijVXawaT2dhCL6d6h1WuVXyGEMhyFod6
 V81FyeKDwUBAEmIzArzbH+rFJn2JJm8=
X-Google-Smtp-Source: ABdhPJz6XrV13T8FjUUtLp5f6EzETEd4e5QzVA1RN56aZJa0Zc5fv95ruTP9RYBE9dolUwRZG9411g==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr29807302wmh.68.1638112627933; 
 Sun, 28 Nov 2021 07:17:07 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id h15sm19806696wmq.32.2021.11.28.07.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 07:17:07 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 16:17:03 +0100
Message-Id: <20211128151703.260928-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211128151703.260928-1-romain.naour@gmail.com>
References: <20211128151703.260928-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: add gitlab download helper
 testing
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Like for the github helper, add some tests to test the download of
Gitlab's generated tarball.

[1] f83826c90daf9cdb5a6196d2d2830eea8c2f0e09

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/download/br2-external/gitlab/Config.in     |  0
 .../tests/download/br2-external/gitlab/external.desc |  1 +
 .../tests/download/br2-external/gitlab/external.mk   |  1 +
 .../gitlab-helper-hash/gitlab-helper-hash.hash       |  3 +++
 .../package/gitlab-helper-hash/gitlab-helper-hash.mk | 12 ++++++++++++
 .../package/gitlab-helper-tag/gitlab-helper-tag.hash |  3 +++
 .../package/gitlab-helper-tag/gitlab-helper-tag.mk   | 11 +++++++++++
 .../package/gitlab-release/gitlab-release.hash       |  3 +++
 .../gitlab/package/gitlab-release/gitlab-release.mk  | 12 ++++++++++++
 support/testing/tests/download/test_gitforge.py      |  8 ++++++++
 10 files changed, 54 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/gitlab/Config.in
 create mode 100644 support/testing/tests/download/br2-external/gitlab/external.desc
 create mode 100644 support/testing/tests/download/br2-external/gitlab/external.mk
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
 create mode 100644 support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk

diff --git a/support/testing/tests/download/br2-external/gitlab/Config.in b/support/testing/tests/download/br2-external/gitlab/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/gitlab/external.desc b/support/testing/tests/download/br2-external/gitlab/external.desc
new file mode 100644
index 0000000000..eafc8a43ff
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/external.desc
@@ -0,0 +1 @@
+name: GITLAB
diff --git a/support/testing/tests/download/br2-external/gitlab/external.mk b/support/testing/tests/download/br2-external/gitlab/external.mk
new file mode 100644
index 0000000000..8de1203231
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GITLAB_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash
new file mode 100644
index 0000000000..79684e9742
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  28f3b63454a7de6d8fb154dfa1e2e203afeb34db006661329e273137f8fe3dce  gitlab-helper-hash-21a378a7858460809ffef1c96a07a493d709730c.tar.gz
+sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk
new file mode 100644
index 0000000000..44a156118e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# gitlab-helper-hash
+#
+################################################################################
+
+GITLAB_HELPER_HASH_VERSION = 21a378a7858460809ffef1c96a07a493d709730c
+GITLAB_HELPER_HASH_SITE = $(call gitlab,solarus-games,solarus,$(GITLAB_HELPER_HASH_VERSION))
+
+GITLAB_HELPER_HASH_LICENSE_FILES = license.txt
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash
new file mode 100644
index 0000000000..1c50bc3c8f
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ef08b22999431b7f81f9b74408221b8a5a3ab5b0f646a835443a3c37cb2fb979  gitlab-helper-tag-1.6.5.tar.gz
+sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk
new file mode 100644
index 0000000000..fb2fc49c82
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# gitlab-helper-tag
+#
+################################################################################
+
+GITLAB_HELPER_TAG_VERSION = 1.6.5
+GITLAB_HELPER_TAG_SITE = $(call gitlab,solarus-games,solarus,v$(GITLAB_HELPER_TAG_VERSION))
+GITLAB_HELPER_TAG_LICENSE_FILES = license.txt
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
new file mode 100644
index 0000000000..7031d1b34a
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk
new file mode 100644
index 0000000000..2510ac634b
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# gitlab-release
+#
+################################################################################
+
+GITLAB_RELEASE_VERSION = 2.3.1
+GITLAB_RELEASE_SITE = https://gitlab.com/iucode-tool/releases/raw/master
+GITLAB_RELEASE_SOURCE = iucode-tool_$(GITLAB_RELEASE_VERSION).tar.xz
+GITLAB_RELEASE_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index c2d98d0853..e1ac35ec67 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -39,3 +39,11 @@ class TestGitHub(GitforgeTestBase):
         self.check_download("github-helper-hash")
         self.check_download("github-release")
 
+
+class TestGitLab(GitforgeTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/gitlab")]
+
+    def test_run(self):
+        self.check_download("gitlab-helper-hash")
+        self.check_download("gitlab-helper-tag")
+        self.check_download("gitlab-release")
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
