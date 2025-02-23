Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D71BC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 20:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55BED40634;
	Sun, 23 Feb 2025 20:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 594ZW9JzLZ7x; Sun, 23 Feb 2025 20:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379A44063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379A44063A;
	Sun, 23 Feb 2025 20:50:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A1F943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC4764063A
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JL7b98O8F7n4 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 20:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9355240634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9355240634
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9355240634
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D5C9313F879;
 Sun, 23 Feb 2025 21:50:46 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 21:50:46 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 21:50:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207144636.620427-1-thomas@devoogdt.com>
References: <20250207144636.620427-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <777adc99ba350bdd05aa25714f5d100a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740343847;
 bh=2TmoujA+8b/WDSm94UjnJi97Rh47D+T9SylHtXL2TGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LxB565qQjVkuZ+zMkvOD+Uh3oqFxRF2Mw88E/+aLBleQJ6cIzBRdzJR4O8O8hszqb
 ehKinuU32DOyitZ3506cOHaehg6iKx2bhVnAcGXr7lfyYQd0XvJbud+T3769MgTfCS
 emGc2oj/qp9fzx8OpHdI6KikzK75X0V92uXHeGrIBOTpy8cRyvfd53iIVNJOzOZq2l
 lMs0TiUftYF7181lnU/6LXAqnjjUHSvZFIss4sn60bak4QLJf438lT6WRBjN8IY4wT
 2rkY6oljQqYKw7YkEdXTmPG1XGxDI2VzPmTxiCEH9D7wDJmDX+DDLtVBoWecJTnOKp
 C6fw6gAgKFQ+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LxB565qQ
Subject: Re: [Buildroot] [PATCH] package/fontconfig: fix build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/02/2025 15:46, Thomas Devoogdt wrote:
> ../test/test-crbug1004254.c:28:10: fatal error: pthread.h: No such file 
> or directory
>    28 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Commit cef7358 "package/fontconfig: fix compilation on targets without 
> pthread support"
> fixed compilation for targets without pthread support, but that was 
> apparently nog enough.
> 
> Back then, I tested all the targets by using `./utils/test-pkg -p 
> fontconfig -a`,
> but somehow these targets didn't enable the fontconfig tests, so I 
> didn't see this
> compile failure. Fix it now by explicitly disabling the fontconfig 
> tests.
> 
> Fixes:
>  -  
> https://autobuild.buildroot.org/results/5f0/5f0c716c20788ba49a3a9f185251ded373a764cd/build-end.log
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
