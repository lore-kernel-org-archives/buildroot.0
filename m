Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D5BCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50AD81947;
	Mon,  1 Apr 2024 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAy_3F394cro; Mon,  1 Apr 2024 20:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E180D819FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E180D819FC;
	Mon,  1 Apr 2024 20:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78C8E1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 661A481A18
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5DuSxy4Q2Di for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D52A381947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52A381947
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D52A381947
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:07:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B8DAA13F861;
 Mon,  1 Apr 2024 22:07:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 22:07:05 +0200
Date: Mon, 1 Apr 2024 22:07:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZgsT6bGX-fi2_V7l@landeda>
References: <20240401172051.68246-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401172051.68246-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712002027;
 bh=knc6epeLg6BvP7wRVzKLYILVd/H4fNyRwomENiHxTZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S1xudqA2yFZDi3taQi6/8fMu6xXb4kQFtqXcfWHQpY87Rah2NJe4WyEb47wLb2EON
 JnZgKJtwSc5p0QhxS2cJ8sHhxhWiUudIFCs/meFLoFrbJYN88XdLoeMbrhdERsXZRS
 L5F467rNKaxsMbPbvQZrXQfx6O0pvdUcGaXI/DnZA8Y/O5SB9xafA1/ik1VinzOB3z
 VcsL7JAEa3V/yqsHSyKKqGStpLG010N2+mPGe0vQWBJh/cgYVCFom26KKiabeiW2ar
 9LgudERDXPhufAiNJ+uuyF6r89GdsxWE0gVicR6cMt6SGHrzTWglRg91GojocDc1Uy
 z02yVeUMsB9jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S1xudqA2
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fix trace-cmd runtime
 test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, all,

On 2024-04-01 19:20 +0200, Julien Olivain spake thusly:
> The trace-cmd runtime test has a typo and fails with output:
> 
>     Traceback (most recent call last):
>       File "/build/buildroot/support/testing/tests/package/test_trace_cmd.py", line 53, in test_run
>         self.assertEquals(exit_code, 0)
>         ^^^^^^^^^^^^^^^^^
>     AttributeError: 'TestTraceCmd' object has no attribute 'assertEquals'. Did you mean: 'assertEqual'?
> 
> The issue can be reproduced with the command:
> 
>     support/testing/run-tests \
>         -d dl -o output_test \
>         tests.package.test_trace_cmd
> 
> This commit fixes the issue by removing the extra 's'.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_trace_cmd.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
> index e7d5e13bce8..5d37aef375f 100644
> --- a/support/testing/tests/package/test_trace_cmd.py
> +++ b/support/testing/tests/package/test_trace_cmd.py
> @@ -50,5 +50,5 @@ class TestTraceCmd(infra.basetest.BRTest):
>          # Check we have occurrences of "kmalloc:" in the trace report.
>          cmd = "grep -Fc kmalloc: trace.txt"
>          output, exit_code = self.emulator.run(cmd)
> -        self.assertEquals(exit_code, 0)
> +        self.assertEqual(exit_code, 0)
>          self.assertTrue(int(output[0]) > 0)
> -- 
> 2.44.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
