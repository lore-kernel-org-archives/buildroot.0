Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A654E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505CB60DD5;
	Sat, 20 Dec 2025 17:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp0qIA1tZFYl; Sat, 20 Dec 2025 17:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75D560DB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766250387;
	bh=lYhetb1CWmgKGGegThR6Zk0T0UCLO8mf27E26o5zLg0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f8ZBzgN/f7n2WELsnUE5EXYzDemkN69uSRhTqEmRlkqjEyn6tBTdy7imVxhIHdyWw
	 4n55nm8kDsD3kaR1oewOQyrWUhVoOvfrIPqqM/hdzTEj8/Kq+rhb15BlT6DeN3brqe
	 UCCkB50miE+IlzBGAgK5FDrlJsh8X2QZnHEfqjneyNY78M+HNTLd1UL4hQJEVN40V2
	 MelX3P4/36hi2nefIji9YeZ/jw8mQjcL7kZykZgaV4kRbBNosKK+yBktnz8973Z3Bg
	 +3g3LuOv0kp/WUwNONzEdUJ9BWnTlvO6WM6ng2VJsZGdh00YA4akI0kNVy5eEgKw5M
	 pSFVniD9yoaYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75D560DB7;
	Sat, 20 Dec 2025 17:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D81119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C6C4035D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb_PgQ5fYbPf for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 994174011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994174011D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 994174011D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1926A4C486F
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:06:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42440)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX0PP-000000004K3-2Vux
 for buildroot@buildroot.org; Sat, 20 Dec 2025 17:06:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 18:06:20 +0100
Message-ID: <20251220170623.155785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766250383;
 bh=/EKfb/zfi5twWQzp/oJdOnYnCJIv3Q8DjP/SyLz1vEU=;
 h=From:To:Subject:Date:From;
 b=LayDHYdvCd7cT89jw1O739fdBionRR4JDFiyAMYZL6dCWXiPf2eKSc+k6MHu3L2vk
 +ouPQWi3NnPsCK7qKyICapdwFNqQNOhCbxdRpP3D+//1Fr1PP9WZ0WuifsNj6oFbE8
 73lPpCi9G+VSt824rVsZgkb4q8KvrI/jF5OJoqKLpSMQnOMKXVnSarkZDu2Wuppp7X
 JpIqOKzX3MP15llWeMm/TDSLWS4OGajXm6DeYnd11nCTUCEEdIF6scwD6kagP7xAat
 46scRmvNY0a5qNfVM5h0/bUNLzjSZXzkYgW9mGyChQcIFK1XhJIxF7P/Z1sL6kJ0hh
 WOjI2oLILyAhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LayDHYdv
Subject: [Buildroot] [PATCH 1/4] package/util-linux: Remove -lpthread from
 uuid.pc for non-threaded builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
util-linux from version 2.40.2 to 2.41.1.

Upstream release 2.40.3 contains
https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
which unconditionally adds -lpthread to uuid.pc causing build errors for
other packages using non-threaded toolchains like erofs-utils.

Upstream was notified:
https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953

Fixes:
https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 16d086f333..8c98d80adf 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,13 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+define UTIL_LINUX_POST_EXTRACT_FIXUP
+	$(SED) 's/-lpthread//' $(@D)/libuuid/uuid.pc.in
+endef
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+UTIL_LINUX_POST_EXTRACT_HOOKS += UTIL_LINUX_POST_EXTRACT_FIXUP
+endif
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
