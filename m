Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EAED6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2867A606B3;
	Thu, 22 Jan 2026 19:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghZDd0oooxhK; Thu, 22 Jan 2026 19:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52037606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108873;
	bh=BdoALAjdyHcmkPK8vfkt1cx6CuXygIRv1Ku/tZTkB80=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UPVWeeBDQrci9SKPpMpGcZNFn32LTua3W258K1zOhX8Gu54UILl3IwEt48eI4XuAy
	 F16yJ6kI5jjniP51xvLuV79bSMafVr/LM57MiZRoP1vh4ktWKrt/9LzUJx6fCHKUkl
	 uLtek0KNGe6GBadJapFwb5wUfH7jZqWdrJ+Qr+WTM3KK714nVIdhtIZUVT+M9jiwIU
	 s3CHk8zMQFmi703E/HLOa+3Z2x3u3/WeypaiJW9Lwkex9VIQjun1/8o7GDDpqgRMvF
	 aB1/zV0DhQ8LGgL0zKnV72gV0CeIeKLLvDkQ0LJMRRar6sAKFm7FPTfPAs3NHCHY3T
	 ElWY+S7PXCaVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52037606AA;
	Thu, 22 Jan 2026 19:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27FCC122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 171D182236
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOXf6K_bobWN for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D2A882234
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2A882234
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D2A882234
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:07:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 02B6419F5A5;
 Thu, 22 Jan 2026 20:07:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:07:46 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:07:46 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aXCZZRkyVbbN8ou4@waldemar-brodkorb.de>
References: <aXCZZRkyVbbN8ou4@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <c713b9b822ff6883c7aa3cf6f3bb313d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769108868;
 bh=ZiVGcya3W8QtA48eo17GJaSWRLTfyIG0RCuZpimyzKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uc8DiV6XQwT8QD50q23nMCjZxUXLIzoUIbSHm2n9+R74f/tLQMmUd1yDPRTEzs2Lk
 +tcICtz+QXp497AoVQs81yTSSR0APtJtWK5XkcvOgyrqUlsp3piZ5jmooXcQFyzy1u
 hWYrC2+fPco6SqakSn9mVeTJs2fwGlDV4pIK23HzpCwT/9+ZKmlJekvNqgPlvjuxL7
 3cDnxfBmVxKC6151aVEA+hf/pdY6jfeeApMOMOWrTgOIDP1Ypm4zsHRoK0rHgilvrJ
 fKjoPHxlgB7CJoY/3qtyUjYrCWLxkPdCYJH4ptxnss1I3Wp7SG5phg2RU0I3ZfHQjw
 AcCzrFzRknJhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Uc8DiV6X
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: security update for 2.42
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

On 21/01/2026 10:16, Waldemar Brodkorb wrote:
> Fixes following CVE's:
> CVE-2025-15281
> CVE-2026-0861
> CVE-2026-0915
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
For info, I added extra information in the commit log:
https://gitlab.com/buildroot.org/buildroot/-/commit/18de297a5ad3d1fc1b44f54ae69289ca10200ad5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
