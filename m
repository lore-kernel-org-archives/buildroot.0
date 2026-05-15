Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14434CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6CF584558;
	Fri, 15 May 2026 17:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiH0pBaLoCNs; Fri, 15 May 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6A948464B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867199;
	bh=Yu/wyA0EXCC7VWBJuoOVJNRoNE39KDi6TFJ8gUs8jZ8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nG6v4y9ktP+BihlsLuB+TWLsNUjcjVDzwslEVHF+sVbDz+qhg+gO9vEP2Xx5STw0d
	 S+IBwhUpctu0b8yYq2O+crJgGBQ/hp8dcDaOmTsdQHKGfJ3fQt3Khu1pI4C3a3Ymad
	 fyQJYhBUfRLhPx9+gYXzueIPg2WVHpheuG70BXwh7vc9i8yG5Wm1Q0V37XKjUiOE9i
	 1wZjuZOog2n7ZCQJiQ7/VDznzPXJ7gMxwDA6clDlAYS8j4IYcW0RBNmawTxoJU0d7h
	 xwJ0Lxh3LKnDUtUKRMGlDk22dXVi8rPOK1WLGsMOGKAqIJmy/JfXzjWFCEsbgcmlR5
	 YiqEC235C+03w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A948464B;
	Fri, 15 May 2026 17:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7B145B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1017884538
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxp3ahShjI7A for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC8A38454B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC8A38454B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC8A38454B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so1158355e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867194; x=1779471994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yyATLcXLJfelQlo9joUeY845dbDyY+hAV1g2eI54YFM=;
 b=i1/mrZXaLi4kQjpx2ALiBbO/2YtbsdsAxUZ/dj2+2Usk6fSe4K8mTrLa8iuZ3GlNsL
 7xW9NuckCGnG1yxmSXkFv516Gq59+QKGL2xcSnkmojHU3ZnCbicnOp/AGq+o60CyV+7m
 a5ZmY7eFIvjWDFqlHCmOMUUj5K0/6oGLuQXB85QwNKW905r9mcSbNRfBbLpF8jyUsOvH
 SNAhykoe3gvrS7PcUiXCuPbJPQMIdFUnRXY1n7v22u3lbWfDJPZiLiyK0Lw2eoM2EfO9
 QVHM70dUbzAu20H5c7StH6nM2Z+OSoHK1o+967hxE4bPUM+u1oXSeq96RUB3QXcycCx7
 A9Bg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EFI8Y/DHftYa0zT5R7wg7z1pVioiZEsZpNrmLPftrScSQLaRVxO0ugbrH21vTVy+3CYAvCe6h5ZY=@buildroot.org
X-Gm-Message-State: AOJu0YxsXa02Lz33FZNiUUQStOOv05lFTp5JqX5HgkjouxFWBvUlBjqa
 8OqyQeZ+62TnX1aM6l5qJ/nHAUZl9+d6L8W/yh9TISlsg6DDmdoFdNdjhIP3q+x5VDJIzxiFsg1
 TSvsh
X-Gm-Gg: Acq92OF7OZWCkqX5SHjbr6wcMb9LkAKzr8PURnTjY7+ka51lnQ+DY2RzJcgEgvuAXqm
 a+xMEH/Anuc3EDm3VDz9irIkDSWP6UBYmfxAdeT5L/MAm/1eEHnA7/3DJUgQCKX1Moy3humMFAv
 lvuWZRUJtrJtncWOerDFdfq5S+naWbdLZbXMFWviE3UIY4v1HrkblkwZTviG1eLfxtYmfjkCzkB
 w5DpAhG0Eu8xp0MEkxQ8vk1VJ49+WUW4Xs6qOLVSE/tzmXBw4Ekcq63txj/IKhpLhDhJkj8QELq
 gz8svp0EBzUV8zmLTWaXSIbIqmektQJX6KGbmnpTY5FdOw8LV+OQF9S63CO/g5trovbsf5Bsg5J
 ACsTwTOs023z0dPePZz3k15O6SECVPzSSxCYRDlqoG7VTwy+1n/cuHDyuH+4bpVN8WCJBt/4kiu
 Ur4ES4oV1XHID2AOy607Uc5vFfut1mSCnNZY2D/HCFBEYP
X-Received: by 2002:a05:600c:8189:b0:48a:9428:5522 with SMTP id
 5b1f17b1804b1-48fe632249dmr79289865e9.16.1778867193782; 
 Fri, 15 May 2026 10:46:33 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19c2dsm16205031f8f.21.2026.05.15.10.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:33 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:33 +0200
Message-ID: <20260515174633.530003-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-5-fiona.klute@gmx.de>
References: <20260426153334.1026982-5-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867194; x=1779471994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyATLcXLJfelQlo9joUeY845dbDyY+hAV1g2eI54YFM=;
 b=emFHfExYeUI8MegImPzGQuHKhh545oxr055d9hdOKJwySZKqII6iov7T7xQDgaUKZY
 l4AtYSqcmQTBmOph+/W2+BbkOrpZP5dMBDFUmZ/mxXiN7GjrPHFrXpOiEac6NAMxl8AQ
 6g4HvbFht3Yi7xoe3bmEnoGR77DERxP17BEj22kQiBjYpCD0kPxoOFJQxRD23WdEJVht
 GDH+qpoQmumlWAic5VrPFWImoEKElGaYH/I3AIzkZUbDRQW45liQORqaBXIEQ4+PCImw
 VrlAcvb7kr7jWqGnkCXNkqB9dN7Iso2M5x1SUrEgCGtnVOQicKLIOQL3jPyPHF1DXW+p
 aIiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=emFHfExY
Subject: Re: [Buildroot] [PATCH v2 4/6] support/scripts/pkg-stats: fix
 host/target infra filter
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The filter is supposed to exclude host/target infra from output if the
> respective package is not built with the current
> configuration.
> 
> However, excluding host packages did not work correctly: If keep_host
> is False because the host package is not built, the next branch was
> checked and included the host infra in output with "target" type if
> the target package is built. For a package that support host and
> target build, but gets built only for the target, this leads to output
> like (Meson example):
> 
> meson (target)
> host-meson (target)
> 
> Skip host infra in the target branch instead. Also include
> Package.infra in Package.__str__() result, which was needed for
> debugging this bug.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/pkg-stats | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index a87bb23a8e..bbd1e3e6f0 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -205,7 +205,7 @@ class Package:
>                  infra = match.group(1)
>                  if infra.startswith("host-") and keep_host:
>                      self.infras.append(("host", infra[5:]))
> -                elif keep_target:
> +                elif not infra.startswith("host-") and keep_target:
>                      self.infras.append(("target", infra))
>  
>      def set_license(self):
> @@ -342,9 +342,10 @@ class Package:
>          return self.path < other.path
>  
>      def __str__(self):
> -        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
> +        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
>              (self.name, self.path, self.is_status_ok('license'),
> -             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
> +             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
> +             self.infras)
>  
>  
>  def get_pkglist(trees, npackages, package_list):
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
