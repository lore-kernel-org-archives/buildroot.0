Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCA9C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D84340589;
	Sun, 14 Jul 2024 07:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMItTQZ2G4hl; Sun, 14 Jul 2024 07:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04ED94058B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04ED94058B;
	Sun, 14 Jul 2024 07:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2C4F1BF3E5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFDD5401B2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUj_YY5yfMwJ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 07:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDFD940010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFD940010
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDFD940010
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:41:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so19301965e9.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720942882; x=1721547682;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5VNrN31CnkYxLRXMC1XfeoGmZ5MWwGfKfw7vs/oCr0=;
 b=HK78/ipiuyd0dMj0hLIYM+aCbbHGYIYPrHe6tMKt/Np3Dzbhv36T3M89l7/0zIW5C3
 Hd4q8+cW2ysTKE7Dq7qI9BHryx0PqjSGTYVHDfcEOAhCbqYJrORWfeKH+sTymhrhk97n
 wa0GifLG62v/U8ImdMPxCal+fPR+qSUGr/X/e2Q/ZLXUVIzIVTZrhvZru1WaakAvmuAc
 r0yKmp6gDr2OCMCtNfUZ40HSbOSkrWo6sIjuXELaiUBitnwdCkXoabSPWttHjCYV7Q+l
 zImgl0jAqfeTQKmJ4D65YnIUtyBhcaMzc7k5BclA1EnqIAeUmVs5ncx6pdATAkv8UXvi
 LLEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/4lseG2AkdoeLmQkXo+hvBAoqprlwYi48MsquhxYoMIiLL9DDZfEvQgRDQlZxvHT4wRppfLYxrrTnpuhfv71pEsz7MjTjTw==
X-Gm-Message-State: AOJu0YzkDlGExPX3mPTehRWjj/TMxOkPPngZctM0fSR4TzG7xQfKdwyb
 GgpaIEK2kRpwrjqLhnRSOkzEUAqwMRc0lnr3m9tSsLT3YFpsY3+6okD1O6sUfA4=
X-Google-Smtp-Source: AGHT+IHD4kJtkyoENDIw039h4pVLBuwOwNu7ALnAQ8lr5NrDAQ1hmF4432gnAlw9DZjmMOfYtiUHsA==
X-Received: by 2002:a05:600c:524c:b0:426:65b0:3035 with SMTP id
 5b1f17b1804b1-4279da3a671mr64738075e9.15.1720942881748; 
 Sun, 14 Jul 2024 00:41:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef44a9sm42951715e9.40.2024.07.14.00.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 00:41:21 -0700 (PDT)
Message-ID: <d3e1c7e1-59a5-44dc-8f7f-0108cb501095@mind.be>
Date: Sun, 14 Jul 2024 09:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <9d4bffd033df7518f8ce488faff9379f1f993591.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <9d4bffd033df7518f8ce488faff9379f1f993591.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720942882; x=1721547682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a5VNrN31CnkYxLRXMC1XfeoGmZ5MWwGfKfw7vs/oCr0=;
 b=TQohdGUOzvE7G86X3EkhATP1j1/NqUddjUxvr8KL3z/LjPcuIXpHzX/7YkzWsvJvKI
 QqK/ozyQtnnky1hpnkMTWiwe/zslcV1E0bJbGrb5WTG7rIDRsjbCwvcPi49F/XJb6gzn
 /fjgku8mkCeNnN8jC7/VNxXd0qz2fnfR6gbLtIdzmR6BD+jcvijl/DNBT9kWFiWqjWZk
 Yj5XgmdtxFOSCjQAq8EhHRgRlZrDHb0HpR6L59Ha/42643iO5OYqhQ6ZN5T67ZZ1QV1C
 WB495kdQQbmO9LycabfFcCKN5VCi1dYQmutxsm64WNgRbFc/a8duLBoHHG/X7MEyQcIu
 zkuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TQohdGUO
Subject: Re: [Buildroot] [PATCH 04/20 v2] utils/checkpackagelib: instruct
 shellcheck to follow included files
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:05, Yann E. MORIN wrote:
> We do have a few shell scripts that have source directives (either with
> 'source' or with '.'), and they all are currently either globally
> ignored in .checkpackageignore, or have shellcheck directives to ignore
> the source statement (SC1090).
> 
> So, we can safely instruct shellcheck where to lookup for sourced files;
> that does not trigger any new error.
> 
> This will alow fixing some shellcheck errors in later commits.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>   utils/checkpackagelib/tool.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
> index 907ada704f..e12e1fa406 100644
> --- a/utils/checkpackagelib/tool.py
> +++ b/utils/checkpackagelib/tool.py
> @@ -31,7 +31,7 @@ class Flake8(_Tool):
>   
>   class Shellcheck(_Tool):
>       def run(self):
> -        cmd = ['shellcheck', self.filename]
> +        cmd = ['shellcheck', "-x", self.filename]

  I've changed this to --external-sources so future me doesn't have to open a 
man page to know wtf -x means.

  Regards,
  Arnout

>           try:
>               p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>               stdout = p.communicate()[0]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
