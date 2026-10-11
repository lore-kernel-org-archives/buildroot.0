Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824D8CA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D29960606;
	Sun, 11 Oct 2026 08:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RK9LwAXzvzEC; Sun, 11 Oct 2026 08:43:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60A8D60625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791708223;
	b=UdwZ07/yCB6TocbcdLdNpyGH+y57C+Nzc0ppRh7qKofJ3XgSMZay7//7WnwWBH9fKRgT
	 QZEb4F6hHyx+HdEkLCVEBoLdBBLeDlRaQr+fhjGIRVpFzG4AfixvvCq6PyDsVKloor9KO
	 UqWctFZG5InSbYwDlqIo47fxK1a4m8qUQgTMN6WaldmtQGaB6//dFthPeicc+EgiiKh7I
	 S+lWOLYVcbOuAQhelDmxsfQzciQjTEWMLn7Q6f9pviTNd0/4zuwkK58LCkDtfUJDak2nX
	 hE2Apb9jBTqupk0uIxbIO7udJkVNtTTn6FClxatPiAqFoRany5AshGji7JMxi/YsSKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791708223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wwzlkXXRKGl4UWMqdRgrBC4EQwJqRNTveQEPTanlxCA=;
	b=ppe5XYi+llWCBlWrGR/7BVgr8yEQaM9jN7VZWrN8+N6+xLNk5HaT/LJqpAv/Sf7GrDPQ
	 oz8CGUiTy6forFXpJ1aCJ+rQCB6bhtkwWNZ3IsOnN+Heg7jpf1wc44EjLU6ryoT3omm/v
	 Pav/4WLGcw3cCrn7qFvtAiaILpLmMi94EpADDfGNwC8X2uCpqIzbzmBdKu0tH6G64l0OT
	 uQvC3S7dX5TzbkC2CCdO3/UwDUfxfwMuS63Qr9HjazotJpSyWMP2gvDeVQyIEROAjL/gq
	 fGF4VkcqWWcD5hBsuFBtEfpupvzKWmR405NlTqzJdN/qlKdNHFUphf4dZZFf9mqaw6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791708223;
	bh=wwzlkXXRKGl4UWMqdRgrBC4EQwJqRNTveQEPTanlxCA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VAGTcYIuDEPMP1WdG7SHCQ03qZIyQ8cUDiBSeppNX0r4hlUi5ci5vJNSOMQhWQggX
	 2jY2XiZsDqqM3lA1Jfh+TCJ5FyujBWO4BeMeQ2PctEM7lvr3yBSf4DaMfsYHdztSLz
	 F/k4nKwCwdmI0qOG56EQlhYeORbJOaIrWzihWYfMWA51g++vRaBvKEhirhocf8idWh
	 pARHEC1aDNgTZh/H0VDrC4LrxC8gfkuch/XIOd9/RhTtsC87gCeJkHWNI7k3/Qlum1
	 nv1RWHm4LOI14x7poMR3uXzAbijES/dk3vhgt9Ue5tT/7iB7DeLiCE9RMB307k8UJ7
	 XQPsgB7qprh+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A8D60625;
	Sun, 11 Oct 2026 08:43:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DD5EDE0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54387406FA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-YOPpvPKjcb for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:43:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 181EA406F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791708219;
 b=PsMOrYFyksZr14hhGJBz8HLHALIgAiw86CnrOMPjeFkxnwavqgy6f4ijJPUc+FqygXT3
 YK2BlpYFZcyTQ0V3DGphw7b/cti0QKVC3wOL1DukmjigSUL6j3sDtySQ39+mz3urHOEe2
 kNMtZ3QUXBBaf4rsTbOQdrE4N9OICUnh6XTp2WAZu5NsqX0Ed2dW/f9AneL8Z1m8e2MAD
 3G8Q8diWf14uFaBNNpfwlFjc+odLMOh7vbvASRsoHJSXiNR7JhqxyllEJciEMdgvv43Dx
 jGZVlHWf7ptZnniYBf8rqMDuBTG/IniRi0owBYPSLyj0Aen33tMzVjqxIeBvZFHUQHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791708219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tgaDr0oMZPja3c890AvAODahRWCnOKC5F5CNglEW7KY=;
 b=I4TPldf+m8LUPeKNbGjoQmOaBijBSkYxwiyuUNzIkmBdl7+2BcLUyMXKYrthDdDYRbv/
 g7u3ySiNx0i2sYq8sqhFchNgd6o29rbaBin2eXUhgcEyHRpLl1ciVZbXGrqLrDwn+b0i7
 8NA3c3DWV2sfYlcSoCWfKA9XjE6EGXijhGxZyEE45AoR9O1F2DRA7urApWygB+wBhzr1n
 LrMj0B92pAI63fdpFoCjYtlBtr2mxU29bnYCGPwJnBUOibZNFrrgAfInzzuz8kW486Wep
 bzFBHQBaPyss7jvnunqFuZPqOATrDV/A0czKmy4Hjl4SoBy3uBJ1wbTcRqyoqaa8RRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dv6ANPfS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 181EA406F2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so12279685e9.0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791708216; x=1792313016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tgaDr0oMZPja3c890AvAODahRWCnOKC5F5CNglEW7KY=;
 b=NqPbVUqKjjObG4Rmr3PCSIfDdHgFi36Jf2QjgujRZBn7meRWpa5x9MbxlXy945EK4k
 ZLL8aExawSHDz+ts4XPAWoqxEmLbHcTVksCMCeOUrKYffC32SSyblMcjN5Ap/zHgWtg4
 32iXhdRHxGDJidYPh7LDmXaJyXxcxuXjJcY8/5ybq82RbWuWQ+m2U2KzT3eqqf6aMST0
 8Il+ubGAVsZb/8Yux8TpBigadXg8rbmQgiHTlOsbGaRd7ojdI6iGouHpAoI+zHHf16S2
 VtXX/RfU3rdLlbx304dEylCV1QbsSU/P7ma4KEowL9zGH8JjmVLEledJo7f/8wUasFCl
 FSTw==
X-Gm-Message-State: AFq9FYLcNT0RfNRIHmp4lj5NZ0w1tztEgEalH3Pe5jGi+IavjfDiWhkN
 nlwSkFrGGl91SNtxC8P9ihEAfpyHHDycstEr3VXMIw4slVPC1eINkWt9P+jiSmOlsumnx5Qn7AQ
 GLVpNz0M=
X-Gm-Gg: AYBFou3TJn8Udx8Ke/Fi3JYuLtiGI8N2o8KRSKMdSnYN9jobVjUASmb8N//Xw1gF0EV
 WtEEF6fvc7oscGwM+jZqWHKkY24H95UHnWrqX8k9ev8G2bCfWy0cIPVQ4OEHKm8vNk17h8YfDGX
 5thetuBi/QLroqSz1ztFP/iJ5dM+4v7VDXDqNcdonRFmDy9bkG/PQFSmqTOdiCxNrSvU/s01y2m
 R11L3oiX5ou7Df2XoHmBbyxTgUvS4gne4kzuESY6ziJjA8j5vcn3+Vsm4mtZv6XIb6UaNDzrkJd
 XiKQ7Y19hrr5LERinCSqCOx754uhOos8GYwDwNvOAh5y5GDr1sOD5nCDZK1Lccij4MVG/oXasm5
 0UQtA3DHt+PEiAmmKS9fTZCst0OtiTzjXySOtAlj4gtz3zBnZx7HJyJCYJNUguhYdqV35g3ZHqS
 BNnTZXCdD6vEsE9OdCkSjpK6POAB4NLgAj4exICgZ7IlZL82qkJSnmpdsH2d/gE7zRlZpwCP5r6
 wVjzRfiU8SvGE7Ig+z2A7RWL1qR62JnRnM4k64D9/tdT9180NtBffYI
X-Received: by 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id
 5b1f17b1804b1-4a19a971118mr13924535e9.5.1791708215523; 
 Sun, 11 Oct 2026 01:43:35 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm197720645e9.11.2026.10.11.01.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 01:43:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 11 Oct 2026 10:43:33 +0200
Message-ID: <20261011084334.667976-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] utils/generate-cyclonedx: avoid f-string
 usage
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The argparse library documentation [1] suggest the usage of
'%(default)s' in the help text to refer to the default value of the
argument.

This has the benefit of making it not mandatory to update the help text
if the default value of the argument change.

[1] https://docs.python.org/3/library/argparse.html#help

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 98009cef98..e8dcfa8518 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -545,7 +545,7 @@ def main():
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
                         choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
-                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
+                        help="Set CycloneDX version (default: %(default)s)")
 
     args = parser.parse_args()
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
