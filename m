Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02EC107BCEB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 06:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6025A40FB3;
	Sat, 14 Mar 2026 06:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dI-JmDcDPR2l; Sat, 14 Mar 2026 06:19:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9BE40FD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773469145;
	bh=gJyPsP2oDzF3dVC/zBKelHtl9Z6jsUq0OaG8KUWPUoY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6eMnxwL3AZCXiqDBeWjGGi0HHCmW6rmB7XT7Ybk1Z5friINkPJqXxWNsvsHwBhC7
	 z3NVE2MC5tr4t2nxTDFauNONTc7sUYBK2tIhXhmeDq2ms6G9YrR8NwSWR5p1Yac0N4
	 GkSazJ02sk8VRSICxQwxZCelgpL/iWM6joEJVhArQ4dhJydz8Hvt6ro+ymNEbjFBmE
	 l0zDLJlpRvoXLHnxyfC8J841VSyh8jfluNXEC1bC+NU2WjCrMqm6b/N6ioQo00j/pH
	 xYXA1Ry0OOjpB3Do4Chx5W2lvAqurAcpuKtgs16uW01dA6iXuhDSdQ4l/EopqRgfzj
	 RXsAnYdlyAbwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9BE40FD2;
	Sat, 14 Mar 2026 06:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70526786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56640406C9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52EMJkQLy8Mi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 06:19:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8106E40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8106E40072
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8106E40072
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:01 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 48E18BDE221F;
 Sat, 14 Mar 2026 07:18:59 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sat, 14 Mar 2026 07:18:34 +0100
Message-ID: <20260314061837.9425-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-1-br025@umbiko.net>
References: <20260314061837.9425-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773469139; bh=wk/LjCoQMHqhjjso2owaeWqnojzFnd6P3uEWnxTJ9BY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QKAD1Ub6KH2KY9ZgmDCNaggjPO8/31mhKpTKDpcofpxM0XOq0dSAYCrLn9eDoJH+y
 AR63cnSFT2zAJEOOGA/g6z3a7Zfv9x4AFOKkpZD4kfaXpAahio6r+eX0kXo2uegd+1
 RVDB42n0x9f+c0sYki98NFgpCLRnNkDeWWv6Gp9M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=QKAD1Ub6
Subject: [Buildroot] [PATCH 2/3] package/mpd: disable build of manuals
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

The documentation feature was introduced with version 0.22, but is not
used. Instead two other options (also introduced with 0.22) control
building HTML manual and man pages. If the tools needed are not found,
the documentation build finishes silently.

Save Meson some effort by setting both options to 'false'.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3df6276a11..c8107be128 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -19,6 +19,8 @@ MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled \
+	-Dhtml_manual=false \
+	-Dmanpages=false \
 	-Dmpcdec=disabled \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
