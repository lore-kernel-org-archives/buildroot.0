Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D6C27C55
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33FC42397;
	Wed,  5 Jun 2024 17:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYdhB3FODN73; Wed,  5 Jun 2024 17:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CBEC42398
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBEC42398;
	Wed,  5 Jun 2024 17:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D781BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB6C81F56
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULFr-fNZo5Qy for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74C2981EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C2981EAF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74C2981EAF
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-35a264cb831so31132f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610005; x=1718214805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OIoktNVsMZgfcGdwdgXzE1r+gnrRJ43JujFCTZw2e04=;
 b=gR90MwMLqWfBIw8ynWlqhlWyE25GVcqEYktSY4UKfgNOdTQdqA87/Btdo3GGQR7vvK
 fxiyBqAojY5HJ7ZaQXXkxUyLeaqRQWv4kIp3NPNrTKSDX6ITsnx89diBo13jz/RUhUEi
 GiuK6DBz9EkUWCc9poMTGI4oiqWjW0Mzazcyb1wBAA0Nbzvb4Q/Y9CP6mntQftzSxgIM
 SBEUFqn1RSM9oi6DEEuJd2aGrg2UbFT4H+w6rmfIRgIQ1dsHwvMnxhQV6cshsTtJbKDs
 X8YX1mS4jNwbocPSvgKpVBZrLDzrfm+QhRT9PTQz/z2t7S672/uO5Hc4M6TMFFM1MzrU
 R5ww==
X-Gm-Message-State: AOJu0Yxq8vBQWMqThtAbeMaisf++Wnd87cqOgsz42odxBbNG0RmcJHYX
 NXIESZg/QH4L/nCO3cg8AUlLYgrwuRvCiXmS0mxCF7ZC0arGboSu8UP4Bw==
X-Google-Smtp-Source: AGHT+IG5ulh5bOm/p2e5MuxYDnWHSHNOjpVWyeT4jNODD0HGl7+C4fuQDHMYsnVpj/KBurq2RGZU3w==
X-Received: by 2002:a5d:4689:0:b0:357:bedc:b53a with SMTP id
 ffacd0b85a97d-35e840688bamr2627473f8f.23.1717610005432; 
 Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:20 +0200
Message-ID: <9f305da28a68ac346fc805d62843db711a0bc9fc.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610005; x=1718214805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIoktNVsMZgfcGdwdgXzE1r+gnrRJ43JujFCTZw2e04=;
 b=f3S+9vNL7/4mf2zUQ8mFe8vNieGEM1Z6YFGr6dD/O4MNcQu+YLfPxNslliJkuHUR0q
 oF11kSKCllOp8qiHaQxYY7w9kZiIW5ZUyvs1khPYyZ2jPUDmP8fr16x2ZUih4Nv+2rG3
 IxUkRXGfPs3A/s1lEFdMQyCEzBnR/Jqo7EfCUxvspwIjckB2BHdSo4frBw6VAA8v1pHt
 c9oO8SDT3mTl2P+3IHkf4i31P+DdCxCQCH1cNUCb05DRpPlknVGFSvX4AYBoVmHhFYcs
 hrgJThBLQS61SpRmmSArPzCsciUkYZELcc/D54psD5fABVy+WiM7+k6CVDZEbPX6tm7e
 rC6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f3S+9vNL
Subject: [Buildroot] [PATCH 08/10 v2] support/download/cvs: use appropriate
 TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/cvs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/cvs b/support/download/cvs
index b771caf280..a6840fea7b 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -68,4 +68,4 @@ export TZ=UTC
 _cvs ${quiet} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
-tar czf "${output}" "${basename}"
+${TAR} czf "${output}" "${basename}"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
