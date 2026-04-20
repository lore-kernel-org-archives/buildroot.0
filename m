Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12BEF5A8A9
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E2F80D44;
	Mon, 20 Apr 2026 17:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cywG6CUIgRj9; Mon, 20 Apr 2026 17:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4977180D32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776707112;
	bh=JPafxq+Crq1p089v3tq2DC3U7tG8SUGAyJ01jvxMpXg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lgry86jBdehyOpnKBQV4W0ahSmtHBsfpzVc7s+AzpWwj0ohMUNrZnkYTyMtatdS1E
	 pP0sixeiYZvpOYYcbYEvpjD1XMMcMhFv2QDNhrOJAfRlxRdwHzhGW40TvA6C3i1Js3
	 mDlt7gyzEcHPHcOuPK37fw6dkVQC4oEfrlR7LLjoXfK0pQfDPWPnFuXSy8Mz1ZlsmI
	 ohgyDEr7kqX2xhPwlGtQPtntr2HqWyrFGs7jqyZQesInsEu8qoMX1Ql0zmLC2pcXpD
	 Sd+loSf7kZMEJkdL9QfLgLlOHOjgz/NDd2o3GSZ8A35ZHbhPtyejyWdkXiYZulAdY2
	 Qf17xD5/aXW9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4977180D32;
	Mon, 20 Apr 2026 17:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1849257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93FA6405BA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBuZ3-v5cfkd for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A3C640565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3C640565
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A3C640565
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:45:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA878A4C0D6A
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:45:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57594)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEsgF-000000006Di-1SmH
 for buildroot@buildroot.org; Mon, 20 Apr 2026 17:45:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:45:07 +0200
Message-ID: <20260420174507.3612219-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776707107;
 bh=57IrevMBsSoazanL7txjsMSkbC9HQKayJ3c/V+aYt/g=;
 h=From:To:Subject:Date:From;
 b=n5rimq0Aw2yCMqJpXMDdlIp06QcgTmjMLdJ4Jm+/CLvlTpgRaVOUzMd1QVOjAiaxS
 asj37PKHOfvrO3p3zkMfdlByvXYkWP5HHf6FpLWzeexD6DOMQHdPvkTgw0YZGtj0ck
 oe0n4h//uKLB7+DAy5Fvvbu2xm/puGRJjaOqp0tjHytyrT1YGdbpcc+JsPKjbOnvpx
 q2dcG0+BmWJIYw9fmObbHelrmd4RwvJ3G5VUyP9GskC7d/wmo7WNxvQZuh0E/y/mq8
 xhxJE8EcK+5UKSI6wMRb/RPUh1xYjMrZ2ZMRk2iJ2DC0lHToQcO+PNQ1Gxmrmf9OGH
 9oiLEe2a9OzLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=n5rimq0A
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Clayton Shotwell,
 e-mail bounces
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

<clayton.shotwell@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.155.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8be446a66..f97fffbcba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -704,19 +704,6 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
-N:	Clayton Shotwell <clayton.shotwell@collins.com>
-F:	package/audit/
-F:	package/checkpolicy/
-F:	package/cpio/
-F:	package/libcgroup/
-F:	package/libee/
-F:	package/libestr/
-F:	package/liblogging/
-F:	package/libselinux/
-F:	package/libsemanage/
-F:	package/libsepol/
-F:	package/policycoreutils/
-
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
