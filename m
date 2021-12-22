Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38142C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACF1481D19;
	Wed, 22 Dec 2021 14:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCm89etlIwZr; Wed, 22 Dec 2021 14:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC9982848;
	Wed, 22 Dec 2021 14:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4310F1BF9AF
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3192360DFC
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIOPjnbQGJ8t for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 14:06:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC91960BC3
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 14:06:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id bm14so9166321edb.5
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FvhlcttY7B4IWmZCwmvK4eMAX1V4ekjl9o1pGiDLdYc=;
 b=fG32QF3tT8bxFm9ozfdtJHKPSgs685SWmXf7PT5CrfAYppq5DTntYk6WthFeWUD/pE
 XZKQe9rRKaD6AOEw9PyetjfeV2oFfahjgiMdHN5PqPIuqD7ZHOODVHx4fCypHNLnyUCp
 iQRIleSFRmxee2zvSHmiOHjhy0fV5N9tGvtJ6U1HvpcJfXq9DLNsEEtkkjZ+YNE61pAD
 /ZWbSP+LOidO8NUw5ZteCiivniAquK02rB2MNTtb17jRN8tyV4D7UGPyN462a1FvxkXa
 1TFlXydQxO92jFPWF8G58MUfbw5W/kp5qN9M0MlA3Pk1mdF+EHzI6ei6LFpFJBVdLwsC
 dIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FvhlcttY7B4IWmZCwmvK4eMAX1V4ekjl9o1pGiDLdYc=;
 b=frHRWb2eDnORKacnxtU4Hoq5Eb6MZyz6WRbCpgJEN1Wj5KpQwhhek+JvMjoHk6hhsB
 9RgEAzDnaNfjAeWqoI/3qa126T3EUgkSes4b59VSTYwrzOCq97cl0wTE9SuL7VzlCeFF
 PcFey01sOvhPr6nfuAwvOADwGMWj7UZdDWp68xMAS7SYXoLMoBbO/KEr9I5u1rZrtV9u
 7nKYllNFsn/Bx8UBUgclhTXcf80AwNU5k3F+R/VA5mM9NH7SLXIk3NUWxqoAYj0+YAc4
 zDw63iCCs8YfegaWtxfvuZiNiZ8xNqi0xkZM80aKDQV1pib/69t0BZep/cz4vHB7kTq0
 v4Dw==
X-Gm-Message-State: AOAM531lr3Xpg8RWybAr1uYlRO7BoUSE+2sDWkePKB0Qgdu+ycp8AAvb
 Fk29pO4lZ2GD6c6xGzkvoeu4Dw==
X-Google-Smtp-Source: ABdhPJx5iGJP2N56LcfDkNnP8Ip4c4/bszQ/75JL5f6sQVDWDcefVHpL62i4ZKUpiXBoTkYBMdNtyQ==
X-Received: by 2002:a05:6402:128e:: with SMTP id
 w14mr3075026edv.161.1640182010990; 
 Wed, 22 Dec 2021 06:06:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ht16sm787451ejc.4.2021.12.22.06.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 06:06:50 -0800 (PST)
Message-ID: <bdbe868c-2ed5-1012-cc85-4c393fb7739d@mind.be>
Date: Wed, 22 Dec 2021 15:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-2-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211222083515.1150267-2-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/makedevs: allow recursive on
 directory with symlinks
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/12/2021 09:35, Joachim Wiberg wrote:
> When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:
> 
>    /etc        r  -1 root     wheel     - - - - -
> 
> makdevs fails due to it trying to chown() a symlink:

  The problem is actually a *dangling* symlink, not a symlink per se.


> 
>    makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
>    makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
>    make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
>    make[1]: *** [Makefile:84: _all] Error 2
>    make[1]: Leaving directory '/src/myLinux/buildroot'
> 
> This patch changes chown() to lchown() in two cases in makedevs.c when
> the argument can be a symlink.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   package/makedevs/makedevs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index c57b964f5c..634ae7c3d8 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -440,7 +440,7 @@ void bb_show_usage(void)
>   int bb_recursive(const char *fpath, const struct stat *sb,
>   		int tflag, struct FTW *ftwbuf){
>   
> -	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
> +	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {

  In this v2 you change the chown, but the chmod below still remains. Doesn't it 
have the same problem with a dangling symlink?

  Regards,
  Arnout

>   		bb_perror_msg("chown failed for %s", fpath);
>   		return -1;
>   	}
> @@ -628,7 +628,7 @@ int main(int argc, char **argv)
>   				if (mknod(full_name_inc, mode, rdev) < 0) {
>   					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
>   					ret = EXIT_FAILURE;
> -				} else if (chown(full_name_inc, uid, gid) < 0) {
> +				} else if (lchown(full_name_inc, uid, gid) < 0) {
>   					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
>   					ret = EXIT_FAILURE;
>   				} else if (chmod(full_name_inc, mode) < 0) {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
