Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8C2C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 09:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD98817B3;
	Mon,  3 Feb 2025 09:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ2c-JCwtJWC; Mon,  3 Feb 2025 09:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E64D81DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E64D81DE9;
	Mon,  3 Feb 2025 09:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB9512A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA12981DE9
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzU-569jpJNq for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2273817AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2273817AF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2273817AF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283d48so30333375e9.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 01:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738575250; x=1739180050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6OLKoD6boUsdU/p/avU+TG6l0gZkJG0bqUeiSisanIw=;
 b=tIAjbvPyVxgPHPXWBuFbodOs3JZOO6s2TrSIO+q6Appmf90jt7Vd5Gi3jo3bgEAaUO
 8aQtpbLjSrm7wchwiLG7Y+jku/a9trdadkTV1L7NxI1aYgOaTMe+QOkJ3dqOaAmk+7gw
 lEX9n66acL+TIDmnaSrqw7uRSsAZJSPfFMYZqNEK+OHVy8dExLDkvachZCx5xvZgf3fU
 +HtOEkdy+REUT5PHJJ/jHIg6/Woyn+rH9VmRCj5DhP0M8D0DsWwZODvO5YAFsNXeBf0z
 L1pDqnCienmB+w1Motg12PqKbzM33m9CDFY+n44yL6t/z3s75W89gUt8tygzTWPQQAGp
 vQXA==
X-Gm-Message-State: AOJu0Yx8X58U0wfsT2YCFEOjvEhT4tSuO6ZuGJJOSL6jOGq1vzm3IRnN
 hgPHlWx/OCZm16WX7qTa66YkpRY5A4qTUjpWlh+hgJk6pgT0zvunlg2+AwflJiE=
X-Gm-Gg: ASbGncu/6TyMHLxE3WxtZglgaA/1kJBLYwUYudAa3nwgAXw1+R17t3tB1YrZD8UNhT1
 jQsAZxjlgfG3VMgD5b8XXZNEbotNgKAk2tGXIpxpz9IdlmkSJ8eDMS+UjRfuTpyjRo9hcwTjMqb
 BrBtQzSfNk6j+TaX2PCRDvbvCLOq5UtDNpgWgKfpMBIHvsvIvghrfbZ88rziWLeCBoKd9M1gaay
 w/CH6CnDvopQCUPwKyEbwN+hAxsFCVpuI+N4gLlr/EJO2usF/XPbTMw0k6wzA1wNqqgv7NhO+MU
 Qh05KMlDpqzwVq70qxWISvOfFk/7KPv0GBo3TDBY5duiuua2LOYo
X-Google-Smtp-Source: AGHT+IEm4tVDejs3QSdvnUUvUfFWMGcssfNjavORakfuW9/SsKUiHfH9kAihhseHYdRaCqkeseElDQ==
X-Received: by 2002:a05:600c:4f49:b0:438:a5fe:3885 with SMTP id
 5b1f17b1804b1-438dc40bf25mr173651465e9.23.1738575249623; 
 Mon, 03 Feb 2025 01:34:09 -0800 (PST)
Received: from landeda.. (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c12193asm12147327f8f.49.2025.02.03.01.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 01:34:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2025 10:34:06 +0100
Message-ID: <fcd979d6868b3f34a4392bad6e7c3bdb100ce83f.1738575233.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1738575233.git.yann.morin.1998@free.fr>
References: <cover.1738575233.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738575250; x=1739180050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OLKoD6boUsdU/p/avU+TG6l0gZkJG0bqUeiSisanIw=;
 b=Vdk9PYLcfsvXafZ8rBIeyKLCMQ/v+vfWbNVdOB6XcHqhZNL5Q82DFfYusrTVAfCvqQ
 N4UDB70Kn/G2nzJi0Sa8cdPVPxJjPIxX2fU2wQf1He90WEWBUpIT0mVsuCcDj+44DytS
 c32pR4qBdG7fXpEm0LNvFpNH8Lo/Nl3sLPS/OTO/YKfllXCpuS8JgpkaApOoKTrNpmFn
 S/jEXjLWH3qFJcpGAoTBK5fxaN3iRvn2KgYYvby/ZsrRrvP/fGDdQE0OkpLbjdY2lrCm
 FPnUpIr5uYKqiylIATbTzuQULCdOXZ8Q1vGQK7ejTbT6e00KbCO7uyAaNWnPPOUZdVm/
 IYSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vdk9PYLc
Subject: [Buildroot] [PATCH 1/3] Config.in: timeout earlier when connecting
 to download servers
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

Some sites have broken DNS entries where some A or AAAA records point
to a nonexistent machine. This causes a long delay (~135sec here) before
a fallback to another IP is attempted. This is the case for example for
sigrok.org, which IPv6 entry is not reachable (at least from the few
locations I have access to, while other IPv6 servers are reachable).

Add a relatively small timeout on connect for the few download backends
where we can easily drive that setting:

  - for curl and wget, that timeout only applies when establishing the
    TCP connection, i.e. the three-way handshake;
  - for scp and sftp, that timeout also include the ssh handshake;
  - for svn, it is not explicit what the timeout is about, but the
    documentation states "Timeout for HTTP requests in seconds".

In modern times, we expect that we can indeed establish those handshakes
in less than 10s; anything taking longer is in practice an unreachable
site...

For other download mechanism (bzr, cvs, git, hg), as well as
post-processing helpers (cargo, go), it does not seem possible to set
such a timeout.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index c0c1a6079d..a543091d4f 100644
--- a/Config.in
+++ b/Config.in
@@ -114,15 +114,15 @@ menu "Commands"
 
 config BR2_CURL
 	string "Curl command"
-	default "curl -q --ftp-pasv --retry 3"
+	default "curl -q --ftp-pasv --retry 3 --connect-timeout 10"
 
 config BR2_WGET
 	string "Wget command"
-	default "wget -nd -t 3"
+	default "wget -nd -t 3 --connect-timeout=10"
 
 config BR2_SVN
 	string "Subversion (svn) command"
-	default "svn --non-interactive"
+	default "svn --non-interactive --config-option servers:global:http-timeout=10"
 
 config BR2_BZR
 	string "Bazaar (bzr) command"
@@ -142,11 +142,11 @@ config BR2_LOCALFILES
 
 config BR2_SCP
 	string "Secure copy (scp) command"
-	default "scp"
+	default "scp -o ConnectTimeout=10"
 
 config BR2_SFTP
 	string "Secure file transfer (sftp) command"
-	default "sftp"
+	default "sftp -o ConnectTimeout=10"
 
 config BR2_HG
 	string "Mercurial (hg) command"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
