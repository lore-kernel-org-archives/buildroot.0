Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF8C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC780607D3;
	Sat, 27 Apr 2024 18:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJTaZszsULCT; Sat, 27 Apr 2024 18:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D7D4608CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D7D4608CB;
	Sat, 27 Apr 2024 18:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1DBC1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE61414C9
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r2YHaRk7Ukg for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2313740771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2313740771
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2313740771
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2458102f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243086; x=1714847886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yST1gVvUmeyo8xLGurFNAw+RXjNK7snMe8V7C8/Jpx8=;
 b=n0CwpllBe6U4ilwhNWn5lZgRaM415AwBnZFFdHj11jvMxqEdJJ2k5Za1EjGJ4L2UXx
 mQKr53uXPtzSpZPX2IlNIE72dqD2IHh8+9P32bcIpJVDMK/BivcD+dzLRdAHxqUyFv56
 CoO87ltUsWyuAXKOA9qSlklWsUQARF6TliJH3/jlwmrzJMDf2YxALvNbBXJZMWcIpxbu
 rCgZGENAVYBTibnj8hcp8TMdVrlvq62Tq/UCI9iSv1omxjAJoW+mZYsF3OgUzq0r1AJ0
 bzfkzW01Syysv3XY6rnCBw9vQTQMaVuH6tATSQEhH82/cno1jhXuQsvKRPZz2No1CfdF
 UnFQ==
X-Gm-Message-State: AOJu0YzymOB2mpqbyC0pNWKsfkzKkbBTbX5WuFoL/yYF98/Cjme5AsrS
 fI6duLTUS1/prWOVHQXKTZvAy2CAYwomvVBnQIaCBwpAZN7+mC5fozJQ7g==
X-Google-Smtp-Source: AGHT+IF+DwB4NFizlWAtLyq7Fg4dbp+A84Tck1AZtJsPCBYWFNMjff6Tw4/H6CGc8rMhLoCrKmRS+w==
X-Received: by 2002:adf:f04e:0:b0:34c:b8fa:9768 with SMTP id
 t14-20020adff04e000000b0034cb8fa9768mr1176210wro.51.1714243086177; 
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:54 +0200
Message-ID: <fac4dda319388b1d32d2f105ba29d47e68c41f4f.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243086; x=1714847886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yST1gVvUmeyo8xLGurFNAw+RXjNK7snMe8V7C8/Jpx8=;
 b=Vf/I8Yq7ji/083Wy5QIwf4bZ9Mdcy+hyBVZPxxZgu++oHMOtmuonBkOGl+dlx4+ZOE
 O/5o4urDwjOGxareV/A938i4jFy/B/6BaQc3EUBx6PHSmlT0OWH6/MeIMpEN/HxRtgXB
 WoBu0WbgBH+rv94wNDFiED6BjHed3NPfDY/yYkgAY/c0ua/hRDUfw2hGMAa1/FH5P2gc
 lTPrjYzPsOhF/pSAEv59WV87O50c8rBDGCWoPqQQKbp2nWyBaEcPG+dVbmBPwJ2aMcRk
 4RmsFmH+sKt+npZk/W1uEfx5KbRo6mkze111Pq71wUgcUmvnz0DLpC+EPv+gmVnriADX
 PS/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vf/I8Yq7
Subject: [Buildroot] [PATCH 07/15 v2] support/testing: add test for
 export-subst support in git-download
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../package/export-subst/export-subst.hash        |   1 +
 .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
 .../git-remote/repo.git/refs/heads/master         |   2 +-
 support/testing/tests/download/test_git.py        |   4 ++++
 8 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
new file mode 100644
index 0000000000..1926236993
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -0,0 +1 @@
+sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
new file mode 100644
index 0000000000..8d7d3ff970
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# export-subst
+#
+################################################################################
+
+EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
+EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
new file mode 100644
index 0000000000000000000000000000000000000000..404bb1397cf8ec58f5e21a86e311e3b3884a55d5
GIT binary patch
literal 35
rcmb<m^geacKgeK9ipS|Qo~A(_Yc)>jYhBdU^VQOO$iz_nm{Sb^1FsEl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
new file mode 100644
index 0000000000000000000000000000000000000000..3a4cc4ead6ce5a7e90a38e025896bc66da85a242
GIT binary patch
literal 197
zcmV;$06PD80j18pN(3<!Kw;}V#qDK=<mP`7v9YjFK`YBl?#(*jBugd>?%TWg1cK#h
z4qtBDwhqwJ-;B--j*`L!t!LwllOZ~Vg`-cw8%Ibno17#|aY~)*fP^|Mib|${mW-#M
zO)5HDL~WGM!6-#hl1S(A**birTH$eq=hwHV7r47zbKY8C>#Sl759Ml@OTP!@qOn#-
z6W~^&lp_B^2mfOs%KF84fWi9!{yw!nrv1F^Lx}hFSed3)%CuY#e^rVfqgY-S2z_Jg

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
new file mode 100644
index 0000000000000000000000000000000000000000..fdc4a37651a4ad195f8f106f3496d5df0b3bb6a5
GIT binary patch
literal 28
kcmb<m^geacKghr&DWLGQ{wZIbjX_@n9x^f5#jv&l0Hs3<3;+NC

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
new file mode 100644
index 0000000000000000000000000000000000000000..932f73602f5927ae985829cdd301b1ed40350137
GIT binary patch
literal 112
zcmV-$0FVE80V^p=O;s>7FlR6{FfcPQQP4}zEJ-XWDauSLElDkAVD-@bZnC*Bx@F#%
z#UfR+rR950SwK~$W#*(ZJf9QSKh0&bCYQsEj;oGV#dUqLSCQn67&0_|^q%JH*m1VF
S>l%yCbKk02!Y2Svbu0l+hckcx

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
index b6bccc1c17..b6e37260fb 100644
--- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -1 +1 @@
-a238b1dfcd825d47d834af3c5223417c8411d90d
+0fdb95cf4f3c5ed4003287649cabb33c5f843e26
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ec5b8f3fdd..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+        self.check_hash("export-subst")
+        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
+            blob = f.read()
+        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
 class TestGitRefs(GitTestBase):
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
