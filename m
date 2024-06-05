Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D9CC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F37FB4042C;
	Wed,  5 Jun 2024 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7CcVNT_tLAR; Wed,  5 Jun 2024 21:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9F8E413A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F8E413A8;
	Wed,  5 Jun 2024 21:51:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A11871BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8F0408C0
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zsiIsQXTnlV for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64A8E4042C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A8E4042C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64A8E4042C
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:51:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4215afa33b7so3515115e9.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717624273; x=1718229073;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MprnxcCqyELjGLP2kT0kIKKqnr16uEa6NhClaObfSoc=;
 b=DI7xt9OEUQ0ou03UhQgXWpQzoJPxzyszDzpPhmfNlk8+deVYpub7nVq92rD/EutaMn
 hVA5MCKs5y1yKE8DZuqTB+OzjEYE0MLsnutxyeKx0HyH2XpaefV9oDL+qsxaPFOW6tU0
 zdB0gq0El1YZ+TcHLS4dBB3BIgaPD5cafHb2F7sEelgG2jsIA6x0UZ1dXoy0mF4it7Dv
 Bt/Vlqjh9OCLu3rn+wOfY5zwDappoGeJTloNzf0u/qvse0NjYm+0O1ibj09PqnZdXM5q
 QCgpBjkUs9PvhYcrm5hTg2kOXQzVA8nrnFMOdNZwnav8lYk3wrpLCu1fGFL9Ee0p0P9A
 S9DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ZOs+m7IItBZ0dgzZv1Kgfo7btbyTTWxoKSCjNGX7xREoiiqD8IbvqvsHWg6I6skCt+Ad5Ji4ATlvjuAwxYjgg73Q4IJpZg==
X-Gm-Message-State: AOJu0YwZ9a42EQIM8XITtZF2KR9vEWL8aOlTngTCPd4rSzCUWFn96fxe
 XP4r/ull9+cmTNMar8lAYOy7Y298RXS/IpCV+UbFgDCWHx8ubw2isLeRUmE/l3Y=
X-Google-Smtp-Source: AGHT+IE+b98UzddS54XwVrKhj/PcxIZtINwHP4dzMgRGAwFtidvzzq9YUZqjY2HmjT67pKF7uSjRbw==
X-Received: by 2002:a05:600c:3108:b0:419:d5cd:5ba with SMTP id
 5b1f17b1804b1-421562c7de5mr31970115e9.7.1717624272369; 
 Wed, 05 Jun 2024 14:51:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c738bsm1073815e9.32.2024.06.05.14.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:51:11 -0700 (PDT)
Message-ID: <25b1bcd0-69c1-40d5-a29f-13f093a8495d@mind.be>
Date: Wed, 5 Jun 2024 23:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <14bb90c566707dbbe9c66b7cf5ae2a05413eeb40.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <14bb90c566707dbbe9c66b7cf5ae2a05413eeb40.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717624273; x=1718229073; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MprnxcCqyELjGLP2kT0kIKKqnr16uEa6NhClaObfSoc=;
 b=eHUv1CfWt0SkuCQcKhLI2SzYGd/xaWf/adtQs+yQ3SYxRdTcLy/64qBJcKZ6ci1qFZ
 crt+LNqHKzQU9r8wvC9PWCLFUfecYfyhIpBr0SrL58YVz5pFgRVoLyBwY1UtnLxVVmbI
 tu5B3VKwBtdiN7B3WvTBp8NOyJg0W/OjL71TBIDlaZstnkqqhUTj18JeDyf4KfPtpuNF
 9oCvhJimCFYWoiWVjXil05ZHiSwrmPucPQGbqENbenvfCA5quam+GEMY8Q100FIl/rey
 Oe5ZmD/NEu+UUF/sWSZeDUv+Ud0LnUlRJnuGIDuvenlgvm0j1m2eU9j/wwtc0UkXKMia
 0HFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eHUv1CfW
Subject: Re: [Buildroot] [PATCH 09/10 v2] support/scripts/apply-patches: use
 appropriate TAR
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
Cc: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
> 
> ---
> Changes v1 -> v2:
>    - use ${TAR}, not $(TAR)  (Brandon)
> ---
>   package/Makefile.in              | 2 +-
>   support/scripts/apply-patches.sh | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index f415e55f84..9dc66bc674 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -231,7 +231,7 @@ endif
>   INSTALL := $(shell which install || type -p install)
>   UNZIP := $(shell which unzip || type -p unzip) -q
>   
> -APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
> +APPLY_PATCHES = TAR=$(TAR) PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
>   
>   HOST_CPPFLAGS  = -I$(HOST_DIR)/include
>   HOST_CFLAGS   ?= -O2
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 6da83f6826..4e633b23be 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -146,7 +146,7 @@ function scan_patchdir {
>                   unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
>                   rm -rf "$unpackedarchivedir" 2> /dev/null
>                   mkdir "$unpackedarchivedir"
> -                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
> +                ${TAR} -C "$unpackedarchivedir" -xaf "${path}/$i"

  For this one, there's actually completely no need to use ${TAR}. Still, it's 
better for consistency, so I just added a note to the commit message.

  Regards,
  Arnout

>                   scan_patchdir "$unpackedarchivedir"
>               else
>                   apply_patch "$path" "$i"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
