Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B3C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1C3D4090C;
	Thu, 12 Jun 2025 20:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCIuFJZFDCFo; Thu, 12 Jun 2025 20:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B374089F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B374089F;
	Thu, 12 Jun 2025 20:03:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A5C183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABF780C7A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCd2xfRiZ7Bg for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:03:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4694580C78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4694580C78
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4694580C78
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 463191C0E09; Thu, 12 Jun 2025 22:03:23 +0200 (CEST)
Message-ID: <9a1bcbab-0ccc-4fa0-9645-203a6c13e94a@rnout.be>
Date: Thu, 12 Jun 2025 22:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250522195330.622072-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250522195330.622072-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758603; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6gOst+9VVnv4LdyzRC2Pf/QGz9Zxvfy3n5EQnnbpG6E=;
 b=H0gPpSiFV0QI6JMLHeP23AJ8UF/ryEJN+SXJR+Dy/DtvZTlYUuOYrN/o77BcsTHYYrKz6m
 ZTPvQZsDO72yVLZ6Hr08oxcDk8MfF5OnG7LlWfzjM2iEOYa3peU2haDes1h2JOoctqjEoB
 +rVdGLap0aMG/eyMeRkD61XN9OhXajpIxZPqoO4vCV3nEq0x1JExnu09hz87x/RM6Co4y7
 7YLOyAtzXXX48rL8pFWyjEvamAblPr6tt7M84mNGMHDN1SZ0kxO8kMk5MynxZJEe6VM6nI
 WM50uoT52tgsbfmVEdY+NElPDLgpSdMjQkWSjXexP2eWPaQFMonLNYzFWeaUtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=H0gPpSiF
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_timezone: fix
 test by setting a fixed time
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2025 21:53, Julien Olivain wrote:
> Since Buildroot commit [1], the runtime test emulator infra is setting
> the emulated system date to the host date.
> 
> While this is desired in general, this behaviour is introducing a
> variability in the test execution. Depending if the test is executed
> during winter or summer time, the output of the command "date +%Z"
> will produce a different output.
> 
> This commit fixes the issue by setting a fixed date and time on the
> emulated system. The date is fixed to Unix Epoch plus one hour. This
> is because Linux cannot set the system date to a value less than the
> system uptime. So we cannot set the time back to Unix Epoch with the
> command "date -s @0" (this would result to a EINVAL Invalid argument).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589073
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589081
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1832009356
> ---
>   support/testing/tests/core/test_timezone.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
> index bf4a47fcde..bfb9604f66 100644
> --- a/support/testing/tests/core/test_timezone.py
> +++ b/support/testing/tests/core/test_timezone.py
> @@ -9,6 +9,24 @@ def boot_armv5_cpio(emulator, builddir):
>                     options=["-initrd", img])
>       emulator.login()
>   
> +    # emulator.login() sets the emulated system date to the host
> +    # date. In general, this is desirable (for correct SSL certificate
> +    # behaviors, for example).
> +    #
> +    # This timezone runtime test checks that a Buildroot configuration
> +    # is reflected in the generated system at runtime, using the
> +    # standard "date" command. To make sure this test is stable in
> +    # time (i.e. output is independent to the date/time the test is
> +    # executed due to daylight saving time changes), we reset the
> +    # system date to a constant value.
> +    #
> +    # We cannot set the system date to a value less than the system
> +    # uptime. So we cannot set the time back to Unix Epoch with the
> +    # command "date -s @0" (this would result to a EINVAL Invalid
> +    # argument). Instead, we set the time at 1 hour after Epoch. This
> +    # is sufficient as the emulated system takes few seconds to start.
> +    emulator.run("date -s @3600")
> +
>   
>   class TestNoTimezone(infra.basetest.BRTest):
>       config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
