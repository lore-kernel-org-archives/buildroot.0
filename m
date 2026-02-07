Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C887AEE0AEE
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3116D41B97;
	Sat,  7 Feb 2026 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1UXeai1Shco; Sat,  7 Feb 2026 20:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCE541978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770497871;
	bh=XXos3lHJTBd0CtDyEyJp/SEyZV4Qz//btn237wKmhfY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RtvSY6M+qJGuBFpjUH8pGQHr/UiTLvwm3N3DeYL6WtRO0PsYtrAdOSNoApp8tV5ga
	 cozqTECBk0/37s5RroS4PPvPHJ8OrxnYYwO8BGtCydXaxbzKLShzG6xu/Ku2ECb7Wm
	 +o4rRxuGxAMnV5rfREXyJBoAwY2Okc/obpyJnWYmpfqz8b+zEBYWwd+ap4SA8pGdcN
	 i7qa4GIFq9Gc7H+xUksfZD0UkRUV4B/lBkhR03Owf4dVaQ0IMvWlL+XTUvUE0PBUN2
	 cBVW4vOO/XI6DK0wU9aJg7UCw9fNl+nxZvt0KUt2NyGDf0u+48ayQ2vdjSxyFnjbM2
	 N9GwxHcSmIqAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DCE541978;
	Sat,  7 Feb 2026 20:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 850E8173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67A1B60FA0
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edwZ-bqcB-YX for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 20:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 465A460D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 465A460D5B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 465A460D5B
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:57:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 519F02003C6;
 Sat,  7 Feb 2026 21:57:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Feb 2026 21:57:43 +0100
MIME-Version: 1.0
Date: Sat, 07 Feb 2026 21:57:43 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <87ldh85z0k.fsf@dell.be.48ers.dk>
References: <20260204150049.3057699-1-peter@korsgaard.com>
 <87ldh85z0k.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.12
Message-ID: <93a8380b1fb5f2107d97f7d3a974c33e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770497866;
 bh=PVuKMi0tHF3OzaqeqIwJFq0FJpe1sQsHb8BBKuCw2hw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwAzXiujpRxz1rVawchsEXt0GCtHuOqdpRzSLfGkFk5QtRx29HvA2iLv7CZPoaptj
 npjho1EFyejM0aCjmH28LKBPFHqD2oF3lDkL6avW68B09t1Ro2V8g4AI/wQIYMwKwa
 puqaFEBpCwuE0cqmAPuw+79w+pVV9CHMf8wfKHEr4mTETTVAFjXUVNUwmMnNs+rEF+
 9EALGLxLXkaFLzaqGQznooK4phCUuxkgmOfRx/LPhj0FB6Qk3o3SH7m2wub9e67/nh
 qpd/DT2ce7j1hwE+axHl4tmM1nKDnq/Bkupz4gPcKVKBGo3l2G2Fn8Qd7HJBcZGtzt
 zpBioOhLFsoag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hwAzXiuj
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: move to sourceware.org git repo
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

On 04/02/2026 16:06, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>  > As described in 
> https://gitlab.com/buildroot.org/buildroot/-/issues/160, the
>  > github mirror is getting shut down - So move to the sourceware.org 
> git repo.
> 
>  > The github mirror was originally used because of performance and 
> reliability
>  > issues with sourceware, but that seems be resolved now after 
> server/RAM
>  > upgrades - E.G. from the sourceware news:
> 
>  > April 22, 2024
>  >     server2.sourceware.org now has 512GB RAM, thanks Red Hat.
> 
>  > https://sourceware.org/
> 
>  > So change back to fetch glibc (and localedef) from sourceware.org 
> over git.
> 
>  > Notice: The git archiving leads to slightly different paths and 
> permissions
>  > in the tarball, but the file content is identical:
> 
>  > mkdir a && tar -C a -x --strip-components -f \
> 
> This should naturally be --strip-components=1 (both lines). Maybe
> something that can be fixed when applying.

Applied to master, after fixing those command lines in the commit log. 
Thanks.

> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
