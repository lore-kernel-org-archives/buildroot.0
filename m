Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07174C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:32:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2146138D
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D2146138D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0781340106;
	Wed, 17 Nov 2021 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVrjxGfnfllu; Wed, 17 Nov 2021 20:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF65400F8;
	Wed, 17 Nov 2021 20:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96DC91BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F7CC400F8
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wslHEMsR2fyr for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:32:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9762C400F3
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:32:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g14so16695585edz.2
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Xu8OmATmy4gg/LbJrkcrHwFb1b+rUvZQLjuFHAnr5qc=;
 b=WYrqaLM+xDL4nJr+nM/v9tOjyRZbmPILXOKQ1cZQkou0E7431QeXtdsQfdpm4dqKVd
 cq7eaMb3c+cjgzmaL/BDcyrjh2A8+GYBMO5CZMRsQlQ/7vE8s96zbAe0Pqu41fLBfA+8
 I7IeShk997x5sQBd33AdUPtLDblMwNdeCSlavKcKXYgZpPTAzHVaqButz4PiOBBe9kU4
 UWORcAKTy6+a8YbWDUl02IdSBCKgSMGGBGb4NTITJzU6Qwktg/dYqqWL+lLdpmFhCPDj
 8wwFjEMHmB0slYOwPOqirahjc9YsWES+PpwY7koT2wbMCX8ZuQKQqFk8ATZGVLXA9KqV
 1izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Xu8OmATmy4gg/LbJrkcrHwFb1b+rUvZQLjuFHAnr5qc=;
 b=FkZ4B++d+bw5gNZdu5wIytGvHrPdN7Wr50KL8DREpGX7MjBgqaNVH0CFvx2s6Gyi5B
 r47OfUV9htxiF/4Om+AjFM+6jqZXOxK265FbrKA8gGTKer+7qsEvDNz1bCF/2mw6yQow
 fXHwNMeko/XvQUJPC5a3zDsvYJGMFyylQbwmo4EWjPXvObBN3DwGXdMoBVXceQ9rWi9y
 TNhjUuM4b/RilV+DnN5u3pbhm1xIS4cxCcdLayeeJ1srJlUYbWJ0pFlvakvlhLly90Dk
 zEhhCQ0GPk/EPW/Jf5RIvjptxZ0yB796Jo3P4XQRwek3g2SGOBZs8OYRVfAKOpJEjplM
 sPCw==
X-Gm-Message-State: AOAM5309MI2by6vOywFjAOELiNP3e8Qt2xfnzldUAmd7EOJZeiZX2IV7
 dJEwQDkJqVaQRcEfcGSs+xkfww==
X-Google-Smtp-Source: ABdhPJyuoMS7lsJgeyvH9pwBj0Uemn1+/JBXxgdEv8j84rFI/ceJUpxhI6a3LH3O9t2QAyK+hGMfQA==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr2385496edt.376.1637181171516; 
 Wed, 17 Nov 2021 12:32:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm541572edb.89.2021.11.17.12.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:32:51 -0800 (PST)
Message-ID: <8f8f9b7a-f9d6-71ba-4de4-0df068dcd89b@mind.be>
Date: Wed, 17 Nov 2021 21:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: John Keeping <john@metanate.com>, buildroot@buildroot.org
References: <20211026170400.265271-1-john@metanate.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211026170400.265271-1-john@metanate.com>
Subject: Re: [Buildroot] [PATCH] package/isl: switch to new site
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



On 26/10/2021 19:04, John Keeping wrote:
> isl.gforge.inria.fr no longer responds and the main site is now at
> sourceforge.io.  This change corresponds to the upstream commit that
> updates the documentation [1].
> 
> [1] https://repo.or.cz/isl.git/commitdiff/002820d725479b456c97ca9b0d59d6b3e18f7ee4
> 
> Signed-off-by: John Keeping <john@metanate.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/isl/isl.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/isl/isl.mk b/package/isl/isl.mk
> index 3abd6640cb..df57c83f55 100644
> --- a/package/isl/isl.mk
> +++ b/package/isl/isl.mk
> @@ -6,7 +6,7 @@
>   
>   ISL_VERSION = 0.23
>   ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
> -ISL_SITE = http://isl.gforge.inria.fr
> +ISL_SITE = https://libisl.sourceforge.io
>   ISL_LICENSE = MIT
>   ISL_LICENSE_FILES = LICENSE
>   HOST_ISL_DEPENDENCIES = host-gmp
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
