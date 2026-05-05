Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35AECD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A891660B71;
	Tue,  5 May 2026 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvpJz0E4LPw4; Tue,  5 May 2026 21:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2703060B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016102;
	bh=FHqJ8p+kEYue21gKG/beoQJFWVpSLj9WefsciluZ8vw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mo1feg1Ea0y6ZDfO17u5TwsdmdrZkMN9gK8fW79jZMrcyS0wCVWPfatfJxvcqvNiB
	 +L8F9CWfDm0JC01D8Ftj6DRAS/IoUNVNfsjluw2piCr9FpK6VUAgAVfU4p627rQUCk
	 E/pg5eFRUMw1a2URCN7DjeNWlYsBRwdmYZebiCndJTlZ/TkERZQTl3YvKwqOvPjXq3
	 KqGHrzA08zowamcrKAbO2GtjQPBb0qlUGXoqnWrwQljEN4L2OqisjWYT5Xiuigv7Nl
	 APNKP18fU2McBZD8r9wTVdl8HSHVXVRNGbGZuquI/oQFucMEa7vLjtNntk8JsnllF8
	 GCRwQjI2VkrnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2703060B61;
	Tue,  5 May 2026 21:21:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C6B315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DEDA40291
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqrxODOVMjaW for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21EE140289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21EE140289
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21EE140289
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:21:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EBA375FFB1;
 Tue,  5 May 2026 23:21:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 May 2026 23:21:35 +0200
MIME-Version: 1.0
Date: Tue, 05 May 2026 23:21:35 +0200
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417085936.200528-2-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
 <20260417085936.200528-2-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <1c007822a6c378b50cb53d1bbd9c749b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778016097;
 bh=Z3TperNGX6o9l7qAMVmKYmPH7H/QQ5fAC6CqTj+RNsI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q/PCjyE/BcTgC4aVWx/+74j+a0/7TelGHhAz7lacx9eM/e3/5tZWBMQj1Dx1AgBbC
 WTL08mE6+u8msnIbL3hv1KhjV2o5MCxH/4uQvpgEn/pccA29b2PVSGVw18ViFHA+Xz
 zTOPqHeyjC/GaMia/fkbxqCNR6dtXZyCneUTZU7vTcVMI6piFlb/9RFxRIPQX3r82n
 QEBzllCeLpVUnjQK8TvNLHfPaHnd/SYluXl5FHeCIhKsVk3u29wUUQVBh6npNiU1sQ
 dVyZoQ8ROPVAxyWjDUTiTaoTLSHZff4PfBK5FECRZY1I4yLqVsG47akksG9W/SySuh
 1fzN9gXVI3kYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q/PCjyE/
Subject: Re: [Buildroot] [PATCH v1 01/21] Revert "package/python-setuptools:
 bump to version 82.0.0"
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

On 17/04/2026 10:59, Dowan Gullient via buildroot wrote:
> This reverts commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92 as 
> suggested inthe patch review :
> https://patchwork.ozlabs.org/project/buildroot/patch/20260314140633.2967249-66-bernd@kuhls.net/
> 
> Indeed, the new version of setuptools (82.0.0) removed pack_ressources 
> and causes build failures
> for packages and tests that depend on setuptools.
> 
> This serie will update kernel versions of the testsuite, so to test 
> them, a revert is needed.
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

I applied the rest of this series to master, thanks.

We'll probably apply this revert of setuptools soon.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
