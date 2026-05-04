Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B258CFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 15:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65C5484453;
	Mon,  4 May 2026 15:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pajn9RLrq3Uw; Mon,  4 May 2026 15:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98322843EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777907805;
	bh=wx0D/IuALA0hPBWmG20C95+RE9ybpDBUTKmHLamESW4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QiIafgwzor3czYDZcf8L7lK3UoObO8W1JhtzIqyJWE9i45JCtbEzkbJwGfP0rtLWr
	 +1jWB9/NqKiY8fHvsnIvCuBUIS3bhodN8vObC2pGuZWuzTrap/klUkczXRILcKzl8v
	 rfW9Ctl0VcZIXCqNudsLMmb4v4LSdsm/a51FAboTYCMM0wyLAegMcyMCGlgZPIvqxk
	 oAOkW/sISfU3+iBcI45jP53fWti42KPFpooNLI7kYFAlsdfRUFov/wjTRMF9M/xhTp
	 mfc/Nm4A1qCHebFsGRZod4hJXjaFgB+T7Hq2N4kRD6AdC8y30fo92o/P8tKV+MBdPE
	 OR/UYrUPCxb1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98322843EA;
	Mon,  4 May 2026 15:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE0B525D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3EE6843EA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cflqnrcCXb-r for <buildroot@buildroot.org>;
 Mon,  4 May 2026 15:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f41; helo=mail-qv1-xf41.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C051C843E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C051C843E7
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C051C843E7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:16:43 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id
 6a1803df08f44-8acae26e564so48362916d6.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 08:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777907802; x=1778512602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2Onc0amZNm/Fkpb9h//5ceO6CeNxbMYLdl0AeeS6XU=;
 b=HMoO1HKnqcCRXpm16kQHTuCNjxv4whtMG/7r6mjIv7Zh8aSy/19AGfzcwvxG0VHUKW
 0XmdmodazQ01vMcBTL8NTl1scEDgorzaHwRHQJJG/MWPjyuTii9SlAJ4Vxg7HSIhZNLJ
 JV+YPPYZBeRacnfWYNnBr5NtJgvp/HJwDvVYijIVpnD4EQfjPCex3PTjTj/L1eiX08j8
 EAu/jDv3nQW7DLVOI/4yvH5dhiKSM742Eu6gHtudximMNvJj9Yv5pRRxtVFIGH8zvB0x
 UaOJZ60yBJWpZR4tWGReGPIXbTI9pT3uJxAVkbcL9KVcGdIHdKYEAM7vafCN1bnJMxXH
 23lA==
X-Gm-Message-State: AOJu0YzkcFRlkTEl3bxtrCQnAsT6z9LvIG4rrKrGnXSaoxuvZQuI1alP
 Bt3klfD+8chMKXVMC8eMYcKwidQujLA3Bzn2NIkTVuqB+YwQMx8++2Tqe6AoFQcHEsA=
X-Gm-Gg: AeBDieuPh0S5gd1Y6iC81Zd1s8ptkvDjz8BeK6IFWIG3bmvjPxfq1xP83XBi1BUJjTf
 3wnLwya8ev+EmZhjEq5kiQ2nPYNeNPaWitnlFumTiKghA5LHJrRpgIW1efbgo3x+Y9o3fTnwNY5
 jZE9y+GFu7RP59A4AK7MA9qlgr4UaIqfPEBk3+3/jO6E1DhSAAyW14KJZXIzVWr+jwLZJv+o5Bu
 bknjbZe/61S+v64V3kTCDKGxsFk8Xwv3nyolir1u/YQVgnAG9V8COkbsk/+qtsPhISQQTGfXbgw
 IqQrsA5wgpZq8v7xBcShNDPGcR3yeAIO0diPzyQ24iqpOwYOFnXRuol43mCTyc9zG/MtkWc3AYh
 FsY6tZJXQSRil/SYvuw8oHkuYAK214XfLhDFAdgMYwmAAWBpiyIJ60z8SF9qTKoA7UCZnUUX9JZ
 QncY0iH7kVJJwV0BOCuCfrw5WLVlfllUpEX5u4Wn0IFiCY
X-Received: by 2002:a05:6214:4c48:b0:8ac:b4d5:50db with SMTP id
 6a1803df08f44-8b66825795fmr145816266d6.28.1777907801825; 
 Mon, 04 May 2026 08:16:41 -0700 (PDT)
Received: from precialexwin ([76.65.67.233]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53c6b8123sm118214696d6.35.2026.05.04.08.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:16:41 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 May 2026 11:16:20 -0400
Message-ID: <20260504151620.1877-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777907802; x=1778512602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2Onc0amZNm/Fkpb9h//5ceO6CeNxbMYLdl0AeeS6XU=;
 b=gVm71pUeWFBt+fv7yXzWQz77CH1ybOxmIyT7yC418bTrm20BFM5E/A9yjUdR0HqtoA
 HIGoV/t2EZC8TA1IGhIHidjh+fvanSJ0ilLM3scmjb3+ihjaoSdVCGRIDBF/f5ngQO1X
 9AXRkfx+n9qrp/n4c3bCQUtgWkBNfFDjdGlSUVYnSgvCgHiwiWcI1yGQx325sMJUDPWk
 +k97zrWvMdbdfhHQd0Z0kOyPhUs7wV9N5Nz+08oYH+WX+EmP8doMs7hBJe5wYZbAFmRw
 KiqfHDcb2fRhqZwo+1zCVAswx8mevVf+lIQeBUZ3Enk6KqCWRUjU4CNBEa6QA/Fjvv0r
 1c5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gVm71pUe
Subject: [Buildroot] [PATCH 1/2] package/python-fonttools: add host-python
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some setuptools-based packages (e.g. fpdf2) invoke fonttools CLI tools such as pyftsubset during the build. Register the host variant so host-python-fonttools can be selected as a build dependency.

HOST_PYTHON_FONTTOOLS_* mirror the existing Cython-enabled target recipe.

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in.host                       | 1 +
 package/python-fonttools/Config.in.host      | 7 +++++++
 package/python-fonttools/python-fonttools.mk | 3 +++
 3 files changed, 11 insertions(+)
 create mode 100644 package/python-fonttools/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index bb6732a639..4668c2ad42 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -88,6 +88,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-fonttools/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-kflash/Config.in.host"
diff --git a/package/python-fonttools/Config.in.host b/package/python-fonttools/Config.in.host
new file mode 100644
index 0000000000..5263963b79
--- /dev/null
+++ b/package/python-fonttools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_FONTTOOLS
+	bool "host python-fonttools"
+	help
+	  Tools to manipulate font files (host). Provides CLI utilities such as
+	  pyftsubset used by some Python packages at build time.
+
+	  https://github.com/fonttools/fonttools
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 1eb8224197..9e3a53d871 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -12,5 +12,8 @@ PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
 PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
 PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
+HOST_PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
+HOST_PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
