Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CAAC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A80840791;
	Tue,  2 Apr 2024 19:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSLlCut7sWEd; Tue,  2 Apr 2024 19:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C2440890
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C2440890;
	Tue,  2 Apr 2024 19:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3AB1BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A1240890
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOQE924TbLxU for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17EAE40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EAE40791
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17EAE40791
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:57:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41620ab6e9fso1358995e9.3
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712087856; x=1712692656;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUB4XzVodqn6Kxiwb9acYjl9H4TqLN4CTAw/WdzkR7s=;
 b=QxotryRWxtIXcLUIu1DjLoEs+LQKhPjkpc1MRzsZ578yO4yWFBw3YnIadO7mwQkQef
 Yqtk08bXYAtWQAIy2sqIrZd3pfcNGL3cXsJkOF9rnwxPmFdZLklfWOitt8ybZpxReOwd
 FVBqlEF4TUoiIdRINRaf3N1YYwJaoOXuNKQCv5CA/8joUHJ1Q4n4m9o7qrsHDw1lZ3st
 UX60X9mvdf3avdR7MUsWpDBthOS1sGs0vDaI5ZjiiYYwNNNaYrj0NeksgN7T8C9o51Wd
 H1F2W4T/aTVdn85IwhBwBeGTmSuTBPAkLird0m0zVxQoQGD5qS8lGIa9KMB/6oS6T5Ut
 TYIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTEb88a1EtHz1pyDojPVgtvODse+0cXP+bx9YA1QBYYtudl1ML023UXj21zWqoYPR5JSLLZy3ZxJg0EGjOPsxVGSfctp55ig==
X-Gm-Message-State: AOJu0YzjdnPgJlW8beoaI47x2gyBd1GiNdKl4yxvfxDzzkrwZcHlMI+T
 9SSY0jaADNUwKd5/I6EjpA099yg8Yq6zIyj0B4UpCQs6gDMpOl+UpMt6PbW+CVg=
X-Google-Smtp-Source: AGHT+IE3429nbUpVTyRbbhHuZW5cs3iMmXiOimwBc8/Y+pOn12cAwV2/ZqkCEVDUYExoFtOEbtNOAQ==
X-Received: by 2002:a05:600c:5598:b0:414:86a3:8e8d with SMTP id
 jp24-20020a05600c559800b0041486a38e8dmr9531304wmb.22.1712087856067; 
 Tue, 02 Apr 2024 12:57:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b004156c501e24sm5363597wmq.12.2024.04.02.12.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:57:35 -0700 (PDT)
Message-ID: <91936fc8-3811-4e20-a94c-31d389f563f6@mind.be>
Date: Tue, 2 Apr 2024 21:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240214093142.3423721-1-buildroot@bubu1.eu>
Content-Language: en-GB
In-Reply-To: <20240214093142.3423721-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712087856; x=1712692656; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eUB4XzVodqn6Kxiwb9acYjl9H4TqLN4CTAw/WdzkR7s=;
 b=Emxr7QqBeQFoFS00YaiojpjowPjn3iHqiFYLyd++gX2VNsjhnbeDVXB9C+WIl0YNx+
 6UHS1fPX+kjXtY4vh18+aTmxRQnef6RXJqWCwQtCfK90MJmR8/EbLL1I1FTRnVFVYJR7
 5HWyRhjnbmIOne632d6KqqhnwuTXI1vEaeQOAIOgGhflQNUfZPGlkoGZ+2M0ve74za/a
 O+SMbFOXz8vOWF4CD0qfd2r7Z/bVOJ/bNzBqj8nBpb4zTNqELnzGFFdhIvEL+83y+8/0
 nUbSEPh8HaJGaHOA3W4EPCYpntE82Jl3i4W/nQgMbj2ShChQk3CalvvdRLf7NhDr27DW
 apfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Emxr7QqB
Subject: Re: [Buildroot] [PATCH] package/python-pytz: bump to 2024.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2024 10:31, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pytz/python-pytz.hash | 4 ++--
>   package/python-pytz/python-pytz.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
> index be6f0e976b..a8bfe67817 100644
> --- a/package/python-pytz/python-pytz.hash
> +++ b/package/python-pytz/python-pytz.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytz/json
> -md5  84e6569fcc917b096cca1063819c4ab0  pytz-2023.3.post1.tar.gz
> -sha256  7b4fddbeb94a1eba4b557da24f19fdf9db575192544270a9101d8509f9f43d7b  pytz-2023.3.post1.tar.gz
> +md5  b26bb090d1fe96064019bf7068eeb801  pytz-2024.1.tar.gz
> +sha256  2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812  pytz-2024.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
> diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
> index 182d8156fc..300e26befe 100644
> --- a/package/python-pytz/python-pytz.mk
> +++ b/package/python-pytz/python-pytz.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTZ_VERSION = 2023.3.post1
> +PYTHON_PYTZ_VERSION = 2024.1
>   PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
> -PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/69/4f/7bf883f12ad496ecc9514cd9e267b29a68b3e9629661a2bbc24f80eff168
> +PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/90/26/9f1f00a5d021fff16dee3de13d43e5e978f3d58928e129c3a62cf7eb9738
>   PYTHON_PYTZ_SETUP_TYPE = setuptools
>   PYTHON_PYTZ_LICENSE = MIT
>   PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
