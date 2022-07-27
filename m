Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF2C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2267960E46;
	Wed, 27 Jul 2022 16:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2267960E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUTTY3ZOIOGx; Wed, 27 Jul 2022 16:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DFF60E31;
	Wed, 27 Jul 2022 16:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11DFF60E31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB141BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A9E9826BF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9E9826BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bHJIXkCvbBa for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A5E826A8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47A5E826A8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:13:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l4so3534541wrm.13
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2V/p/eZKCUJh7yLUvs5IQaBaHY7LfY0IMcn0I6+DFSE=;
 b=S2UEwKODil8m6s2cgaBNGAaH5gwwIF/QWvVa0BdZJTiHzmEEnuySU7pfwoGyjtDrOa
 pZ/8V1qpdAlo3FTWcuKjwh3ofWvWGFqHVYrWUSdZhV9l4tqfRrRIiV24MxfQ5bcJvFaY
 aON6DkoKt7R6Fv0swKEf3Khe9lrBp7Hy2/CmdJ9emlYJ4UpoB4lSyhUtWL/DnqesqqQC
 XeqOsCNqwodvbz0a2rAAF2kmAT9OB1LJexLwis+DBosIvbz2J5Srhe57nCQFcz9pLwOZ
 xFypTi35uvBQOC4Qa7pPD1yo+NYpQ+/WuPd5x56meWQf4xvVs1R9aMZMgJ53eE1MHlvp
 WUiQ==
X-Gm-Message-State: AJIora+h7TFSGV3KOvT5rtElcrcusgOLec+/b73FUV29axMXux5C8oqq
 OTnWbbHv16zfZ7uSn2rH8ZP5ootC2JL/Kg==
X-Google-Smtp-Source: AGRyM1s5kXiCVSsvJSy7S7fPx/VpEUeloygj7NUYimyq8+5F1fjAhLkqiBhmtSX6KOhk3DJRyZuoAw==
X-Received: by 2002:a05:600c:4e08:b0:3a3:55d9:fd52 with SMTP id
 b8-20020a05600c4e0800b003a355d9fd52mr3645224wmq.148.1658938391409; 
 Wed, 27 Jul 2022 09:13:11 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b0021ec503075fsm2648333wrq.31.2022.07.27.09.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 09:13:11 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 18:13:09 +0200
Message-Id: <20220727161309.3616285-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2V/p/eZKCUJh7yLUvs5IQaBaHY7LfY0IMcn0I6+DFSE=;
 b=b5kJpevndSxWY4Mh8sd9sWnuVEAro5PBeElkWWGEMXgWBAdy3LN5GPgXVPWOWM43sN
 Vvrl5hJlrxf78RHkOkNp7TsBJwvTTnAb0FDVZw6syZfuXwQbFF/45ZrbV47iArsAXc5i
 MQ14eQJvO7Y1fMjlLrqW5j9Y5nYjVoime8OPyr5DaavcqL0gecSR6dJ2UtlK/rbWIRWB
 aLrROOkC5l0EghIAGq2bc/MU86P4n9w7dvSX/iKP6Gp5CSYP4z4nW0nMVCh1j4awwxpL
 9FJ+hxwvn3XFHESOHxnAdOWJkxzL9fCG4MUe6VcX0ruG6f5mjQFOKd9IsbCAOR7jeLSU
 z76g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b5kJpevn
Subject: [Buildroot] [PATCH] support/testing/tests/init/test_systemd.py: use
 downloaded kernel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since systemd requires a relatively new kernel, we switched to a
self-built 4.19.204 kernel. However, since then, the downloaded kernel
used by the tests has been updated to 5.10, which is certainly recent
enough to support systemd. Switch to this one. This reduces the test
time significantly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/init/test_systemd.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 80c6776f59..be28209ba0 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -11,18 +11,11 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
+        """
 
     def check_systemd(self, fs):
-        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        self.start_emulator(fs)
         self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
