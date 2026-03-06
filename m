Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E7FFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47ED341E8C;
	Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sSOlUm16kDp; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C9442081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826794;
	bh=6U+XIO6YNzF1uWQrEBqOICyJfEyjDyYwiOoP5XOsgfo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTc+yUSo78cDS86y7hlDcKJixEhBAT3K7SO9a97PstAjMZeowYGSFXJXXpuNclbIO
	 OrKY57C4QNohJxKrVHP+gpkHo5K1aBVTXzi0SI7VEraYuZHaZpLdtBVk7KHMclfb5S
	 R8lXX2pfw8w5mcaqItfzlFcZ/R++ERoKsBRrNjoeA15nLexc6Y+0fEjw+blF698mxV
	 XwVEZuB/PmO5x0NUTLLLcG1Q5ET3miOzNYkY2JTScrUm4Zbjurgu8kq4p3bD0vmPxz
	 F5AGgonNhhL4Sy1zPS+1OnzK2AvCM3QggptqR/4Lvk92ll260jrOklnSrHnO0UR6W9
	 0NZau1uVqGn8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C9442081;
	Fri,  6 Mar 2026 19:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6BD1223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC77D40767
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g06vdhfOENIU for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D13CE406BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13CE406BE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D13CE406BE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439c4a93841so2770011f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826786; x=1773431586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HD0Hmw3VXjmyafA3gAFnwiZwQPOT1IUODfz4bUgXec0=;
 b=ZlL/hZxYuAtWpjeHkxV1GWkLxkfGaFW+7sGEhpyHuks2Q1tlljHxAhfTGqE36V2R6d
 ojq5P3EJ7o3K9tWEh5svYt1KLYuyJC0H2bVyIZZwfRauFr19ZBnfrhwJJmxiRJDlO+vT
 LZM2eJ+YjvdDUBEFlqI/9kWRCgFmCvDfXwyMl90BRgahP8fx3tCQjB62/pmBYzQW2sjx
 Ptzod2Q11hsbOfiXD/UXMw6pjGHmuajHtOcfTsaVZbckXSS1/U2ND2PpfeKRbtoMlL64
 yt5MJW/EhYse85SkW4Ny48+uGH+ZNhjSk2rKXXv7G63uR7LBFaVjBOwcG9BsJW6jDyOy
 ZUTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExCPr5sNjSVlrKcn+RrcwHPhsXVaolvmmoDE1fIta47pWI0/XxIiBdf8qmsvE9rxtJPEB7uUXSlo=@buildroot.org
X-Gm-Message-State: AOJu0YwsAdRZu6X4aKlEIFoEOvR8gc+KwwCNf64FswtCO3GdMkP0r7uP
 FqlMTTNTJrhKqIoBQYvjtKMGzRQRnDXivH5JGMkvo/V5Re7ZGHxV0qI0ensIlXxup3cA7ypl7Qk
 e4hZz
X-Gm-Gg: ATEYQzygSaYQfTRhDzFWFoRxOXYUqH9EWPEtFap21AsxEh81mNV2CAok6MYoHWX+SL/
 NxpkRmp/sxAglZAbcBhvIuJDJHBFX1TtmLiUPsq9R1SnvMfQo4qEG90+yEQug3tnSsJMPGEkZmm
 4cyONLtrO7hO5IoGIv/aD2UfeG+qKpwNWLhJeOgFRcLEtEUJYEYOdcKPogsFbwxMCqDjMlDzUTN
 s/wFZCPaD6gGRmGqccXiS3v2Tx9PY1V/j/lfSlfda/IVDZ2ZeA9cSOYeXPudRbOtALPoh/PmUpp
 3MF8XmQk4zirbtP5mYOEJfIv0bpozprZaEaaFejryw65o5EKWRnXK1SnvlKEsv3BrSfZN1+lTVs
 hC8pXCHvQowlY7NcVqj5Elkj0gevwwNaWQyHoxoPLJ5Ytl2w7XpmYOV/lG2v6Aa35kU0t9gpchM
 71K9vIHWJQ6gr+ji8=
X-Received: by 2002:a05:6000:2407:b0:439:c39e:da00 with SMTP id
 ffacd0b85a97d-439da6698b2mr6036914f8f.33.1772826786432; 
 Fri, 06 Mar 2026 11:53:06 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae3a20fsm6724301f8f.28.2026.03.06.11.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:05 -0800 (PST)
To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Martin Bachmann via buildroot <buildroot@buildroot.org>
Date: Fri,  6 Mar 2026 20:53:05 +0100
Message-ID: <20260306195305.7486-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ZR0P278MB0869C41190C47D5811F1A6758B75A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
References: <ZR0P278MB0869C41190C47D5811F1A6758B75A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826786; x=1773431586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HD0Hmw3VXjmyafA3gAFnwiZwQPOT1IUODfz4bUgXec0=;
 b=KP3MDr04ak5SAfHNhNF6cIz5nLwcMcUyW0a1ClaTeKcpvL867DMFPE9dUTupmyUbfK
 mi+gl2Ce9tNyrkbHgbvRddPB2zN36mObNYY0ZWh/uj6oaMCcO55mY4B7hc/RkZDmuxr9
 xaGQRQ74ICNF/iZmW0/8QM2oYXpNE2HzQQk6HcPxugKUnNZe8VETOZklBZZ+kWFK0bOi
 8EJloZ/fTbsj2jEwyomgkSJu6Y0aliNJu0armXZuSTC4EVHfdX/qs9lEdF4UjNXsW/4N
 axBEfkMt4s0YsBiC1cFEqNKtw8atL9hbY3NBiQmDKQYcWNF+G0ch7Fh5qwA9GK/EVjiA
 YFog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KP3MDr04
Subject: Re: [Buildroot] [PATCH v1 1/1] package/python-multipart: bump to
 version 0.0.22
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
> This will fix CVE-2026-24486
> 
> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python-multipart/python-multipart.hash | 4 ++--
>  package/python-multipart/python-multipart.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
> index ed01763cd7..a5bc988b02 100644
> --- a/package/python-multipart/python-multipart.hash
> +++ b/package/python-multipart/python-multipart.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python_multipart/json
> -md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
> -sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
> +md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
> +sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
> diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
> index 6921d935eb..cdaae6ef67 100644
> --- a/package/python-multipart/python-multipart.mk
> +++ b/package/python-multipart/python-multipart.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MULTIPART_VERSION = 0.0.21
> +PYTHON_MULTIPART_VERSION = 0.0.22
>  PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
> -PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
> +PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
>  PYTHON_MULTIPART_SETUP_TYPE = hatch
>  PYTHON_MULTIPART_LICENSE = Apache-2.0
>  PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
