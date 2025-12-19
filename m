Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F4E66892
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86136089E;
	Fri, 19 Dec 2025 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSuNy_Q9qBxA; Fri, 19 Dec 2025 21:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFF660BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178934;
	bh=r1xpiHFZQfTI0g8Lfl1KnRpBiAcOVOK/QiNiVKTWlUc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZXt1ovJRnDNwPQ2iJOSOI+o7oaqm8rArNThZ3Z0jek4Y1PmpfYCiFuPINMP5P2fnW
	 X2n6HRaxsL37VajFyhHLnyPPPmP8bSyKY7rxzWyFzQPKI7Y0kSirEQ1HU4F/Noequ/
	 5iJkTJ38T8eMI1+dwH7ZXtRkkrsUAMiZBpzau4TJTHSP64LGPwNYhDOqppEQlQr8DE
	 D8dUF3q2OKY+kZPp2p3/TkBnQJ5/NhcDUrlOwU4vbCWq6gyAhtDuxJDGEP4BJYQP9C
	 6s2nss3aI/gJqYCjRw1P8oKZxK5Ay1z5CfP9mGxkIJmur3OzBGWKoInd3uZwthNJxg
	 mrIsHevynlDww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFFF660BB3;
	Fri, 19 Dec 2025 21:15:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B54861A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C4E0401A0
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dufageO8QA6H for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A835E40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A835E40051
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A835E40051
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:15:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6E8F920039E;
 Fri, 19 Dec 2025 22:15:27 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 22:15:27 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 22:15:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Simon
 Dawson <spdawson@gmail.com>
In-Reply-To: <20251219175141.1907408-3-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
 <20251219175141.1907408-3-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c5f632d22cdc250cc87395ee2f776693@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178930;
 bh=GofSKBy+nfmfE9YeyY/H1dtfH3JvAX5Qc2rBPxn439E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=guFUMQuTE4BWCKj3/+U1nxY7EcH7GVVtN84wsEPtifuC0UQZMOb3jnL/NiLUhCiS+
 pbvGcri6p9sgtiynBtc6UlPStKCAvcbeyghwE3rJ1aV6BQ9+laL1ScRxahdPQu/xWE
 AOrFBwZE8csvv8ucrSHSZbACn6z2+Ah3eBfR9O18U+bmfSJjT2GlDoE6nx/X+uQV7o
 EjqJSyV1l16n5uUF1ejzieynoBrQh2B33lpFAuGZvsnyo0OlUyLZqUyJOqpvrh1aQz
 8KKaL5HjpDtFLCKzxAc9N/f88orpf9gRbdHavCGxaXqzqWcg/Z6KZyGjAr81QTZbi5
 0xzp/RhZcSsyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=guFUMQuT
Subject: Re: [Buildroot] [PATCH v4 02/20] package/dmraid: remove package
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

Hi Bernd,

Thanks for the patch.

On 19/12/2025 18:51, Bernd Kuhls wrote:
> Package was abandoned by Fedora:
> https://src.fedoraproject.org/rpms/dmraid/c/2a27f40357e52d5497a0245b05624ce37b8474e6?branch=rawhide
> 
> Build is broken with newer gcc.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c79/c79232526ded1d6f1f0f8925f006d7613e22be89/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |  2 -
>  Config.in.legacy                              |  6 ++
>  DEVELOPERS                                    |  2 -
>  package/Config.in                             |  1 -
>  .../0001-fix-compilation-under-musl.patch     | 47 ----------
>  package/dmraid/Config.in                      | 19 ----
>  package/dmraid/S20dmraid                      | 29 ------
>  package/dmraid/dmraid.hash                    |  5 -
>  package/dmraid/dmraid.mk                      | 25 -----
>  .../testing/tests/package/test_ddrescue.py    | 94 -------------------
>  .../test_ddrescue/linux-ddrescue.fragment     |  4 -
>  11 files changed, 6 insertions(+), 228 deletions(-)
>  delete mode 100644 
> package/dmraid/0001-fix-compilation-under-musl.patch
>  delete mode 100644 package/dmraid/Config.in
>  delete mode 100644 package/dmraid/S20dmraid
>  delete mode 100644 package/dmraid/dmraid.hash
>  delete mode 100644 package/dmraid/dmraid.mk
>  delete mode 100644 support/testing/tests/package/test_ddrescue.py
>  delete mode 100644 
> support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment

While I am fine with removing dmraid, I would prefer keeping the
ddrescue runtime test. I proposed a patch in:
https://patchwork.ozlabs.org/project/buildroot/patch/20251219210957.556930-1-ju.o@free.fr/
which simply switch to lvm2 for having the dmsetup command.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
