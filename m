Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D040910F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD39540E74;
	Fri, 27 Mar 2026 21:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwl_uIR0j3rF; Fri, 27 Mar 2026 21:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E51E40DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774646903;
	bh=lt5hR5nlR1Ug/2d/ZRKIeNPfU7oDW5lJlIO0S0F/XgA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLMcua6VAal2d163SwY7+tIeze/zGZCK+//UV8I5PFb02gKXb8uWrRiOq9TbnCoz4
	 f6Ev1oFw6t5GkWgTEz0TwXhsw1QFHAOvzxKem4ihkC1O2B/h8u7KEG+LTidb/NVti/
	 1qTPCibpz6ve58oKXInsvcMOeS9vMxTRXViQTsxc64aumf9YVsBCC5Ag2rZjI9gYNi
	 yW37ihxVJhsYdSdcTB53lNanU9B7ZktKFQnSE5fPqyvcyzoH8iPpUQkoMGna3jqUm0
	 Gyagd5azqBabdBekhtHwObzX3R5jroOdrZ75bNSuTfzF/QqNxlQijc6TcVdr/W3HSf
	 Rxk9/O0AxjMAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E51E40DD8;
	Fri, 27 Mar 2026 21:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2D9B2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A909781A1C
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIUETh8ftPoM for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 21:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B07581A16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B07581A16
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B07581A16
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:28:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB97BA4C16F4
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 22:28:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37436)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6Ej2-000000001xn-23zH
 for buildroot@buildroot.org; Fri, 27 Mar 2026 21:28:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 22:28:15 +0100
Message-ID: <20260327212816.1228111-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774646896;
 bh=Wu/BrnCd6lSCeN5RQRE+anBSos1/uKmHt7PqpHQMG6I=;
 h=From:To:Subject:Date:From;
 b=dcvZ8sy+Y4+JrI+gSgNyQTklBy+65sP/UH2L4+yWok6Nnf4Upk+h9GNkkJ8G5n2O3
 awwCyNRUf2lP+v1KF0kiiPcVMLm0YFBZkBxKBlo0t1w5xNDFIXGnKp/Ne8HDwenLRy
 LFxsNzv7xv4KvAYT80g4mzG7wUi+aVlcjHbpBOyrwJPLX0Ni3aqFBK/Ggkc2cE8rZJ
 j7A1BgW5OIkvS/KrcZfk7X2dNh9cBYHo8QOVvJJWJkNBOXQ8K1Y9LORaRWWc0hRIR0
 dcnMJwfH0VVqPplVfjKTobfShjQOiIcHRyL8n81epZLTnywRMnF8GKWg3+mvHw2Lkr
 uM2wySxc/lg6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dcvZ8sy+
Subject: [Buildroot] [PATCH 1/2] package/leafnode2: fix build without pod2man
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

Fixes a build error when pod2man is missing on the host:

  pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
  /bin/sh: line 1: pod2man: command not found

Fixes:
https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/

Although the build error only occurs since 2026-03-05 it should be
backported to LTS branches because the last change to the buildroot
package dates back to 2024.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/leafnode2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 566aaf3d55..8c44071209 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_AUTORECONF = YES
 
+# pod2man doesn't work when cross compiling
+define LEAFNODE2_DISABLE_POD2MAN
+	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
+endef
+LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
+
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
