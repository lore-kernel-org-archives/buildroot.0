Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044CACD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 18:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BDB84D1F;
	Mon,  8 Jun 2026 18:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKSr4aqHGYPC; Mon,  8 Jun 2026 18:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA30884D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780943228;
	bh=ersbuZYwO15bJoZMfP+PDIVyrIsKVk1W8pEi/m++nB4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tfi3LbpFTdOLtlgAMVQXISer/ms0+yyesubii6VjdZhMGSJX458MRO/4sezyrA2kG
	 hQg24ymgOuXX1g0DlD5pd0YeAFBUEng1jSu8dj+5XSuI6/3foc4QsdSjNNLMTEzR1G
	 eHRmRaai4+bmBKkC/p4ajgpdwSnjtz7R+03jPYuKMwtjQeU6UT7ZKgUN27XW1720zw
	 qj5xjrrgqYehqtCnYCfQgEjtoDo8pImRKToIM8oYjLleoZo4RyOWqGa0bS4ZnBufed
	 R6AnH0i1wow9eJUDJ/ylgAODTB7FoEnHcKHFvDxvLn1BCdlQPbh6g9IhaXroJ0yaYF
	 5kpuaJmcfNzww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA30884D1C;
	Mon,  8 Jun 2026 18:27:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4995FEC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF66284CEA
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIj0g3LB1B_B for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 18:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9F5084D19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9F5084D19
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9F5084D19
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:27:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bec4639953dso838068666b.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 11:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780943224; x=1781548024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GrdrBRBHg64yJ79gqSGgd6k990Xw1mEx1q6rDH0tO4=;
 b=hKxFlBXvZG+vyp71Zg9H2eGKHLEFT290Mz4OavBrNGCbZOfimINPd+9MaLdg3g+djk
 k3tw+MnzIf09jMeSr+zduqU4twb6jiPEnnMh4Xg+HakH0LCpZdDFuhmZ8KY8r+VkZLrX
 5pmViocGyEsWnUQhEEfdzzaRkbFu2OSb79zqc/MW6GhSUUuMbT/dFXP+9s4UROf/rawX
 TmeZP/tfxJLeOjmM9nGa2avoYtUveHpQvVq+ekgYjezWStsopcuLLmWVUGoUp7IleDG+
 VAMkiQyW956usQslVgLBBYvzUXlM8zQnJhbaxY7whU8Vjhr0ZB+k3pMIJ1hYYULVDk/O
 5z/Q==
X-Gm-Message-State: AOJu0YzkirXksdM+YybsK45Cjt0Vl6asgnGla3xNzAERB/eiNoCIdNur
 SUrpi9Lpt5S3BbPE893WSMs1SMuUo1vcBp7UxqS/siniBlRi1zKUikLx7fBsMaKUA+iJ4UgtMGc
 Rs5s0
X-Gm-Gg: Acq92OGq5FM+6IGMPepXPp8h9nIB8fdkb/dNxiqjCy1pX53OXhlksfSTOhjXrFEOM/G
 ywwB2hWMqeLmle17ylk2n9oDbvhoaLbflYiNL78PAkLsCFuRX8SkacsoEi+2Nm8sLotDdDyTpWS
 FefJrpTY8Rsbzj5yj/WBRCcQ4WkrUb2Mt7YcCHgN8DfacLdBNo9x81uVV6mnBgLWH41PeQA7wSU
 GRbEQAY9rDYGmd07j4/PLlZjKyZSXFU/YFgu9MrhfxYfkhE9h1uWJ1o5lnMgdZmG3JXJH5g/5Cf
 9Fs9NbjlTCmbcNSOoUSkh8/GEewLM0+qjNzZoBAgls3uhu5ACyfbuDHo/0ZmgT4oT29JVFmnOmK
 If5IZTA0Jc/W4x5LXShjK9vbpDMIp0ekS4Jhe928O8LZQFS8WmcKRVjVoNP0dGvV7upGz5Y4MyD
 981bQcMDayslmVLcmDm9r5Tqsg9xg96APGltSxsWB2mbwLH8CeCA9cjM1V5e3fvroSR+2qyoeBS
 2o1WFrbPYkhT+8bVm4dMOYSciGFkxmja2wiihAsX8oQCm5oJueHbpHA8S4=
X-Received: by 2002:a17:906:d552:b0:bd7:f75a:817c with SMTP id
 a640c23a62f3a-bf370477fcdmr845774666b.17.1780943223551; 
 Mon, 08 Jun 2026 11:27:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051c83c93sm934943766b.16.2026.06.08.11.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 11:27:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  8 Jun 2026 20:26:56 +0200
Message-ID: <20260608182656.1213082-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780943224; x=1781548024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9GrdrBRBHg64yJ79gqSGgd6k990Xw1mEx1q6rDH0tO4=;
 b=myawsrHZjH3BXAaX+p9mJdL/7WRs6a7xuE+bhRK5iBr81ebab+84ERWVz1fakBUAAV
 4XSJShqpu7HOR4MTu7yaczir9URm+6nf0VJbMmva0+QutqB+t4CrjwjOTna345Wxzmes
 GK9C+cVXrvS0wSuZwRZx0NeyzJB2+QGIic0dM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=myawsrHZ
Subject: [Buildroot] [PATCH next] package/less: bump to version 704
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

For change log, see:
https://www.greenwoodsoftware.com/less/news.704.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 8eafceabceff..8d29dbc87db6 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-702.sig
-sha256  242a64c00f02d96f8ee208cf638ae1728b727c7f5fdf82a7d4f4cae32fb084e2  less-702.tar.gz
+# https://www.greenwoodsoftware.com/less/less-704.sig
+sha256  20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb  less-704.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 91c853009af7..d8ffadb8d204 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 702
+LESS_VERSION = 704
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
