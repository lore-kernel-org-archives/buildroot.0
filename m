Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C99110987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342418486E;
	Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T1nFMlo-TKw; Fri, 20 Mar 2026 15:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D998487E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022109;
	bh=1LA9d91mBZfVnoxmHhQ8Pi2EdGd7HNdZPYYMCFqGaWo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kk7xRpoc3Vokb6JrU19Yfri7GwxtdIVsq4MJ2Wp5cmFimpWblby1I0+aI1eRbtfuH
	 +Qn/g/sKceJJ6wRGh+NZJg4f7SAvc0aooz1aiU1pCBQACWiYSg2vJGpv55PdH+6MWn
	 AmEuI/acKDynPmJrQ9Tkw/usmMthMJ8zIdtEimOp5xaZIJFtcRtUmkJYyjrGOY+V1c
	 6TdHzxTHT17OSfFmYMhlPMiHxKtw0UmE7IUorzOUrzMCRj+k1bGKnmKJetYEN0rZzt
	 pKMJ8XsAGXi8z/gIA4OdIWzvNcRe5IykRvfntYelEWrQBGv9fzbOOybhDNf7fLTajL
	 A7eWBa0i5EmNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D998487E;
	Fri, 20 Mar 2026 15:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A25E325C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87FCB403A1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNrfiJ5gWHqv for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6257040336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6257040336
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6257040336
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso9145075e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022104; x=1774626904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/CohLt0q5zfr/OpHj+48c0nCY5elpfVw/AXcE9TT7x0=;
 b=hNEet4B+db8BCOZzINU6pq/rieSA2qMXnu+gOnotHhnXpBqYwVdi3KzoUwURVMXpU0
 QYIgEYFqtqSE56pN5xOrGLj5Fd9QW1uTeq09pUXGpEhIIWNmL1dwUSLMP/1xaJZca7j/
 VIU+dD44V4Qp2bkhyygIOfQJF9FFTdxf7rbI6SoLFJE+irjwWRu68uvxZ+NsuSeRooT4
 0WK1zHpB2NY8VYOgFw1vRYSPCYWXmadlz4QIUqbKI06r3W/4wxOEOFGF1g3O5G9RNDxr
 u6dU1WF2s5hth+d3g76yyyZhKwhAigWbWefZkUWYDL5/LyVdLycbZW0Mh3ZSi9kT+k7Z
 iV+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEHwoAiOD3MaoNsrnkYysnA9d6ZRviGD0zsvM+PbL5twlFxj4/78ZqwKWaDDGt78f0TibbnMffU0Q=@buildroot.org
X-Gm-Message-State: AOJu0YwwaxtWhH/mIgwunHnCiwBB+Ad9zZDinnbSQtgj9QoWB+61qBbq
 tFvYj0GcmHmaHWRj2mVx53ayHCbblpLbCeaG2CCsTW2SyMa5MHmvfBLyeO++ngMi2v0=
X-Gm-Gg: ATEYQzzKnkHlH3lfU4YFZPTazTyw4vBo+PQDIQedvEJRQ8u1kNFoKyqpqR/8pIay+8j
 +DE56lXJ3ji+NcgbtyTrn/TRyas4FZre2nu4sngwimEcgxTlYjjICqkNcqvlcuA3GO9rQblug90
 CrDLjvl/Ry7iTIEU9Gjvx+04RCcvjmFvrSJI5cfVcBMAj1ltyixVorzZaiaXxTxu+PJC8fKBjum
 YDdYLGyrULTtk4cXdlUd+1+LnM6gLqqNlh4CFz8OgCsX2w7hQiEKmV3FAGMuZI29IifHDZxf7Lv
 pVaF4YbnxfIWxj375bkbFnEPPzyEb5ebFn7bzytZIX8JQAn3rbiwmcZubmHzMO2cCpPFHUWVPrE
 YKnUOEC0UX4+1wO04nf0kP+OZngJGZcxpXHh7j3xvIVuhlPZqdPDnDwvRVVy/SyH1vIyGyC91Cl
 /t3MO5GDrJ1JWabAu77r1Ai9hPF+g=
X-Received: by 2002:a05:600c:828d:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-486ff0291ccmr54040655e9.16.1774022104253; 
 Fri, 20 Mar 2026 08:55:04 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1db4aesm24187335e9.7.2026.03.20.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:03 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:03 +0100
Message-ID: <20260320155503.176524-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7afd223643ad94c36adc4ff486197aba5f073d0d.1770155657.git.yann.morin.1998@free.fr>
References: <7afd223643ad94c36adc4ff486197aba5f073d0d.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022104; x=1774626904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CohLt0q5zfr/OpHj+48c0nCY5elpfVw/AXcE9TT7x0=;
 b=SpNCyFZ9bECgj/U3s6bO1VBHCe3SxWkrmm5MKaeAUtRt5atT6IYlZjb12zRHzjZBOS
 EmsXQlAxFG5b7CIBsbeV7NXQU2oKeXVTxcyaRD+2o4/RBl09n+5Xf+Uy/Yw27on7sawH
 OEKhaobHdnBJAC+RYwQ+VJZSRoVv9cZFGGf680IbQeB8z3GglgsBXM+7AWFb7kq4mXRP
 zuxsXr6SvbgRqwQoin/y1HBZ48nd89e3ipSe0AaZtFxs7erPgyiq89s45C/9qe43qTyC
 J07FDFEQ4JcVh6vBuPGOY0KaxaRnIJJU8d9zIrLgL0mHl0SXnUelnmAflnRz12WEj2t8
 U9sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SpNCyFZ9
Subject: Re: [Buildroot] [PATCH 1/3 v4] support/br2-external: remove
 leftover trap
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
> The trap was initially introduced in c5fa9308ea4e (core/br2-external:
> properly report unexpected errors), in 2017, to catch all unexpected
> errors, back when a single file was generated, and errors emitted to
> stderr.
> 
> Since commit d027cd75d098 (core: generate all br2-external files in
> one go), in 2019 the single output file 'ofile' is no longer created,
> as multiple output files were then introduced, while messages for
> *expected errors* were redirected to a Makefile variable assignment
> emitted on stdout, at which point the script just exits (in error);
> expected failures only occur in do_validate().
> 
> Unexpected errors can only occur on failure to create, or write to,
> output files, either '.br2-external.mk' in do_validate() or do_mk(),
> or any of the kconfig fragments in do_kconfig(). Cause for failure to
> create those can only be a no-space-left-on-device condition, as they
> are created in a directory that was just created by the script earlier
> in main(), and thus has the necessary mode; failure to create that
> directory is now caught explicitly.
> 
> A trap on ERR is not called when the shell exits explicitly with a call
> to 'exit', thus, only failures to create or write to output file would
> be caught. In that case, we are better off not trying to write to those
> files anyway: failure to create the file would already be reported by
> the shell on stderr, while disk-full would not allow to store the output
> anyway...
> 
> In any case, the script exits in error, which is going to be caught by
> the caller, which will terminate.
> 
> So, drop the trap altogether.
> 
> As a side effect, that squelches a shellcheck error.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Note: remaining shellcheck errors will be addressed separately in the
> following patch.
> ---
>  support/scripts/br2-external | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 8aea479d20..6d4fc1a791 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -30,10 +30,10 @@ main() {
>          error "no output directory specified (-d)\n"
>      fi
>  
> -    # Trap any unexpected error to generate a meaningful error message
> -    trap "error 'unexpected error while generating ${ofile}\n'" ERR
> +    if ! mkdir -p "${outputdir}"; then
> +        error "Cannot create output directory '%s'\n" "${outputdir}"
> +    fi
>  
> -    mkdir -p "${outputdir}"
>      do_validate "${outputdir}" ${@//:/ }
>      do_mk "${outputdir}"
>      do_kconfig "${outputdir}"
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
