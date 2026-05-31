Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526BCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955F984EC1;
	Sun, 31 May 2026 17:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWLs7yjOhzoL; Sun, 31 May 2026 17:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BD484E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249519;
	bh=xjJLxMbDcVcNwuSw4fPYgIsuXRH/JkyEn8lFI8OnumA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kAyCyK3EQFjUiV0r5U1aFpZFMpGUSQW4VAHcJ7Ki9foFKHF3xaQj3Dn+20KDdAn5J
	 oWfoPWESVccQ/Ct1mWTj1UsPCG4TWCfVqNmVOcyOIsv+vqE39gPQDaJgN9EDto6Vm6
	 iFbLTvnOZFqwkDPlHrrMhqIux4ZVQf8IuIPhE0Ch4Y1f0h4eLs176U6on7u7KvXHxn
	 5OpXYDA2TNUgT1bKUkJQjRFO07kscMEOjsTfmG6q5Ky5FfGHz7ijubx3X1TEmdGiWL
	 7OrqKtdc3weiQ3d7+LCEWVJOdzgU10KaboKAVN6ujeHCVyhaL3ux0a1U2arPT8BgIq
	 lWgKaVM2MEVvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BD484E92;
	Sun, 31 May 2026 17:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4ABF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D8E84E92
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRQP-pV6j3SL for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F81384E8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F81384E8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F81384E8D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:45:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00045A4C2C3F;
 Sun, 31 May 2026 19:45:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43134)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTkDr-000000008Ah-0Fpb;
 Sun, 31 May 2026 17:45:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 May 2026 19:45:14 +0200
Message-ID: <20260531174514.1681226-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780249515;
 bh=mPxLOMxUocYJQmmTVjVR8ibeTuWsrapWasPNdptGQrk=;
 h=From:To:Cc:Subject:Date:From;
 b=oHc1hDioWU3nI9EE5PCr18NlWUgtdUZFPjZRZl6WVHFWg/8Z3Jp8VVOXj8pkzPBdr
 0C15z0NRlnvisiT01USzklDepOdS/RoKQ0VdNnLdwG4EAVXAlL5yooJwPpeTkb8oNC
 XuoYTiSXSbrEUIcnJns4ySRJGwroxOYYNs+bG00VgJBiTN81jNxbFa9sZKYzEqo0KZ
 V0RxiU/Xisc2ty8sx6iLXaleAkqhIOaO1/AHbIuDjTmS/lhSId1tmN9QXAEC0o37JM
 +H+QQb5yVTeAO30dVKXNXMYLopcKN7db5teZw2yFuvucrWg8oAzCR0175/wzZI/pCX
 Tfnq4XLKGLyBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oHc1hDio
Subject: [Buildroot] [PATCH 1/1] package/glibc: update upstream URL of patch
 0001
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

Buildroot commit 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d added a patch
from the master branch which was now cherry-picked to the 2.43 branch.
Update the upstream URL accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
index 5b7172df44..ae832a6035 100644
--- a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
+++ b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
@@ -12,7 +12,7 @@ years ago, the rest last November).
 
 Reviewed-by: Florian Weimer <fweimer@redhat.com>
 
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa
+Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=18b97b03b7442d8ba0860e43145f8724c9e77b17
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
