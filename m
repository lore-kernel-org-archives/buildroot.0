Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B32C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 12:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 461B28142E;
	Sun, 16 Jan 2022 12:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUxVBiuSDkQm; Sun, 16 Jan 2022 12:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801FA813EB;
	Sun, 16 Jan 2022 12:27:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1BDB1BF32C
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF348402EC
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ySbrH9zW3ea for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 12:27:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 076CB40236
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 12:27:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u21so53402441edd.5
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xfI+/1IE47sIBajD2IQsooFHNoD39mpqmDWBUbyyiKM=;
 b=QGjTETmcyCPW6pePR9MDBRbXwN+uIrbgq0eMFNghG00K6wN9uGY1vnLQCpDz2oW7Gq
 jNF7Z05LKK+LcpnytwT82BiTs4xhljh55/GyCuLYx5v/jwcBzMwRhQUQD+RQQuYdw7e0
 SXd4/1Kqv8LxKtEuySxW70M9QF3Imz8tXniUcfW14AnVN03PT6ffFu8jCnyUYoHol2PZ
 rfUvQ/B0j2zLOvR8OHvbBF4X+Xbk5HOHwWF8VILzVo2QfU2MWdRz30w21Ch6kwxk2GFX
 WgMir7+ip71D333Q+q/hdjD4oAaZ/z7zF6yHSU6ZEF6QsWTH5PLbRL7QVtMOxY1pqG7F
 r5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xfI+/1IE47sIBajD2IQsooFHNoD39mpqmDWBUbyyiKM=;
 b=oZoo3Th24jqBfJ8MfntPCbj323Nlrvy2pNLtHpK4xD3Lj9YmTiVLShKxGhiHzofItl
 PpymrH8S8foe8TzM/6G1wNszpj8J9Gi/srdZOqFsr9VdbIkV/2An7ioJAYl8fMq9lvtX
 0iNcP0U+kXvW8+I1Nc+3eEozAuPEjUtILe9trCj2kEOF+clZwhwey1Jg+md1cKQR8ROY
 E84pDs8VUEeayxMHIccwvBMssrTxUZ4hAkFTMrVNMjWdav8agAQE+qBOAu4cpxkeVnzk
 aNgqbKz+dAaMt2GAKwfMK7nia9z0eP33i+L9pytcssvhga0K/AqYbvjpOhyJCz/kAufD
 3nxg==
X-Gm-Message-State: AOAM533BHL9NRYIbvXXxAb/0P4qWvYmxSuLhFI5pba5r/iIzMtGb5u9R
 RcvdGPnNK7wvn4TBcUbNHtUxSbS5eAq0OQ==
X-Google-Smtp-Source: ABdhPJzqMxnWAX+9TSut5Vjo7nIJQXVEkK1nJiAge6g3IhOCL31hK2KmTkxKQQdXZdvnLbrC5Xlcjg==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr16625374ede.162.1642336036982; 
 Sun, 16 Jan 2022 04:27:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qw28sm3407359ejc.154.2022.01.16.04.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 04:27:16 -0800 (PST)
Message-ID: <38a29a75-9f0a-a7b5-cdf3-16d54c00e2a0@mind.be>
Date: Sun, 16 Jan 2022 13:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220114101247.342256-1-nolange79@gmail.com>
 <20220114101247.342256-2-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114101247.342256-2-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] mkusers: change default from normal to
 system user
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 11:12, Norbert Lange wrote:
> for all packages, this is the fitting default,

  Ah, this is where I saw the remark! :-) I should have read the entire series 
before commenting.

  This patch should be squashed with the preceding one.


  Since my only remarks are nitpicks, I'm going to merge it as is (after 
squashing) - but later. So I'll already give it my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> but the fallout will be user provided tables.
> 
> Also update the docs with the chagned behaviour.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   docs/manual/makeusers-syntax.txt | 11 +++++++----
>   support/scripts/mkusers          |  6 +++---
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
> index 467e596230..3d1013f447 100644
> --- a/docs/manual/makeusers-syntax.txt
> +++ b/docs/manual/makeusers-syntax.txt
> @@ -20,13 +20,16 @@ Where:
>     It can not be +root+, and must be unique. If set to +-+, then just a
>     group will be created.
>   - +uid+ is the desired UID for the user. It must be unique, and not
> -  +0+. If set to +-1+, then a unique UID will be computed by Buildroot
> -  in the range [1000...1999]
> +  +0+. If set to +-1+ or +-2+, then a unique UID will be computed by
> +  Buildroot, with +-1+ denoting a system UID from [100...999] and +-2+
> +  denoting a user UID from [1000...1999].
>   - +group+ is the desired name for the user's main group. It can not
>     be +root+. If the group does not exist, it will be created.
>   - +gid+ is the desired GID for the user's main group. It must be unique,
> -  and not +0+. If set to +-1+, and the group does not already exist, then
> -  a unique GID will be computed by Buildroot in the range [1000..1999]
> +  and not +0+. If set to +-1+ or +-2+, and the group does not already
> +  exist, then a unique GID will be computed by Buildroot, with +-1+
> +  denoting a system GID from [100...999] and +-2+ denoting a user GID
> +  from [1000...1999].
>   - +password+ is the crypt(3)-encoded password. If prefixed with +!+,
>     then login is disabled. If prefixed with +=+, then it is interpreted
>     as clear-text, and will be crypt-encoded (using MD5). If prefixed with
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index 9d8295e8a3..f7a3180e30 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -14,8 +14,8 @@ LAST_SYSTEM_UID=999
>   FIRST_SYSTEM_GID=100
>   LAST_SYSTEM_GID=999
>   # argument to automatically crease system/user id
> -AUTO_SYSTEM_ID=-2
> -AUTO_USER_ID=-1
> +AUTO_SYSTEM_ID=-1
> +AUTO_USER_ID=-2
>   
>   # No more is configurable below this point
>   #----------------------------------------------------------------------------
> @@ -433,7 +433,7 @@ main() {
>           read username uid group gid passwd home shell groups comment <<<"${line}"
>           if [ "${groups}" != "-" ]; then
>               for g in ${groups//,/ }; do
> -                add_one_group "${g}" ${AUTO_USER_ID}
> +                add_one_group "${g}" ${AUTO_SYSTEM_ID}
>               done
>           fi
>       done
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
