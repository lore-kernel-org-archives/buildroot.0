Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70266D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4707E40DBB;
	Tue, 13 Jan 2026 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhwu1Bgt5LRl; Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265A940DB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333618;
	bh=ndlvZ8IAt4HoDII7tGa+OHUjE6PbwprISJGyei9lIvY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nqQ/VN0i85UpN4TJjal9xa+gKkzm14PaHl1FJFhZyLkdgGMo4tuOszbPVbP7SwL6J
	 K0mXygVibqJVl92hLyUV/69pB3K1Tuz0oN7Oefg8f90vOfEl7z6/qh5m5rdRHbxFUH
	 RU6yNpHm9Gry0sWPcqAoz8Cysg6QUBC4GLyaLBsxijSGoSBHWMBnxLJJUhQmGjJC8z
	 bfMhMEz1za9BHGaKdpwRANcMhLlxouOj18nFXzE912ZMuSqsoEIfU+dX4x4lezN1Fg
	 68SebbyoW9vnApgFINv+rbZ1mjPlOprb6u1TFM1jrGR1e6JQQShDZ1MJ0NIZxqaau1
	 g+HwJLY5ZzW3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265A940DB7;
	Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCED1231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E7740B8A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAVsNbQBODLj for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5D2040B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D2040B63
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5D2040B63
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2C3BB97A886; Tue, 13 Jan 2026 20:46:53 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:52 +0100
Message-ID: <20260113194652.99148-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-15-thomas.perale@mind.be>
References: <20251230081917.18676-15-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333614; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=cubQOs4IS7TdEvmQPdI/B4EZdGs63fvKLiEz/LxUIMM=;
 b=ohGVR0Hn4uLiw/a5m1Jd47PcOemF4OqPH2jcRUqYnFezvlVVnBdyLUxQoOJMzFuxQU4bSC
 FTWzx4Bs9EWcPDoaf2CAxxf9qLVEITDNMF4ys7v0Hf0xw5pXT9ZW7xkAeGx5ZWvctWe5ed
 AbATrUQpK/qkXfJD7bcFr3yHQbKHBDyxJTic3AMdZ0WuKr2MN5d3cZ2eNgUWq54mh5/mys
 xks0CSCnJXXTTuldFZABe903vAiW0p7OwhTpd0ITu/IOC9odPyZ6NBgp1yZyv8ONRUo6t1
 2atiphcvfCEv0I0B3ussmueYYZZWcbTfAiRMZX6TDOOfdqXutrKeVnqbF6BNwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ohGVR0Hn
Subject: Re: [Buildroot] [PATCH v2 14/15] package/dovecot: remove stale
 IGNORE_CVES
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> These IGNORE_CVES entry introduced in [2] is then no longer matched to
> the dovecot package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> [2] 948e71689a package/dovecot: ignore CVE-2016-4983
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/dovecot/dovecot.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index 6612787a94..a4c799221c 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -21,12 +21,7 @@ DOVECOT_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	openssl
>  
> -# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
> -# is part of the Red Hat packaging and not part of upstream dovecot
> -DOVECOT_IGNORE_CVES += CVE-2016-4983
> -
>  # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
> -
>  # Note: this ignore CVE entry is reported as stale by pkg-stats, but
>  # the NVD database is incorrect:
>  # https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
