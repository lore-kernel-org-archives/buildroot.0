Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F60C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561AC40734;
	Mon, 15 Jul 2024 14:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXy-MWcP8nGm; Mon, 15 Jul 2024 14:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2E8340A51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2E8340A51;
	Mon, 15 Jul 2024 14:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39D761BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2682D4035F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSh7cE0meHJ6 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C74F640363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74F640363
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C74F640363
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:51:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3679e9bfb08so2431758f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721055086; x=1721659886;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rxvLYMJz4L2nwt9B8eFkoI4Cf2oyWvZgAR0i0plKzic=;
 b=Y3aE08cqX+LwaghwMOZo+54GnqC99c/44A52pPPS3k+/8WEwUw4dt8bKfr3KeasW8f
 r8cEvFPFlxdDVTppIuEg8ifLNNa0klDpmrmwWMWRgUr4O+J751hlAX5QS+pfaEhr0UHd
 EPDv2cVeR4IAs/PEe+WUNYQ3F3FxqGHtBVTHCGpF2SQeMOs/Pp5slGoW7YzyFrJ7ADf5
 /4LCos696Ax3dc94PexHjFjy4TlbraD4XZ3mYT5MNn8xx/DMtDfaIawgrboYY8nlI/DX
 Eu5fbNRDpUz+plNGcvyLg81ErL333ht98y8ruOL4tI+YDylhktQFDOqK18o+dMzLsagg
 aHCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAU79pac6X3Eds9imR8nJkpsyPhvyUcul6F0S80/HpvqO2pALlXe435UoJTWQm5/6rTH4QkfapFNR4Ui2T7mKQlTQvlkiJ5g==
X-Gm-Message-State: AOJu0YzsTGErfJcpLOyLY4TUPW0EseigLWhNvZaaiCOjjd2taQgpU6e2
 qDkiuMoqDOmNOVWvQOdcNmqNh/DPXhZcuQV+w3Cdp0HtGVdO3x8/blk9Gmb6XY3R7F4TrNBatpH
 C1js=
X-Google-Smtp-Source: AGHT+IFnilSj85+h+PRd6f6bJagRmoGId4QlfJrYJoVOHFvPBWqSUu+JVUNCyKc519BZqTdJMD+EGQ==
X-Received: by 2002:a5d:518d:0:b0:367:8e06:d5cf with SMTP id
 ffacd0b85a97d-367ff6ee125mr8117116f8f.13.1721055085798; 
 Mon, 15 Jul 2024 07:51:25 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db046e2sm6639019f8f.105.2024.07.15.07.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:51:25 -0700 (PDT)
Message-ID: <e752e21e-e072-4c45-a515-93d414e1fb99@mind.be>
Date: Mon, 15 Jul 2024 16:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240715-support-testing-s6-networking-fix-v1-1-f6fe7d3fcf51@collins.com>
Content-Language: en-GB
In-Reply-To: <20240715-support-testing-s6-networking-fix-v1-1-f6fe7d3fcf51@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721055086; x=1721659886; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rxvLYMJz4L2nwt9B8eFkoI4Cf2oyWvZgAR0i0plKzic=;
 b=GCzO9WOBhknMXqv7JKwr+a9GW86dY2GY72+AjIPs45PF8n+uQemlZMLdoHOh4z9we1
 YzxrX10ZMkS7gaoG2tQIlJsJ1LzYcBFtSwMGiOfDuo6BILtw+mCfWRvjc78RnMMY+NBe
 6OfB6a+GS2wwgAw29igFc7maxPhGG+7NV8EhOSMEvvn22yjMHDkNnnYzLbSNup5+pL1f
 u3mf7olUQNhgcMR84htctB+JU+IX5jcWHIqONEXDI/5Iaf0sbPdRaCH28QzBAClC5bf/
 3RV8KH/wAUZEVh4/I0t1IrHk2n5BroirAqcwa+W8ybAJNtHCF97+SnKr/snk0scf8EEE
 1P9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GCzO9WOB
Subject: Re: [Buildroot] [PATCH] support/testing: fix
 package/test_s6_networking.py
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 16:00, Brandon Maier via buildroot wrote:
> This test fails with the following error
> 
>    -sh: s6-tcpserver4: not found
> 
> In release 2.6.0.0 of s6-networking the `s6-tcpserver4` was unified into
> a new `s6-tcpserver` command[1].

  D'oh! A compatibility symlink would have been too difficult of course...

  Applied to master, thanks.

  Regards,
  Arnout


> 
> [1] https://github.com/skarnet/s6-networking/blob/master/NEWS#L33
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>   support/testing/tests/package/test_s6_networking.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_s6_networking.py b/support/testing/tests/package/test_s6_networking.py
> index 1fe1b81668..bbbaefdf94 100644
> --- a/support/testing/tests/package/test_s6_networking.py
> +++ b/support/testing/tests/package/test_s6_networking.py
> @@ -28,7 +28,7 @@ class TestS6Networking(infra.basetest.BRTest):
>           self.assertEqual(output[1][0:5], "after")
>   
>           # Test the TCP server and client
> -        _, exit_code = self.emulator.run("s6-tcpserver4 127.0.0.1 1024 cat &")
> +        _, exit_code = self.emulator.run("s6-tcpserver 127.0.0.1 1024 cat &")
>           self.emulator.run("sleep 2")
>           cmd = "echo foobar | s6-tcpclient 127.0.0.1 1024 s6-ioconnect -67"
>           output, exit_code = self.emulator.run(cmd)
> 
> ---
> base-commit: 51a58ff0624f62ca0fa0ca6494928e8bd1410f69
> change-id: 20240715-support-testing-s6-networking-fix-28e7573197e7
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
