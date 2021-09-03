Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5A3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3F460555
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F3F460555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282B060719;
	Fri,  3 Sep 2021 16:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjRE0X4VABkn; Fri,  3 Sep 2021 16:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78EB9606C4;
	Fri,  3 Sep 2021 16:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33A0B1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30EFC426B4
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4AfNSt7yWDE for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9707A426B1
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:37 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id s11so5990597pgr.11
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkAuGVmZ4sGtuCDQdqC3y2FeVvygDcKc2H36Ag77FKs=;
 b=FLhMUaNTpJaXstPhXjfTHqbiQ/nIDLHxgWhnrpSy5kjeWa43SdJiLplKc+gFKAiUcy
 w0FVPsGCnK2M16XfBiWiJV4P01oxzbrpBk82y1YnYaGStu91QPrjuGC4tzofhIa/RLSY
 sWqTnJXO4Q7BCHmN2aeP4kHpnIWF/G1CepTdOgrcK/aNwQJhy2/3FVv1jkfWDxkeql4/
 UQnQoigEO3IKhSH78GaiVq1vlEp+GP5aS6rq6u00tQlyjHggfPJt4KFSK9xK3LCH5k+9
 hfiYFXgPPJytqFrnOGxjSyhgfWBLhbM9sf4B22EYzCBje7rdi1PUk5RBnYLmzRCHTijm
 oZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkAuGVmZ4sGtuCDQdqC3y2FeVvygDcKc2H36Ag77FKs=;
 b=XgtclnU1ixN6NeEHIBf+SAENaINXNUhOHJZFFkaZsFer86/bYynLCaYzIORf9eHUdJ
 oyNMvE8MGejLkUY2bikK890ijemaeJM2uxEshkFwPV5GIhdYgCXDqQUUxXKOqk5BIupN
 d7cLIP+LlmuDOTNmJ25Voi9jvC4bTkJE7rGneH05VMmo69CauG0EMZuE/OA/wpYn/Vy7
 T5sbJ8LnnzHRiMOFLTrQOIme7Z3Y0qsj30gn5DEy3RzbEFP3BqWtCJJi7G9BZ6hEXZVd
 lMM8Qz+QsPXo245+DtJLxCwITLdpD3iRdhV/cRc+tIQymJ6OkZXnohUlVor155acM0lc
 T3PA==
X-Gm-Message-State: AOAM531d0rOtPr4ySO32peIPgHqW+bJ3i1xohlUYfJKq54oRidffPUoV
 VTNr4DBoNGZ4kaVxHLOOM9SsvDpI1Rh5vw==
X-Google-Smtp-Source: ABdhPJyw1cz9ZVsBu1SJzAf3CWg2XmBzpgI4c+IxdyVJgTYkk1LfxgD2pALn/B/WDUHXJul5nuDoDA==
X-Received: by 2002:a62:a117:0:b029:394:dddf:6b00 with SMTP id
 b23-20020a62a1170000b0290394dddf6b00mr4045939pff.50.1630686036857; 
 Fri, 03 Sep 2021 09:20:36 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:36 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:22 -0700
Message-Id: <20210903162027.1935040-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 2/7] g-ir-scanner-qemuwrapper.in: Fix
 shellcheck warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

  - Add double quotes to prevent globbing and word splitting.
  - Add indentations of continuation lines.
  - Disable SC2181 and SC2016 as we explicitly do not want the variables
    expanded in the echo.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../g-ir-scanner-qemuwrapper.in                  | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index ec066062e2..5ece75d0a4 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -1,18 +1,20 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
-# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
+# Pass -r to qemu-user as to trick glibc into not erroring out if the host kernel
 # is older than the target kernel.
 # Use a modules directory which does not exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
 GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
-GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
+GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
--L $(dirname $0)/../../ \
--E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
-"$@"
+    -L "$(dirname "$0")/../../" \
+    -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
+    "$@"
 
-if [[ $? -ne 0 ]]; then
+# shellcheck disable=SC2181
+if [ $? -ne 0 ]; then
     echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
+    # shellcheck disable=SC2016
     echo 'Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"'
     exit 1
 fi
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
