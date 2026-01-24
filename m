Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D2D715C6
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 12:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D167A40ACC;
	Sat, 24 Jan 2026 12:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTPaq4AXDNWK; Sat, 24 Jan 2026 12:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4A140A19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769256532;
	bh=VQ5PoEbXXRjichmF0fj3whwjHb4VL3dc5zmCEK+wiAs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TcIjzhDlqtkjE7P7enILWXwhGdqQFYIJAi3lWOI86YtxO8BPXcQ+kWqrlGS3B9L1u
	 romFCYE/C/rR/FZK2JywqF71Lwp0C1z7UEYaduJ68rllTUvHMmNiUsymu4lFCrNLFw
	 Hnp6nD34/Nh0iHtjGdUhZlvmSHaxHQP7Ec1sa/FywAQoqt7wf/OJvl/HkPCkJh33UP
	 65X7HROYoM1nys0B9WUKCD+66/r17oL8u2Fmf06V0BYgh4r7RS18GZLOZdHsMa7iHD
	 ttx/ls/ySah/c3HR/D+OJum1TdCKDVIEYsVSmGYvwnYBxYV7zHK3mCj6ooEKYI0j49
	 0fqjj9grkcakQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4A140A19;
	Sat, 24 Jan 2026 12:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 559E7122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39F7083B7F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX91wboUI7xK for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 12:08:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D2D182D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D2D182D17
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D2D182D17
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 12:08:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A69F65FF95;
 Sat, 24 Jan 2026 13:08:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 24 Jan 2026 13:08:46 +0100
MIME-Version: 1.0
Date: Sat, 24 Jan 2026 13:08:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260123222945.15544-1-bernd@kuhls.net>
References: <20260123222945.15544-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c5363967fd27419078bff788eec00a19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769256527;
 bh=Y4c+geEEAX01MFT4RNR3vMxEB5Ggkw+jA3k6pJcGZ3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lUlAIFK3gbbVamfyVXQgMRMZqQvVf0wl34iknfs4uqoozTAAFRMG+8kMsuHBS3ltI
 DYlKyV08XguEHCUQDTPZklsgdkb74U77cITGWZkI2cUxW+G8vdwLZOgDT+9C4TDgib
 V30wEiPOF9h+zVm/1a3ag/til5dCEn0dCqSr2VHiN7ZD3TWa/MTlMEOsO3q8XYaWBc
 eEGTNw03+wl5sfIb31SA/gSDfwuwnIUEpjEMGuPltK12XmtcgyR69qlaG5VSDfXqPn
 Vkbqu24r/Tbhd0t1lDulbx/GIqS2fbu7qccRqX5ffLuay6tXSiNdhKUpEIl4A0bBsj
 l6ht4NMtus2pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lUlAIFK3
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.5
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

On 23/01/2026 23:29, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.23.5.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
