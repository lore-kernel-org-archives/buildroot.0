Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF67C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03B224032E;
	Sun,  6 Feb 2022 10:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2NBFzPqK5_S; Sun,  6 Feb 2022 10:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECF98401ED;
	Sun,  6 Feb 2022 10:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47DCE1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3651981656
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LF9J953XyKK for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:37:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85344813CB
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:37:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GevGnJPKJX0z7GevGnKaYg; Sun, 06 Feb 2022 11:37:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644143855; bh=evJvK7JgMDnCBa4xW+fXwnl3rUflYAWeDf1KyPG7/b0=;
 h=From:To:Subject:Date:MIME-Version;
 b=lCxed0cCtZPvgW+PpCqWtu8zGgctrMPG+DFA4iQl3GIbFVFFOzIUaiylupIfJJQ6f
 vH9FH8BDhSXfVuOaaPBZRf5Y+8pYrcMZesD24OWHxzub95+ZbzBnoGeunIzIv2sCN9
 cR/w4enkVTownTJvxq0oIbORmde78WgP8nzKXSdsmmbYibo8sqrXudRA7MH8aU7viJ
 GFsnsn8slkTIALMsmsNohjw5fm5C0Iw6uaSnkRUEML4i9hYHfnhlHed0xscWkaxQ++
 7dwWgOI4O2oOwbjSRKP6Ki+nYA7Cbxyu5f/rfzHaXZX9y46Rpa1cg97n/Dg8OjX65N
 WW/BPRhnWfJew==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 11:37:33 +0100
Message-Id: <20220206103733.1580146-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL1G2H0kM0ElIiIOMCsD5t4E8dB4g7vIK4VPVg4qwjcsf7XwExHYfr7xH157xfF/ipTrl+dEx/S2WaLV2X8gXpezEb3sIDl4qvTUlZ0qOyiVexoURvEa
 8x/5aAs/4aH+64IoJprxan8tzt6mUABxLobryuKVI3JprqGJoF/sAw3A+oMS6mnks6SH3YsM83vdhnfJiHZl5YhhOu/ufgASwuQMVnPmzAPXSnqqrGrIhRyh
 FezTFV5XrI+9DO0FEOlfwLtZgZ1y3RTdpLQEP7AN6aYLPK1Qfpdco9Cs4UX/Od4kUtCRas2puSWxVwRE6cOWlKQyh1jPI7KW1VEzUhfDn9I=
Subject: [Buildroot] [PATCH] package/systemd: don't treat ld warnings as
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
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5626b54e8e..0f7da5cb28 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
+ifeq ($(BR2_nios),y)
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
