Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473E2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 11:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D2260F57
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 11:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5D2260F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B11E404EB;
	Mon, 18 Oct 2021 11:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2Hw8v3OFyLY; Mon, 18 Oct 2021 11:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C63404E4;
	Mon, 18 Oct 2021 11:20:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257FD1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 11:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20DCA403ED
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 11:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kv5sgQBQrV9l for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 11:20:47 +0000 (UTC)
X-Greylist: delayed 00:14:06 by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 040CD400D0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 11:20:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I9fiRd030428; 
 Mon, 18 Oct 2021 13:06:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TJE+6iwCqTjQDNlZTeWejhsYfhhr6569lzVABIjI36Q=;
 b=BN6IsRGf0Dn5oszo8LW9hzJHSctYC3r7aqcfKJezpQxic+CiiXL9ykT5MCPUuNLF6tdH
 8KY9Jlnq43gYy+FlTB+5WjKS6fPqaIhqlzeFR0pobtBYM95bWjekKDPEEKS0yMfnb692
 IPKnsAAga0+O5LyzDO3O2vJdFawe7oB48dc2u4Nx5YsZTUju6Lkzu468akkaZrhuU1UJ
 f4EVAvq5oQ8m4TuOWC6PymwRYrE/gJeGyEUh6+Wzg7P8ENU7VhrKKJYUR4uG4m7hgTPR
 Vn5tXuksCt+ebIzgkSo9nurQy7CZMrA82BqlJdqPb1JwT8WMrw5f9iPBLi82GoCdOP9f xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bs6h2rfw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 13:06:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC624100034;
 Mon, 18 Oct 2021 13:06:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A536521B530;
 Mon, 18 Oct 2021 13:06:33 +0200 (CEST)
Received: from lmecxl0909.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 13:06:33 +0200
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211017162839.20278-1-dariobin@libero.it>
 <20211017162839.20278-3-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <8a33166b-a475-e906-6bf1-71eb8eff1ee2@foss.st.com>
Date: Mon, 18 Oct 2021 13:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211017162839.20278-3-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_03,2021-10-14_02,2020-04-07_01
Subject: Re: [Buildroot] [PATCH 2/2] configs/stm32f469_disco: add
 framebuffer test application
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

Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

On 10/17/21 6:28 PM, Dario Binacchi wrote:
> It's a test suite for Linux framebuffer. You can run, for example,
> fb-test-rect that displays random rectangles on the screen. But first,
> you need to enable the framebuffer:
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> ~ # fb-test-rect
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   configs/stm32f469_disco_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> index 438d32150c..47dbc108a7 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_FB_TEST_APP=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>   # BR2_TARGET_ROOTFS_TAR is not set
> 


-- 
Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
