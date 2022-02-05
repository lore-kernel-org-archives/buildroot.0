Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D2FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9497140160;
	Sat,  5 Feb 2022 22:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5RgVYlIs4VZ; Sat,  5 Feb 2022 22:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A874016D;
	Sat,  5 Feb 2022 22:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A64F41BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1DE44043B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 086-m5nI_LNy for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:14:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92CBB40160
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:14:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id s21so2307705ejx.12
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xmKCRjAKRilVOzqe9XDga1dXuzUKksC/TkRJJTp2X4M=;
 b=WevPlkU28ULFFl6Gcym9RP+n6hxh5vt5MDh9XZVz3p4j6Q2LaTEQj/JoZ1Hrhe4KVi
 NSaPwhXVQyt4URC+oiH2THYrVRLoiL0/LTvt2e7jzQVg2r/patgzxpLcqaX1iVcByIgt
 IzAxHU41oGPuTWtwbJ7piGFHhXcMGln9sQ1Ei+cO6Vw6Tg7V591rowbWbVdOAPewAyUV
 G470jEFjFnSJg8a8E7sv/SSRblySlO8CBUNWSmQ5TP8zRzW3MzhhOLtI7KmTzsHakwRt
 YeDM/JBBRas9cOx1bqJgWu4SOOw5S6z1Rxf4zAyYm72NwVpDBOPPrOPuWGtTe+u0IAGA
 kjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xmKCRjAKRilVOzqe9XDga1dXuzUKksC/TkRJJTp2X4M=;
 b=6OULP3kLhCOHCs1/1QK89aEDPDTlXh6MKPIKj/Gh3PeT6KVPf5WI8E7s2ur2aXBH/C
 NUtHaCtK7LBE9aTIGYHY7kY2B0NZeOkvCww8yaOqawDrmGkmGxNkR6OVjTlOUsyyMFEc
 tlZwIYj6FYOhq0REuC6vEG66eTyd+xXuM6SqtCeO9Sk+bYhpDghKQHGtjecasYl5AmTF
 WcB6yfAELsG22we8yJlhrmhpRYf0AdkgrZP5yIPltTTZZvtnCO3qWKKDeZiVjeshajZh
 MelmLYjUuV1JbqAMKsz0hgFOY5/sn7uboYkCWPF/mlAODp13+Ol8hQiXmxUKABTFw5T0
 wAJg==
X-Gm-Message-State: AOAM531CzQIBQT4VOsRIKtgF+iXjRO4lJroqgcV8fsXd83T7I3gwrMZb
 JGgcFUsZi48czVqfKiR3nQtuXQ==
X-Google-Smtp-Source: ABdhPJw59SCttOlFnA6domO7G/sKyNW0JhS9FdiFz08LWnq9wExAdjGAQUxUhDTZFlzREKTAFPXpDQ==
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr4480942ejc.278.1644099256840; 
 Sat, 05 Feb 2022 14:14:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h16sm2019625ejj.56.2022.02.05.14.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:14:16 -0800 (PST)
Message-ID: <1cc78242-026c-6c70-04b6-4c76a15fe6d7@mind.be>
Date: Sat, 5 Feb 2022 23:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
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

  I changed this to decide on user or system ID based on the uid:

             if [ ${uid} -le 0 ]; then
                 auto_id=${uid}
             elif [ ${uid} -le ${LAST_SYSTEM_UID} ]; then
                 auto_id=${AUTO_SYSTEM_ID}
             else
                 auto_id=${AUTO_USER_ID}
             fi
             for g in ${groups//,/ }; do
                 add_one_group "${g}" ${auto_id}
             done

  It seems to work well.

  Regards,
  Arnout

>               done
>           fi
>       done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
