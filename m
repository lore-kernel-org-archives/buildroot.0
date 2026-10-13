Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84319CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5119E406A7;
	Tue, 13 Oct 2026 08:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW8zx4yJ_KVa; Tue, 13 Oct 2026 08:24:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F9E940640
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879858;
	b=iTAPKA13CTHLbDaMmnL9Yq2cGXQE25MjcPqP2ElIf6+boU9uQOw09zCgV6Wonk+6+dLj
	 31oQEsB9vKd3y6HHU8Kupd6SYUu+WxtYICREsrIvxzCgVNVPeLNBnFDW5SAUn1obFIiIi
	 4zV0Y7FZu3XcOztN3qLcDBC67us2Y+lzfyymaWkMEdBl1FqAENjRSchP9T/9RyCu+jctP
	 VgqT2Qhb4y1k6/rcis8I2o9wxnbWCkOozglsEB6NLUy8Lns5zzfMhyj7H3yibkd5JIZjc
	 oyRh6xUyMRFs+vomYXPde5IQuiZWAQ3sdakTIHpCdSYZfB6Flp0gJ4Stx3ZxLnYUj3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Re4rdlOsLArWU0dAIG7WpyM/q0D0dWwHmmrdeqQXOIA=;
	b=oZ3RT88cMaFB8yAaq37e7HWr8Y/F0R7iuaxZSxbNiAZbzTCcyleNDKZ5dxr8BWuzNF9M
	 0eBRniga2dj7pWLZ4U5IhbhoF4vVFBTAn2qXhFngqOimjxduBa+/B0RLEgTR8O90mLxSp
	 0a9FWPNDW2tJmvU/341V3nts0FgTnpjPiW/WrBWcVV7RJZFDMugYkyW2Jo31bsN0A/N0N
	 XsPiZRlbzePiZsZvO+0yNsrz1EC2m7Z82tw7s/UkKt3l5Mc4Bwp96LhDoyJ/cB5lAx42s
	 87mr2jGYQrD+mT2MoF8VJiZXE6jgjROmII4DT3J7OI3XRpCxrzuzWssGjOHkIZHYdOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879858;
	bh=Re4rdlOsLArWU0dAIG7WpyM/q0D0dWwHmmrdeqQXOIA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UYqCIGbV5rbSDIoUQ2i0kSmnUB8x9fJJRNy9LRLlV7QA+NXlp9sEp6KsSEtv5QekJ
	 sK17WyvSuQKMh35XaEKLP/WB8HWbrC2iWMxIm4EC9jX9y2SuaWdrEe/Yhn7fbL5LdH
	 DU9mo/Pc2evSsxVsqOtatL1rwg4XfBLXw1D2notNfSirpCyVuuD1gF8ZR58VdwW5R3
	 RXkxe0KwWp1HATv/5xWNE+jvP9iiGJT0PCwx3+Ov+2Y3iyx2FJORlyUMtGu2HyoLCW
	 t9BxxVzs+3yqHp5SrmNHaE2X404MdDdwZFOr7zDdRP9P/RYkNSPAE63GiYq5XHygEh
	 VvNB3XbPW1UHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9E940640;
	Tue, 13 Oct 2026 08:24:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92E38788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84C044026E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLJkGpoTJCsM for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:24:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0B383401EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879856;
 b=Oms3sUZmk4LKiKw3x0pCzOTTvhcc8FEAI67bvdUVZqqpAflRjeZRMm8IZeSIr4xC5CgR
 S3ynyQd6ygUNBo1NTjdJUa1SKsEkliQ7ApGWElRWkagR6TK/XD+EkV6Pqjm3lLjkbv6D1
 97KIHXfsmyqoTCjPBrV4+ciC72UhD4Gv0IbOPk4taK/HC5bMHlZcHGja3N3jT+5mLXGOr
 UtMnThgt0h+VM12/JZ7Z1COnUJH2oe4jWNkmCiIxU2byPuhCViLlNRr9FMQoqlKr2Pwp4
 kZqfrBb+dlshrf/Lpb4BghRhj+mNuNB9lXQmq844IO0o2xCipm3rJS2YWkfIMyquRhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879856;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=pQMM3MXjwfpBVUJn58GuJFB48eoK4eJRKscvC/hE9hM=;
 b=PGJ2F7tCCW4fZc+fZFJbCLk9qldQHgs7MaCU5jB/rlk8krs+s5XaX9Gxq/SoY7sPbayR
 nIUWqEIBcPOIkTiPU01EWK+PILts9DghZoWTVUV5JW+8FvV8jduNW2sBF66rf3VpI+3JI
 b/knajePfRMXQ7OoQRTcUXw/By2K9YX2xuQeROgygu1R2s1W+co01jXLbYVv6cWOfaDoZ
 NAqUcRXAYbary1K7I/U+i0I6hcRzrwGmqpy0TAriyvXdzP8bumdm9LtPIJRNEP/pM8pxr
 GGcO2sYw8uaI/VS9eRPpb/WNWJU0reNrs7tZ4RiEFfh2fR7KalIg4XIAPTUVlf+3TMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=h2SSlZ1M; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B383401EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 47CBD4E411D2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1BCF160362;
 Tue, 13 Oct 2026 08:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FA0A11D70D46; 
 Tue, 13 Oct 2026 10:24:11 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:24:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Message-ID: <as3qqJ2csRIWgRGq@windsurf>
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-27-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011130058.3443432-27-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v9 26/52] package/znc: Fix build with
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 03:00:31PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: C=E9dric Ch=E9pied <cedric.chepied@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
