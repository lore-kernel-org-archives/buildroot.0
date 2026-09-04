Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D649BC79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E54A60C01;
	Sat,  5 Sep 2026 08:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zh3sX3uqCO2D; Sat,  5 Sep 2026 08:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A8B7660D4F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595961;
	b=Pp3HAXhX8pTu0HmQLvC5ZPgWxMZkBcMfBlBnIT8vgIQQ5TbR0f2BG4B/HpQGuXyre3Y7
	 c1bLnbcwP++NFK/G9mZkAi0yspXMYvA+IpJuU3WxcSwxHeMlO2yW+INfO7/j4PJow6rqw
	 iipgWqRPkMYmxBJX4foAwLJshZ9n2GsgJ8ziWZitLASCDqNE1aQjdS4WDr6szOaRU/HnA
	 VWt9OgB4QpcmmT+xSQrG+huyCa6uGjfChSi9TLtcUzQug3SB8PbvWCaeCOWWLiVwLI6hL
	 oDM41olDzqCJG5jgATggS3Dtup6ztPxiCr62rcubwznqPx6eGZTz4+XUrJbAAapkkSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=e12wE0KIs5Hkk215lq6MbRdhsxW8yrPJjPbccfYwTb0=;
	b=Iu0xJNObaoz8g0D4Gp00OVFUM3teikZEOMKhW9a0KiCYTLHkLVd9TBsnimCChdKv0auo
	 WNEb7JAzmt3Dti3Min23RhjV7pFMTrUAVI+y4FjvdYjL6TOdyMxnuojTjP0JOg9/o0iLE
	 w/5c9rtuOi1CXGLAXqcAPbAdy/RrNLFv1zfcMFhVXrmRTSd07AsJ7vZCn0TZjUfraQS6p
	 63CmBkjSTBXxypyjQ7amE0RyolaDj0aNJY1E4hats9yV7k5nm3/QeG4S+XLSVbEsQddrt
	 MvJAl/LyjvYbfwmk4KqqPhIOqB8c6Vph/X4e8y/lFyCrsgeqgFnrwXHaHwJppkYCz2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595961;
	bh=e12wE0KIs5Hkk215lq6MbRdhsxW8yrPJjPbccfYwTb0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTbA99w3Sqaavny4Bw+VLNw6TvPpZK9rAzmuiVD/Q+JHNSA21xzYEGrqfK032XMJT
	 ivb95w09hwJxewuM0o4OJi+qsW3a1aKqbJ9ZWxL+q2Uk02jKMJpggUIVlUq31/pML8
	 9HFwoduRmwe4Z8Vfh7TxjKvPcFqVQ3G8+H8rjAL+v8ng2nYi0yrs9b/W53gt/j8RX2
	 JvakA0wErrU2L4ZqWpsljuGxiqgvu5A/cQbNvKWlLYvSn8TfrdhgY9OC0NdpxhLM8C
	 wvr+eUiBaEQ/k5Kla2syPVNL+yYj4BNl/2p90xlFrD4Mc4y3fAcIdq+hP/eXOw/y1O
	 iD1b2J2vIGgKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B7660D4F;
	Sat,  5 Sep 2026 08:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A419CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D0FB81187
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oQBNJpoIBT1 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2377E81183
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595953;
 b=WNq/snIEHiAE5Qc4txDzkhFwea3lSm0nl9ZKW+fhlGK8u8UEz0UtedvyUCaidG2YT+/O
 4H1yEJv4yWQvzO9CTgenfsQNfslFXxxjBa88uqUF29yNgikjPS4hdOx65NMNPHPgU6yDW
 3xOrtNx19nBWQ0/4zFvinnEE3S2sgP0XmyS7I6fy1jjfuJGr8wZYdAoWUU+R8rvjkSz12
 GQdJ9burTM0L54ZSiejyhOMwbU5kRIfLTWgzHjBOnmCcDV291i4/CuYxtz8GXJ4JKwmrk
 hwzsYc9anRB4ZbfX9FIO81Prh4OYEJWw2RDvx9P4y61Hjfu4cg1njjVJ1yjj94XSL2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595953;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Xo4XT8WGPShND3YDduyPeAi/lwk0sW0ss6SrmpqUrn4=;
 b=AOJKurGNWYTiR4C3+yi4KsUb72Zf/zXFztGIqmtb7mPWXhU20JdHg7rsB7m4kXepp56o
 BEHWbZIHTVigMHYYIyP+TkPFBikIbxE7kfkPqwwzk6cNtrTCN3JdON2M/QzJFnqjKDUEv
 Snbs5BofvGKdug8zgUrpvJCJWZRukS7FPGbTblAIYC0RKGAhO0Ak0nqt6L4sjmsGqgxNR
 +nhpegvI7owr+JNnZ2PoxD5L3bxApaQulVm6/KtD1u4K8U7SzyZv8JqNYz0AoxhTsLjPn
 FRVyoCBgKfAe+C6yMHRTLNqdVDM0k6sz4cPLGB9ykknJ916izSlXKzCPia5Xdjq050g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UhAua6nx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UhAua6nx
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2377E81183
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-485850cbac3so1157691f8f.3
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595950; x=1789200750; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xo4XT8WGPShND3YDduyPeAi/lwk0sW0ss6SrmpqUrn4=;
 b=UhAua6nxAN/rfbAcF8JrFgwY6N8Hr81RLcgkD1O306JK10gt4SaseBwmjBzLAlJda5
 asHVuEhqcMkRV2MdZR+bRgpDgHRNbN3vBwbT+mrYs8tN+rgIcfoV3K/2F/xkdMxXIO+H
 ehMl2WKjsRpeL4sBwT1QSaz0NLdb9Ek0WxYYH8eq03SIZpAxMumxJHzCW1VcvpsWOsYO
 q6OYlpHlfR1Jn8jhQxS7fbzluwU8t87fW9b0C5jkRVgWPo4NAcjBVDE/8HKRnT8G+/R7
 r/N9T5kG31TLG4c0HlEfmnaEFSLciNCgzMOLNBkDb1AM/LJekzSQDysPYV2siMuKVvjl
 6xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595950; x=1789200750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xo4XT8WGPShND3YDduyPeAi/lwk0sW0ss6SrmpqUrn4=;
 b=n4mIwN81l+4oFswpFgg712+iRN5ImBupQpiN2hiiW0r1u3jDa0NG7pnKf3+w0A9npW
 44E4wpJHd4q12B4cqsF3v1gElDZ6brGUBiVB4JPxBgxh0NWq6L/AVIMnYa3sltdrYB99
 dOrR2DUyixSBkWkaP54He21gbzHGD7VZroVX3KZlyFvC5YYFNQHpjk+Y41yQNEjWkpEo
 OtR3/gRTC+Uup0Qqr7mTKZnVXDx49GtoRpWukGuDvQagJx2YgOKa4vnuBFY0446SXSic
 6dAyWMb2aD1gmHKks4VSUNcvd3FjQdhiwC+WgXyfdGoxc0X9/imlDElc80hcqnwWL2UK
 ml7w==
X-Gm-Message-State: AFuF++kTv5FzgXmN9sznOGl5fxsRs+vVa4/ed4QfJox1DFRUiLg6YElh
 ahkabpz27Z09wlXmZFz2l5ZNxVyJ73u24Fas/jfqIJ0ga1X+d8AjaSUSRnJGrA==
X-Gm-Gg: AYBFou1pA9YpMpmAn6KXucBKVIkm/R//xV76EgaiFXT/PqhnlBOGBwS/eJeqaxMM4OP
 ZoIMFL+J8U5gNmEHi+V6t4IF3z5Z5N3zx6KlkAXD9863C7bAfoGejZWRWzJJU2aWshQK44Z6yF0
 5zfoF9s7ereB1usLH2y4w8SGgVtVS8pe5E/rznYU74BcA8FXkuDDLke2pPzSsr2+sfcJqS8Ow0r
 XDGzKsTKDcT2SevbWbgaDf8VbKGib2H3fCJtGWtAm7ltFYvLlvaZ09iV88RqGqhdYmWNALyPJFw
 YvveHppp1nVll7+jTBd5UTTYxZgOFve/BFAnHvXhGr5JRmr/rMTPvFfdVxVhHS5L9uhLlqrbxRS
 4myRoFqBk/aHtuum4YqHZcbqxhbdzwasgtAG/IsCmFMIEuvh5VVqby96tD4Ny8BUKsZp60zO0NR
 Zxp982y+ju7APKJQCEjJdqXAzgI360G50zN62wiMC41U/KqhCn37YUPQMsX45uULC7MUMTf4yXP
 dbyrx9ww5PvjHGFjbk=
X-Received: by 2002:a05:600c:8b25:b0:49c:fc6e:a3da with SMTP id
 5b1f17b1804b1-49cfc6ea704mr86256665e9.25.1788595949624; 
 Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:16 +0200
Message-ID: <20260904185921.587878-8-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/12] package/luadbi: bump to version 0.7.5
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luadbi/luadbi.hash | 2 +-
 package/luadbi/luadbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index 992de9571..3d1051cc1 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b1b6abd58a7b9cb51ccf67be903d5cbace9721c35dbf799379ffd57f45b40f12  luadbi-0.7.3-1.src.rock
+sha256  521834be356e747b31e42f6be5f5ebcd1232e4bcd36e948fd9e003e6e135de7b  luadbi-0.7.5-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index 6f617fdc2..4507d4fe8 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_VERSION = 0.7.3-1
+LUADBI_VERSION = 0.7.5-1
 LUADBI_SUBDIR = luadbi
 LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
