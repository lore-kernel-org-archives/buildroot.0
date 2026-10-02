Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F3BCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 12:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89EC781220;
	Fri,  2 Oct 2026 12:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCk2aekT3L8C; Fri,  2 Oct 2026 12:44:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8646581205
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790945091;
	b=qAENo9qx+0g1OtoRrl16nBQAtkTyUFPlmHuU8qCZYeWZzkBuFJ/pu0YVM1mLh9XCiq/I
	 Mgw/0sk+Kpdrvt+Hd57XpvYM/e4oflaoy7iaM+fnmPwMaPtpW8eQKX6MhNH+0h7rMVSOT
	 MAZNBsxs6ba4LzRfBLB60W1AwL2Mgvkdqx38faur72dsGntslLKyye3lvOhX9kdX7wIiA
	 UKgazQkSeG1NpCVbCgdD+7ydAAyd3HAwmHwWq8CVJO6cb0DmwgxveXT7qwHzczLDDDEj4
	 bTnlHT+XMfcjWaIUzM8Au8azvI20bLpSmPb98aeh8WAjVQ4mY39j+kPTAwGe9H2k8fA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790945091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GTWAvDwSVNF9zUYrySYCLavh9nQHS5N2SlW3zn8r3ZU=;
	b=QyMqxolB5doJPKufN/oYwamtEwhV4QPY5THYiNN/Ei9CdlbN6ci7Pn4r6c9/31mJDV4O
	 7tQP4e25fXKqXLKV0txGC+MJZYvV9f5HwRcjNVnrmuqeoShlcBNCkqqjDn+T37gXfB644
	 n6I9UYZ1OGoU9Lrhqow9eIgSOJwDBVgg+Pm5vnC50aK/JEgeggEeeFfkJJEp4bQfIFfkC
	 ivzwbB5cpYY7TUjvGXj/1/bY/aIdpyZVgoMb70kQaCSC14C3p7p+/d4wzV8K/neh7tB/o
	 jujMlyiEmleZspYn29FLU1DnQctyukvCEhAtwA9ol1pD+L/24+17SK5Z8tNZSYpdGQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790945091;
	bh=GTWAvDwSVNF9zUYrySYCLavh9nQHS5N2SlW3zn8r3ZU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sKrXCyYnIB8Ql7DbM1tBi1KTJM5gBaHaka6zuTuPLuWuJTpojFts0rP/x0BCwDFYE
	 1mR9IFsmSXFDJaNsWhV4fBqIrXa8MNZ0ay+Radz3Bw3+bPHgK43gP+S24EEec5+V4B
	 fSXOVKP91a6p66NLGk/gkhCfQBbF6y1MK/6vX0B82FnWaP+7ZR/6H3p+MdnMoeaC55
	 s4+3MNuCd/8amZk2uGB5uXMOMxnWGi6tLUv7jr03Oh/AmbENQIh6mQqzXo2KxeBYey
	 hGah50Q0RucezyoRaXw6j+91ghi9b1x2hS1j4dgbwsjEKIzP2VaWU1lhwKvx45b6jA
	 vvDqZr0esilbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8646581205;
	Fri,  2 Oct 2026 12:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC7F32F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E3A0400BB
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJNS4neVZeof for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 12:44:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4520B4004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790945089;
 b=gJdUmwYVnj3zCWuYmdIDwBkWlfaiSWAE97zY/vaJhpRSmRmP8HZ2wkgUUgBktLFs4+An
 O7mwVBhecTC7RuYn5hFT30m1n8apZmxGP7LzkInHRFy79qg+5XC8R2Us8ui9jEGWtOx+C
 /9FVrhoFqMLGeYCx6QGYwiyTcjVGePwb/E7OQ3T1MMak2XtfkA5JzRv0ad8T0FLCSpB9W
 9OC7zYxXnKLZ3C65YOHpEY3Sp1pF84v3HXiqMbvZ49eZmc1orY+ROwwE0JZxs+GBa6uj7
 tQPO1JbZeSr7cgYgKs65pQ5oMRpwnfJ/TsiBH63ur1R3w8u4iT+FaPkNRtYV8piVvgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790945089;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ma7KRfCLUUaUL5ZOYyonnaCgH5RvTPzPAdmY/suO+GA=;
 b=YZJsnfA72wPACyb/08tIIeBHe3XlTw6jG7Awm29inq/mWTs7P5o2TtYdxGqe2ai0h+ez
 v7jSnkYalx9i1ushkAu0kT+HwfS6LMb4yzK/S9SKPurv+/AcDnV0Bq8Tz0/u107xWEA30
 bTyh8A/B4D7sq+LE4WotUcxXkc5SIkp/+GynxfW+DIIBGqtVWT/N3q+9UVK96LDzpVOb6
 YdPfeA2xqBx7fafkGlD9yv5dipPnUMY5VZYLVGUmRzh8aQn3K5euY7lhEGyoX9TtXBAbv
 34QgF1qBA/YzIbtWZnETJZVXu5IAmpTSy4ihcRbVxiK8wfUUTOqiLTV7NLFFG8HIp2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4520B4004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:44:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A4CA885A4; Fri,  2 Oct 2026 12:43:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 14:43:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0b92359082ca48896038af7cf47313eeb614421
X-Git-Newrev: ddb043b26a4177a98b25ed06c80a4764b7c0fcdb
X-Patchwork-Hint: ignore
Message-Id: <20261002124335.0A4CA885A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: fix missing
 </div>
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddb043b26a4177a98b25ed06c80a4764b7c0fcdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In the maze of <div>...</div> blocks, one </div> was missing causing
the rendering to not look great (no vertical spacing between the
panels). This commit adds the missing </div>, fixing the rendering.

Assisted-by: Deepseek V4 Flash
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 2a9606e23d..955f18269a 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -132,6 +132,7 @@
         </div>
       </div>
     </div>
+    </div>
 
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
