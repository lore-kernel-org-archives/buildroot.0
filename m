Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E329241626;
	Tue, 19 Apr 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtgYnWOWNEnu; Tue, 19 Apr 2022 20:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89BE3415C9;
	Tue, 19 Apr 2022 20:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 468351BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B4883E50
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yOyXYf--DAp for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C90283E47
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:31:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 21so22823117edv.1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vVAA5JjcfJYleEWVnAVqar6NAYoLLkbch460ZM1mG4M=;
 b=MuZykfHxgpAtIwxLx9JMU1CuaZ570iSd+TIljjlQHLvVZHgD5R49roVH2Q3lZo/WdC
 SIGVKP8kRHM4D20BNPv9xAjUzO4goASHolmqSCjC+XbY2YoqHGaxKAwRHY4iBbC/rdpb
 84AT+e4XC+gvAkCV4YG0D5+A/equvfDyz1EYuGMx2vQ+asr/tKfAOD0VSNO01jS7qPF9
 WPcRzxwG27qAlCd+4iNfRdqnoxUcoRw2lkysoK3v5sCqOQk4h30o1X236CVbxCdBxsJU
 I5uTzTsyDYw10zLtZhL7/+JruuvmZJbskYrYgDCkxKQJYtSDhPsRMkp/9bOZWLYukYBf
 yQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vVAA5JjcfJYleEWVnAVqar6NAYoLLkbch460ZM1mG4M=;
 b=2Ss6IHv4c0/2ebU0M/xaQeY5e8BVita0Oy9hC5jNO51QB7NqvCV4RusbmztDvOnU9F
 XnQUY6HKzIOjZuUdVbOUtPzVTVjaDg1DCocwZ8HrP0UFmsruxptuEGv4EpKZEg/n5gff
 ohIhRezo5I86KbPp2BbdxiP+PTmaBSqDFAsxZ9lEZy28LSRsiOwvp1xMkXrjsPMIahGt
 kccOMOSjZePIPpsm2ZX/tiHb4SSqP3UXf8ed7S0ZgY8N5/CzCwGw0boo2A7I/gE2NaQl
 6eIOItpEk2Q1cngOIfkYIgDQQza1yPYDukKNkJVw4qDx5IRrFPS8wa/zawYHOwLXmVa6
 6Qug==
X-Gm-Message-State: AOAM532DgU3uagl1I6ii1jHpF8pCWhBnW+T0FV0DJHptUYSa8l20Or0c
 vAZeQxjZPMFtzFWxKckjvFdogGGSsQds3A==
X-Google-Smtp-Source: ABdhPJx/P1Rnv/yAj6/JPeOIqT3NDaeZvaWuTwzOhWq6N//mta5RSmdSpIT4fjrqgIBs8My0ecKqCg==
X-Received: by 2002:aa7:d904:0:b0:41d:728c:6cf1 with SMTP id
 a4-20020aa7d904000000b0041d728c6cf1mr19014139edr.366.1650400281083; 
 Tue, 19 Apr 2022 13:31:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a1709067c0c00b006e86db76851sm5950621ejo.193.2022.04.19.13.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:31:20 -0700 (PDT)
Message-ID: <087b047b-348d-cd25-8f40-4a551851c38b@mind.be>
Date: Tue, 19 Apr 2022 22:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220419111714.1647112-1-marcus.hoffmann@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419111714.1647112-1-marcus.hoffmann@othermo.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/gzip: security bump to 1.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 13:17, Marcus Hoffmann wrote:
> Fixes the following security issues:
> 
> CVE-2022-1271: arbitrary-file-write vulnerability
> 
> zgrep applied to a crafted file name with two or more newlines
> can no longer overwrite an arbitrary, attacker-selected file.
> [bug introduced in gzip-1.3.10]
> 
> https://www.openwall.com/lists/oss-security/2022/04/07/8
> 
> Other changes:
> 
> ** Changes in behavior
> 
>    'gzip -l' no longer misreports file lengths 4 GiB and larger.
>    Previously, 'gzip -l' output the 32-bit value stored in the gzip
>    header even though that is the uncompressed length modulo 2**32.
>    Now, 'gzip -l' calculates the uncompressed length by decompressing
>    the data and counting the resulting bytes.  Although this can take
>    much more time, nowadays the correctness pros seem to outweigh the
>    performance cons.
> 
>    'zless' is no longer installed on platforms lacking 'less'.
> 
> ** Bug fixes
> 
>    zgrep now names input file on error instead of mislabeling it as
>    "(standard input)", if grep supports the GNU -H and --label options.
> 
>    'zdiff -C 5' no longer misbehaves by treating '5' as a file name.
>    [bug present since the beginning]
> 
>    Configure-time options like --program-prefix now work.
> 
> Release Announcement:
> https://lists.gnu.org/r/bug-gzip/2022-04/msg00011.html
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gzip/gzip.hash | 4 ++--
>   package/gzip/gzip.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
> index 1cf73ff912..80b86f4797 100644
> --- a/package/gzip/gzip.hash
> +++ b/package/gzip/gzip.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz.sig
> +# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
>   # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907  gzip-1.11.tar.xz
> +sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
>   # Locally calculated
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
> index 92588fcdb8..2092df363c 100644
> --- a/package/gzip/gzip.mk
> +++ b/package/gzip/gzip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GZIP_VERSION = 1.11
> +GZIP_VERSION = 1.12
>   GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
>   GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
>   # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
