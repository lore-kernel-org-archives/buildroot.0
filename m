Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81F9C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2801B610C9
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2801B610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D06B3401B4;
	Wed, 25 Aug 2021 20:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeDG0jwTCA3P; Wed, 25 Aug 2021 20:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FA640510;
	Wed, 25 Aug 2021 20:04:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3F51BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0946D407E9
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNoX1KhRFReV for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 484BF407DC
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:04:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id d6so872134edt.7
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p/KbKgOJEUnz53pW8nAtZaU5Utkg2KEx92Df1qZFHQA=;
 b=TXBdaPc572lHRbT9d54mEKCCGJVpagj/g2pB0p2KSvmtvHfU1l08qcTy7Xs8S2Ik1a
 KAKqOBVRNcTC2Y7owunyce+sTdSzxoeKVzJP0rw++2jOsHIU1epwdLmovkorQ2sqC+Yx
 YzhE+Z1LtKryDbrhbmDD3sxTzt8m5rwrdcSm9rmZZVAKdktse5Us5aQjCC0FN7PfWNmL
 T7/8Q0kCZo1ymnPOpNykolew8MaCOuNYrWEIXkiPs9G5j/+2my5TUKdmTHj6QLX3ffsd
 Ym9IEuLS0av32RbigBvKjXz+ordaye8RBsCkL3u5EoafLMS4RkQRAh1Sg1sHq6hY31ze
 l7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p/KbKgOJEUnz53pW8nAtZaU5Utkg2KEx92Df1qZFHQA=;
 b=kSe6sul/KtBNTIWYEp+Aj0wlDR4CSH+MV2+PGSJqaippg2BZCIT79Ych9QHCt3HtCK
 mDVnZ0p8/Yv/VyNSfKtCeTNxUIa/kQvxBfeqcyS5iRwl142OWuX5FmQm4E8otJR7Y2gv
 Vtc54/QOAKsSVh79fuSsRqIGujTl4zw1Y18G6ckK5zLqEx8bJMNo1TYz5NyhW7Fr6uLx
 MWf7YjrLblhZ19OmcIb76rVgpEqiNVb3KxftTKMTr0LUUlAZdbs0YEUaQDxjFuczFPiK
 zNxfAgIs10wCsXnz9evPxYGtIXAgYZaBDuZ8g4DJeX3f0Z91IMvkMuMA/poViF0XoSI2
 D/sQ==
X-Gm-Message-State: AOAM5304W2kGVW1620xFDGTF70y2geWPwTObuuvBbywEBGZyO524w7Cf
 A8uYIpbptCqzcXlZZ9pimz+Gtg==
X-Google-Smtp-Source: ABdhPJz5JO1i73dEUo4CfVGAws5VGKFXzw6z7Q5+OSXpMCAU0arxymz7QqebkWz4209z7qTqD55O0A==
X-Received: by 2002:aa7:c4c3:: with SMTP id p3mr310161edr.122.1629921854279;
 Wed, 25 Aug 2021 13:04:14 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t3sm543045edt.61.2021.08.25.13.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:04:13 -0700 (PDT)
To: Jonah Petri <jonah@petri.us>, buildroot@buildroot.org
References: <20210824203841.1554763-1-jonah@petri.us>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be>
Date: Wed, 25 Aug 2021 22:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824203841.1554763-1-jonah@petri.us>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain: handle toolchains with
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 22:38, Jonah Petri wrote:
> Some 3rd party vendor toolchains have multiple files which match
> these glob patterns.  In this case, the shell script failed.
> Switching to use find and xargs solves the issue.
> 
> Signed-off-by: Jonah Petri <jonah@petri.us>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1->v2:
> 	Add SOB
> 
>  toolchain/helpers.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index dfb2581ed5..5ed149d57d 100644
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
> +       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
> +               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
>  	fi ; \
>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
