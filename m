Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B5BC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C00080ABF;
	Sun,  5 Feb 2023 14:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C00080ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6yWfTXxNsRH; Sun,  5 Feb 2023 14:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E2880AAD;
	Sun,  5 Feb 2023 14:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E2880AAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2489C1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2DF681DEE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2DF681DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8MfLTmVPqGv for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A7281DEA
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3A7281DEA
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:25:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h16so8262989wrz.12
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 06:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1yus/O0lpfluEyvZGZk7EgBJIIJIUgy8m5hIY2YBAg=;
 b=GwGRFl4K6OjOx32nTpR+gRE4/B4k6fj3SbgN9I1ZtuBRiSSL30I3AB3x26om1LG/aW
 zhvYXS0Qv40LyD48vJ87exv7KoTcBwNt4AxajL3IwmYGx6nnb2UehOj7YqRlGSouarAJ
 U6xdah8A9mKehV5SAyFytBtEQwtw1ejTJQfGFh106DymUlsybfCtdMm+y+pSIZZiEO8R
 2Kxas8i4B+u9aPtg2nouDlRDAlttDvQkaHAkRmOgewXlNqmLC303wangvWOPko0VotPV
 NeM832EpjYrxbiSbg2OaNdFFWIMZwU1Wzpejct6MexnOSCgXyq8rPLKX37HgrABOr/el
 ZHBg==
X-Gm-Message-State: AO0yUKU9fkf8JagweWXNt76yU3C9xqNVctY1tdI/EMwZJ+kab77IQBct
 YfvKKzrDN1cUlF/vsNE/Msyskt3UZF8=
X-Google-Smtp-Source: AK7set/+R6zY5LebfxgQNXsx3TxAnL6Z3yCyplRj6yldgj0cuoA0hEd+J20q2SIyYSlvJV3yp6q8sg==
X-Received: by 2002:adf:fd4a:0:b0:2c3:ea63:37b2 with SMTP id
 h10-20020adffd4a000000b002c3ea6337b2mr131901wrs.2.1675607148976; 
 Sun, 05 Feb 2023 06:25:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f9-20020a5d4dc9000000b002bfb37497a8sm6555486wru.31.2023.02.05.06.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 06:25:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 15:25:43 +0100
Message-Id: <20230205142543.285695-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1yus/O0lpfluEyvZGZk7EgBJIIJIUgy8m5hIY2YBAg=;
 b=NdpGWtYBnzZcaHq6+R3WTrFEy7HUSPV49rMgyImVljH6ykfRqfq7NZvro0Cu3dPjtw
 Q3NAkN0i7BAA1ST8zIrcYA5feS8uPpYGxlM2zcnEG44usIvybT+94xBH0KvI0oBvgtaR
 eoblAIysDKTyLcHjcvRW6/I6mZI+h4C2f8bRJijfHTggRglzPkcz/fys+bJE85BzBAHI
 rg1mgJri73DPqvn/D2hZcdmpfNH6mEfHa600FOJn0OOGKL8/kixvO9QP6Naau3YP5XvF
 5nN0/dssEaMiqe2/COBWTN2PakkjgjvHMPR1mFny09xDKdbFDAp8QkHt+IRJkxAcEVXG
 kQUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NdpGWtYB
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-0411, CVE-2023-0412, CVE-2023-0413, CVE-2023-0414,
CVE-2023-0415, CVE-2023-0416 and CVE-2023-0417

https://www.wireshark.org/security/wnpa-sec-2023-01
https://www.wireshark.org/security/wnpa-sec-2023-02
https://www.wireshark.org/security/wnpa-sec-2023-03
https://www.wireshark.org/security/wnpa-sec-2023-04
https://www.wireshark.org/security/wnpa-sec-2023-05
https://www.wireshark.org/security/wnpa-sec-2023-06
https://www.wireshark.org/security/wnpa-sec-2023-07

https://www.wireshark.org/docs/relnotes/wireshark-4.0.3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index e9026b8caa..7128b560ae 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.2.txt
-sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
-sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.3.txt
+sha1  243b0057cfe6d447662e81b5646110aaf8b63c81  wireshark-4.0.3.tar.xz
+sha256  6c51e15bcc0afb93734e686dbff354ffd159f570bd2904bcbbad6f3feb7e9511  wireshark-4.0.3.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e2a424ef0f..12c36575df 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.2
+WIRESHARK_VERSION = 4.0.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
