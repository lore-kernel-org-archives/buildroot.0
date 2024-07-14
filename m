Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704ACC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 11:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B5C405F7;
	Sun, 14 Jul 2024 11:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwMnRoXt4Eeq; Sun, 14 Jul 2024 11:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722DC405EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722DC405EF;
	Sun, 14 Jul 2024 11:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32CD61BF3EC
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20994605DD
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfekChtgcFQR for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 11:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9CB660598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CB660598
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9CB660598
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:19:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so22624505e9.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 04:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720955969; x=1721560769;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hpm8M/blIDytl8dwWL7qVVF76VWR1iUQRoe9ersHPRg=;
 b=YzQwXQFLaJVKGaXaKHbIFD9mN06rWr1cRBB1L6rLYGjWcVsOaynuT5jq30f/zD/brS
 EBEdkoaxYSyl4DXmkK6YJXf1G2pQ/QqW+6ucgfzMgi45RhxJwDdw43AXOPBzH7v+ZeFB
 JSlgO6D7fQt+jlkbJR0Nhig+/7cpNavA3lO416U/jwT/UnhfgVw8WUJ4POY01i/fdFth
 UQeNd02HJjQSGcox8xTkcFA/HwtZayNkTfz5NlKpvFpO5LIK2jqOgBm876GGzy0Auc4l
 B1X0j+XsKLaUBok2qVWt91kwY8EokUklpLNS/CU8JvxQACS/8+qcuNv9cs6UGHPglsPl
 pMpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKo4ARnU266SkUIsrpcATScs2Dh+RM2f5B/mFnto6qnFXj+waZetuC/UAVhjrnTY5Kbx3I1DuSo+dOAwPG/bvFN9JzpB06vw==
X-Gm-Message-State: AOJu0Yw+/V64aQBvunuaBiuIzp/exlZTgooLbdyxHa/K9lVr8M03lbPF
 OMchOjFh6WJNGLYVpdibYkuk9fqGIifPYF0CriWUX+KD6dgDOcmsQlZoP5Em+hWd/yDDW5dIlvh
 4/SU=
X-Google-Smtp-Source: AGHT+IGeO/gAvnweFM+1QVnvBmj9MmDLtRrTDh6zMKq73D/JodC2MI61bj517kd4vcUUJQwXJpEG5w==
X-Received: by 2002:a05:600c:4c15:b0:425:7796:8e2c with SMTP id
 5b1f17b1804b1-426707d8b58mr116647025e9.12.1720955969121; 
 Sun, 14 Jul 2024 04:19:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e996c1sm48990905e9.25.2024.07.14.04.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 04:19:28 -0700 (PDT)
Message-ID: <30940a3c-24de-4ca1-bd88-37817f308aa3@mind.be>
Date: Sun, 14 Jul 2024 13:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
Content-Language: en-GB
In-Reply-To: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720955969; x=1721560769; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hpm8M/blIDytl8dwWL7qVVF76VWR1iUQRoe9ersHPRg=;
 b=Lwx5g+fUTZzY44pDzodTar1rcdFOTpw/NpEzsGAf5HzX0A9qesU+F4GBq2qrr1u9pg
 Fuc/D6ThaEixPqpX6s15Y+Ldtuejy3Y/XMO5/3k47OH3bQFBYXzLVtBUIi7xwXq82ZmH
 YDjwL3NAJJL0MOah1gUPvVGJT3uW1rhOLwupuHLUxvjiXo1QzWRchX4h6bzmMmCbprF0
 F2RCpzH4gLQH4LfTkNdbCZ9XhYwrNFJxiRA9K8jUuDYrxDaIEQ/JFR3uY/IC6HrCzFsu
 FFbnVlpE69UzER5+bTZSw5K6p1Zn0S32Du2IAgZhcPEGzmbPGC04lP7TLsotiV7u/r/D
 f02g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lwx5g+fU
Subject: Re: [Buildroot] [PATCH v2] support/testing/infra/emulator.py: fix
 qemu prompt detection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Brandon,

On 12/07/2024 21:31, Brandon Maier wrote:
> From: Brandon Maier via buildroot <buildroot@buildroot.org>
> 
> The qemu.run() method can break when a command happens to output the
> string "# " to stdout. This is because qemu.run() detects when a command
> has completed by searching for the shell prompt, which by default is
> "# ". It then captures everything before the "# " as the commands
> output, causing the rest of output to be lost.
> 
> Instead use the pexpect libraries REPLWrapper to handle running
> commands. It has hooks to set a custom prompt and avoid some other
> pitfalls of wrapping a shell.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> I tested this against a couple tests and test_bash.py which Yann noticed
> is special in Julian patch series. I am running a full test run but
> that will take awhile, so sending this in the meantime for review.

  I'm also running the full battery but it will take +- 20 hours to finish.

  I've merged already. If there's breakage, we'll fix it :-)

  There are a couple more changes I made:

      - Make all arguments to _repl_sh_spawn non-optional.
      - Move non_printable_insert to a local variable instead of an argument,
        we don't need to override it.
      - Copy the comment from _repl_sh that explains why non_printable_insert
        is needed.
      - Add a comment about timeouts.
      - Rename spawn to child (we don't actually spawn anything so this felt
        more natural, even though the class
      - Use single quotes instead of triple quotes, and explicitly escape the
        nested quotes.

  I also pushed one additional commit that adds a copyright header. The copied 
_repl_sh part makes the file ISC licensed in addition to our default GPL-2.0, so 
it's better to make that explicit.

  Regards,
  Arnout

> 
> Changes in v2:
> - Rewrite to use pexpect REPLWrapper (Arnout)
> - Link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240522154616.1265769-1-brandon.maier@collins.com/
> - Link to Julian Olivain version: https://patchwork.ozlabs.org/project/buildroot/patch/20230611104518.337528-1-ju.o@free.fr/
> ---
>   support/testing/infra/emulator.py | 56 +++++++++++++++++++++++++++++++--------
>   1 file changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 624740fcb1..c586603787 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -1,12 +1,38 @@
>   import pexpect
> +import pexpect.replwrap
>   
>   import infra
>   
> +BR_PROMPT = '[BRTEST# '
> +BR_CONTINUATION_PROMPT = '[BRTEST+ '
> +
> +
> +def _repl_sh_spawn(spawn, orig_prompt, non_printable_insert='\\[\\]',
> +                   extra_init_cmd="export PAGER=cat"):
> +    """Wrap the shell prompt to handle command output
> +    Based on pexpect.replwrap.bash()
> +    https://github.com/pexpect/pexpect/blob/aa989594e1e413f45c18b26ded1783f7d5990fe5/pexpect/replwrap.py#L115
> +    """
> +
> +    ps1 = BR_PROMPT[:5] + non_printable_insert + BR_PROMPT[5:]
> +    ps2 = (BR_CONTINUATION_PROMPT[:5] + non_printable_insert +
> +           BR_CONTINUATION_PROMPT[5:])
> +    prompt_change = "PS1='{0}' PS2='{1}' PROMPT_COMMAND=''".format(ps1, ps2)
> +    return pexpect.replwrap.REPLWrapper(
> +            spawn,
> +            orig_prompt,
> +            prompt_change,
> +            new_prompt=BR_PROMPT,
> +            continuation_prompt=BR_CONTINUATION_PROMPT,
> +            extra_init_cmd=extra_init_cmd
> +        )
> +
>   
>   class Emulator(object):
>   
>       def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier):
>           self.qemu = None
> +        self.repl = None
>           self.downloaddir = downloaddir
>           self.logfile = infra.open_log_file(builddir, "run", logtofile)
>           # We use elastic runners on the cloud to runs our tests. Those runners
> @@ -97,26 +123,34 @@ class Emulator(object):
>           if password:
>               self.qemu.expect("Password:")
>               self.qemu.sendline(password)
> -        index = self.qemu.expect(["# ", pexpect.TIMEOUT])
> -        if index != 0:
> -            raise SystemError("Cannot login")
> -        self.run("dmesg -n 1")
> -        # Prevent the shell from wrapping the commands at 80 columns.
> -        self.run("stty columns 29999")
> +
> +        extra_init_cmd = " && ".join([
> +            'export PAGER=cat',
> +            'dmesg -n 1',
> +            # Prevent the shell from wrapping the commands at 80 columns.
> +            'stty columns 29999',
> +            # Fix the prompt of any subshells that get run
> +            '''printf "%s\n"  "PS1='$PS1'" "PS2='$PS2'" "PROMPT_COMMAND=''" >>/etc/profile'''
> +        ])
> +        self.repl = _repl_sh_spawn(
> +                self.qemu,
> +                '# ',
> +                non_printable_insert='\\[\\]',
> +                extra_init_cmd=extra_init_cmd)
> +        if not self.repl:
> +            raise SystemError("Cannot initialize REPL prompt")
>   
>       # Run the given 'cmd' with a 'timeout' on the target
>       # return a tuple (output, exit_code)
>       def run(self, cmd, timeout=-1):
> -        self.qemu.sendline(cmd)
>           if timeout != -1:
>               timeout *= self.timeout_multiplier
> -        self.qemu.expect("# ", timeout=timeout)
> +        output = self.repl.run_command(cmd, timeout=timeout)
>           # Remove double carriage return from qemu stdout so str.splitlines()
>           # works as expected.
> -        output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
> +        output = output.replace("\r\r", "\r").splitlines()[1:]
>   
> -        self.qemu.sendline("echo $?")
> -        self.qemu.expect("# ")
> +        exit_code = self.repl.run_command("echo $?")
>           exit_code = self.qemu.before.splitlines()[2]
>           exit_code = int(exit_code)
>   
> 
> ---
> base-commit: 5543661bc0c1ebcd01e5e6bf5ac565fd0f1ac8d8
> change-id: 20240712-pytest-qemu-prompt-detection-34f3ed337b09
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
