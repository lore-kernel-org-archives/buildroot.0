Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8C6C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDBCC607AC;
	Sun,  4 Jan 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPAOLvbacKa7; Sun,  4 Jan 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A84C606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767534754;
	bh=r3DnHzhy1bZYd9r8oLRTTUot5Bl7+zeAq0KudHnEOeo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q/SZ4qgDgYxTe4TK/2rs1/gSjDKqptDlMnyfrUU9QXXatbh6jVyDiYd2WWRZ2qwtP
	 BM/9e7EJwbri7YZgujYqiVdrxbfL2pI7N0wXsf5S4kLq9FG5/ribnsiwmyezGEZuSF
	 6qEQ2z0IBcIufgDJHVnqZvrxP4j6ETb4hej+f8NJwMbcT2fBTijoJJKh65r9MEs9cJ
	 3Ja2wrkXmmG/n3RP7KuIIDNtB0cVfzRl5oqqTHg40jBzlWcM1JgtPGN5P2M+JiXGKq
	 aKxmVJ02CI8vhC6F04zeOQe2nljFJ8BFmrbsTlhC7SpUeg9ap4NacfJFgPs8hpmFot
	 YaK3fUsOnaQOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A84C606F0;
	Sun,  4 Jan 2026 13:52:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D18229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B7F40332
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xu23oJiIgqh for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC93040327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC93040327
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC93040327
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:52:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A52DB5FFB7;
 Sun,  4 Jan 2026 14:52:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 14:52:26 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 14:52:26 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>, Dick Olsson
 <hi@senzilla.io>
In-Reply-To: <20260104115644.35a50066@windsurf>
References: <20250630185854.9826-1-ju.o@free.fr>
 <20260104115644.35a50066@windsurf>
User-Agent: Webmail Free/1.6.12
Message-ID: <b30f24b92b5fe6941f7cd048cea58924@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767534748;
 bh=MkrZwWUx2K6lkXLjkVvJjJ58oXiJabVABYW7liTkPL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fbGqc8CUKDwOjcDG8UVEC6bM6ROlOPcbQ2JPzFbC6RhEQ5S6ogBo9EfzyWBGIGiVB
 jf3PMXinvwrSLoRRsZqs9qI5qbHncPJ2m/yOcfzSx+jlX53fRv95VQyKzT1gjbgUs0
 5gaxYa3NY6JWveimDfm2QZZSVLbQB36W6abPCUbQrD1nGs4ZI1nEMPS4UxK3QOJrqe
 Z3rep/6i6wBKkRna0LeCVEPxd2z1M/He7f7DdjJFF/GVUH4TkLU+Mv1+9yxilG7HTm
 P1aMfBbfdVS0gkA9jbyPE6bDjISBKNlAvn9uQzmqnV3547ZbHm7gO3jQ5gP4n/IY0S
 /vpzAsuUMQvHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fbGqc8CU
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: add a new Kconfig option to
 pass arbitrary build options
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

Hi Thomas,

On 04/01/2026 11:56, Thomas Petazzoni wrote:
> On Mon, 30 Jun 2025 20:58:54 +0200
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
>> EDK2 build may include extra options. Those are usually in the form
>> of "-D SOMEFLAG_ENABLE" and might be specific for a processor
>> architecture or a platform. For example:
>> "-D NETWORK_HTTP_BOOT_ENABLE", "-D NETWORK_TLS_ENABLE", ...
>> 
>> Those options are generally documented in their respective packages.
>> See for example:
>> https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>> 
>> This commit adds a new Kconfig string option to let the use define
>> arbitrary build flags.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Sounds good to me, but one question:
> 
>>  EDK2_BUILD_OPTS += \
>> +	$(call qstrip,$(BR2_TARGET_EDK2_EXTRA_BUILD_OPTS)) \
> 
> Shouldn't this go...
> 
>>  	-t GCC5 \
>>  	-n $(BR2_JLEVEL) \
>>  	-a $(EDK2_ARCH) \
> 
> ... at the end of all options, so that BR2_TARGET_EDK2_EXTRA_BUILD_OPTS
> can potentially be used to override whatever option is passed by 
> Buildroot?

I agree this would be better. I've sent a v2 including your suggestion:
https://patchwork.ozlabs.org/project/buildroot/patch/20260104134755.1786447-1-ju.o@free.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
