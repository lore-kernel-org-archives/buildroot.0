Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 18:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91A2840132;
	Sat,  1 Jan 2022 18:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbPqfF9PmXEd; Sat,  1 Jan 2022 18:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F83401F6;
	Sat,  1 Jan 2022 18:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78A3F1BF399
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620788140B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2U3R2vRi7qvo for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 18:00:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CF03813E6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 18:00:10 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id q6so23051692ilt.6
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jbDgAv188APT3D8nYfX8UgT8+uTKXfj/GpnmP8u43YY=;
 b=VKprVQOaiQAddVPMDRleHqF3tw3v8SF02hA9ptrnFUD0Xw666FEccLnooUvBOFe8Sj
 W5mcaa4Ew8z2NHfI1K/Zj8bV4xVPAg8LUKW6uVSERlmY61ZmqDoQy/y86ICoarSsyVlM
 6YwgCMZ11FRzOc0Jg+64mM6SxHvvNwi3Sf8VhImkjVOYhOAWoLIjNe+3m3ol5szhomGb
 s2XyCRmTx1M8ChhaqS99SN9JHc9oX1pHmOmClRmB7LbKUw2KfV9XtDA/vxY+ql+V2JSw
 BnZFGvFviym/IeoQ3kSKHKqm1Sq2wHQ0wD08aC0elrX7SDGRPJ7A3q9IsirHwEemtzZ0
 iDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jbDgAv188APT3D8nYfX8UgT8+uTKXfj/GpnmP8u43YY=;
 b=NVws1IDu3t5cV184z6s4AfBDqjlF1a6PivxAKydwRIubxcmX/6sQGa2VGOWASi0/36
 ZB1gsXwccnTPVEEyur5YCIKbsnDsNmB9WK50wdgLG+t3H0pl/QDWMjbgKmekHDyaivcK
 9uVR2hKaIicDaTNh5QrPFhgphIhKqac4yYV8Z6vGpRkfixHccs8KLGrjrpba8ROigY8R
 o5OArae2h3QpnZ9BngKSBMW6v73bdn7/ZoUOQdMKdDo1oarWt736daKeBQ/ZpQ6zM7Iw
 RjuEtOBr8JNAw1jHVotK19I/0JwVCbgBvXwXtHZJyzpic2zUNFQ/b35FP6YuWegxCGNU
 XZrQ==
X-Gm-Message-State: AOAM531JZxEOAn0mEcJAt7vvgWHjyBzVdmPQPGoqyW6uOWTS3cMgZgK9
 A0njIJFtC3FMA6xNCGNLnV2b55/Fqxg=
X-Google-Smtp-Source: ABdhPJwfWFVctpYJpE4MJY3CScLZfHzsnPeiy21kiyj1wU4vlTaj17lWd9lN424ViIEC2wscVFSMcg==
X-Received: by 2002:a05:6e02:184f:: with SMTP id
 b15mr17682233ilv.56.1641060009361; 
 Sat, 01 Jan 2022 10:00:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id e2sm18497073ili.45.2022.01.01.10.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 10:00:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 11:00:04 -0700
Message-Id: <20220101180004.2499189-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cffi: bump to version
 1.15.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 package/python3-cffi/python3-cffi.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 8ab672a56f..41565f9a62 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  5c118a18ea897df164dbff67a32876fc  cffi-1.14.6.tar.gz
-sha256  c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd  cffi-1.14.6.tar.gz
+md5  f3a3f26cd3335fc597479c9475da0a0b  cffi-1.15.0.tar.gz
+sha256  920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954  cffi-1.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 2504cf18f4..b14dce8225 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cffi/python3-cffi.mk
-PYTHON_CFFI_VERSION = 1.14.6
+PYTHON_CFFI_VERSION = 1.15.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
index 52ea3b3fbf..2770eda93e 100644
--- a/package/python3-cffi/python3-cffi.mk
+++ b/package/python3-cffi/python3-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cffi/python-cffi.mk
-PYTHON3_CFFI_VERSION = 1.14.6
+PYTHON3_CFFI_VERSION = 1.15.0
 PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
-PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
 PYTHON3_CFFI_SETUP_TYPE = setuptools
 PYTHON3_CFFI_LICENSE = MIT
 PYTHON3_CFFI_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
