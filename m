Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38ADC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9D5D40217;
	Wed, 22 May 2024 19:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qG2hobAVAMc; Wed, 22 May 2024 19:05:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0BF40328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F0BF40328;
	Wed, 22 May 2024 19:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 824FE1C5EC7
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9C381A23
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ma19Y7mINHTB for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 19:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA7CA805B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7CA805B8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA7CA805B8
 for <buildroot@buildroot.org>; Wed, 22 May 2024 19:05:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E4A3513F88F;
 Wed, 22 May 2024 21:04:54 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60722])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 May 2024 21:04:54 +0200
MIME-Version: 1.0
Date: Wed, 22 May 2024 21:04:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20240522154616.1265769-1-brandon.maier@collins.com>
References: <20240522154616.1265769-1-brandon.maier@collins.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <a27d5bf51fad0eb68dfbc1faee805b8d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716404698;
 bh=XiH+AiE53LQJuE+FUfsg3/0iH6XEXCkP2LHw3f+qOPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UPeVsgqTsGIOVZIY+Xjg4MTHtmKYYcPVtBSAO0OMS75eIyzJ/Q1mm6j6OU1tkMTz7
 /68/qHExEUuNOmxsT4ZEkIYrK1IRr51JxcTU+pwjIr3/8baeGfbJlJiY2y+0KWpbQ1
 QmhhXAzCfIOfFPtTWM8Jf/Rs8yjC/eJHmYH2NIfzoLBZuK4yj1R54ab2dTRnpL4Yjz
 dHfDyrvmKuA0OgYqymhWoO6XZKa1j8rLu4IudktLBcRFDlqByen41W8TyxC9QicX2E
 NwGIHT5AUEiaQLYoDV5QVrUDTKhy+S3E84sl9Q0xiEiOi69STtAiAg9L7lyp5LuRv/
 OOCFlXvL+HSxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UPeVsgqT
Subject: Re: [Buildroot] [PATCH] support/testing/infra/emulator.py: fix qemu
 prompt detection
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon, All,

On 22/05/2024 17:46, Brandon Maier via buildroot wrote:
> The qemu.run() method can break when a command happens to output the
> string "# " to stdout. This is because qemu.run() detects when a 
> command
> has completed by searching for the shell prompt, which by default is
> "# ". It then captures everything before the "# " as the commands
> output, causing the rest of output to be lost.
> 
> To work around the issue set the prompt to something more unique. This
> makes it less likely to appear in command output.

I proposed a similar patch last year:
https://patchwork.ozlabs.org/project/buildroot/list/?series=362761

Changing this prompt requires to also patch the "bash" runtime test,
which is failing if the prompt is changed in the emulator.

I think my patches were not included due to lost 3/4 and 4/4 patches
in the series from my email provider. Those patches were originally
in the v2. See:
https://patchwork.ozlabs.org/project/buildroot/list/?series=359185&state=*

> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  support/testing/infra/emulator.py | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/infra/emulator.py 
> b/support/testing/infra/emulator.py
> index 624740fcb1..aa579443a6 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -100,6 +100,13 @@ class Emulator(object):
>          index = self.qemu.expect(["# ", pexpect.TIMEOUT])
>          if index != 0:
>              raise SystemError("Cannot login")
> +
> +        # Set a prompt that is unlikely to appear in command output
> +        self.qemu.sendline("PS1='br-qemu-test# '")
> +        index = self.qemu.expect(["\r\nbr-qemu-test# ", 
> pexpect.TIMEOUT])
> +        if index != 0:
> +            raise SystemError("Cannot set test prompt")
> +
>          self.run("dmesg -n 1")
>          # Prevent the shell from wrapping the commands at 80 columns.
>          self.run("stty columns 29999")
> @@ -110,13 +117,13 @@ class Emulator(object):
>          self.qemu.sendline(cmd)
>          if timeout != -1:
>              timeout *= self.timeout_multiplier
> -        self.qemu.expect("# ", timeout=timeout)
> +        self.qemu.expect("br-qemu-test# ", timeout=timeout)
>          # Remove double carriage return from qemu stdout so 
> str.splitlines()
>          # works as expected.
>          output = self.qemu.before.replace("\r\r", 
> "\r").splitlines()[1:]
> 
>          self.qemu.sendline("echo $?")
> -        self.qemu.expect("# ")
> +        self.qemu.expect("br-qemu-test# ")
>          exit_code = self.qemu.before.splitlines()[2]
>          exit_code = int(exit_code)
> 
> --
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
