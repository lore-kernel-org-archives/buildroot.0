Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B43C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:22:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681D160F4B
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 681D160F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31EE180E5C;
	Sun, 29 Aug 2021 17:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOWTgoJPNwn8; Sun, 29 Aug 2021 17:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3A380E9F;
	Sun, 29 Aug 2021 17:22:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1E31BF599
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7516E6070B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swYfjx9fM44C for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:22:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAFFA606F2
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:22:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i21so25958371ejd.2
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ovj1oQ27GA5HXZKxNOabFD0CrZMlmmO+EUMtsFBpxAg=;
 b=KPYBva5I9611RRYDu/vhT3Z15/Do1GLxmx80Zw7AtPpTrjQnvybM5VJUqem1aYz4AX
 gdJgJ3/2q/jJxS6qr/mfWOJn8xFGxkvG0G6uF0ogQ4+15sYKy4li550L07XLtK8C8Bpb
 5EcVN8BZTNv/6k21IjM1s/1SMrpFhsyssBzcegAdIG1hr72fRq3Om3Bw8QGhHLNQMsew
 BWY5j+YRD+Iv9RW7fOOwykqi1sg0FDBI4ZuTebINHRnu4NXaJ0j45EwaLnOJYEpMo277
 EmmsLHxVLJTINMcuXw7lXMjcUIY6IWS/UO+xcYWxzKvp0pSrNsHOwq2ZMosxp+1+ejVp
 Gc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ovj1oQ27GA5HXZKxNOabFD0CrZMlmmO+EUMtsFBpxAg=;
 b=ZCOjfS0lxpcnpZ8EUM5ZnlZ21aJjou7cMZ1J7gxhVGq6Q3IGnuBB7zY/3UcV4SpYnT
 8RbvjqoUFFiwAfplYvDCLNd6xezGoKr7bEgEJNVaJksExHO5otsuZQ98MHTEYoYAYWis
 JBNW2NSDn6EkeeVimrImXl9NItWug+Vig2yaG3K7OqEhzPO8ahfvfppDeweyaYCtfcAc
 FjZc/Vb/aaALAHJ2ZRo7AIgm96ERlHHXXTQ3dfj05jE0vNO8mUWtvctIdNmqeTQsRbRW
 4MCymZ5WOzNcTD8qeHHVX1T7aAZ3Sj52sdkhaf67xWWW8COQ8OeQ9CMAhfKzaHw8nSp9
 tkiA==
X-Gm-Message-State: AOAM530rhEmctu7iMq0F/ELfNmNhHzww8lKTuMsz3DCkr4Quy2wWycC6
 16/3PJAgCT0aH7paO7pCj+dM1g==
X-Google-Smtp-Source: ABdhPJySech43I/S3O9OP6ykXSxMqxOD262n4hi6/PixM/AAU8l2jEFaET7jDlBkFIJF3PBww3S8hA==
X-Received: by 2002:a17:906:c443:: with SMTP id
 ck3mr20498107ejb.195.1630257719071; 
 Sun, 29 Aug 2021 10:21:59 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f30sm5574513ejl.78.2021.08.29.10.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 10:21:58 -0700 (PDT)
To: Jonah Petri <jonah@petri.us>, buildroot@buildroot.org
References: <20210826193424.1650108-1-jonah@petri.us>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4bdc9d7d-b4ce-4834-c7ef-eff9865f82fb@mind.be>
Date: Sun, 29 Aug 2021 19:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826193424.1650108-1-jonah@petri.us>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 21:34, Jonah Petri wrote:
> Some 3rd party vendor toolchains have multiple files which match
> these glob patterns.  In this case, the shell script failed.
> Switching to use find and xargs solves the issue.
> 
> Signed-off-by: Jonah Petri <jonah@petri.us>
> ---
> Changes:
>   v2: add SOB
>   v3: fix usage of `find`
>     I moved away from -wholename, which seemed needlessly complex, and
> instead I'm using just the base directory and -name.  Tested with
> previously-failing ARM aarch64 external toolchain build.
> 
>  toolchain/helpers.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index dfb2581ed5..cb9ff6479b 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -135,10 +135,8 @@ copy_toolchain_sysroot = \
>  			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>  		done ; \
>  	fi ; \
> -	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
> -		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
> -			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
> -		fi ; \
> +	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \

 I was going to say: don't use [[, it's a bashism. However, we already use it in
helpers.mk, so I guess it's OK. It's up to whoever has a problem with it to get
rid of it :-)

 Therefore, applied to next, thanks.

 Regards,
 Arnout

> +		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
>  	fi ; \
>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
