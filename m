Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB4AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5196112F
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5196112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06E8240409;
	Tue, 21 Sep 2021 19:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i777OLGPIjtk; Tue, 21 Sep 2021 19:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C891F403FF;
	Tue, 21 Sep 2021 19:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43CB1BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D418582EA2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NNOFIdpc9mU for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D269D80F7D
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:20:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u27so410378edi.9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSfEkWxDu/9Awnxgy9dsHqh/TpJS3f8oXiUXRnUMXaA=;
 b=eRRDfrdGS8I6z5lwxChW/7CsmR5dbjLK7RpzVX3CPGNEHfPVGEfvO65ZUQK5Bo6E/C
 c+REH2ZTIR8wA3m2waJ6Y+hwBplInyDC4ky0d7Ngbb9TELrRb8lZTTjjPpQSBzMgT5RY
 2zO0K8iT6MH1eAnpw9ND7XSlyu2DVrq1DWekren4v3hZXSGptUSSDo/e09EgssqifLYJ
 vvq0vf0iq/IxvwpzoMDPJUZivkkzqU83iO1Oalp5gk8Ny7Vf4XMMjG2yG6H6i0W3ANKy
 izHWG49sFN7wYkGfLEOqi1e37zZGWATDxhG4EhNwJ5f7nCJAwu/s8iQ+wArQYSFB32Eg
 ging==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSfEkWxDu/9Awnxgy9dsHqh/TpJS3f8oXiUXRnUMXaA=;
 b=gUzy8GMRHZ8vcOItpMoRW8/LjSZg4sns3Fe1BWCIf8Zk/mjK8n9bxZfTBPzOc9N1lR
 h2aTS6KwSVfsOuA8XWPXvXi0VYTLx7xo7wlURP0UFAY04p+vokPK2daFw1azqjdsQu1I
 AscYkX+9E1RMFtMeXlG+I5HjP9MFSSSMnjQkJqTK625j5dtRsQZekvEM5yQpqiYSmdyB
 e7PrNNSAUPO92nkYPvn6AvWBkk5wn+JDP4lJYKyk7vrTAn/fv2gE3KqM+y2sWuE96H+a
 2q76U0ZbaBO4d0pG2ae+IldN/57wtLzxp379KTTajbeB2Z87jqFZhbbdvaG3sVFGky4W
 2fuQ==
X-Gm-Message-State: AOAM531ejsMPbHYjoIU0wlpx+TQXgfoeLiRdEOLDmyk1IdklG64sd7FX
 U16ROeD/biZmQK9BG61SadANBXLq2DEKNg==
X-Google-Smtp-Source: ABdhPJxQuy9o3WAZBYH/SfDhqIe66qn7Q4O+c7SBpVXTXvx9nRgF+8UEOXlntXNTbNXpht+QYqNp0Q==
X-Received: by 2002:a17:906:39d8:: with SMTP id
 i24mr36598534eje.49.1632252021104; 
 Tue, 21 Sep 2021 12:20:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r23sm6568506edw.39.2021.09.21.12.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:20:20 -0700 (PDT)
Message-ID: <a96322f3-3984-4def-09f5-08e98783b10a@mind.be>
Date: Tue, 21 Sep 2021 21:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20210910185213.2686343-1-m.niestroj@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910185213.2686343-1-m.niestroj@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] package/python-packaging: bump to version
 21.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 20:52, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-packaging/python-packaging.hash | 4 ++--
>   package/python-packaging/python-packaging.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
> index b3145dfee6..0c23a5f71c 100644
> --- a/package/python-packaging/python-packaging.hash
> +++ b/package/python-packaging/python-packaging.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/packaging/json
> -md5  5377308b3ba89f2d78c05e7f485be65d  packaging-20.9.tar.gz
> -sha256  5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5  packaging-20.9.tar.gz
> +md5  240ba5823ed31051a1254e74c9d18d55  packaging-21.0.tar.gz
> +sha256  7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7  packaging-21.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
> diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
> index 5fdf7616cc..6b54d2416d 100644
> --- a/package/python-packaging/python-packaging.mk
> +++ b/package/python-packaging/python-packaging.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PACKAGING_VERSION = 20.9
> +PYTHON_PACKAGING_VERSION = 21.0
>   PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
> -PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/86/3c/bcd09ec5df7123abcf695009221a52f90438d877a2f1499453c6938f5728
> +PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844
>   PYTHON_PACKAGING_SETUP_TYPE = setuptools
>   PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
>   PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
