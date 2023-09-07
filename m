Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A406EE14A9
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 00:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E1A6821F5;
	Thu,  7 Sep 2023 00:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1A6821F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWq8-1W_oQPh; Thu,  7 Sep 2023 00:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0578B821EB;
	Thu,  7 Sep 2023 00:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0578B821EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD7991BF425
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 00:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB66A40422
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 00:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB66A40422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkUjVElzkgrF for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 00:12:25 +0000 (UTC)
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A6BC40400
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 00:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A6BC40400
Date: Thu, 07 Sep 2023 00:12:00 +0000
To: buildroot@buildroot.org
Message-ID: <20230907001121.3620891-1-fhunleth@troodon-software.com>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail; t=1694045530; x=1694304730;
 bh=ZtOQG1A85qQaBwSjbMWxTLREEqNqgnbDRi7h8Iub4uo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=p4E8QvihJ3aUcOMt17KwptcJnJK5BANro1xUDDVf/iRURucTtLsFAukowfK+lYIkE
 +xSMqTmass0CwrJK1VA520VTLnWK4ydYHHxiB53TyRO9IK+FmlLqDgwkiFPwj24Q8U
 YSGG/cbEzdDqQFbI9NkwJIg7R3Ejyr2k7MNi1BYFE7IeLPSGSp1K1X93K07/zrWBs6
 wJY7p/AHW8klporlh0eG+HSy7EAwUWjQsz9OibqI3wqI1McCvlTB6kCZ3gz+4ZxYmQ
 ZW1cdxu/I+XnI43XXn3Uh9BvJHAYDI6+cDHd040GX0LrHpy+K2EBLIUC91ercQ8yKj
 uqnMcPrj47oKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail header.b=p4E8Qvih
X-Mailman-Original-Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="p4E8Qvih"
Subject: [Buildroot] [PATCH] package/erlang: support building on aarch64
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Erlang has good support for aarch64 hosts, and this allows it to be
built without a warning.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 8f9700bf5c..d3fe0dbec1 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
+	default y if BR2_HOSTARCH = "aarch64"
 	default y if BR2_HOSTARCH = "x86_64"
 	default y if BR2_HOSTARCH = "x86"
 
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
