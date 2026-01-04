Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6AEC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58AEA80DE5;
	Sun,  4 Jan 2026 17:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLu_VfhfOWGA; Sun,  4 Jan 2026 17:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D4680DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767547739;
	bh=bPcIXDZhni9qaj/2LBcXLyPIyGvFYSR8nD1/hy50apo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N39Av/sCxbJsFFryoQ7dj5DwX6k2WcEeSBbXYIZsd3tsCmWJlBFnCs9FC9c7tLM8c
	 uDoNMjWuQgMezHjsNpbIOXo9DzpnQ8WQfd4KritVoxfi6tR2gfnPKkNnuxEFGY3FO/
	 BzyijWSHn4JbTzJnxacW3ln3rnGxm8dy+evDsCc3nLto7LxEZGx8CSEAEiN+0m0oi3
	 nzqiP4+i7IxQGHR8ObxYjSkX5FpEo9cU2n5GjiNauPeFG8C3+bMgdqOG6kZsHODsTM
	 vWF4H5DUh47hAjshokbRCb/zrwZ0OsFjDViFA/WBlHYec+VDlx4Ev/fOBzjwJmmlYm
	 P7MowL5P4UUwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D4680DA7;
	Sun,  4 Jan 2026 17:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE652DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7396780DA7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLKxgieyranE for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB7B580DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7B580DA3
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB7B580DA3
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:28:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id cRuQvkCrwGVgvcRuQvb4GN; Sun, 04 Jan 2026 18:28:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  4 Jan 2026 18:28:53 +0100
Message-ID: <20260104172853.3441726-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNRCJH2BGx2pJ2OGRqPJ//w+g91gcIPq6dA0+w9btXu71q6x36u6mzmGTKt7AhPrrppogLuUxc/CeQEi2EHlheoBEF17Zzk6B7abdn3+/6a4C0wXJlYE
 YLcrDwhYSz+vK/yyz1x8s88iB/aKiWEa92xxB+DSrkozX4zYYd5TTqtLt2BH9CuRFnf363lVtcUAqIZmu/9eBAIvLogUxPcXLS62sU1IrUToVcyK2HC936qg
 f+MTtYqueXERVhQjbXBshNVsA+vqixjbRMJkBFIM378fC5YWgQ06D9dQFXvW6yUbgAiK4mo6bG3lPLClq8MkTQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767547734; bh=L8ntOn8REPA90QftuoCLNBxEkRWzLMG2FPghjsf6xOo=;
 h=From:To:Subject:Date:MIME-Version;
 b=F2YheiY7Ulmbza03C0VsVDgQxGLHbR/nvMPoiP7TeZ2tGQ6A14NsLzF1IKWfBQGnz
 ulE5cowx9hJ0zoQJvGAOa0JtZhqMShWJUNmD827eZPSuLGbhClMOQnel86fry/kRho
 o/LEZJsY3Q/LbXycipRp4FX4X2Z829HiVxhnFZvWb4+j8OlmenlhIjHOvZduSxry4G
 rIiFFBAMUUjGNulX4YbSbXuEKdq9H9RIZrrIJ4wWxv0OI90RX3iIlCjQUkaFneARXF
 vEUM6NZvDGHFgHvzFh2Mqf0zWPZ9Wndvg5OCex48M6CWOVfeK3KVq/OObLRP5KbBeY
 zEYZS0fjhgrsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F2YheiY7
Subject: [Buildroot] [PATCH] package/efl: update Upstream: field in 0001
 patch
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/efl/0001-ecore_fb-fix-build-with-tslib.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
index 2756e0932d..4b12183de4 100644
--- a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
+++ b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
@@ -12,6 +12,7 @@ ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
 Fixes:
  - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
 
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/f28462ee1082a26e4c394ff5fc6e2994d02bfb0f
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/lib/ecore_fb/meson.build | 2 +-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
