Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1249DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA5460FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACA5460FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ABB940634;
	Mon, 27 Sep 2021 14:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeHg-IJDEn0Y; Mon, 27 Sep 2021 14:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED61404B6;
	Mon, 27 Sep 2021 14:36:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 611F91BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500D6404D2
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAUTeOb4ObTo for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28CB1401C3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:36:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g8so70151768edt.7
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=moXNlnFp6GahNfq7eVsnG2EGqgd6ZMCCNKA2zUOlVMY=;
 b=V1Lb1QM/5fR06h5ImAAfQEMPERT//AGrHjvrsGtx5Wf4vlY8bMFSq7hCRyGIzAd2Vr
 UN3KyMmdyoAoDo1nczrgQ6ZOqSdETF9UlgoN9QPCdTudKTTq0ecSkTvmHBBjJhu1VGcp
 kRlhf+YVOnVlilkYGehn6sO87Po1jH6eSh1yaJpILQsgaPwAlIOkdvWQ9RXitQydXFco
 9PcbZi0/1FDrtZVVz4Yc9Z2D7JkbqcHcw83N35yv707fZ9kQZascwlqtych2PWSjPetT
 qwsmrg/tM6RKaT7CQOxpXzXQFCExJSXZ60uPJsX6Ro4YFg1KAkuGTgSEpO7PJqosxsZk
 WtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=moXNlnFp6GahNfq7eVsnG2EGqgd6ZMCCNKA2zUOlVMY=;
 b=tBmHwIf7NzYoYxEitRRDlmkMkZZU8D44ZBMRCFaqK+yn9J5Kb6yGlcx8NQzkRuJVS6
 fBCxRSKAkFlbmGA4YHt+YcN+fBvlCF+HDEOk23FYZ3FwZiT8Qp2hfxnIvmHdAmW6oe6t
 uH702sb2HdGe3w2R1HIdDouN2UvF9/InMKxzWpk//BreNZh8EoHUtZ6W5euB9xmOmMp+
 OX8Ys4htLbIm6ls59Hxm22XA+asX7k5nl3ZCs24frZipXx8ztAjSKAgcSs4AnG5uPDLW
 xdoYcZeXYP4GeAWDMXlUMlM2zYepk5xgrcuJqxiQFo0PU1pD6uGZyN5SCHN0X+0NZ3/o
 TUdA==
X-Gm-Message-State: AOAM5304bTQCj9icBfQfKkSzn5OUBzlvIJ9h5UIod5lnzf+9fxCowf2o
 mf8+ftxYFVdV/ooYfPqYGMaNwg==
X-Google-Smtp-Source: ABdhPJyrLNtDTK7c3mUzfU9x195Xgty+Bti77uwcM5pvd58LWmPNKQl/CdyCpRqqUfYkqS2qY1TxqQ==
X-Received: by 2002:a05:6402:54d:: with SMTP id
 i13mr156124edx.389.1632753359966; 
 Mon, 27 Sep 2021 07:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cn8sm10417082edb.77.2021.09.27.07.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:59 -0700 (PDT)
Message-ID: <08f4a3f2-fe10-242f-06a4-f7fb0ebd0a65@mind.be>
Date: Mon, 27 Sep 2021 16:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927053740.1060569-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927053740.1060569-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-inflection: needs python3
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
Cc: John Faith <jfaith@impinj.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 07:37, Fabrice Fontaine wrote:
> python 2 support has been removed since version 0.4.0 and
> https://github.com/jpvanhal/inflection/commit/a826dac7a562e67881ab704adbef45440566836e
> resulting in the following build failure since bump to version 0.5.1 in
> commit 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c:
> 
>    File "/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-python-inflection-0.5.1/inflection/__init__.py", line 91
>      def _irregular(singular: str, plural: str) -> None:
>                             ^
> 
> Propagate host-python3 dependency to host-sdbusplus
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6d6e937135ef95c63001359fec5f8c28183fc0a9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-inflection/Config.in | 4 ++--
>   package/sdbusplus/sdbusplus.mk      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-inflection/Config.in b/package/python-inflection/Config.in
> index 427275bc71..5b6a26fead 100644
> --- a/package/python-inflection/Config.in
> +++ b/package/python-inflection/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_PYTHON_INFLECTION
>   	bool "python-inflection"
> -	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
> -	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON3_UNICODEDATA
>   	help
>   	  A string transformation library that singularizes and
>   	  pluralizes English words, and transforms strings from
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
> index f4e258089b..498b835052 100644
> --- a/package/sdbusplus/sdbusplus.mk
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -10,7 +10,7 @@ SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
>   HOST_SDBUSPLUS_DEPENDENCIES = \
>   	host-autoconf-archive \
>   	host-pkgconf \
> -	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
> +	host-python3 \
>   	host-python-inflection \
>   	host-python-mako \
>   	host-python-pyyaml
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
