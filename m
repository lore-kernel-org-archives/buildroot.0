Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FA0106F2F3
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 08:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B929540969;
	Thu, 26 Mar 2026 08:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iupDei7O9VIO; Thu, 26 Mar 2026 08:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E2D40990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774512889;
	bh=B3UU47vWT6Nw0ke7xTKos/tWSdxljUKGUF8rIXjrUE8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=iv+pa00KhwpR9S5F0Y7guRlX+zV6aEySqRmUqFzysFCmMpRppo6Yk1z/Niy5lFzcA
	 XJwvq+SHgsKr0n/qnEhRLWUKajAszAOsZJAf/TiwVPUdtlgAVvuKFwxCD3kk7FzpO7
	 tsqrHS8i2q9YlYHSdtO2Xgc9jNtuiXdfw/gmZV24AN2ZefbL2Pn2J9qSUJLtzUzx9W
	 59fM/g6yoo6a+ArwoJ/19xE6W4PrjfGLVYs4TjteydnIxEgipPbKhx467ghthqt0FW
	 oPGKSkusZ6S2cZDTZ+y8NLSiIc+cfbWufKc2Ajy+OcuTugD5NjtuxEUR3CjTzzNIoc
	 xuuPgrGrLT5sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E2D40990;
	Thu, 26 Mar 2026 08:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 705D51D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56402813A6
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIsvvJ2DF0Ov for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 08:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7210F813A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7210F813A3
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7210F813A3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-66a5d76d9e2so1035822a12.1
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 01:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774512884; x=1775117684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d4un7FCVVHB6rmNvoZsjHluJGqU2KzhgPlqfbtzvWuw=;
 b=IaW8jxV3voB2dKGUBvZDstBOPe0nJNZEphDXT5adjF/htAr3Ll5K5lNevhKL7o496T
 PtfsPeMg0oSTuv+1g8HJAcYb42SM4cD4livZyOo2y2hDxMPke/wi0scQ2BTHqWsCgQCc
 syf8agkD2cKB0J3hp3AZmjhlQn49lakaAH1+Te6NrLzQFij3dyfkxNmQeUeZYv+DEHOd
 7FtZAO/+g6mbhFGqp1qGMJsXlRxVVqqbrq/VjEX5Z47VZjYRu6fe1qODOFmkpafVI7K0
 hV04C4kCFjO4UzkKfYUQtvVvXqqEESiAFQDGGfyLTlDECjuYZeAFcrrcyJOTh+NPDdBm
 0sYw==
X-Gm-Message-State: AOJu0YzeETtDtSbyq+c6oBPniD67nQqRdmwIqYQcUMN+GSeOWwTNp0u/
 Po4ZIUGbXhqZYp5VfZ15znyChhijkyLj+20f1Yf04PMp+3Wi1W8NjtFf70AlGHmEBnnxkjPyfgr
 TlcpqkEI=
X-Gm-Gg: ATEYQzy6+/YIDyVrw3T8lwSqona7ONtzZGH1BcHK5tg6skPVssGMckJCKrtTTfbn1KA
 U6osFBCl1GfHKMG/SCLZufS9YKJmdSx79SORV9ab1OQbfBqpXkzAh+WCuyoPbikkN1+g0lGj2CB
 YZklmKDVtfrPQWvn0SrvNZxAgQ2crT0GkMcP38ntSPtaRxegJtlnJ9SWatwS9X05QRLXkE+1H/i
 Y8Iu92XBeGdkeL/A4/D+uLSpL1WbmDoHBVZaWnqy9tgx/5skHpjI0rWs3SnpfqfXysUb+5Bm29+
 S5bnT/Zd/JPaGf8LNp7mMgX0dUV0Ezk9F2C3r+4U7plr4Vbgf3SonDEaeyphsHUTfdGurmJCX/X
 Ivj3YYLoKUg1yeOStgsWp517xN70Btpw/92cMWru0BW+k2GQsiMYpllm8eKY6k6hwht+02f5vAb
 KkZvi8fenesYGhg1VlLo376d8Gy0HcDFos
X-Received: by 2002:a17:907:1b05:b0:b98:286a:e2b8 with SMTP id
 a640c23a62f3a-b9a54271919mr467780866b.42.1774512884071; 
 Thu, 26 Mar 2026 01:14:44 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b2043e7cesm83315866b.57.2026.03.26.01.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 01:14:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 09:14:21 +0100
Message-ID: <20260326081422.945900-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326081422.945900-1-titouan.christophe@mind.be>
References: <20260326081422.945900-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774512884; x=1775117684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4un7FCVVHB6rmNvoZsjHluJGqU2KzhgPlqfbtzvWuw=;
 b=ZnltMupZa58HsX7CHDfnb0TQjAK+FMy25A1j5UAJMOvG6cfr81x7PJtKbydn+doci+
 tlWxINROJEpjiyID1OW0hFsiboA968tL6Lf0+GC2dUNXTqjJAMkL2RKC/ESMWIQo03wP
 ueYUVzqazChe41RsvH8wG9U2ZOg1oYWVW8hxrxUkgTXaw9w4C/SvIHe6tX+oMZgrgLcP
 eAafL96Y1wLV6m6MY3SJpV8YM289zBr274hYjnJu48wEk31kvxX6SCMs6uzQE/F9xCci
 P3iXARP2gWCBBz8YEdR1oMUNYp98Bmizg1aCdV5kzwQFMZjq6iNDTnHe/D0/73DrYTqX
 5VOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZnltMupZ
Subject: [Buildroot] [PATCH v2 1/2] docs/website: add security contact
 information on the homepage
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
(no changes since v1 in this patch)
---
 docs/website/index.html | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/website/index.html b/docs/website/index.html
index d68436c721..027fd485e0 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -148,4 +148,15 @@
   </div>
 </div><!-- /container -->
 
+<div class="container">
+  <div class="row mt centered">
+    <div class="col-lg-6 col-lg-offset-3">
+      <h1>Security</h1>
+      <h3>To report a security vulnerability, please send an email to
+	<a href="mailto:security@buildroot.org">security@buildroot.org</a>.</h3>
+    </div>
+  </div><!-- /row -->
+  <hr>
+</div><!-- /container -->
+
 <!--#include file="footer.html" -->
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
