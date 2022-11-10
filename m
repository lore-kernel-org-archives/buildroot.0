Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E5C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 06:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B3360ABB;
	Thu, 10 Nov 2022 06:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B3360ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uo-bKh8nyW51; Thu, 10 Nov 2022 06:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A765605EE;
	Thu, 10 Nov 2022 06:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A765605EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD5BC1BF31B
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 06:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B85668146D
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 06:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85668146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0aTsCad6gELA for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 06:16:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D6E81461
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D6E81461
 for <buildroot@busybox.net>; Thu, 10 Nov 2022 06:16:44 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id AA872440EA2;
 Thu, 10 Nov 2022 08:14:11 +0200 (IST)
To: buildroot@busybox.net
Date: Thu, 10 Nov 2022 08:16:30 +0200
Message-Id: <3e8e93e9eed117bc7e49580fd77e254eee237a99.1668060990.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668060851;
 bh=kw9F5tImi6SYVE698SKrgamb2dAFcaJrlttyNqrP71w=;
 h=From:To:Cc:Subject:Date:From;
 b=qw/isPagPlY7G56viBCVOMsykwOph3GiO0379KvCO0STaWK5U4XrhZvM+bUQDJXjT
 CCaV0G6TQw89EgxgXPu4H2F9vc4AuC5c5p/k2parQeUioWQjFZxAQuMs4j2/8oV2qj
 zdEBsN1GYoPLx9Omz4sPWb6j6seV2MPl6K+H6t3ynp5wPQ8J4VCrnzrIEqmxSegluD
 QwC4gTY9/LdvJlcyWjiQUJ/Id5f6UNImIMB/r+P/zB2z1w4iaIAmvhBYnC3sfrPVHi
 vcfjY8vz9JSo2NaguvruZqyT1iIPuPIdNkenGZxbC6LA/M8Ks7krlDkgyNxcFZf7bL
 onL/VhJL/0Qbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=qw/isPag
Subject: [Buildroot] [PATCH] package/socat: support OpenSSL only
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

socat is not compatible with libressl.

Fixes:
http://autobuild.buildroot.net/results/6f0204004c52f762d6e3cb3064238d7eb3646038/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 0414c8adc855..639b3d302847 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -31,7 +31,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
