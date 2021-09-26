Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF51C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A77361041
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A77361041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EDEE403B6;
	Sun, 26 Sep 2021 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooq9P2EUwjxR; Sun, 26 Sep 2021 21:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F24A403B8;
	Sun, 26 Sep 2021 21:44:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 324C51BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 220356071C
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3VmRBbuUhvz for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1352A6071B
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g7so1275470edv.1
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fmA1a7DRpGtNvJ00b220yiqdpo9YCoN4hvUFiTks03w=;
 b=Bpmq8qqXvyQmrQZTbMPcWIYK8KoXFkQfXigEAhjKyn3vHdJBOklbuKgyl5lxEZLarK
 TDVmIbIHdGmt6JhFnrqE7iCD0Tk+q7OfyJGmR2DpNfZoRLFyIX6zm1ZQP4WkLM92oWwU
 Hmt0lUdUwtGBHZjLz0kPC/w3f1RXS2Ki2WUqFKc/N/vA2FhYM2Th7EJ9Dfkp2afJdnAG
 0NHaagU3JpMCudrjFl7AfP94ejLz3KyYgVrhoWYv1f6lNaJ0EZnit/QYS5LXNCPbeGQR
 qViCZb6IGOAXMvlPmW3icWtdUCJUZjAxgxVtZnLxyFhVIBI3BKjPztYcfHzaFktbj2zf
 vOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fmA1a7DRpGtNvJ00b220yiqdpo9YCoN4hvUFiTks03w=;
 b=oMtBMhnrcVw2eb69cLDolrzI8nekDiP7OCCNYoCvpAXaqcz4ADaiLWtGQ57qLMgdbs
 BTyo5+yoMEH5jxTH/yyits0v4E1XfQPM4uRZOTd8I+ds259s4sErEqD6E73z8PmgNzuq
 SnQ7doc63fA+ftPfONK4wVk03W8gFWX2uaE2tA9ciOec97amWSGwaenv+y5c9tNAx274
 F+6hQQYpxWsggfSFfLsJbkTdQEDE2N4Gvzx11P3ivAwrHYWZBz2F7oS0EnFGbu2HJ2L6
 Vns+L5HB5z5N+xHqu6B6F7s3W0+IWisFF/qonRF/uEaO9c8V8/hgf2RzrXD1TAGdHdjl
 kCkg==
X-Gm-Message-State: AOAM532MogXJH+hU5LIkShCu6r6cjDhSDaqB4hIhjHoYkfJzszbvC4Jh
 qAJXr3fBtE5stCWoAjlXnNYolw==
X-Google-Smtp-Source: ABdhPJyGAC8Dwy0FLNQvcVm7BIjQFrMUKOw0nHjljW4QqnVfcnVP1GlgkprTLtiw2YFlYcns3UzqEg==
X-Received: by 2002:a17:907:7284:: with SMTP id
 dt4mr10660836ejc.433.1632692662273; 
 Sun, 26 Sep 2021 14:44:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v21sm9288614edb.62.2021.09.26.14.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:44:21 -0700 (PDT)
Message-ID: <046fefdb-d037-60dd-a4ed-d83f11f845fd@mind.be>
Date: Sun, 26 Sep 2021 23:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210921062555.25823-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921062555.25823-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/python-django: bump to version 3.2.7
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2021 08:25, Peter Korsgaard wrote:
> Bugfix release, fixing a number of regressions:
> 
> - Fixed a regression in Django 3.2 that caused a crash validating "NaN"
>    input with a forms.DecimalField when additional constraints, e.g.
>    max_value, were specified (#32949).
> 
> - Fixed a bug in Django 3.2 where a system check would crash on a model with
>    a reverse many-to-many relation inherited from a parent class (#32947).
> 
> - Fixed a regression in Django 3.2 that caused the incorrect offset
>    extraction from fixed offset timezones (#32992).
> 
> https://docs.djangoproject.com/en/3.2/releases/3.2.6/
> https://docs.djangoproject.com/en/3.2/releases/3.2.7/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 2f5f96a501..ab89f0341c 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  46e306a5a775cace03a03d5a158ff767  Django-3.2.5.tar.gz
> -sha256  3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd  Django-3.2.5.tar.gz
> +md5  2ade1eecca77640abbde6c4589da27dd  Django-3.2.7.tar.gz
> +sha256  95b318319d6997bac3595517101ad9cc83fe5672ac498ba48d1a410f47afecd2  Django-3.2.7.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 1603063beb..0850aa1358 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 3.2.5
> +PYTHON_DJANGO_VERSION = 3.2.7
>   PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/95/3b/468fa33908feefac03c0a773bd73bb8a1ab1fb4ee06e9dd62d24981f4603
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/59/45/c6fbb3a206df0b7dc3e6e8fae738e042c63d4ddf828c6e1ba10d7417a1d9
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
>   PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
