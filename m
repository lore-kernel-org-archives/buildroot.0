Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 08:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86DD340448;
	Wed, 27 Apr 2022 08:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPsdS0MpqRZv; Wed, 27 Apr 2022 08:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66BE5400E7;
	Wed, 27 Apr 2022 08:18:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 201C11BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110DA400E7
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ce0jUkPg5R8 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 08:17:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B764440017
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4GfmW63aEbNDVuWTQFsQjhhsuI8K0ji7E7hVZEmxpok=; b=EQC9Jos/i+M2YXInh06DjCqeeo
 fcUi5wwZv4s/tuk/nnvaoypllBY0nDCLBf0iuCNkHjPCBBsz+xmPXAMNkRgXPnBLuBL+cyxbD4nPy
 JTN4X8zOXuxKqOCkY+9HV81RJuSHeFh5Mx+/drZunMbCWPULQihg6SCUiJbb9OHMIpTW3/aeaTCVt
 BmhBPJnmF+XF4B2Z+WA7rdUriDDTXJ+NqE+Sm78BH1Dcju7nPN52Vl3Qi7zZTbfQbE239YhCMfxCE
 8DPRD1GV/Hl3xVXDi+1U1NQu/wwBVcdD3bqbocngZQi8YcBxlaSCHhDWEYAYZBL3mm38DkswfR/vH
 0KtRW8GA==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1njcrz-0002uJ-4l; Wed, 27 Apr 2022 10:17:55 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 72fcbd5a;
 Wed, 27 Apr 2022 08:17:44 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:17:44 +0300
Message-Id: <20220427081744.116766-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/brotli: workaround m68k build issues
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On m68k building with optimizations  results in failures such as:

/tmp/cckiMnG5.s: Assembler messages:
/tmp/cckiMnG5.s:142572: Error: value -39206 out of range
/tmp/cckiMnG5.s:142629: Error: value -40282 out of range
/tmp/cckiMnG5.s:146408: Error: value -53294 out of range
/tmp/cckiMnG5.s:159014: Error: value -39206 out of range
/tmp/cckiMnG5.s:159071: Error: value -40282 out of range
/tmp/cckiMnG5.s:162850: Error: value -53294 out of range
/tmp/cckiMnG5.s:175456: Error: value -39206 out of range
/tmp/cckiMnG5.s:175513: Error: value -40282 out of range
/tmp/cckiMnG5.s:179292: Error: value -53294 out of range
/tmp/cckiMnG5.s:191898: Error: value -39206 out of range
/tmp/cckiMnG5.s:191955: Error: value -40282 out of range
/tmp/cckiMnG5.s:195734: Error: value -53294 out of range

These only appear when building with -O2, the smaller code generated
with -Os does not cause trouble, so workaround by using that.

Fixes:

  http://autobuild.buildroot.net/results/2f222d5a86b4237b81ca31dba89f58b0e6e879db/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/brotli/brotli.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 43c8524c0b..ac49fe664f 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -21,6 +21,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 BROTLI_CFLAGS += -O0
 endif
 
+# Workaround "Error: value -1234 out of range" assembler issues
+# when building with optimizations.
+ifeq ($(BR2_m68k),y)
+BROTLI_CFLAGS += -Os
+endif
+
 BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(BROTLI_CFLAGS)"
 
 $(eval $(cmake-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
