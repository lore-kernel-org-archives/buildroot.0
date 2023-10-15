Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE6CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1587402D0;
	Sun, 15 Oct 2023 20:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1587402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxXRoIYS3O7T; Sun, 15 Oct 2023 20:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 898C340B22;
	Sun, 15 Oct 2023 20:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898C340B22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078561BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1634611A3
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1634611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3R8kW3Qh3DXz for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:05:24 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75659607FF
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75659607FF
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so3157414f8f.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400322; x=1698005122;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BqVU2y00MaBJzKT8lwkvISK/nZ0q2KCyrT00DMOXiOY=;
 b=dk9hmxkLuZTxsVnG3WNRqdFS6w7jZuf4AcDF9NonglofsfYr/7ZzW+/mpuHyxQ25pi
 /npT1IvXGuw2KOTOp3sjX6gkuSU7NkD0W9t5ZTKy5FMckTgv5Zr3oJhdTI76i+ZBwT5a
 pm2rYQN7DzReHcPPhzuA/xgP3+zYxIVBIKVKxE25812LjJEbNNOmUEd9YvTiDXuDpKPw
 YeKlqSNza6fzXp2ILbaM8hirlt5lvoYJv+oaNyV5fVVAJc7Zb/KZ/WWBnwzALbGADwsA
 KgoyQuYNB1Pi0DPVIBT0CH/EWu1SpHJrzmVsP7WpH8F41CiTieIbMV8epUdTRXCFfg2T
 GuXg==
X-Gm-Message-State: AOJu0Yw/3RfTwhTy/ViD+AgMJh7vWwndDuoxkF3uWaVsmahUpzqZOjrB
 +ywwRvziLsj6i8jzyQW4nC18HYXDeoQXeIl56x8=
X-Google-Smtp-Source: AGHT+IHMVZ/R5xLPlpyVvUhvtE3MgLKmeTcEhXFDuts59qjzj1uXhAeZ4wSWi24A/ANqLuzX7mSr6w==
X-Received: by 2002:adf:fc91:0:b0:32d:9d99:d0a5 with SMTP id
 g17-20020adffc91000000b0032d9d99d0a5mr4568679wrr.5.1697400322522; 
 Sun, 15 Oct 2023 13:05:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a170906069800b00997e99a662bsm2677909ejb.20.2023.10.15.13.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:05:22 -0700 (PDT)
Message-ID: <4a66d4aa-0a83-818a-d0fa-462ef39cd83f@mind.be>
Date: Sun, 15 Oct 2023 22:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20231015093532.1139778-1-bernd@kuhls.net>
In-Reply-To: <20231015093532.1139778-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400322; x=1698005122; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BqVU2y00MaBJzKT8lwkvISK/nZ0q2KCyrT00DMOXiOY=;
 b=DAd1xiz53GmJqBM7ZU8jo7UXNVIfpQzhYon0Isrk+uFRe12N9LCXvPw9kSPKEQ+3Jj
 8iswrVM6p6WbRIpUcf3IfyOiqCR/IG+DXme3vySzV/+jG0sE8bEpV7Vuo9SYfg6Zbvhw
 PxkH8BkOfe1L8eq/aqA6W2cUd7it097JJodbk1j2c+IW95IUA9vg5E6zjLlAs+Vgd3aY
 kYO1unACaYls3BszSAg0kcaC/bIcu4vCgpla+mo9k2pm1TNa/eW350LwbFdj9yOAog2t
 3V76AsahBPO8Je533zd+5XlIQZegVTqcHeSZALReqfb9Y3UDlQJRl3vTZwAqRIC7cgR2
 0l/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DAd1xiz5
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.1
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



On 15/10/2023 11:35, Bernd Kuhls wrote:
> Removed patch 0004, not needed anymore due to upstream commit
> https://github.com/samba-team/samba/commit/a25f549e9a03010996300b04271a7909b6fbf756#diff-6e2c3d973b3ce82db7b4f67111e36116517b040ed64c28f40114d2e0d535706a
> 
> Release notes:
> https://www.samba.org/samba/history/samba-4.19.0.html
> https://www.samba.org/samba/history/samba-4.19.1.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-Use-perl-module-JSON-part-of-core-i.patch | 41 -------------------
>   package/samba4/samba4.hash                    |  4 +-
>   package/samba4/samba4.mk                      |  2 +-
>   3 files changed, 3 insertions(+), 44 deletions(-)
>   delete mode 100644 package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> 
> diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> deleted file mode 100644
> index aa55c09891..0000000000
> --- a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sun, 7 May 2023 11:02:26 +0200
> -Subject: [PATCH] 3rdparty/heimdal: Use perl module JSON:PP, part of core, instead
> - of JSON package
> -
> -Downloaded from
> -https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: https://github.com/heimdal/heimdal/pull/1176
> ----
> - third_party/heimdal/cf/make-proto.pl | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/third_party/heimdal/cf/make-proto.pl b/third_party/heimdal/cf/make-proto.pl
> -index 36a040ce6c0..ad21dbad9e1 100644
> ---- a/third_party/heimdal/cf/make-proto.pl
> -+++ b/third_party/heimdal/cf/make-proto.pl
> -@@ -4,7 +4,7 @@
> - use Getopt::Std;
> - use File::Compare;
> -
> --use JSON;
> -+use JSON::PP;
> -
> - my $comment = 0;
> - my $doxygen = 0;
> -@@ -70,7 +70,7 @@ if($opt_x) {
> -     my $EXP;
> -     local $/;
> -     open(EXP, '<', $opt_x) || die "open ${opt_x}";
> --    my $obj = JSON->new->utf8->decode(<EXP>);
> -+    my $obj = JSON::PP->new->utf8->decode(<EXP>);
> -     close $EXP;
> -
> -     foreach my $x (keys %$obj) {
> ---
> -2.25.1
> -
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 9843d419f0..5e65295e4c 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.18.8.tar.asc
> -sha256  4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1  samba-4.18.8.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.19.1.tar.asc
> +sha256  ce3b7f0d18bf91aa5fd646e8bb385a3b35375b703c6e5123b02b85a1abc81879  samba-4.19.1.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 9cf7a59d9b..124ce564d2 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SAMBA4_VERSION = 4.18.8
> +SAMBA4_VERSION = 4.19.1
>   SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>   SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>   SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
