Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4032EC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099F960692;
	Sat,  8 Aug 2026 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfSMbomshzO0; Sat,  8 Aug 2026 14:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DCD6067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786197619;
	bh=DdjdXUpen8RclQXeWZyZIuuu1aaMwbhOQ+w1momQD9U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o2UBgfjKn0oayOIg5DTgI2KfM2+EKePnt1pT+2E5sWaciuQpkrWjlM/CLJqi60zAd
	 ULwmXiVnSjwH1aS0EyH8akd25tC4T3ifFPn7cIwlk4UZRS5WcEwZOMEtR5hN3e9dvC
	 glZJ/GLLAfvJWSuHjUAAj6965BnUyVi6Zt62TBDaD+tqOnLdK2dXodKRx7yeuMJ4Gs
	 i9EZ5H/AZK8KXc82O9PSrWyZXW1FwJnMHdxY7NvFZfUMuntxNdbhUSXwxcHRpknh3/
	 dUJ4pAn8h4CoUyzZbMN2HFlBb/vtW9UqHjz6FyHM6El957ede+Ybyu6gMNOTOYKSiy
	 vTkJGWkrtbTMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9DCD6067D;
	Sat,  8 Aug 2026 14:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 989B9296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E942405ED
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxs9jetplds6 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD684405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD684405A3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD684405A3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C0D112003A4;
 Sat,  8 Aug 2026 16:00:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 16:00:14 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 16:00:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260808090642.785882-1-thomas.petazzoni@bootlin.com>
References: <20260808090642.785882-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <e81818bf1eb94224937af525fc4392c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786197615;
 bh=HxnJL22fCCTt7x7wOAienTb/nG+kzKt+e3PwkdJEtCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H7BaPN889FdYIui31qDSm0dTIDrsCOwFhV0mw04UvXOmXvCRd3soccMP6ZUnITU7H
 HzT8dp2g7ony+v/xyQeIqpiC3ZuFjAdMB86K7yFqvkAJxEri20vlGkVVr8z78NF1x0
 u8LNpfODskFoHeMXv6plwOjIaareT63xn0yuvr0lH5f1XXGZuRyS+JjQmjFwsrFpPD
 8r7jyxSo5cEoZUGaf7+Pwjdd1PIcvN1h1+DjaWUXbYLkuPCVCJcVSpZDoRS8PJFuvu
 ug+Ml+K30sZ7CvBJEl6yWKb59oQ3lhjLCoa54Kk7ZbfDNoivWwc4bl9lV/DcR7cQpU
 C8gb0tHkQTKjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H7BaPN88
Subject: Re: [Buildroot] [PATCH 1/2] package/tpm2-tools: propagate
 BR2_PACKAGE_TPM2_TSS_FAPI dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2026 11:06, Thomas Petazzoni via buildroot wrote:
> In commit 5394df6400912efa7da4f97c7ea68a81a9f77c1d ("package/tpm2-tss:
> add Mbed-TLS crypto backend support"), a depends on
> !BR2_PACKAGE_MBEDTLS was added to BR2_PACKAGE_TPM2_TSS_FAPI, but this
> new dependency was not properly propagated to the reverse
> dependencies, causing kconfig warnings such as:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_TPM2_TSS_FAPI
>   Depends on [n]: BR2_PACKAGE_TPM2_TSS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 
> [=y] && !BR2_PACKAGE_MBEDTLS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_TPM2_TOOLS_FAPI [=y] && BR2_PACKAGE_TPM2_TOOLS [=y] && 
> BR2_TOOLCHAIN_HAS_SYNC_4 [=y]
> 
> This commit properly propagates this new dependency to
> BR2_PACKAGE_TPM2_TOOLS_FAPI, fixing the kconfig warning.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
