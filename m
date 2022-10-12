Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B607C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 06:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F1A641821;
	Wed, 12 Oct 2022 06:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1A641821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntMp8C9nhzwM; Wed, 12 Oct 2022 06:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533F041814;
	Wed, 12 Oct 2022 06:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 533F041814
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6512C1BF909
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 06:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF7541806
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 06:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF7541806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0ncVnPOT2pe for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 06:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8494181F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE8494181F
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 06:43:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id w18so9509520ejq.11
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 23:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FpFdhyvSZ4Q9TLSF9gyEoF3otK/WO7xco9YXSYQbK0g=;
 b=boURLv2Ms0LGK0ukW45HEziDrcxalEfRcVmqrufcelvzbg8V7Je3BUveqfhlFNxDZd
 pWfGIwovGv67xhrWX+IQA+OO3rnnujfpm466sLKYL+ETuVfINanDIq4EclW/pLu111f3
 l4eGpU+s/vC7sBMEEMCLpf9jjox6JhkXz6MnOYtxzObdsAdv2ZjNk7F6gibdGzCXjaUD
 z+VL28EB/+C9OGNLNybO89/msvRUvTOT7PAefwE5QXqHMRhrDHKaeJCqOVXAD2supeZl
 EsSQmkddLi2lpsYpO69WzxBwfOuMLbcyCmRDp5USHLBw5d5wXL0bpKQP+Nia+7cnna28
 ZIUg==
X-Gm-Message-State: ACrzQf39fo1gLqMAyWiJFhLnbKEWQ6r35+Aduh5/h1G7qpSYAGjn3b0g
 f1ciK6BnGnaNeAdHDM7wsiWgGMqlFeJvRe8z
X-Google-Smtp-Source: AMsMyM71F/Fc27Lg4btaTEbtcsooVeQ7ubCrMQgfaeZP43M0KzA3/BQYyo8cZj2ziTljPYOhchgrnQ==
X-Received: by 2002:a17:907:c15:b0:78d:af58:4274 with SMTP id
 ga21-20020a1709070c1500b0078daf584274mr12414960ejc.150.1665557037225; 
 Tue, 11 Oct 2022 23:43:57 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a50ce42000000b00457c5637578sm10556815edj.63.2022.10.11.23.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 23:43:56 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 08:43:53 +0200
Message-Id: <20221012064353.454369-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FpFdhyvSZ4Q9TLSF9gyEoF3otK/WO7xco9YXSYQbK0g=;
 b=clFV7KUfcxvNtJu/18h0tYm9SWw+1Zk+IsTBS+apt8yRUQ3ZxpmqF5e3XfinWDNt9h
 NWq+cWIJpyYB+ALWrg1Ui4H5DVY8K07tRfCcVWXQBUhkrbA2nOe1iJm4XiQr8HpYLW/F
 vvICWecPc2UdHJfrhfqr2iKObhG/rOneVcpLgGNee2L+NsqRAmyIMIWQN4PkbwF1LI+h
 h4EynEzYaTHIE4eFlJob1dPif8VwarXerpYYC79mvvsJp4up7UPSCUr7sh/1jfYKIh9R
 D262JOWpMnt6ar97LQCzRTbccJDTtTPtRtAT6XpDfOUVPUXmUn+ZwytIxzDLqVNPY1oh
 1oEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=clFV7KUf
Subject: [Buildroot] [PATCH 1/1] package/qt6: Change license hashes
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There was a major rework of how licenses are used in the Qt codebase
along with a new location for all licenses, so change the hash file to
reflect these changes
https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.hash             | 15 ++++++++++-----
 package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 5dd26973fa..b004347a5a 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -2,8 +2,13 @@
 sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSE.FDL
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index fb1b3dcf6b..887f67b2ae 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -2,8 +2,10 @@
 sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files:
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
