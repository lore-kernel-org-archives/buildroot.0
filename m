Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9336DD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBAE809D0;
	Wed,  7 Jan 2026 17:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xkp3o7v4uJa; Wed,  7 Jan 2026 17:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9932C80969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808560;
	bh=0TdDDCVRxNLwwoKJ6t2hujz6oDw+2Sl+JJ0g5pt7+Gs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P26xFQKQRs7hKx4A9Zw8Ys6iDn9qem3bqZpoTOurG/tqZjd5mHTvgPrpTajbv0UN+
	 i6KG21qWdIrL0HktGqWurmKL6nZS77+MpenCqPPQ5hc/2FjEnKZpxRuEcMxcvSfRYp
	 SLk8tZ/RXby/xmZxjIt576j/FMNO7Jl8oJmB7sm+3l4iALyEJyWWL4LsaMIuQtDune
	 pyNwh2k/4ZK+LcdwRsKZ7iMS/9Pb8/c83nNKfyKGfUvcxAJT7p71dJxu04qBF8fc6o
	 p9nSfjtbJBwnwADJBnhHqKZrwB7TkKdUIXfI5/gtxBSjixg6y8gy1oFgjxcq2BSbs3
	 qFhzbciTptz+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9932C80969;
	Wed,  7 Jan 2026 17:56:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1AA25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646868089C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tSMTfECzkrg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 561B3808CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561B3808CD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 561B3808CD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E3DEB97A704; Wed,  7 Jan 2026 18:55:55 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:53 +0100
Message-ID: <20260107175553.230579-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-4-bernd@kuhls.net>
References: <20251221223441.185169-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808555; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=nruJnLTh2aO+V205jVeLDM0iFFMZnu7ars/vgdliUCM=;
 b=gWfrdwUTQnGh0fur3H2HB4XXAJqo69Ccia9Bxsc1gglGR/uvpRUGGasuJYqw+IewgAeFRW
 bGaZoR62pOTMTvt0uLmvYHeL41SSx7/bvC6WjB+yb90QF86WPVKxSZcIY0o9O1/Y8M7XRR
 GwuSllL00xuekVqeQ2Ig6ewnbZNDZfJEHO69SeCCSk8cXrshMQY+AS/LAu1/2Z/Ooy95lc
 FESGdSPVJdWM1AeXsBENuWY8E/GhSj5cbyZLAvQAUGqqRAyMBpFa9QlLKFQLOTuFMkkUU6
 uLybBfQIMbG754/l1Ic46aMqIHPQqVxvp1J2udhYBv+1GQNvl6+slURaNkG8nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gWfrdwUT
Subject: Re: [Buildroot] [PATCH v2 04/23] package/python-crccheck: add md5
 hash
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
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/python-crccheck/python-crccheck.hash | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-crccheck/python-crccheck.hash b/package/python-crccheck/python-crccheck.hash
> index 3fb58a7299..b8fb4e3312 100644
> --- a/package/python-crccheck/python-crccheck.hash
> +++ b/package/python-crccheck/python-crccheck.hash
> @@ -1,4 +1,5 @@
> -# From https://pypi.org/project/crccheck/#crccheck-1.3.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/crccheck/json
> +md5  b70543709102d2edb9159a9b26366706  crccheck-1.3.1.tar.gz
>  sha256  1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a  crccheck-1.3.1.tar.gz
> -# Locally calculated
> +# Locally computed sha256 checksums
>  sha256  1237ab8ea60caa782d77d9d2ac0cdccd765475e3848b0b91b5751d3f299e9d31  LICENSE.txt
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
