Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1674CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 05:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C72242D41;
	Thu,  4 Jun 2026 05:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iVWIFI3QlAj; Thu,  4 Jun 2026 05:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3C242CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780552142;
	bh=0kl9/UT1BNOZyukT7nG94nei4Sl0WRNU84JnaCusY+o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T/KXG1PXugI4pV8oqsOuoS3cjRFKRVe8uAQDTUPlfK2vTBl2HFF/ftVcPqOElSJ0z
	 r0IhgqeoGRCS/ZD8BzfT7qFVNjiW/ldBkxzmGJ32CaC8jtwa7de2UzA/6ItB9hL0Sv
	 crbAvchgCxtfrwXDKhiXkBqHEIFdXtV6DRz6cZpplKz89SV2I5qnpWC6zLyggS+l+o
	 kjXyjtzEIdXc1bk6yRSvKtvwVAijkKaL8X5r+ozeCbLqCH9zCx70BaCMwHPmeXFMGV
	 dgLc3mGnZClPu8FVQ3a/DXKy0HNm8IzNs2BqNPMZbxptfFDOR4mmCo6Bgk3MDHgURX
	 5n224epkY6LWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3C242CA0;
	Thu,  4 Jun 2026 05:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D728DDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCA16423DA
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL9svnPsvMnd for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 05:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9908C40730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9908C40730
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9908C40730
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:48:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id CE612580D33
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:12:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788CD20658;
 Thu,  4 Jun 2026 05:12:21 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Thu,  4 Jun 2026 07:12:21 +0200
Message-Id: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFSZb+dBpplMf76QT8bZhCJirZlPVMCSG2QYjRVGZztRRT+9y6qHUJWN7Z5ReyTGC15jd3d2DyOgs9mkRkVa31rG23RVf8ppJ6DsT/mXIWwfjH4bXZ3KT360Zsl+BbJi0sqndAa1sh+7ulj0Z2Kidls3mmSL4IO3u4qrsmxqopfKcHuSID43wPqcb1DAarQT0kM/wu0iFoCBIR1yCxi4lPwKea0AWS2eixY7jaKBZvAOmDERpcADXyevNRTV2mYVm+dRYJSmJV/iG081E8EwmWT3v6Jh5ckdMPSTQow/weTkbtegsqLI+8BxZQ7Txn3vCN/xgC1VNm1KyWKdK80wloKCmDu8vKfGN1pwyBxEh6nF11RLrh2B2jSv4kYTCxKMjxmNiqPwumbpfGovhS2iLltvxopvLRWMYBtpmP040EL083uGyOQ23bzJrlhXaeqxcfq//spEAPOaW+wVQZpS83/LlY1mn0j4mpxfHTYnRiQqup5SHgzjSNh8C8jU8SqrWAF2gHppBGxjlbhNBu8oa+OhkCgYhG2iUoELuonPmoSCTVGEEbVTmIVEwipyyQxjbaLfk8Rx5Z7t3x9A3OAozmN6J4+vJGF4Kq65Ug6UlRmsIprDcR4mnFEaw0y+aETXUfmY51WW9D49K3Ed0vbQGarenw75l4GlNObt9d3lXTT7Q
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780549941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fxnRuEc6GwRZ9ZYO2TW5YAxSo1ZcChQVFjtMMIH8s10=;
 b=kqOlnDD/Yq2JYP1jwoa4aKiRxKsCqecojxbPpwKUt9CIsPUJuVjU+h3px6Ehu3Tyq6rYXp
 h/Z3MpkxeXorJbMsPBzErNEQkU3cYwhtJ57HA3hK3ip/zBuMTeTy2OCvwDLaOCUoSdV4T5
 pSUz5jJFNv7LNGtjHsJpHjDv8n0RLggLT/GTVoe5h52h/3RT/I5R1WIde5+kKIZtDlcpMo
 K+Z9nUmhk7MW63kp2zsH6I7IwNCN6T9qNN+1t0m3wUWU1WIlEfv+iTB0/zE4V+h5VXafik
 LPDMKg5SoDpPg8GjFx5qbWIRTxSnzdG0sQvTD8jjazF+YSgE9IymiF6QdueYog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=kqOlnDD/
Subject: [Buildroot] [PATCH] package/libglib2: disable sysprof profiling
 support
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

The sysprof profiling support is not useful on embedded targets and
only adds build complexity. Disable it explicitly so that the build
does not depend on whether libsysprof-capture happens to be detected
on the host.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/libglib2/libglib2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cae8a85a28..deea6c146d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -60,7 +60,8 @@ LIBGLIB2_CONF_OPTS = \
 	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 LIBGLIB2_MESON_EXTRA_PROPERTIES = \
 	have_c99_vsnprintf=true \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
