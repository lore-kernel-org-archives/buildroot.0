Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B46CC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1D141305;
	Mon,  3 Feb 2025 11:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBNo3HwNwDyK; Mon,  3 Feb 2025 11:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A7741339
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A7741339;
	Mon,  3 Feb 2025 11:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54BEC1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444F641339
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3KP6IFpjcwG for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF4A341305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4A341305
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF4A341305
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:55:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso43436405e9.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 03:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738583701; x=1739188501;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMt/IrGfLp4uVcXIXHU9Fwcc2Mk3evlFI+qg9M9wP/8=;
 b=Sk08cxUaMV7WA36esOJlljABoTnkew1TvDGv5LMqa5nxZCdQekS+v5KRnB+qKfM+Fe
 5CMf0neqV/YBhPO+ZG6K56XI7Eriac0Lu1672j8ZOPCpYRTJjQnqDk1C54IOApXV1D7N
 ciqb1rVOOQp7NgfFOTKzQrnvpf6pYsUICv5I7fXkIp5uJhCnN33XX49fOjSdS+1YzatJ
 qEriAfBIicfg2vgf31tvJ2uujRfvmuPL3fTeypPknlnO5iSl4WTd4Qj71jqmVFxzTc9k
 p/NX4ow5Q8atW0QysdSKcwHDe/kitnxt01jPiaEF0xP9Vv9HUV0PM10VHQlV61lF4Xib
 R1IQ==
X-Gm-Message-State: AOJu0Yz4HdYAds6cZ/uPLPpIHt7H43c6UjfiN4xR+2p5wHHP6ngemcee
 UhbejcZykYrEEo8nQo2OzhaAPMenSR5Dx1oC8tMpJjvR5snMd5WbG4y/RMvWCShsEpF7+PIJscr
 J
X-Gm-Gg: ASbGnctGVspG5IqOoCzsRkaMdFEqsgbvS7trZpJLaobfxwahxPllHcPHq2yncGxmABG
 t7Fti60HmFNx1Q62TMTnPjF2VTrqi7ZEhCXMS45v3nqR7gskt8ICG9sHnsZA6HPY53nZh03iMkh
 BhylklIlbZDijejZcr0pYU8FsQVSscKGPNej19OGZyXQwR/sm9KgweNxtLMmAtCSxTgivMtTKz+
 CyG2xVD2jjw54PDsS/uBOMhSOf7gqySQll7LDd5D9Qq43vIlefJfS7FG8A0RiGfxMnVRAW0SBpj
 9fQ2UThaJz2vOgkxUU9oGup9fzZGfmgpLaUEdJ2iTcwWGNo=
X-Google-Smtp-Source: AGHT+IH/SiL9orN484E9ZUcGWtUpqKPesvWKieXZLpzv73GCCDchAtUyHNfdpnh3qTs6afK4Yge1JQ==
X-Received: by 2002:a05:600c:296:b0:438:e256:a77d with SMTP id
 5b1f17b1804b1-438e256a851mr145232235e9.15.1738583700516; 
 Mon, 03 Feb 2025 03:55:00 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5e53sm151102435e9.17.2025.02.03.03.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 03:55:00 -0800 (PST)
Message-ID: <ccac23c4-8de4-45e2-afc4-8d3ae6a041f3@mind.be>
Date: Mon, 3 Feb 2025 12:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241115224753.1074295-1-ju.o@free.fr>
 <20250131223620.GA1139889@pevik>
Content-Language: en-GB
In-Reply-To: <20250131223620.GA1139889@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738583701; x=1739188501; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jMt/IrGfLp4uVcXIXHU9Fwcc2Mk3evlFI+qg9M9wP/8=;
 b=cQaYz+xsnj3sMpsitjay2tpmbieS5VavPAjbyCcYhbpyPIkgABoShwM0v/i0kn3Jnr
 gB2MShwi+yQkxreNq481udoiVaWcuDi1j7hwG4Cwjq1SV/sYlBRJlCTgE2Fd5oQoKgV/
 UIDQZ80zJu1zg1ospjevEru44njUgVOZpwts86efwK13uRPWlMaGG41qOjW0w7axIPJO
 LbCD9oJrGxir4vidjawTYfC4Yjk0HnDghA+O5j8QeVVw3sbaV4LlayWvbDSux5PdihZs
 RXyGGNOMWLQoECODyRNalBGGlPloUENKcL/lsVGWPLoCOfWTzCAzeZ5AXJnRHHLiqIw2
 Mi+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cQaYz+xs
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new ltp-testsuite
 runtime test
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Petr,

On 31/01/2025 23:36, Petr Vorel wrote:
[snip]
>> +        cmd = "/usr/lib/ltp-testsuite/runltp"
>> +        cmd += " -p -q"
>> +        cmd += " -s ^read0[0-9]*"
>> +        cmd += " -l /tmp/ltp.log"
>> +        cmd += " -o /tmp/ltp.output"
>> +        cmd += " -C /tmp/ltp.failed"
>> +        cmd += " -T /tmp/ltp.tconf"
> 
> While this above is OK, some notes:
> 
> 1) Many LTP tests require LTPROOT environment variable (to access some data files),
> e.g.:
> 
> export LTPROOT="/usr/lib/ltp-testsuite"
> 
> See https://linux-test-project.readthedocs.io/en/latest/users/setup_tests.html

  Since only a limited set of tests are run, it's apparently not needed.

> It looks to me that infra.emulator.Emulator does not support inserting
> environment variables via os.environ.

  No, the environment can be set as part of the command itself:

cmd = ("LTPROOT='...' "
        "/usr/lib/ltp-testsute/runltp "
        ...
       )

> 2) runltp old script has been deprecated, kirk is the replacement:

  Ah, annoying. I think we'd probably prefer to run some tests directly then, 
without runltp at all. The point of this test is not to run the actual LTP 
tests, but just to verify that ltp-testsuite has been installed correctly.


> https://github.com/linux-test-project/kirk
> 
> Currently kirk supports few testing frameworks: LTP, kselftests and liburing.
> 
> While kirk can be run o SUT (like runltp), the best usage is to run it on the
> host. It supports testing via starting QEMU VM, SSH and not yet stable LTX
> backend.

  Starting via Qemu is possibly annoying because then we no longer control how 
QEMU is booted. SSH could be interesting, but currently the image doesn't have 
an SSH server by default. So I think running kirk in the test environment 
directly is probably the easiest for us.

  Regards,
  Arnout



> 
> Due the above I'd like to add kirk host package to Buildroot.
> 
> Kind regards,
> Petr
> 
> 
>> +        self.assertRunOk(cmd)
>> +
>> +        # We print the LTP run log and check there was zero failure in
>> +        # our test selection.
>> +        out, ret = self.emulator.run("cat /tmp/ltp.log")
>> +        self.assertEqual(ret, 0)
>> +        self.assertIn("Total Failures: 0", out)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
