Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59656CA9EC6
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244FF608E6;
	Sat, 10 Oct 2026 09:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In76xoILTc5o; Sat, 10 Oct 2026 09:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 287DD60A46
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624281;
	b=L4EMWnjZqoM2KIXiEucY9XBJlhIRdpV/XyjaVnl4OKoEbuZDWJ8302ThVDV+SnBuZzL6
	 7Sog3vxwrVdWSUB9jrAFxNwgxtYuyBNCtoekE7eYHe8Iixg4DK/CO4/AVrYFsnHIR7qtU
	 B4b4wgnsheZS94mE6oWiPGWNu4y0MGc2amlcm101IEQMKsftsGRObIFh/PGMSNyUu1Myr
	 ardbYaa8iX6gQzNUSuE/Rw4f4imUBM0/u0NYRz82J/VDOPzINkKoUrmULQ5Rj4JnPFdQf
	 Zy00wJU/6Mmw4Z742/RQ2hIqjlxz34W17uWeRayF4/Go21QgAASuczodPgq4+weh/XQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B/CldyjVK6xpi85iP+pNvO/mJC5XmS190Yz3J2eVzOQ=;
	b=NDeJfx6i3PfnnhR/PM6k1WX68fXe4L6IvAhmKUhn9HKpy4nikLOuxwi6/Ql78e2AroBn
	 HiRGpk0scVlvNzASRsxNYHHYBukV6CoQfdRv/DDCAMNvtMpgjO6E6r++JiqKc2wYdAxGV
	 V1H2a1bpQzZdG3qIBi+rmvbbE1VbMtWqGcok/t04OtumtfqnabXxksxvoM+AiyOzdBC8a
	 Utc51vxAo8BJRgWGpdzFhokK6cWetjZpBSbQHLpFeQtu0q6xvP6QpVMIwPRJbwhV0Lao0
	 Pci/XS0O9R+zhPPvQyUYVPFZrSSGC5MdH0i1OauvoQxx5Ch0Ks6ONnVQG3o0imMY4Rw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624281;
	bh=B/CldyjVK6xpi85iP+pNvO/mJC5XmS190Yz3J2eVzOQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hu2Oh8AP9hpEAiRtr8b+n8TrYXzs4IghB/Sq9+NXpwiG8yOKNZtgwwFiGxYQNRNpK
	 wqeIfnoFCA7ewyM3wgmu3rP6J1XUWbsNUyZeGd6ke5jkMgy1uXfubzCW1zFSSoIafY
	 lDDoP0kOjBAemPrJsxZHAmhcupUHGEv/PmCqSL6jRB8y9kQkUUNpkS09uHtuX3Jtew
	 +UY98ItLU4NVs7eHiukQhPekEmkXNvSLHNeXTkZjTeeJme07D7lgf5ufzyxAWY+CK1
	 zb801WwFzB8mJhkanE76zZnPYnFDy45Wv+g8d0uyUv+JQMCJmT3Fm/PfkpR2WFIVP3
	 wDh2efWAoc72Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287DD60A46;
	Sat, 10 Oct 2026 09:24:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E6C0356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 645D7409D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3QA0rF-zVBq for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 25D57409CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624278;
 b=Zc0bob5hfjd55w2rlx3bmOe0OVxCy155wWWzarzouRFjolqYrMV3cBGiZZql0NO7R5gc
 79OEfr/exZ4sUHY+UTqSqUdcOv2UO+AzIO5I2hnlwlEzVPvbIbZDOw8fXT/FxrV03Zjfq
 /7zgJy6r8QKK7OCI579SBDQhviXkb6+6frR+807hTSWQ5ibobWOwD4mcJuo9iQ7g3FZ2p
 aBDAvYXSucGSnMSeSENNcgFc7tIcvBIosh1syFdPYdEwQxj0gjhh5EdwG6uxOUqCZR/6f
 OVIS6xvDdAjqOHGQjWzxmhsg03LXEWWPiZ6DZqpq17h/zu4iGg3TLxMSZ4kqvoh8uag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624278;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Izy2tQPtDjJanGlMHhmBRteM1p64NIMv069DMJoFFU4=;
 b=EYM6uB7cUNwwHK6HdNOd0oKtC2jzuH9ptWEDYhPjmuEErr5eaXH1L/UETPjawQvzj60Y
 jKsMRGPuoLVnW32eGtH00VIu1tCrkDHbvOyupDg0+IzpiO5WHNl3Tubl6ucjs/MKHwVKh
 dp3FQ3FrgjnLSzDyEOyT7rWlzQ1zCZmFT6Awc/RltJj3gl/tRFeSPbmbWz4Kq3fyTd1OE
 Rn9XmkfDkvGOirwEWz//Eb1xV82F1Gu2cVGghgpX6Bon7UzD2JmmHRcG8K3n380Rosncy
 BNTrg+QfxsbEqDCaUHR95UR9w4K8N24NSkV23skMcJRPDXpPYn4VGGpQ9IXZrGCKbhQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bDaom7NP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D57409CB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so4256735e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624276; x=1792229076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Izy2tQPtDjJanGlMHhmBRteM1p64NIMv069DMJoFFU4=;
 b=sBn468wjIaXk1Ms5VitlBpsBv8SwkTCKd+JT7kPnCRygHh09w7IRsTvzghfoZwSS3+
 nlR/Xlq1SwrBLvzFC2GPhp+eBtxHH/gM9ggGLNEfLB8GvOS0lNJUBgcAMwAt2STExRWF
 t/Ib30S/gBA7sgXej5VCDCrhXfftd/uXzcPH8V0+NSOixPUmZNbFm+/BplCS18cpZVtt
 RQNOWjSzxNdrml0tWiCmczTUKkMlvH5yoSlFnkImCW9Wb2+5EqQ/gbTIzf+yNUgNd5r+
 1xD+RgtwXNCDO5Z+04cqug9GsXnvVyUumL0G+fA3yreIvHNTYRuW/PYj/qSREgue3llP
 FJOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqfIvvbSV/fwhUO3qxd0Z2pi6wjpuaOExVFYROePV6u4iJOau96V+htAKa9ySzpryHlicKOPDfuoc=@buildroot.org
X-Gm-Message-State: AFq9FYIHNYIZubO8lkICnmU75slnhac6ngW5B7MBA9XpflaXdyf7iJLP
 m9h/8BEFz+Sq6lIU9kMVwJS3LUjUrENk9w1/Z1N7Qv88fVQ1Hfrx+FsPe8KV3cE7O6+rfXRgpFF
 +/5+OnMo=
X-Gm-Gg: AYBFou3xlgP7ZJdhqkSDipSADP6COZ84lvgsIE87jcuuf5SoO7vTrupSOZR6pjqzg/H
 ONoxxelg8qT7yeglgb/rAd3rBPcv6oeVp6rOxMTYoRN16d12EAH/wMQPykFl5Jo0UY9ayea65NZ
 yNJuYHK/cg29XTVlGwF6/1KscaGK76NwlzBV12Oqmgy0jec36rWzyYT6NiT1MdSJzMhHEiox9Vn
 FDvJ5/fCLxIHVB274mcyR5eT+fYuyySC4qqg7NvTnlYX4TpnB2MZn+DFp5xPyJxFDmh+hsIG7sq
 ji7+bY4Rcv4OZ0DpBKhypmAN1TSH4LjqZ3Tj2ig1iqsGfx94+7KvZce6J7r8npVFpa5L0WZiWpQ
 T7FWxrl1adSAE6OjcWL13YLg7qQ3NkopOqVDHl1j3l+BDOapymKAqbYDWZHOhrLF+iJ5OFYWxRU
 9z83ve17ZDUaNNunDo9p0XPZ80KXJH1rqkKl5VDSu/kAsRBfTycjbfG+v8BtjWQTl6PVEy2ebHc
 BEb6CH1NuC0zGK8Wu2ijOkziNKDh1JeJwRpUbZ3EaX1gzWYeZ9281wX
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id
 5b1f17b1804b1-4a18e4afc3amr79084735e9.24.1791624276221; 
 Sat, 10 Oct 2026 02:24:36 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be97d1esm183163885e9.8.2026.10.10.02.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:25 +0200
Message-ID: <20261010092425.140269-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003070128.1295458-90-bernd@kuhls.net>
References: <20261003070128.1295458-90-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 090/114] package/python-thrift: bump version
 to 0.24.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Vinicius Tinti <viniciustinti@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/python-thrift/python-thrift.hash | 4 ++--
>  package/python-thrift/python-thrift.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
> index c6fea735c1..452bb7176b 100644
> --- a/package/python-thrift/python-thrift.hash
> +++ b/package/python-thrift/python-thrift.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/thrift/json
> -md5  d900f4b437b1ffba7258c58c3fde40db  thrift-0.22.0.tar.gz
> -sha256  42e8276afbd5f54fe1d364858b6877bc5e5a4a5ed69f6a005b94ca4918fe1466  thrift-0.22.0.tar.gz
> +md5  521e6b4fc5d135af2d16f7198dcfa0e2  thrift-0.24.0.tar.gz
> +sha256  9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c  thrift-0.24.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
> diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
> index d0c7896f8e..182139015f 100644
> --- a/package/python-thrift/python-thrift.mk
> +++ b/package/python-thrift/python-thrift.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_THRIFT_VERSION = 0.22.0
> +PYTHON_THRIFT_VERSION = 0.24.0
>  PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
> -PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/b2/c2/db648cc10dd7d15560f2eafd92a27cd280811924696e0b4a87175fb28c94
> +PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/5f/bd/8f90501b11206e545da3343ed0e5740fc694be24a5f637d7dd7e4e3af927
>  PYTHON_THRIFT_SETUP_TYPE = setuptools
>  PYTHON_THRIFT_LICENSE = Apache-2.0
>  PYTHON_THRIFT_LICENSE_FILES = README.md
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
