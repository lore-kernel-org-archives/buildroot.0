Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B63CD8CB4
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA3460F69;
	Tue, 10 Oct 2023 20:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA3460F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4t7eUUMpqaI; Tue, 10 Oct 2023 20:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3AB60F51;
	Tue, 10 Oct 2023 20:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A3AB60F51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 005A61BF2CD
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBE6D410E3
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE6D410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_I6rQiTXhLB for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:01:58 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E7ED408AC
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7ED408AC
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so44898066b.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696968116; x=1697572916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hw3AiPp1Tk1Yysz44HRCLm/Xyy0mi2ynJAhbeeToiXc=;
 b=ehtlc9/xkwRfSp7mhWWgNcCGhDNiXYOzWBdx3DyTpc2kZ74NI6+FiQKwu3PSgN7Q35
 1LT8TLKbZojDQUWuhw1oZ8kCZ+oMYsBXxEw1LZWWfQlYHIRh6iivMPaxFb3/EC9COMtd
 t4BrF0FlFu25XaMWzVvH/C1/XtWTFEHWJBJqdmdQxKdubAwknGniaBVn7HQHL5SXyoBe
 MTkTNtYY3DJYkFYnj9zXO+JBLMLjfg+FexFpNwVu79st5FxSkVmlt5nI2atC6scTZJF5
 RDoaERjsh83CmuJTbqu8Bxf/3jxyGQnBp+3CSJYkTn/u0LGCsHbSwamYL0rds1Qr6FBj
 xEnQ==
X-Gm-Message-State: AOJu0YzIWYOI5re01w9K+fs/9FJ9A/Ka8UGZWDbn0jCnjzLzfdE6lFRh
 z/dldx6gtHLZK1shJmOk1FmqCdJJ9YQavJFtgQg=
X-Google-Smtp-Source: AGHT+IFssAYVN+TvCudL1GevSt+2kNU4AwjzyDa1aGMkYPWrVQ0Wgo74fa/B9GszJDyzt3pFvxCxjA==
X-Received: by 2002:a17:906:7113:b0:9b2:bcea:e517 with SMTP id
 x19-20020a170906711300b009b2bceae517mr16145970ejj.10.1696968116506; 
 Tue, 10 Oct 2023 13:01:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090617c200b009ad8084e08asm8722087eje.0.2023.10.10.13.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:01:55 -0700 (PDT)
Message-ID: <8cf0f4df-0b95-4253-cee5-91cfc2b74205@mind.be>
Date: Tue, 10 Oct 2023 22:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115125253.280257-1-nolange79@gmail.com>
 <20230115125253.280257-6-nolange79@gmail.com>
In-Reply-To: <20230115125253.280257-6-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696968116; x=1697572916; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hw3AiPp1Tk1Yysz44HRCLm/Xyy0mi2ynJAhbeeToiXc=;
 b=A5+81HVcyq0Qz+0VzcIonvMYA++MLJRkrq42a8+jGvgURkpE48VZbRigJ1CWjBoLbs
 9m1P0hSnn1AbJ4AaigPyhfDV+d0dETuwZa7CDUINWvziFo7PdmoL0ejc8Nu/19Q+cFBM
 mVfXDnmXxaP7uLGGHfW6M+GTx5qKT3mehtwZBdB57CUVr+PYju+Z/N2yKO6fhyGuH0kE
 51gHlU9XRdWrN3QvT9F9tyaDE3mHOA5eHF+TFIpKuMSqkUezPz4nFSDWTqVXPDrgzihw
 MywDJ3eZWtdLL2oos29Cu+pXGTjXJ1XXBuZLRAqrKaE5zaGoF1VU+FF5uCmHShEg1cma
 46AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A5+81HVc
Subject: Re: [Buildroot] [PATCH 5/7] package/skeleton-init-systemd: fix
 var.mount options
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 13:52, Norbert Lange wrote:
> The mode should reflect the mount directory,
> and 755 is the default - so drop the mount option.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/skeleton-init-systemd/var.mount | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/var.mount
> index e97accef93..a681ab0c54 100644
> --- a/package/skeleton-init-systemd/var.mount
> +++ b/package/skeleton-init-systemd/var.mount
> @@ -12,4 +12,4 @@ After=swap.target
>   What=tmpfs
>   Where=/var
>   Type=tmpfs
> -Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
> +Options=nosuid,nodev,size=50%%,nr_inodes=1m
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
