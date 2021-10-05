Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E7CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:35:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894D061371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 894D061371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDF3407EE;
	Tue,  5 Oct 2021 19:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2wkbBUkQNlh; Tue,  5 Oct 2021 19:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4060406D6;
	Tue,  5 Oct 2021 19:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE221BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08CB1406D6
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGvD52akrlcl for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BF61405E9
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:35:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p13so1074993edw.0
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j/awVH3aaOgyOPEFYqoeCvWMvz/7DaXoqdU1PNGJhi0=;
 b=XI7HrtXAD9ssVxarVTclXVENSzAemZnH2LFJpNAeS1EOxVHIR7o5xyuSDb0EL8+2Pm
 AhkHfcGLellfLSg5ry+PxswXJ2s+hE2IAcK3veWyOxRE2uGtStSvbl1qg3MpDO9Q/enL
 Xs9lW7Kar8ipZhayUC1Epn7EmOPaJY5n32k9przLoJoSnU7pqViCQ2K9k1ZmTD4iMc/Q
 AvU6ejO5+GmAH7ands7cWx4+zKrw52+r1/+yb8KvUJACcC5i3FcBpUXtA5IF3uVcNgj6
 M6IJjaF32ojxMrG6BwBPAU5anIpxPSTBQnZn7bqXa8FIU8PngRfTYIKyAkTbs3IZZMDX
 YYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j/awVH3aaOgyOPEFYqoeCvWMvz/7DaXoqdU1PNGJhi0=;
 b=ygYbDe+ixuBK597jsBF7KuYPVuaiivxHdxZTiOcdvXg4ONuNI7elzRQ5xSlSQUX6E0
 +kHHz9GWSDJ7uLHhhQAo7wtwA1ToqHW0hjh8lgQ5FP6UXQANGkf0HuYJevH1r5ezCMl0
 MzQb6Ui1ri4b657Z7AIFcL3wpTs51r9kqsK/zPJSZxKyNAQR2HcYdLvoKNTMLD1ckJ5X
 3f1Qoh+KjRj5SexRmkzQq37yWJOV/sITB1131R+8dYTJsammiwsA8v8slZlpJmiaWI4v
 9Er4mxsojZ3Rkar3ZrqBGl55KmlnuTm9Vbcyx1cMex5w337Sho/DizFmV8jPwAipb5LS
 uZhQ==
X-Gm-Message-State: AOAM532hc4/9oIlzsjBn3N0cTfhiuM9mPJZPWWUjCyAUM4nbGYacI0f8
 mxJA5iMu4R/nS3rMXTUyKS2ehw==
X-Google-Smtp-Source: ABdhPJy88dmf/JCuV4ku2NWj09385dN9IdmaKhPX3ED3W1aNE1lSp85C71IGrbg1ZmWa97+Eg09Myw==
X-Received: by 2002:a17:906:cec6:: with SMTP id
 si6mr2347518ejb.270.1633462511676; 
 Tue, 05 Oct 2021 12:35:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nd22sm8249028ejc.98.2021.10.05.12.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:35:11 -0700 (PDT)
Message-ID: <c77b7e29-9d2b-fe09-434c-2a649ac42d98@mind.be>
Date: Tue, 5 Oct 2021 21:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210927195057.549363-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927195057.549363-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aenum: bump to version
 3.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 21:50, Asaf Kahlon wrote:
> Plus, indent with two spaces on the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  All 13 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aenum/python-aenum.hash | 9 +++++----
>   package/python-aenum/python-aenum.mk   | 4 ++--
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
> index 16ee23aba5..d10254f9b1 100644
> --- a/package/python-aenum/python-aenum.hash
> +++ b/package/python-aenum/python-aenum.hash
> @@ -1,4 +1,5 @@
> -# sha256 from https://pypi.org/pypi/aenum/json
> -sha256	a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8  aenum-2.2.3.tar.gz
> -# locally calculated
> -sha256	0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
> +# md5, sha256 from https://pypi.org/pypi/aenum/json
> +md5  6f30144abd4d156f22f8a49d81c496df  aenum-3.1.0.tar.gz
> +sha256  87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a  aenum-3.1.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
> diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
> index 97fcbb5e86..98695d99ce 100644
> --- a/package/python-aenum/python-aenum.mk
> +++ b/package/python-aenum/python-aenum.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AENUM_VERSION = 2.2.3
> +PYTHON_AENUM_VERSION = 3.1.0
>   PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
> -PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310
> +PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/ae/25/00b2949186e76a4c9732e33221274964fecf5c88178cbe5a14a80cfc04e8
>   PYTHON_AENUM_SETUP_TYPE = setuptools
>   PYTHON_AENUM_LICENSE = BSD-3-Clause
>   PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
