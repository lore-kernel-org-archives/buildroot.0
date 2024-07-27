Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E282C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 17:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A795240571;
	Sat, 27 Jul 2024 17:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id visUjRWgooBA; Sat, 27 Jul 2024 17:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F9A340625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F9A340625;
	Sat, 27 Jul 2024 17:57:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2F9D1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD26D40625
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6LZND59WLs9 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 17:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B145F40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B145F40571
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B145F40571
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 17:57:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7AB1A4C30D9
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 19:57:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42020)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlfm-0000000069P-2m1O
 for buildroot@buildroot.org; Sat, 27 Jul 2024 17:57:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 19:57:38 +0200
Message-Id: <20240727175738.1739958-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722103058;
 bh=ga0RXUXVJMjMlrLmVdbobOQjYI8riKQYoXO5a/hvz+Q=;
 h=From:To:Subject:Date:From;
 b=HiC+b4DKfGNLXKHV/hkelzOvESskQ9ZMv8dhXZww1TweXfAPkLDpayh0XNN86ZuSN
 PjulSQTm8UEn1q54vhZH5U+TFPS3464JFgxjT1HJB3zetdHKqYNlaC5FlwPXM/qwrY
 uG8cLHcEiHjjsoWS9h3/5K0vg1LptwdDf6q0rAdSFdQEhddqS+gst8BrRgjiT8gwYt
 QH/GaO9tRv9taLw8FUdzKFW8CrvxGkQZdNRnY0HELNRrqb4c81dEazoq/oI1DJIBpt
 rJ/vNKkXoLtxR2oyRsRmm7jQMgnEofxbQY5hKzo52tT2NxrcHQngz0qXW+AwOq3ypY
 cbf+uUsZqzR0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=HiC+b4DK
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add Bernd Kuhls for openvpn
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bf44035a59..92a34b0136 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -466,6 +466,7 @@ F:	package/monero/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
+F:	package/openvpn/
 F:	package/opus/
 F:	package/p2pool/
 F:	package/pciutils/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
