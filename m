Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8BEE9DE62
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0018E40FB2;
	Thu,  9 Apr 2026 08:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgmxbL1E4ydk; Thu,  9 Apr 2026 08:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A44C40D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722467;
	bh=lrLNVjwW4zLhm2xaDreZ428jtbm9X0N/flOnAQoFcEs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvAqfuEBPPfNE41mbTzFBnWhht2y2wPQmbbEb4VQJ6UVyZhmuEwGY+oXpCEwmoIlo
	 q3rpQET45vZggfc47SePCsbY4lgfwXnuYDTq0F/en0nM9nmRgsejKVqstsBFHt4v9c
	 HOhoja3aSJl5LzVmLy2OOJ+NQlUgWkw69L7ePqaA0ABYJIWqE+R7vhJoGmaB6cy+IK
	 3LwKxi/n9aet3iXXofpr7LutF70JKxBbus/oQJuKuVelX0fgHn1F6JzJtWniBNLrxN
	 eybhjgGgbZXbMn8LcGcIqFyRPbCmSu5j7NxnmU0taQNWxwZ2oD5UqJwxNEgNUiA3TH
	 8BU/5cUKjwt6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A44C40D59;
	Thu,  9 Apr 2026 08:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 886151D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E7B582726
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTpA_LlmDj5i for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54DC58254A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DC58254A
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54DC58254A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5F5FF5A0007;
 Thu, 09 Apr 2026 10:14:21 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef3ijtExo-XM; Thu,  9 Apr 2026 10:14:20 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 0F7F35A0008;
 Thu, 09 Apr 2026 10:14:18 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:13:59 +0200
Message-ID: <20260409081401.2060709-5-martin@strongswan.org>
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722458;
 bh=ixONAypPBzyyZRjrUCWtj4/qkow6sKn6rP9vuiQhnrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ydnn16VUIFCZ/aXBgV85CvazqDpuZs3JUDSQ9gSWxRmkt/xPDJLm54pHH48XnoVxV
 Sc2YvhvRLilV+3eC1/eET7b9/3Mx/UWgMjwYv2OrTXEwiUXvCChSH/2Vfv2RVV5zVC
 caXHqyvfx+qhtJby7OM4vWd0sm2aW2FkhCI++JF9x5Y4DMMpjwHqMmP9LPysQfhV2s
 Ty4GL0CuvpQqtcblF1fmuP0FBpeQHvD28y0SGSWCKSul079Scjo8nOyoSZfA29z0z2
 lwAou7Eq2e5gEpx2lffyx9FiF4wpAQ+6qmZXQoJ6GA1jHTU7ZbhlsMPMhlSHKN6dq1
 27nSD9PcV+N6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=Ydnn16VU
Subject: [Buildroot] [PATCH v4 4/6] package/pkg-utils: add 'hashes' to
 show-info
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

Finding the hash file for a package is non-trivial, as they can be in a
<version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
such as utils/generate-cyclonedx to find hash files, expose this information
from show-info. If a package does not provide a hash file, create an
empty hashes array.

Suggested-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Martin Willi <martin@strongswan.org>
---
 package/pkg-utils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 211e681e8f5c..17b0aa176045 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -197,6 +197,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"hashes": [
+		$(call make-comma-list, \
+			$(foreach hash,$(wildcard $($(1)_HASH_FILES)),
+				$(call mk-json-str,$(hash)) \
+			) \
+		)
+	],
 	"patches": [
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
