Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CFAC44516
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55FA6409C4;
	Fri, 17 Jul 2026 10:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diGdmSnf-L1Z; Fri, 17 Jul 2026 10:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7971140A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784283203;
	bh=EgHtt7H2xnLWNrCL9NzeWpaAKfstYPRETHcxf5UqNdI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fLtjgCsjAzReA+/pTbB5A5upV8PD677xU2L3vcMdmuYeI9iIb09Q+xoIOV4615yLA
	 SuBxIEuNWbUlPVQ9a6LnKNNj4gLLkS1HvjrVrC7m7DqDqqXq9VmjMZO3uXWCb5ftoO
	 jkBbyvGqfHzdFuKQ9OtDgReAiaS7ZAPp3Ft/7S1Mfef1vLyENmfLi21azDbdEZky09
	 kRd4duh1VTojmuMw51aeTNbWy4ilTmFC/9ESf/rJcklWumo0q3ceT6klnvUOt+GKCS
	 fexUhwfSgc+7GZxuJ+FpDVNT5Ofoy9iDCS/gxeXmc28f9glHkREuEM8go2vVKF6J2t
	 u292d8d4kXdcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7971140A38;
	Fri, 17 Jul 2026 10:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D031320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 10:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ADE74026D
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 10:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phWNV9PxnpP7 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 10:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCEAC400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEAC400F5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCEAC400F5
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 10:13:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D55C613F88D;
 Fri, 17 Jul 2026 12:13:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jul 2026 12:13:16 +0200
MIME-Version: 1.0
Date: Fri, 17 Jul 2026 12:13:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260716053350.11727-1-bernd@kuhls.net>
References: <20260716053350.11727-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <3bf41a357bacda5e973a23a622edceb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784283198;
 bh=gLVg0xGLtUBj2YWRaxSQS9PFuhZ6yQlbCkPRaI9Jam8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SshHeyCd1qGiSEaZM/BzgkNha8nh1YYC9/MdoP7GjlHHu6l8n0dP+DPArlxJqFNnx
 CABGeS0VRBRN2EGDttCQWOwqh7qx7/OwpNjrJ0b8DKdb81uxKK0sMG556pb5Kw2H8c
 KMxoJI/9OfVfpUd0Lw/oVtxXiTAZjD34259o41Q137pROtdcQklLz56oKaHCagnZjO
 v3ahV0Ll303+Iq4mKh6sKaEP8plienGr4/Lc8AFADWo4Wfqud6QiIdCg3JY9TdAUBu
 YF74lBjx5KG54bu8N+0DH+XwONWSDNokV0gOi2pMWDWBHXo/8/NEy3uDj+0Fk0GcdM
 g+/iDNr07OcAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SshHeyCd
Subject: Re: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump version
 to 2026.7.7
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

On 16/07/2026 07:33, Bernd Kuhls wrote:
> https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History
> https://seclists.org/oss-sec/2026/q3/152
> 
>   Multiple vulnerabilities have been discovered in ntfs-3g.
>   A new version 2026.7.7 is now available at 
> https://github.com/tuxera/ntfs-3g
> 
>     (ntfscat) Fix heap memory corruption when processing a corrupt or 
> maliciously crafted filesystem. (CVE-2026-42616)
>     Fix heap memory corruption when copying index data from root to an 
> index block in a corrupt or maliciously crafted filesystem. 
> (CVE-2026-42617)
>     Fix single-byte heap buffer overflow when decompressing maliciously 
> crafted compressed file data. (CVE-2026-42618)
>     Fix heap buffer overflow when copying the tail data of an index 
> block to a freshly allocated block. (CVE-2026-46569)
>     Fix out-of-bounds read when processing symlink reparse data in a 
> corrupt or maliciously crafted filesystem. (CVE-2026-46571)
>     Fix heap memory corruption for maliciously crafted or corrupt index 
> data descending to an out-of-bounds tree depth. (CVE-2026-46570)
>     Fix heap buffer overflow for maliciously crafted or corrupt index 
> data during a node split. (CVE-2026-46572)
>     Fix heap buffer overflow when building inherited ACL data. 
> (CVE-2026-56135)
>     Fix out of bounds access when clearing an index root in maliciously 
> crafted or corrupt index data. (CVE-2026-56136)
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
