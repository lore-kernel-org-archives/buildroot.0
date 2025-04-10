Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE31C369A2
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 01:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EED0605A8;
	Thu, 10 Apr 2025 01:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Akpxah--A7Y; Thu, 10 Apr 2025 01:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE1560652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE1560652;
	Thu, 10 Apr 2025 01:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B2D138
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 01:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2485281248
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 01:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u40nofMTbkOW for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 01:45:41 +0000 (UTC)
X-Greylist: delayed 906 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 10 Apr 2025 01:45:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3105F8125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3105F8125F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3105F8125F
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 01:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744248632; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W/23q1xBvrCjw5MAF8UgYT3reU7X4bG5xQ1djklIovGntWFzs0DQXJDDXypBzeY41bOUFfmqSFVKcNWr2HPp4dXLdPYw6gVSb8jd9VBJdtqi1KI+yDEuXmpfW9XReZkLJiywkPtg82jt60LacWcHxmeYhDIAWr0PUPsb2Qx3Cm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744248632;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XaeNejiJgGgqOlKYcQSF7816HcT1WgaYi92ivkDKGD0=; 
 b=GCRtGMQ6EtmoCmKhvcc7IKQFo3B6fPXR7Dj5MUWwfObPDqeWjIxsgxdwU2sVMGnopzi/wnI9bd/WQ8FvPmX7BB6v+QwA7bxzrXLLkT+5053lS9XqpjmluhnzljkDhRdJ7EVuXSXy+7mQ9X8fKW5PoghxJJatkNwBmBbz5xcqgDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1744248629369446.30575836269554;
 Wed, 9 Apr 2025 18:30:29 -0700 (PDT)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Cc: Matt Silva <dev@matt-silva.com>
Date: Wed,  9 Apr 2025 21:29:23 -0400
Message-ID: <20250410012923.37614-1-dev@matt-silva.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1744248632; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XaeNejiJgGgqOlKYcQSF7816HcT1WgaYi92ivkDKGD0=;
 b=QYTYYuSlCHEmAXuN4aDNfaD3qIapJP3MrMrCT+9PKGEzBjCLdOTFJx6vQ+ccLJAr
 ZbTDMyJx4GkrqkL4dF+cYG+UFMmOvgvN6LX3JoJaFEDHgkAyP3lLgsecO8AgDFm+q5k
 5gzvXdjk7pit2Xz9pCkmB4soseBNUTmB6bp3tTmY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=QYTYYuSl
Subject: [Buildroot] [PATCH 1/1] package/rlwrap: use the github helper
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

Currently, rlwrap just downloads directly from the hardcoded URL to its
Github releases. However, we have a github helper function to streamline
this and handle if Github changes its download mechanisms in the future.

Signed-off-by: Matt Silva <dev@matt-silva.com>
---
 package/rlwrap/rlwrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rlwrap/rlwrap.mk b/package/rlwrap/rlwrap.mk
index e3973e841b..3d3d4fab92 100644
--- a/package/rlwrap/rlwrap.mk
+++ b/package/rlwrap/rlwrap.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RLWRAP_VERSION = 0.46.1
-RLWRAP_SITE = https://github.com/hanslub42/rlwrap/releases/download/$(RLWRAP_VERSION)
+RLWRAP_SITE = $(call github,hanslub42,rlwrap,v$(RLWRAP_VERSION))
 RLWRAP_LICENSE = GPL-2.0+
 RLWRAP_LICENSE_FILES = AUTHORS COPYING
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
