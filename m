Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9455C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 852354059D;
	Sun, 14 Jul 2024 20:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JeWqPfKdDo2; Sun, 14 Jul 2024 20:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFEC405A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFEC405A1;
	Sun, 14 Jul 2024 20:36:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64A3B1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6175605D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Vtdzojwpslp for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6848460631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6848460631
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6848460631
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:36:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3679f806223so2733796f8f.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720989367; x=1721594167;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pziNlrO5S1qYAltVfdkL3VEgDmRYJtvk86gGX4XJsBE=;
 b=eXmoxee2T0/GTbFRUuh5RKQhK8wviYyHQ/dGvaWc8Q1drCSRMwItYBBRmrGH4HQTfk
 jznrAS+2LvrpPMCsVZnYa0Z0z+RfhQRm3GuEPSVwClFbt+fCqNTO5V4j4ZDQWMOWUNRM
 /xBQeh9v5HyYraaivOPLz8rtiG34+UuYWAfFp8Lst85IlWgOkaJJmVDmtbj8tEgDcrvC
 p/Vel4+Qr2xR55ccqE87rxayBvkV6JhJnp7XHye7kljdbPsk8vPFXvM9zEzTcu/uPsl5
 HBK6sV5gZAnynL6/O/WouZPsJ7sLm9CoxdiujFtb7VJjwDOUPKNJQpZxGk+ERugu3WtE
 1Tfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhCcClVHpvcVVj27G7fSn6QXbTH1vLNGzttGlDdUc6DHB736Wv7oXbo8vhgBYwSfWtJfZHoSqOPE9vTATIY7FPLHeFnd2KBQ==
X-Gm-Message-State: AOJu0Yz5Tze641BFUeSYwp5eStFSU35GE2ftHIAn+AQuAMUGwLCQauP2
 B+lRrY3akeGjcjO/KuN3FEEdU15r+Mrs+zeLgVusKrlPa+oUlmKbhFsO7v7xIrD6NCCyaWe3rCY
 YbZE=
X-Google-Smtp-Source: AGHT+IG/pe9u7BkucYgr8Bjz2cZHmakLhxDHbeA6qN2eZGpHsug7khYAWDVmwqEp3Lv8Vy9/2qlIsQ==
X-Received: by 2002:a05:6000:1844:b0:362:d7ac:ae70 with SMTP id
 ffacd0b85a97d-36804e7f68cmr7163904f8f.5.1720989366974; 
 Sun, 14 Jul 2024 13:36:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm4660204f8f.0.2024.07.14.13.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 13:36:06 -0700 (PDT)
Message-ID: <c322f791-e070-45f2-8399-5dbdda3688ca@mind.be>
Date: Sun, 14 Jul 2024 22:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240709-support-b4-v1-1-ef971fe9a893@collins.com>
Content-Language: en-GB
In-Reply-To: <20240709-support-b4-v1-1-ef971fe9a893@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720989367; x=1721594167; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pziNlrO5S1qYAltVfdkL3VEgDmRYJtvk86gGX4XJsBE=;
 b=HKNAIeWQWsIC2CzUtVpBqyHsHn6C8pO+nhX14GEERLYRznYI+n4p3JXPWuKiG170hZ
 6afx2jtXhe/060T7mseofW63o3BOv4a1yOpvs8b6kB7XC6qqBmfdI5gFfW0NWnKC/fK8
 mFQWeSgufMx0+A7tRgJrwYZMLQl4DhtN8byC7E8jJRIA14HGdnxWM5frSKc7llEEeBFM
 1zpBz4uu6A3DbCZ+gPmAalFPNpTYvcdHX2Iu4JGAutLkjCPV3cInXj7NvaLbFQfjJQi6
 iyAsZHvg3xYBhL/413GSaRVpaceGfgpCGlrSnuHImvrBAgxNu4U5Y2qGnqcLVeGUIweW
 mjSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HKNAIeWQ
Subject: Re: [Buildroot] [PATCH] .b4-config: configure `b4` for Buildroot
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



On 09/07/2024 16:16, Brandon Maier via buildroot wrote:
> `b4` is a commandline tool to make patch-based development easier[1]. It
> is primarily used for Linux kernel development, but can be configured to
> support any project that has a public-inbox endpoint. Buildroot has a
> public-inbox mirror at "https://lore.kernel.org/buildroot/".
> 
> We configure some basic settings that tell `b4` where to send patches
> and how to use get-developers.
> 
> [1] https://b4.docs.kernel.org/en/latest/
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied to master, thanks.

> ---
> I am planning to send a future patch to hook `./utils/check-package`
> into `b4`. This reminds users to run check-package with `b4 prep
> --check` before sending a patch series. But support for custom check
> commands is broken in the latest version of `b4` and I am waiting on a
> fix I submitted upstream[1].

  In addition, check-package doesn't accept patches as its input at the moment. 
IIUC that's what the check hook is supposed to receive.

  I have the following in a post-commit hook:

git diff HEAD^- --name-only --diff-filter=ACM | \
         xargs -r ./utils/check-package

but I don't think that "git diff" command can be reused for handling the check 
command.

  Regards,
  Arnout

> 
> [1] https://lore.kernel.org/tools/20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com/T/#u
> ---
>   .b4-config | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000..1943458f2f
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,7 @@
> +# Configuration for the `b4` tool
> +# See https://b4.docs.kernel.org/en/latest/config.html
> +[b4]
> +    send-series-to = buildroot@buildroot.org
> +    send-auto-cc-cmd = "./utils/get-developers -e -"
> +
> +# vim: set filetype=gitconfig:
> 
> ---
> base-commit: 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
> change-id: 20240626-support-b4-41d61b8e4d60
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
