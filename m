Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF998C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847174032E;
	Sun,  6 Feb 2022 10:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvqBD8HS_G43; Sun,  6 Feb 2022 10:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA51940325;
	Sun,  6 Feb 2022 10:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 699ED1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56051401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OE5kZflr3nWe for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:41:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTP id E29EC400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:41:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GeyynJRXmX0z7GeyynKbeb; Sun, 06 Feb 2022 11:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644144084; bh=OWkv8eNFs/MJtTXtGYNERmlSfpYT31WfXZMRab1E4EU=;
 h=From:To:Subject:Date:MIME-Version;
 b=HHQZqAYKDgzf2k0KIyNhAv01Ws6ohPRxePFEm3IPfqxbO/7fWtxIYwMdIwfrOQR2E
 xa99E9r8DKGOVtJE9s4fBjRkbghSwr2+BOb/Tw6qZVYiyu+0yxSgSnmalS8Xgvl1pv
 2yut5w655Bagfpb/K6KuRQVT2i5FL4G8vrVp/p6WNokmwd04OyyRRyDQ46i91hkDk6
 28aH5iIWsz8Vfjr57eKydfC7nFBmoLlfE9JBno96NuYvtWrtsPmMRB3SPmp8cfL+11
 VjYs8fm0RoRe54ulNOO27iO821eSukfdRtR54O2uIF3/EKN3JhU7PUD9wLQBi6zjTO
 aPA2I/8E6VJOw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 11:41:20 +0100
Message-Id: <20220206104120.1580819-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCzXB+5Y6oNe3tyBxXwE8JfFslZspcPKt5UrZVOkS61MOEn7WAlOcP3VBqydxRSObaUZho8/G/YmHxJEiBoFxHvNrychd0mWF6O7sAwBL21BFzHSt8gE
 JnqMGTozpo7yuzAFm/47XryGLnJoqm3GCzQvtRFhL5HCBkBpaMqzccg11s0nYaY2XPYOj8QL8fL6QSwteQq+kqQSPCR+QsATpiRBmt8opihDyW8in2qawVbg
 X6l9qPF4SLEpbvkts6Y/I+0OA4751VAv4j09F1BVt2RvDI9YRbcWIZ0ghwg3PZtPY6m4H+RgEBNQiPXeqbWmHKmGxijqtNIKOGzHvB0z4P0=
Subject: [Buildroot] [PATCH v2] package/systemd: don't treat ld warnings as
 errors
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nios2 ld emits warnings like:
'
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
'
Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
SYSTEMD_LDFLAGS the same way I've done for Microblaze in commit:
https://git.buildroot.net/buildroot/commit/?id=cc53d5357d84ff9b78d76e45ce216061df8a37c1

Fixes:
http://autobuild.buildroot.net/results/5fc884e11e46ab165ea21c8e8f2901516d79ff80/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* renamed BR2_nios to BR2_nios2
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5626b54e8e..b07fac27d4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
+ifeq ($(BR2_nios2),y)
+# Nios2 ld emits warnings, make warnings not to be treated as errors
+SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
 SYSTEMD_CONF_OPTS += -Dacl=true
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
