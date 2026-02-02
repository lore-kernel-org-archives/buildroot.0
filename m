Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C2E7DEEE
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5C4821FB;
	Mon,  2 Feb 2026 14:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LJhvvHwkTbD; Mon,  2 Feb 2026 14:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEC3821C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042520;
	bh=Ku1dU6j6xXZGpq9sk93cj3o6rwfGDpuD55VSzGCDzfI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gTQE36eb+DaO48TPa28iOD4QhiWHwBT47cCUMcSmmoMXW6YPRCfn9h86wCw2N7BH8
	 +6f6MJouUVmqxWXNI+2IdujobItiRyErJf7FEAIv3EZmHM3hoRRtzvaAuIsgILj8cf
	 AVYKl6gBEl28UkdNkCuy82M2by/oLPaDEqW3hIiYZ0N2BBhRR2MmvBaOe51dHTNEKS
	 4Y4L8ZjNQ7JOATJ7vZaer4UN8wU6n7lBObie2+CUdggVeEWbBLeb9R9rJcj8KkEoGC
	 dSzyKFF0/aQrf0/egKNuYoTfaXd3n1YkjyN5NxXXf46Lgw4NiC3/y5Muq26sHjo2G5
	 ay+G2IKhODAJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FEC3821C3;
	Mon,  2 Feb 2026 14:28:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A835F149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97020820E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJD0Jy2v1qcl for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDB0C81F1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB0C81F1A
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB0C81F1A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43590777e22so2825562f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770042515; x=1770647315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8VTZ+wfvdYWW7jEL8Pa2MUheInPsCVTmfYmFpK9QDY=;
 b=EFtB3MQD1y30q7jOKgwzVK6huhGjJj0kXf68nNOyPby1S9MOzoT6UenxiPYBi8RY7O
 T+ZeCmk8+UhS3/YHuhS+k025zTdYcAttUHwPFP9vnS1EEZNhHjDjoPwqeEZ6gg51Fv9i
 nCbxFEwScD3yjwwCrqFM3cdFV3JxkyYu/UwvP3hvouxIVuDfrn3eT+RM9xsvDyPgHhLj
 EaeVo+u8h25z+x/+FgLjCpMWcJSDe2qePxShddEB/vnlrWzay90BFVTqDn+Gc2MpSw9+
 FUJOiu5k/c9FVAPUy1ItoGrFFPRZsRsjV2HQFjrSf53PgIZr4kowtwq8A6tRFiGQRoTJ
 +2zA==
X-Gm-Message-State: AOJu0YxyRIs5XPA6TjWYLhfECtL82dOpOdTHdkLYdCUr/+g5IiCGrYMu
 8whxIAM2rQOqJoVw+aRc8bOk9wtw2xF8gEAgAX0UcdEzl41jHpXZKmz2MQ5v806s
X-Gm-Gg: AZuq6aLAm5Yy7nfUjIRX+xu3hH2wrtElByc7iD/NVnfWIqfBPbHrrHrGiNbiHjS7pqz
 wpnJ7n/UAjbQRU3nEThGpskty3Ul+TWIMW5KayzCPyooRA+EVPF2Gm8RR8A8GmJt0pChsA5Uy+f
 o4P/IbkBIedXYriRsL7xYPZHe2+6ujH9t0CAj8KUsbdHLakTA1X0HC7R4H0BtNKECRLAu6Kv3cD
 1GKAT+pIHiH/og7GnoqiwIWsZLhre0IcVV8cXG2kW15vG6GVzJNXnGWgAGOwDa/xn4YHtzz4dsl
 /BRaOH3v576cK5SCSLoz39yJ5H2Ql7tvOmvmO3/FHXI3H9w67bXUoG303Yvvf3CCfF8/TvBObQ6
 9vz0slevJsoQA3vpoICwHZJ3SrdDRyI/wefHXq053axdWLf466LQN/XM3ZjUEpimmGRUo/6p0Du
 U242zYL1el5vU9HPFnqglkMzO18OhrzrhW3tGOvYQ=
X-Received: by 2002:a05:6000:1a87:b0:431:a0:7dea with SMTP id
 ffacd0b85a97d-435f3aa91d3mr18071838f8f.40.1770042514668; 
 Mon, 02 Feb 2026 06:28:34 -0800 (PST)
Received: from trial (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee562sm44149978f8f.18.2026.02.02.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:28:34 -0800 (PST)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Mon,  2 Feb 2026 15:27:51 +0100
Message-ID: <20260202142750.937246-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770042515; x=1770647315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R8VTZ+wfvdYWW7jEL8Pa2MUheInPsCVTmfYmFpK9QDY=;
 b=a81APhaSTkmJPF2KfOCKmvSqh6ZVNT5AFt7FS0A942JOILzwlFidPclMJSzA2UyQYJ
 MYHYKpdkKUJ7uO2D+FmyyE+Xbb6ZwXP8yCgI16k/Msoqxanwd8TESE8nOSq4CCV36lBz
 zuaMQcVhvcVj6t23yyQP+AufFTYgfBbs9pYZ8KMIFJyRCjOlAQIYPk1LRD73ywF5BUPq
 VVEptyWmf27XbjyQjZVFYFlDNfkteZf09ZT8Mvxtm/TLY20qSCZ0r7HbDm9bncx4V9N7
 uEO7x0w8GcvyH5+ps7uon0C9R+OVg4jaJgb8Ri00InQtvExy9g9KwZ7Fe99SaeG3m+Ou
 6JDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a81APhaS
Subject: [Buildroot] [PATCH 1/1] docs/manual: replace bulix paste with sr.ht
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

http://code.bulix.org/ is no longer responding.
Fix paste list formatting.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 docs/manual/contribute.adoc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index c17f1619b4..f22164991f 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -559,8 +559,9 @@ If some of these details are too large, do not hesitate to use a
 pastebin service. Note that not all available pastebin services will
 preserve Unix-style line terminators when downloading raw pastes.
 Following pastebin services are known to work correctly:
+
 - https://gist.github.com/
-- http://code.bulix.org/
+- https://paste.sr.ht/
 
 === Using the runtime tests framework
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
