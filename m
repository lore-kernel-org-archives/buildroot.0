Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E1CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 22:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C648240A5A;
	Fri, 16 Oct 2026 22:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubg9MK8-U6qK; Fri, 16 Oct 2026 22:47:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F126F40A45
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792190845;
	b=BV55bsaPAYjsbi8G5hBA8QKG4ZNb7GEVWN0aj60/F29kTVulADzkiiH9D+xspdshpbjd
	 UrpEVJyUb0JWVaFdUiS0/6fDSgFx0AkZGHlOb+qsTAccTuRTZLgGRbR2Heta7KGitsDFS
	 7Ht98EjjCzTbG+WbIH3eKYNccBS47ojfezjzkl44wS3YKIhuofUn66bufA35cVC0olrGa
	 6SlW//QUFW0XH14Uiix8pmr9vz752y/9DSYKbXE70zdjjlXxHL55t1fG1Sqb0gFDIRQiV
	 UfUBCuVA1dc/Ttw0ajhkDAMcKq9GDJeEpxnafxKZBqqrdh2mKLXbTtiiwUsrpmvtppA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792190845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4liLjPd3UVcYOv3bLIc6wzsUuXCNgO5DLJuu98ms5Hk=;
	b=IwjB2k5X8cacv4NCjs9pBiEp5CAlaidULRunCXyNhxtUMgJuwdTbjxQXuGhz0ELiiKCQ
	 Trzb3Mx+VT7QthTSxWYy94W+Amjkb0DZI4IWBdVAOFVclspY9Lx27KX/3Guf4Sspg6h0O
	 TWMgynZGIvn1/ZEbaYM9+FLiiq7reSpoJcCRCWqSbuphoD9bWHTeowd8BYPEDhv0B37cp
	 qEyTgRXhHV3doFdlVPYLApnmoJV+dG0sNA5NU6EExhUJRBahWAhsKJmQaLk3nCdiZ/cCt
	 it+CpgRhOBFzsVlK2aWSSyNCWRHO33hbnoPt5Xjvgc8eC6YBhMuB8ofEEtYOPgLx8mQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792190845;
	bh=4liLjPd3UVcYOv3bLIc6wzsUuXCNgO5DLJuu98ms5Hk=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=LtVTQwJgheV7kAb7cpr9HUCGb+BWm15PW0sY1ZwsmeD8cFcK3IrmmHdAbGXT+sIh/
	 R9ZuKEvj3Us9ywqIwM9atF7PVX5Qi/on+pZB8f4leiCyji6dXLk4H0HFQv5W5mDW81
	 8lz1L1EbfOokWamEsSIt54zdOkOFuysUO/fqeOjDpYfopbTaH4+g3ltbs5IGn535zu
	 yiHSt8vp/+xAjAu8/SN1QjbjdqsZ25PLMfpKcoQ3hV17kH48CiomywG7IYDz/bpfA/
	 eWdzBhgGmMvx6Eddqh7nU8VDF6gEMuX9nhGjMh9CGT50/9Vsh/ZOZYZcVaNPeo/AIu
	 5SQZHiu1gDIZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F126F40A45;
	Fri, 16 Oct 2026 22:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71FDB79D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D6D60B02
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S8uQuku4O8u for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 22:47:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5069F60AF5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792190842;
 b=Wt5vtmr1VroAg3biUpB9bN3df9fmHeIs/hSj9+DvYpfUuU5NoZd/1P28w+bV6MEaO2ko
 vB8rxOWJZWHGhEmHyS3i48Kwp4+/j+bR0QBF/g9e/AjYslMGLqVooYdOJLD7dOSido73U
 6B+agoXn1traMXiN6Iq0kP34wpYUO37bP+PoAfBby9pUDTFl3vzCR+4rDSNzx78G2SB7L
 dRyiFv+cORYhJtKen4fcLeIAeW2TD4fPbpcYdcIgq9uf5uw+rVZ6B3EXucsSLrXLkNAcq
 vPc2ARdbSr6uWyDVXuoRO0rBAEhtLYsaz3cfZcYgga71uMW9N7P1H5zrGpSJJA/uOQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792190842;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=31iaOUSYZ7pRe5QcUizbe3ceEtYxf3aRJQdxZjINke4=;
 b=WKA7aiHpQvNW/N/9nrkPjxov5bpERd9Z7MpbYhF/6ryvp4AzmAKaIEmMKB7c7fW5B3FV
 DbTIRxHEbcxeLhlj46dezJ12DzNStZPhp8Q/Lud2MIwBYX9udBWEm3pCBbLZ63Tp4jZrp
 MEVuNHD9own9fpInYMoXNE0ZEHv+NLU5kCS8Cc2NCZ3VKlX+cHYdjbfOGaNDq/jHhPOZ5
 bZ/zjJpIkDBWQD5ajnU2bYzoxZ124K9orx4JimfxiQ//ONh5IX+8LOE8nLrg347+rI8nL
 nO9ZY3ZH0Jwl66W8eFa8kIYjEpXSmYuhElOgp0RC3xbdX5TvAE1u6iiMokDa7pWxjQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=f+c7o4bl; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=f+c7o4bl
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5069F60AF5
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:47:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so143718f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792190839; x=1792795639; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=31iaOUSYZ7pRe5QcUizbe3ceEtYxf3aRJQdxZjINke4=;
 b=f+c7o4blW1yAu8q7VXH9DrRfkafo+Sq8pR0mUTXpBuDiZVXXJFlpJZmpZefG46a0Fh
 GINc/+zQRjzM+j4e9vJPIVSh14U5DzaXfqYDXCoTH7sWxZiqvScJuv+8he27mj6MnSfM
 KXX0UVDoGHaziAyl3iEsSv0nrXvwCmWB7cP93ikGr5pXS7JsfO5MMJRLwnR1VntG7xA+
 +3aRx7/SU9JzI9RQ9+QE18BpufwT9uO/RvXohaqs3CvLqf0AOPoaHb2YgmPrwZUFxDtk
 8CXaf4ARKRihQ18v29J2tJ3Jee3te+H9l+l8o1SIEFUR5wgQIuN3YuI+jVEh4ataHPkK
 ZzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792190839; x=1792795639;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31iaOUSYZ7pRe5QcUizbe3ceEtYxf3aRJQdxZjINke4=;
 b=G+uAhfz39B3iWwl3bdG/3DNJ05RAEb5h8ymUMvdHasNS3OekITuF4yqCD+qISmQbtl
 BzEuobJOrCzF/YasnBlAyUp3hDqDsE8vTROA7Y7HCtbArsr3ktMguYk3F/ZiY8mngovW
 vriHs89kyKGfK9XuQWCmU3/NpkVC19x1UqdXUqqeqE8aOVTfixXR1J2y13zJBxOSgQo3
 dv8FwHz+YyYUKR54HmUZbQ92WaEadeuUSMll9+xGU4t82e7XGB9tY1d4HdXh5a8dKn/f
 kkO3NB83UYC79XLLQarkQoLfkWd9Rjcx97XHbHhQDBERMK0sPYTiwGpDKvAkRw7Itbzd
 rfrA==
X-Gm-Message-State: AFq9FYIPRmvKg44SySpVh5DnQBhEk7m4D7ipGARQSDK0DXYzP6e8ErEH
 HcRNBjyR7592iT5/HpzD4EB70lLhGrB8+o8j3UQ9RIL4ivYxBiJvwPBN
X-Gm-Gg: AYBFou0ipP736xK/O1EzoFFPHOn5402FU2R7TKORyDQ57FyPXLA7jY71Xzv7aKql2/X
 s/4DorL3lPr+CbhSd7vWdzOuyk0PWAV61y7y6pBiZCDha3sfhmHO8kcnUZBm636gu3U1RXtEbC9
 KNE+4j2HXSj080Jq1pvPbi3V585aZ5Lf9VCZP8QkdGC88z5UdY5vYfhh+RkbU9JhhRr3LvEkdNX
 G6ruksE1/0D9e/GoyrCmofgpSr09C1HsNuxFOQ/JkC6EXI9R2qQcVVwr3kKVaUBrc4hl4QR1MSO
 VTiiFog5NYb3WUvwP4oYwRHruvY6wltxqFRK3a8LMcqBdXiMqvpeAsPoHZ2QB78eBsa9hj8bytX
 +er+/nWqb3gdOVfuW9W6jG+0oNq8zvnlHysjngucGEjtxA+2IU95qy5GSxQNXBwljlszbO60q3Q
 YLdXpaQqLnAvXLM5WTOiTxOm30CQxbEwePPxp+QL2PijillINxWsmZe3h9ffypRDLTAWzgZaHsO
 99hXNX5vRScvypsgnvYKLbd1TYjvQJLi0oR
X-Received: by 2002:a5d:5846:0:b0:48b:677:f80d with SMTP id
 ffacd0b85a97d-48e07f98c94mr1828650f8f.26.1792190839394; 
 Fri, 16 Oct 2026 15:47:19 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8d1esm7891894f8f.39.2026.10.16.15.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:47:17 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:47:15 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016224715.GF331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-5-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-5-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 4/7] support/kconfig: update to kconfig from
 Linux 7.2.9
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> Many changes happened in upstream kconfig since the version we had
> in tree so far, which was derived from Linux 4.19. Here are some of
> the important ones:

> - images for the graphical frontends are now in dedicated .xpm files
>   in the icons/ directory (previously they were embedded in .c files)
> - some header-only data structure helpers (hashtable, list, ...) that
>   are used in other tools in the linux tree have been put in an include/
>   directory, which must now be copied in Buildroot as well
> - Buildroot specific patches have been heavily reworked (some removed)
>   to apply on this new version
> - Upstream dropped support for including files within a "choice" context,
>   but this mechanism is used in Buildroot. Add a patch to continue
>   allowing that in our tree.

> Finally, update README.buildroot to reflect these changes.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

This would deserve a lot of testing (to prevent revert of whole approach in the
future due hidden bugs).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
