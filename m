Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AEDC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 18:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 000ED4167C;
	Fri,  7 Mar 2025 18:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x40y3fpjrQKL; Fri,  7 Mar 2025 18:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7113B4143D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7113B4143D;
	Fri,  7 Mar 2025 18:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 801EF1C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C07810DA
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYKDQkpiOU5q for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 18:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4237D80CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4237D80CDF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4237D80CDF
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:49:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 10E71B0059B;
 Fri,  7 Mar 2025 19:49:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Mar 2025 19:49:10 +0100
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 19:49:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <745bdcacbdff342d7e37dd1003a03923dc03b935.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <745bdcacbdff342d7e37dd1003a03923dc03b935.1740841539.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <8fb79f2dfe7c9cedca2e2e854e4b3c48@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741373354;
 bh=o12lErEutzHVTbtq+hIhGaRXr2/IjvUY0hfjjwwDKU8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=foL8YUkCqAXe2P3hlZhAn0V3Nppwd1W0RMnWHJLg9KWEsFsq35uT3f1bhA+CbJ51s
 Id4MvbqxrM955jYFTOnnvFCBVrzXpdlOYsI6uBLnfqLzvRwz4JSqE+mLxNCJEq9aHU
 Wp3Fi0nDYoHQzowLFKAPe+AyXD4LJqMwizd+eG/Vmq6/kSrC4Uj6U/6STQPJchyIm2
 tPefFNI11mS1fAX+2eQdRxV4RVAacLY7owBNxkgsN9AbGqFAs9WiVWdCg5erPz5Rlq
 EMKJ1ToYerF9uYX8nHniQSrEUvQTwIhyuloI87/yVHtF7ynDK7HTwvcbtyu3Xv56Z+
 9Br53x3cxcNDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=foL8YUkC
Subject: Re: [Buildroot] [PATCH 1/9 v3] support/testing: set date in
 emulated machine
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

Hi Yann, all,

On 01/03/2025 16:05, Yann E. MORIN wrote:
> When time comes to check certificates, the date and time in the 
> emulated
> machine should be close enough to the actual values, so that 
> certificate
> validity can be checked.
> 
> Set the date to the date of the system. This is going to be accurate to
> the second, which is, by far, enough for our purpose.
> 
> The Emulator() class doesn't inherit from unittest.TestCase, so we 
> can't
> call any of the usual self.assertXXX() methods; instead, we just raise
> a standard exception, like is done a few lines above to detect the 
> login
> prompt.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - catch failure to set the date
> ---
>  support/testing/infra/emulator.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/testing/infra/emulator.py 
> b/support/testing/infra/emulator.py
> index ef5be2a19e..9be1143944 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -5,6 +5,7 @@ import os
> 
>  import pexpect
>  import pexpect.replwrap
> +import time
> 
>  import infra
> 
> @@ -152,6 +153,10 @@ class Emulator(object):
> 
>          self.connect_shell()
> 
> +        output, exit_code = self.run(f"date @{int(time.time())}")
> +        if exit_code:
> +            raise SystemError("Cannot set date in virtual machine")
> +

Is this really needed?

Arm and Aarch64 qemu machines includes a pl031 RTC.
x86/x86_64 includes a mc146818 RTC.
RISC-V has a Goldfish RTC.

If we revert this patch, the podman runtime test still succeed.
In the runtime log "TestPodman-run.log", when the kernel boots,
we see:

...
rtc-pl031 10017000.rtc: registered as rtc0
rtc-pl031 10017000.rtc: setting system clock to 2025-03-07T17:38:24 UTC 
(1741369104)
...

I understand that it is not always guaranteed that the qemu machine
has a rtc and the used kernel has a driver for it, which is why we
would like to set the date like this. But this could be left to the
test implementer to make sure this is properly handled. And in the
podman test case, you did.

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
