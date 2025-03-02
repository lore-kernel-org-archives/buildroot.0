Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEA8C282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF74413A5;
	Sun,  2 Mar 2025 21:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7smyHY54xid3; Sun,  2 Mar 2025 21:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9120F413E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9120F413E7;
	Sun,  2 Mar 2025 21:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E507D182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D087541457
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojn8rKyTSpE2 for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66F63413E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F63413E7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66F63413E7
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390ef13838cso193333f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952374; x=1741557174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuEjqD7VoG/jGZLnlVDKQnatGYEQqK9YeUGJde9QLe8=;
 b=RsSQTvgdAdnWsw4NJo1r1ZJ+MwT8U6BFVSs9Hiz9pxb5Sp0tYJ/3lY9BR88AfmPjGS
 OiOZoeBoXnQsSYGmUt2Zixze/uY31DXQ9guiG4E3a6OdjMTRXcAPqCY4kI6VrAMP2FjN
 g3wWkwUyWCmU2kkmiXIB813ypth9u0X/vvd7a9ARa2sOHWzKazuAGIca+AFfOoc2RRjT
 8G96E9Op1n/8FInphrQOEW3+HRicQpm8a/sFbopck9bSsNDDgryD9Ht23E25AK/Yql1V
 UIBp4ge0Zl6iRImDzspQwYnEzWRVch7+YAMrs0pyyfDIOVa6cQHPjWHH3+jiOGYbeLY0
 n/vg==
X-Gm-Message-State: AOJu0YxlvyWAZKMTopqu12b90870BPVwnp+ZruoJVfbqoECGKLkOb1+o
 gVyqN0s6T7kS6DSXtjw5GaY1GzhK9mD7P94Ml3lG0wb48ep8+Fg6kMobXCsR
X-Gm-Gg: ASbGncupR9dDAIHrvseCS8Ks3W4SLyZDHJPLjZRJoGJO96jj1njMhRDATabE1l4N2fc
 19LqJSRneT4KzLS192ymL+D36pGJMhTrBF31OgGhyw75b9VwABdQ6xZTrUfzFIiCfxdDRZxfcQ4
 Jw265D2cMfZEULKH/S0MVWsnCBOer0hmbicpJtqSk/2sP1fybs7cgw6NE5L/MbxVmTubQ7o/DBZ
 x5/whDrqaFmzPmApj9U7m0ddmM1MY2Or6tX6Z9yVWyYIe62xTsK5QGXfRNPV0j9doNMaSoalk7O
 NZMKHdgXZLYSuaw594XQ4VQp4gGpdNg4O6cRmg==
X-Google-Smtp-Source: AGHT+IEUDfXkCRpH747p6cvg22KVjZhanBUDsQR973cfxDlBTOFxYmyrUl7ndSK5UBw+f5n2ku+6lQ==
X-Received: by 2002:a05:600c:4c89:b0:43b:c0fa:f9c4 with SMTP id
 5b1f17b1804b1-43bc0fafdbemr4080885e9.4.1740952373672; 
 Sun, 02 Mar 2025 13:52:53 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:52 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:13 +0200
Message-ID: <20250302215219.1276480-10-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952374; x=1741557174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuEjqD7VoG/jGZLnlVDKQnatGYEQqK9YeUGJde9QLe8=;
 b=Vw70iK0zwQjhv/lzSAobgjXuVthYQKyokpZhgFQ7AwzlM/zFD+lxhgsEv1iQA4PXGo
 TAzRfA3b1lHYnVt2bypIdGzHaj0IuPoTvrkG637P4PUInY1lEqA2l+m77Oi22Ib7CTTT
 vXCex8UurRDgB0Na3D63YMT0dr5fNyxOselogYc3KaXRLQnTDonVm7Rb+dZwpvkDhjme
 GgsjolAJIpSnrNdY4i5QXUbH1YhnhWui3sXwsz3c6sYpfwnnQ3BKh14EsVfVVCBRZmRC
 jxjF5GgEHiCRTw9i+Jve5pEOzSXW0LESQ02omwR3+1JqpD3TDCn3Yf7KTSWmFuR0u+kY
 NDiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vw70iK0z
Subject: [Buildroot] [PATCH 09/15] package/fmc: bump to version
 lf-6.6.52-2.2.0
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
5b9f4b16a864 soft parser: avoid 'register' keyword in lexer files
aa63ed53bc9b FMCPCDModel: use const char * for rodata strings
5841ba12d151 Makefile: fix parallel compilation
5b695fba6506 YOCIMX-7790: fix build after libxml2 >= 2.12.0 xmlError const change
63c8ac99899a Deny HC usage on fmc cleanup
3def2b9b5d86 Check if valid FMan handle exists when create devices
a8a257ba10d5 fmc: rename COPYING to LICENSE

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out fmc changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 package/fmc/fmc.hash | 4 ++--
 package/fmc/fmc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 961ce18ac713..8f59c94e6a52 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
-sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
+sha256  13a5e327ef1d727946187fbd021513194981e42681c73e56933109af8a5889e7  fmc-lf-6.6.52-2.2.0.tar.gz
+sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 4f25545ffd8c..c6d36f14a00b 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FMC_VERSION = LSDK-21.08
+FMC_VERSION = lf-6.6.52-2.2.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
-FMC_LICENSE_FILES = COPYING
+FMC_LICENSE_FILES = LICENSE
 FMC_DEPENDENCIES = libxml2 tclap fmlib
 
 FMC_MAKE_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
