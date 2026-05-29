Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B81CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AABD841F5;
	Fri, 29 May 2026 16:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn4_BR8-AzJP; Fri, 29 May 2026 16:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED14841F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071076;
	bh=dk/7fr9zININrDE2fBW8ElorMOSIjS3vKucQ2QoslfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZeWEDX3eCfnyi4tSuzK+/Evdf45NtzSlUAZBKuJ3SukLUBbBWgcbNgKzACfbNTBF
	 6L57jgi2gCAZvhSS8F8ymoCudFqov6V4G1bLuHboL3mOB8r19G/7rOZAm7e44cqHO+
	 FUIpD3eD9v0JypjLZgmMFbOKQnCF4SlQK5Azt4OpHH49I93K6wOpr92a3eWCJXOD9R
	 H96CDc1zuP2vJYF+vJwScKd31gBJnKLp4UNbRnKrJZbF5dqGMRDtQawlzzZe5cF0rb
	 tseEo8B08UljytV5q1GQ9NlVkdicxhdZXkKAbCIAjR/9pIF6cw2SbFg4e205Fcb/zp
	 uDFsZG0FvNOBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED14841F0;
	Fri, 29 May 2026 16:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E1E288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8569A408AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC1Mi-qLjKWl for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1E4C403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E4C403DF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1E4C403DF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:11:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so7241565e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071071; x=1780675871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+kxSQbG1Q7s5Gt+gg3Zetqqa1BdoT3pyN28gKixM4S4=;
 b=DMEL2gPtMcwWVw+g+s65cfjP9paFsQ7ogxN5on+TZZfB6BHmVmC1/X2+d0TsG5jrwL
 A753BDB6akjfF3EutRXe3s465tjkWiOcAfWLVgxZCi5bfF1eFQtkf6e+fi1w66QT7D6i
 4/liBSilVJX7ouI5VevFVJkXl3e6P5Sx+efjFA18Ssv1VJVH6Y67z6Ms5ZEZpnX0tPet
 R7Z4922h0ZVGK/sfNCbk6+PStVLt9R0OpigSWlUS2ELgpeWFtN6L3X8G0FchQlRV2Cuf
 EVCTYCRMcIimYUxJaZp7DByhXgUKcft5bajhr9qXcjAQ2k5PfL3PmlX+rRz2jftNfCWK
 SwQQ==
X-Gm-Message-State: AOJu0Yyk1vXJiCHUlwNAPuZvHzH11LpxPX2jnIYPWK+jCc+G7v7VXLOb
 M3UdPbkcnJiTqz8nZAKM1LlD+5cVNc8uRe/H/4dhWg2nRWCNQwizgO5HZPYT3fwNosjb86dIuPL
 jAF3M1BM=
X-Gm-Gg: Acq92OGbtj1XSx56cHJklMB8DIoh+3sxjpQ1DYotLFYwHNwW4nDlcmmE5QhpiRhNRqE
 X8bsWSerROr4EdNioMAPMES8ehV8XQrp5Ma3eZQr1vfFt5G0sJuIDAOCrW9Sb11o2JiE4IuYUwq
 2AnQ1micuc7cymCLX03SvNdR5ykVI2NCgeBKwteIaUeAxdFiv9uxKVlBQ2dznyugP7QC9za/LQF
 cGa1hz0u6KaVUQjxjXlgcpYtkBT+2e/I7u1KbLWGL0lBLEcIVDZtM9gxJkgoLkJqLJobXQZz/0G
 yYGdMakkvhx3V3E08ikuUlnyFBVk1X9hvmbBSp7zWyErPPSQrxvOoOxt4sK96/LQdxlOip1kzGx
 LLkXLLMK17QlSxQ+sRAdZ6FXcJJTUezoTmD3OyF5ahofnEjHee5RNe/E7ixwLm0M910HiRqziY0
 lIbT41xh3HpEWqHBc0QLg3YT/swUDGRlCFgMTbfPA=
X-Received: by 2002:a05:600c:1546:b0:490:50e4:7224 with SMTP id
 5b1f17b1804b1-490a290bdf1mr5191145e9.3.1780071070760; 
 Fri, 29 May 2026 09:11:10 -0700 (PDT)
Received: from dragon ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c967c77sm61685305e9.1.2026.05.29.09.11.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:11:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:10:43 +0200
Message-ID: <20260529161043.2471088-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071071; x=1780675871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+kxSQbG1Q7s5Gt+gg3Zetqqa1BdoT3pyN28gKixM4S4=;
 b=UrGIV5x05GI4kLmyuCwOLvhCEJY2LM2BzVKAEkTjRgfdpXINN3Rn66fE8kqyetAt5c
 gZ8dbYFmwgS7yJNToHjV5gnACGg6mjD743gUfQD382sMlzFv0am2VWVkrbXfV8q0u6iM
 989xOzD38vkyYDl9trn8S8U0OkGa/QfWp0hDSkTcLhTU1R8RWt6Q/qczI98Q6yVa63Ik
 AWEBSE4cHdEA33nTKTpO3irMOaljrb9GQIgk6IRUp8btbqYj0Le8mIAonBKY279uMJlE
 9iOZ5y8CHkfZiGNr79tSR/XvmtJKxRuZZEX3gyZDeCFNfd7zrxtrDOeAoluCBf/d02qZ
 BNNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UrGIV5x0
Subject: [Buildroot] [PATCH] docs: add OpenSSF best practices badge
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of today, the Buildroot project is now 100% compliant with
OpenSSF Best Practices self-assesment. Let's therefore advertise this
in our SECURITY.md and in the footer of the website.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 SECURITY.md              | 2 ++
 docs/website/footer.html | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/SECURITY.md b/SECURITY.md
index 6b21ffd2b9..85740a15a5 100644
--- a/SECURITY.md
+++ b/SECURITY.md
@@ -1,5 +1,7 @@
 # Security Policy
 
+ [![OpenSSF Best Practices](https://www.bestpractices.dev/projects/12245/badge)](https://www.bestpractices.dev/projects/12245)
+
 ## Security advisories
 
 Advisories for Buildroot security vulnerabilities are reported on the
diff --git a/docs/website/footer.html b/docs/website/footer.html
index 82901b7ee6..b93fa46ebb 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -3,5 +3,11 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
+
+	<div style="text-align: center">
+		<a href="https://www.bestpractices.dev/projects/12245">
+			<img src="https://www.bestpractices.dev/projects/12245/badge">
+		</a>
+	</div>
 </body>
 </html>
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
