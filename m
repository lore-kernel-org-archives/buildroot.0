Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44EEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 595514F4C6;
	Mon, 30 Oct 2023 08:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 595514F4C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMubyHPVdhib; Mon, 30 Oct 2023 08:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C15C41EF5;
	Mon, 30 Oct 2023 08:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C15C41EF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13CE11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0B638543A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 08:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B638543A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw_HS59hL8ig for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 08:51:01 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D378185434
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 08:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D378185434
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40850b244beso32828655e9.2
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698655858; x=1699260658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HhSVczqOsKP7FW+tFFb7R9EHYOuG2dI8xv6Oja+R7wg=;
 b=IHoDwzhV3G1cA6R2WPT8hCZAAJUpxk57R/G6lXx4pUh0VhlDUD3eNErQ9iuWX5SuTW
 y/sI6T0+eG7QT9itLP/ZxeBR361oZxWq1S0TXX0tlT7D0NeKmtIabFt1MD1E7iMwKDQ9
 mOOoNviDPCh7TJ8Ndkjk57QaEPA4wdQ+lI9JkeqacIG/SzePeXjs8jBtTS31isjg7Mb2
 A/pU0hI1Jo0aMVjS2VFNB/s1A4weoXAAG1t9O2tZ1uAJtmviwQbBsAgMlULKkzrbPQzO
 2t0S3IeB2TdL9b3biMWzOzuB+vM3sEOlAZaZ5ZgqMQdp4Kk8eeHWZdldPFzPp4ZIi3aw
 R01A==
X-Gm-Message-State: AOJu0YxgTIF1PqGMDV+OiAHDARWAiDIpZULgCaNGBsO9njOvJobk82mQ
 LyNnatwbMI9Oteeq9osB73wfVCYRWPs=
X-Google-Smtp-Source: AGHT+IGV/EoAOv+joR5V/XghKl2IfmIfBHxzu/adfEaOfFEIcao7VhO5JAK6YWW+lTJ4QSBuPfQAKg==
X-Received: by 2002:a05:600c:1389:b0:409:2e36:577a with SMTP id
 u9-20020a05600c138900b004092e36577amr6893210wmf.16.1698655858263; 
 Mon, 30 Oct 2023 01:50:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 dl19-20020a05600c669300b003fee6e170f9sm8551722wmb.45.2023.10.30.01.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 01:50:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 09:50:54 +0100
Message-ID: <20231030085054.31859-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698655858; x=1699260658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HhSVczqOsKP7FW+tFFb7R9EHYOuG2dI8xv6Oja+R7wg=;
 b=BuBQ4gxYJnsriNp9sRuVmOfZE6XkBieKMQtz5Ifsga4kU5ok3cTo5piiCsHgDgGoN9
 6VWkCwwZuUXrmtD1g+Lv+5jc8LJPT44PwAwC3pf+HNdCG8SM09/jpxZD1ZcEXNmjUUqj
 GWC2TXdvnEtw3uOosR3BM9+yW3c+mLZdT6da0Q5WqILFZsG+eXTf2dVjkvIFeOqdeycA
 m9aUCdeesO0F0Ye+3J/PvJn6O+jlyhceTSLfdbJfrZXBLr6SMBzItkFBoW+CKxrF1XNu
 0tpmIygQfmU9WEw2oYOK4BIzmGpLtxlf+2mKl8KUGmC/CbXm9kybQ03xk/QjVJ+eH4xz
 Pbew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BuBQ4gxY
Subject: [Buildroot] [PATCH 1/1] package/sedutil: fix build with gcc >= 13
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

Fix the following build failure with gcc >= 13:

In file included from ./Common/log.h:45,
                 from LinuxPBA/LinuxPBA.cpp:25:
./Common/DtaOptions.h:33:5: error: 'uint8_t' does not name a type
   33 |     uint8_t password;   /**< password supplied */
      |     ^~~~~~~
./Common/DtaOptions.h:1:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?

Fixes:
 - http://autobuild.buildroot.org/results/b6feb4fb33d595414b61174deb9867e8c30cd186

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-include-missing-cstdint.patch        | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/sedutil/0002-include-missing-cstdint.patch

diff --git a/package/sedutil/0002-include-missing-cstdint.patch b/package/sedutil/0002-include-missing-cstdint.patch
new file mode 100644
index 0000000000..07a617c5e7
--- /dev/null
+++ b/package/sedutil/0002-include-missing-cstdint.patch
@@ -0,0 +1,31 @@
+From 927cd88cad7bea94c2eebecc18f7881f0defaccb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 23:36:29 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint>
+is no longer transitively included [1]. Explicitly include
+it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/Drive-Trust-Alliance/sedutil/pull/425
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Common/DtaOptions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Common/DtaOptions.h b/Common/DtaOptions.h
+index c012af1d..7530a0b7 100644
+--- a/Common/DtaOptions.h
++++ b/Common/DtaOptions.h
+@@ -21,6 +21,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ #ifndef _DTAOPTIONS_H
+ #define	_DTAOPTIONS_H
+ 
++#include <cstdint>
+ /** Output modes */
+ typedef enum _sedutiloutput {
+ 	sedutilNormal,
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
