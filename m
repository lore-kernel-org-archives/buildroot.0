Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E2FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A8261166
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6A8261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82E960EDD;
	Tue, 21 Sep 2021 19:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdBGnlUinbNn; Tue, 21 Sep 2021 19:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002B460792;
	Tue, 21 Sep 2021 19:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87E391BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AEC60792
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1bVvFQo6XFT for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88FC560737
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:20:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u27so409824edi.9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S5TfYcff6WJk0R/KJzgDWv4GbkPXKdJSR8XuVjo6fkg=;
 b=XEHO/Z1ps0Ok7DLbWyLcTmY68eaSxBpKofB4/L6ogMoAeBlFokxZUq/tm/0l+3iORt
 NY4lGo6WduDElwrq4QvpqycNk4OJ5v4u6j2Ld/PBtCpfplq4r/u2XMr2WW+zF3A18C2X
 Yiw3tKwRvUwwNGTDTL5ap6f/z2d3YlK6PLR+YfzVvBlqysgvBwk1qY0ZCZnlRHuMQcKM
 odS4bcG2Z2godIVZ22mvuqulQ5TEkP5luXwQ6fHSTmsPyrUrzpLw0ZKI8xF/4luJGtXq
 6jbuvC/ZhChHzqRMo1PMCLlGxJVv9j/q8d9CUlS2R/fFy7J4sZfJKXfA2ZjU6sEFHmqJ
 Uk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S5TfYcff6WJk0R/KJzgDWv4GbkPXKdJSR8XuVjo6fkg=;
 b=KbOA51zQ9fyDEk0wfkMja7tAGKMk2CIPLzlp+yVCsNJrs81cUc+IfjOwbHMpKmBWxT
 gFW747OwPEo1+IYtE/KVOGMYDNF5qR5ePJCKNBPYWiujUZw3PUGg1J+Sy6I3ijN70HxO
 hFwewLfhy6chUSemxHQ7Dru/yqb4RFVyOraAX9WPLr2JKII5a/RvvDkz7wg2zRM3IZ9Z
 fgGEBRx5zr7MawG0TAXFeNF0beMMUTTR7cWil5leFAtiHf4Pk+4KZAuGwqQcNEMMWK2J
 iXh8XJBqVxPiCbZFOygbtnyrBwMAyaigTE7SxEw2eEfuFfRMZgDtWhaLi0cAkFo0+/18
 hzPw==
X-Gm-Message-State: AOAM533la+bAXq4GgF1UmGHrfcMBKb26xTFVSL6r9Rn9tupy28JstZL4
 OyyiB3YLir+0HE7E0St+x9aX6g==
X-Google-Smtp-Source: ABdhPJxaicG9rGoOq5hGRD3blRZ9+vbdpoXbukjLKQDvRtV5m1snsCJpL9oa+lDV0N6GXXpe6aYvqA==
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr29884034edl.307.1632252017760; 
 Tue, 21 Sep 2021 12:20:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm7684391ejj.55.2021.09.21.12.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:20:17 -0700 (PDT)
Message-ID: <d592d0b8-2570-6ed1-fd2a-975f82c37476@mind.be>
Date: Tue, 21 Sep 2021 21:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20210910185038.2684110-1-m.niestroj@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910185038.2684110-1-m.niestroj@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] package/python-typing-extensions: bump to
 version 3.10.0.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 20:50, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
>   package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
> index 4c76caba43..abaac77d34 100644
> --- a/package/python-typing-extensions/python-typing-extensions.hash
> +++ b/package/python-typing-extensions/python-typing-extensions.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
> -md5  5fcbfcb22e6f8c9bf23fb9f8e020f6ee  typing_extensions-3.7.4.3.tar.gz
> -sha256  99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c  typing_extensions-3.7.4.3.tar.gz
> +md5  ed80ecc8eac5cb15840535ca54eb43f3  typing_extensions-3.10.0.2.tar.gz
> +sha256  49f75d16ff11f1cd258e1b988ccff82a3ca5570217d7ad8c5f48205dd99a677e  typing_extensions-3.10.0.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
> diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
> index 2bcf1342a2..46c2977cd7 100644
> --- a/package/python-typing-extensions/python-typing-extensions.mk
> +++ b/package/python-typing-extensions/python-typing-extensions.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TYPING_EXTENSIONS_VERSION = 3.7.4.3
> +PYTHON_TYPING_EXTENSIONS_VERSION = 3.10.0.2
>   PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
> -PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/16/06/0f7367eafb692f73158e5c5cbca1aec798cdf78be5167f6415dd4205fa32
> +PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/ed/12/c5079a15cf5c01d7f4252b473b00f7e68ee711be605b9f001528f0298b98
>   PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
>   PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
>   PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
