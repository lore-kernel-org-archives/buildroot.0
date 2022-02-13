Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2753C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5737040360;
	Sun, 13 Feb 2022 11:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Twn1KNN9NkaQ; Sun, 13 Feb 2022 11:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6740384;
	Sun, 13 Feb 2022 11:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCA61BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520144033F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYTbZlMZiqqj for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E615840181
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:07:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b13so23131782edn.0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qv3OFS1npxOzmYWR1tkx5PNiyXMQmZGKMgfTnWra4NY=;
 b=XCsmHYfB6YfwagllVPe8gze6d13p6s86nPSBihlwfINU9g/IQS7x9d1OikMqW3DGTF
 p4Y4PGfoMOwMCfTXZYJqslA0jby3LEJtivb0unPY5fJknr3qOZOG+AJexOZODCDQdYwY
 vvB9R+q+ybicNRLIU3xLj+TaKBxMLcTXokImDYETiUElP1GW12KaOFbqUBekN0A/BGiO
 dZ3ylighI677xqolQW/7eEhpYP9EnHdziwO2Pge9NbXroGizApVel1D4J/vMIysPGP/G
 CzZ8ydVabScEQUj4Ks7+gIqbTAlvjI85+NUnflZMsIIqBIYFNaUn/gLIqgQkOOQLpPs+
 usow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qv3OFS1npxOzmYWR1tkx5PNiyXMQmZGKMgfTnWra4NY=;
 b=UcjvR4LXAUfEliGgVN4ch4cvP2CQlfVOdRLQYLYkT6pizPESvvBs4sJC6FAdTBSMsI
 K2o89qzswFUszP4YVzuZ9k4zLTX8xIRzGR+/fBXWJr6PzeBneRow2Hmqh7AYQyVisqck
 1HkRJHapRdhkoNzd2bD9WWkqkQ2PrwGeNotyiDfVwnwwhw9zR+g/gW3Mz/A6Vurp0MhQ
 4NnEqrHhwiUA6UVIOj4gbAlwSJRHPzxx9aaz6y6nE3kisKl4Z4OBX8PPWxixaj1cIRv+
 bKYGcxyzYMTucVfhsUkozn1iN7AhiBcadjr7zdGYEabvZwqTgquimbFZxif5Sh14q+QW
 X5UA==
X-Gm-Message-State: AOAM530/JWb6EyB67D72kJ7h42y6N/0PvsvOActkLhu4SkRbeXpUycg1
 3KYtdkVtHp4mLnXyXkKkF3Idig==
X-Google-Smtp-Source: ABdhPJxcABAzg+BCELNheAw64/+tDLw63Du8MwhOCS1kh2yHd2iBc+srIEJc9gtWR2twqq6LQO2Yhg==
X-Received: by 2002:a05:6402:84f:: with SMTP id
 b15mr10452964edz.206.1644750430012; 
 Sun, 13 Feb 2022 03:07:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g9sm9487099ejm.152.2022.02.13.03.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:07:09 -0800 (PST)
Message-ID: <2b888540-8ee9-fc8d-58e3-4a7d0c71da48@mind.be>
Date: Sun, 13 Feb 2022 12:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220202031745.448551-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202031745.448551-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] board: x86_64: Enable and mount debugfs
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 04:17, Joel Stanley wrote:
> Add DEBUG_FS to the kernel options, and modify fstab so it is
> automatically mounted at boot.
> 
> This is useful when testing.

  "This is useful when testing" is not much of an explanation. Why only for this 
defconfig? Why only debugfs and not strace, dropbear, gdbserver, and tons of 
other tools useful for testing?

  For now, I've marked this as Rejected but if there's a good reason we can pick 
up this patch again.

  Regards,
  Arnout

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   board/qemu/x86_64/linux.config  | 1 +
>   board/qemu/x86_64/post-build.sh | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/board/qemu/x86_64/linux.config b/board/qemu/x86_64/linux.config
> index e1d2ce01b004..2ed5c4194560 100644
> --- a/board/qemu/x86_64/linux.config
> +++ b/board/qemu/x86_64/linux.config
> @@ -50,4 +50,5 @@ CONFIG_EXT4_FS=y
>   CONFIG_AUTOFS4_FS=y
>   CONFIG_TMPFS=y
>   CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_DEBUG_FS=y
>   CONFIG_UNWINDER_FRAME_POINTER=y
> diff --git a/board/qemu/x86_64/post-build.sh b/board/qemu/x86_64/post-build.sh
> index bf83a002c2fc..0b27ab2c8074 100755
> --- a/board/qemu/x86_64/post-build.sh
> +++ b/board/qemu/x86_64/post-build.sh
> @@ -9,3 +9,6 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
>   	sed -i '/GENERIC_SERIAL/a\
>   tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
>   fi
> +
> +# Mount debugfs on boot
> +echo "debugfs     /sys/kernel/debug debugfs defaults 0 0" >> ${TARGET_DIR}/etc/fstab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
