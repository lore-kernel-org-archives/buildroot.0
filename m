Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CA1D7237D
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 12:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76087835A3;
	Fri, 23 Jan 2026 12:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpRCloNUpbrx; Fri, 23 Jan 2026 12:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72543834CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769170893;
	bh=RJOOTXKF0Rd9ldbxBjn5UwDrgkVKXTL/lHhRN7WTMlA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IF+xCvG/yjo2UESP0Uck89lsednjvPhcxbbISto0UAVaqS47qIPNHLg5/W5C/x5sQ
	 /WN2b57sPh7mSB+nqXpq5ocVdOSlE7yKjA6rOuyTkKNomySPZgTITXWWh5QsXve5ky
	 nN3kxEJ4odPJ/c/hK1Lfrti4MD4GNWppTEqEEQWD8nQoq2hgnZFOKnlEv5YYzrar0T
	 SNk9NWgURYDAri20AYd9v969OZXUuvFSoNR3Rlj9N9DOCD4V2yhJQ07o6qJIodNqbT
	 Qf9fVIriQAThxpuVEdsuSdEE+b1Xrf0aPZ8zZB0JE7DLfXWtOaS0CK5GEwYJkC8Xyh
	 TIwintiskzt8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72543834CB;
	Fri, 23 Jan 2026 12:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD234122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA30D40AAC
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpPsx73bAT1Q for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 12:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6008440AA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6008440AA8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6008440AA8
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:21:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 864FFB0056A;
 Fri, 23 Jan 2026 13:21:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 23 Jan 2026 13:21:26 +0100
MIME-Version: 1.0
Date: Fri, 23 Jan 2026 13:21:26 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aXKjG3hQRwysfYz1@waldemar-brodkorb.de>
References: <aXKjG3hQRwysfYz1@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <ef5d1e19214cf403a117e1ade62a042a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769170887;
 bh=CFGz5fbVSYDMuXm/K6XwzjUd+wZ7uJtJYp6ZsEb7/8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uBzFP9f9/E2Q0kSeGPCrUzihu6ReblUFuQx45ZKHG33TpnhelreM2oBVY65AkiqTP
 iQSiQKqlQZyYU6m0KUKzfo8YIGkhU9EnRvBWzzjF6615f4egjqwHSIBlpZV9EcakUz
 lMG5n/9GI8A8ZLq1fW+ouf7lX2MylFKkHlZTRJiT924OFYDeK1buZlFqg3gyQqXnMb
 SJhVZity7EukRIrHbPdMdyzDmjZtvAmXS8bBq81Vfrtt1EXwLuScSttOkvG3LCAPID
 ypGEVS2Dis5ZS2UWDWweVQn7aivno8wtyuUla64xNlTfMU51UBKVnPyBDwgLv59WBT
 jeMtGF0zsWLmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uBzFP9f9
Subject: Re: [Buildroot] [PATCH] package/strongswan: bump to 6.0.4
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

Hi Waldemar,

Thanks for the patch.

On 22/01/2026 23:22, Waldemar Brodkorb wrote:
> See here for Changes:
> https://github.com/strongswan/strongswan/releases/tag/6.0.4
> 
> Enable minimal required kernel config options.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
[...]
> diff --git a/package/strongswan/strongswan.mk 
> b/package/strongswan/strongswan.mk
> index 9719242327..ef5a3fc42f 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -STRONGSWAN_VERSION = 5.9.14
> +STRONGSWAN_VERSION = 6.0.4

This bump directly from 5.9.14 to 6.0.4 seems to include a high
severity CVE fix included in version 6.0.3. See: [1] [2].

Upstream seems to also publish a patch for previous version in [3].

To help the Buildroot LTS support, could you split this bump
in two patches?

The patch 1/2 marked as a security fix, (rebasing if necessary)
and adding the patch from [3] and adding:
STRONGSWAN_IGNORE_CVES += CVE-2025-62291
in the strongswan.mk file.

The patch 2/2, doing the bump from 5.9.14 to 6.0.4, removing
the patch [3] and STRONGSWAN_IGNORE_CVES.

With such a split, the patch 1/2 will be cherry-picked in the
LTS branches.

Could you send a new series with those changes, please?

Best regards,

Julien.

[1] https://github.com/strongswan/strongswan/releases/tag/6.0.3
[2] https://www.cve.org/CVERecord?id=CVE-2025-62291
[3] https://download.strongswan.org/security/CVE-2025-62291/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
