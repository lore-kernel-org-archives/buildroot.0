Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C90CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91AF4853FB;
	Sat, 30 May 2026 17:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjTTLgVVrcci; Sat, 30 May 2026 17:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 859AC853EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162924;
	bh=I1QEigWqPHOMXFRZvz6mXNT4PED6nvnSRIcIOximl2Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7LHksR64f73+DdBYIx7Pprx4lQljDiJfmdTeKyPePqF1d3IojaCklXg3Ri0Djpll
	 3/L1xrNulaUubIKtQT6wlkGbFruKZLUWcnPZx+l8155oNglsePeweUnOVAPN60lqeg
	 tRnitS3w920J9wabkC2L+UZqD8PbfkWmQlC+6RdZMJqo6MlB8E7r3RceBOjG5nf7+O
	 IKLaCRmCDimPtTTZ7eD3F6sBG9NLPMqU3CBr4WV552DIC35wwElp9XamH124+npuUI
	 WVqKIDy9ZkFF5Kdz5HiH803Q35ON9onvSDDkAIrQpM6jCjfwcXlUtTd6rOaGalw1qq
	 32igMSOQuQ9SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 859AC853EA;
	Sat, 30 May 2026 17:42:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65618D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE9642861
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CohRqI36nShj for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0F57427D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F57427D4
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0F57427D4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:42:02 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c858d69bde9so235608a12.1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780162922; x=1780767722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ejKghxA7I9d/vDY8SOpMIRQ+yhhW5q6Zt5CcVw6Pi3w=;
 b=j0vGfsYCoxaHNJASyqwQgFPM9V102S7n11+P0p3Clq5X8TkBZH6iDfINJOXO67eY+M
 LuvrVj1wtAIdmyW9p2bzY0ug163HPCYzSvdgk+Y7Py19d/w4KxuG80S8Ntqjc44FvvHv
 Qntni7tSYCuPFQPfD8wmWNg4RjC1lVEtd3dOKoqzjiaysJEKpQtLFLVzaKAp61ZVwcBg
 vt/a1LKJiM9XOPrQLpCSqPtnPBw2qYnrrtEsfVl0RY6dVDdT6tIty1BM5AEmNyyvwmwv
 kJkTsVCi8VckYyxQSZodV3XWT68R0hVL2kRf78R2EZSm/Qjqw/t/mq/CKpW5EVzTH5uR
 4n9g==
X-Gm-Message-State: AOJu0YzROsfeATfZxdj0StHOB2IbhW0qBMGpk0yNrcN4EaKiDQPoqc5h
 30L/BaHQjvcpSkjrqtHOi1YuBOGBamybOvOLCzZIk4smPnSVE+IFFBax2MsFONdmi6U=
X-Gm-Gg: Acq92OHzPd5MRGVzUqRlm/Q0MTBB+nXRZrG9Rq4ftoF0vDE3g8Q8JY93F0D3bqdoAdb
 CF/HxujzXMzlFJKDSAQFH2U9vYsWqVo8foUUZ61lHy/EvIrOE4t4/KEBdS3g5e3zMGwljlKDP2s
 dtdkaGwgGEdWdSIL3ScmSvvsTACSqDB4eRCtQR7Q4ZsnICGIDvOWiXg5UfL170Ugey7PwyBN2d9
 hgtAZ7maubZYjSGo5gAzd9g1VEP76zPweQpYqkfMgHk9gph73zrJG7UQfBJXDBkAf7FedqkiK8W
 WKtIZu9juiFuEW8wTE1CTg5zSSyT9KsqCsQTSrBmXQsKbMTcli2fKOLwa1Fv2HofrBttMkA/7+y
 rpK9Lb2NuRK0DOpIdEt8J7AevV/yZMZ1mkPvyyoNmjmrImbejaXQmuD6MkGwomQek2m9TpbJB6K
 eXoJ1v+meOQ8VD7kYf7W+52Qzcp9up/bTcq7IjBV+pok78jqRqdRgYAYrVxj8UDa46gko=
X-Received: by 2002:a05:6a21:6497:b0:3a2:dabf:fef6 with SMTP id
 adf61e73a8af0-3b427f5b066mr4325904637.35.1780162921884; 
 Sat, 30 May 2026 10:42:01 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85771a9299sm5161853a12.7.2026.05.30.10.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:42:01 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 23:11:35 +0530
Message-ID: <20260530174139.28613-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
References: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
 <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780162922; x=1780767722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejKghxA7I9d/vDY8SOpMIRQ+yhhW5q6Zt5CcVw6Pi3w=;
 b=ePXFH78y22sjrXfVJtGADToThRkiFUl7p1lkTnsTyFf9vm2dqemy+IECZ4UnXx7Hwp
 A1/DYfFkm1XcCbHhf7gmWO5eBmM5DA27Dj66S7QN7gmLa49uS/7WpK/gx6c4AEHqSGGU
 bU4homoMilPeCEZmYJ5CqB5x62LVO3k3EywooKmsmyxWiXUvgEhIlKXBpppwhFsc4hjm
 PyyMD5nkIRFrgVC6LVPPQ6ox0Bd9280gJK3YRQ2nTGQGHNOOa4T8H1KhKRxKQnoJjJlV
 VJMPvkMgtHnuivlYXP7s0SEFKjQou13K+bj/qi4lZPjjhEC2sXLwoVdhYGSXXoJ72TSs
 fE9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ePXFH78y
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Shubham Chakraborty for
 font-awesome
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a00627b28c..fea089e97c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3046,6 +3046,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
+F:	package/font-awesome/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
