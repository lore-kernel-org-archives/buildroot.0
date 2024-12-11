Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F1CE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 06:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F05E81F3D;
	Wed, 11 Dec 2024 06:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cVvohRIJ3Cl; Wed, 11 Dec 2024 06:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6243881F2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6243881F2E;
	Wed, 11 Dec 2024 06:51:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 136EEED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D7140F74
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeqFg64PUDkv for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 06:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13D6040F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D6040F73
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13D6040F73
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:51:02 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 94757440319;
 Wed, 11 Dec 2024 08:46:53 +0200 (IST)
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>,  Julien Olivain
 <ju.o@free.fr>,  Vincent Fazio <vfazio@xes-inc.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241211004940.14204-1-christian@aperture.us> (Christian Stewart
 via buildroot's message of "Tue, 10 Dec 2024 16:49:40 -0800")
References: <20241211004940.14204-1-christian@aperture.us>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Dec 2024 08:50:58 +0200
Message-ID: <878qsm7lwt.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1733899613;
 bh=wJ5XvwV7EveZQiaN6rY3kEkObt9nquVq/k9F4johJdE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Wgq4wXB/bgE+lrOCPdMFCfnblOYMcQRJrclCw8GvfSBDRk/QLgzmzeAZgsb2lbRsz
 9sW4bZOyJbwbSgsb9P9vpKITFJJTLUN6FzF60+y33LYpIFQGNVwjK9dHlnzGcZqfq6
 3m8AudIz1Up44IzMN5bUAbp7BziBoXa/ipgb0Dw/Ht6/Ob3n86oE0uG+AbGTzBudkU
 d71KMu3pvr9vYBEPW2t9RXxUhQnkElk2HCqf/56ZcxQ9+daJsar+70hU09Fg0EMAzp
 CTwqMPyQ7pJVBD7u+VoeiJXEuK7E1dWM00FSXWSEuH5fL3OSHcle8jKIc8IPo8zHCk
 rnlTJWAdp5JpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Wgq4wXB/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mmc-utils: fix hash mismatch
 for readme file
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On Tue, Dec 10 2024, Christian Stewart via buildroot wrote:
> Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21
>
> The README hash changed causing a build failure:
>
> https://github.com/skiffos/SkiffOS/actions/runs/12266361526/job/34224344838#step:8:60617
>
> Update the hash for the README.md file to fix the issue.

The patch updates README hash. Is that a typo?

baruch

> Reproduce: make mmc-utils-legal-info
>
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/mmc-utils/mmc-utils.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index 48bfd7bc04..3da95d8070 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
>  sha256 1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131
> mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
> -sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
> +sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
