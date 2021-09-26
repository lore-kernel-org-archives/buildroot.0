Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AED60F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35AED60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A4140227;
	Sun, 26 Sep 2021 19:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVeYCG-kH937; Sun, 26 Sep 2021 19:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27B9D4020E;
	Sun, 26 Sep 2021 19:49:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7BB1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F5140226
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QeXS8FdA-BK for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:49:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E5A34020E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:49:15 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x7so45284796edd.6
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZXTYJSOmwxDDQJ9DgMEDaA5qM7W1leQZ8gRrly7hRN0=;
 b=OcWPrUOfClUcWwXHGK47lwOUjIwMNStShNdQyx13aFcIi9NVNXV7ureYND4UwcMl7+
 fYjpJIa38nUjNbUhVPUzG45iX4pJnBh1wbdDw4hjEUX5pAz+ok0Lhy34LAW09gdE89H7
 cA9bahAS8IyS3ACdNku1VWC839GwsU1srSZuHaEOUxNLWDlMQMZ85Edb1I/7dKeaoFYh
 bnxCQAyzpzYRdXtopbuPix8dGLFn1a2F5hLi2TxVIoOwm0qEMzftoPBgDvxkKowDHkwi
 I+MGMyNNPNJOpu2PKJHIWeW69chESOsREcUGgQYs4KN6MlqD5cuconYwoQFrIU+tVMVR
 R9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZXTYJSOmwxDDQJ9DgMEDaA5qM7W1leQZ8gRrly7hRN0=;
 b=mj8q+o+PI4ptOWHtFjE2DgrbucVi0pTIg6IVBKoYposxEsOyNC96ORziaTd33yY9aL
 D1Bwsq+Ok/BUtNZ1hbyJAPz6oq/n4n00AtfxnNPSYueNv16JUrX8AJfgkAxKrZDKhSkC
 R7k134bZVEC9m3h2MIuJ1O+f+5VHBFZ280SGZ9am+vaSBGVK/Ep/h1gsPGBrxdeqLWSq
 /1TvgMMKcIoh7ROe6o7jdDXS3poKrMCMavQqgJnuWTvVIItRWG9QzxDG36VMMPrnntpk
 kTtqYtLntequCIX05FzzIKwRWNajTpG4jZDzEMZzc4tcsn4/HdAw/uTPYd4XMysnnFDc
 H5/Q==
X-Gm-Message-State: AOAM530MApueFXhuC6+C/UsGuXqw76my1eqSz/RI3vrtOdzGShigymNI
 iC6YYC68AIIZfzZklH0LooONBw==
X-Google-Smtp-Source: ABdhPJw5Zl/0Wn7VE92MjhsbBuln20PfA5NuWpcQnzYD5p0kBvuciIHjBpnupj7hTo7B4tUEKL+OcQ==
X-Received: by 2002:a50:dacf:: with SMTP id s15mr19360441edj.385.1632685754296; 
 Sun, 26 Sep 2021 12:49:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mq25sm7606287ejc.71.2021.09.26.12.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:49:14 -0700 (PDT)
Message-ID: <2962911b-9f21-06d2-b8e2-f56aba78dffd@mind.be>
Date: Sun, 26 Sep 2021 21:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210925213803.3405981-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925213803.3405981-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mtr: add libcap optional
 dependency
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



On 25/09/2021 23:38, Fabrice Fontaine wrote:
> libcap is an optional dependency which is enabled by default since
> version 0.88 and
> https://github.com/traviscross/mtr/commit/2ff8de310222d26d10b13a104a1a82f2b86a84c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mtr/mtr.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
> index 263482534e..7198cbcc1c 100644
> --- a/package/mtr/mtr.mk
> +++ b/package/mtr/mtr.mk
> @@ -8,7 +8,10 @@ MTR_VERSION = 0.93
>   MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
>   MTR_AUTORECONF = YES
>   MTR_CONF_OPTS = --without-gtk
> -MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
> +MTR_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
> +	$(if $(BR2_PACKAGE_NCURSES),ncurses)
>   MTR_LICENSE = GPL-2.0
>   MTR_LICENSE_FILES = COPYING
>   MTR_SELINUX_MODULES = netutils
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
