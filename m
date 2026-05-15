Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C28ECD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55F7E84657;
	Fri, 15 May 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id za_rIqsnBe9q; Fri, 15 May 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9FD88455D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867203;
	bh=Gz5BhlR0fzIC1qrnaIODE/r0jWbqXmN9ACEMbDyc0JY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BijnVj4x9j1nBB5Ds9sEEcLRhMd8F6r6G9npztjo1/VWFvJaWHnfCpB/PIhiGLq4Y
	 Ik3CJzoX7NbGFtNj6BKQdDeBZl3Bi2eCO3onu1iZix9D5GuH8i3t7kZnMVUVhNL2Mq
	 2Y2CsOyyQQWe6boI8RrDY4m306uXmNWjt1gZYI6tYB6NGyyj2qTXDJxcYr+EI1Ar3u
	 ZilKpZrPoHrqB7El4gr9xD2Fwoh1wtW9O6LijIKyHgqsjgm4BwDrjj4fRYIzE8Hmw0
	 GECp6GW94kLVZK7ThMpcLkQMY/OAm0Jgip+CD+0JTvdg4AcpFlBPI/wU2e0fdU2SKs
	 EaWJcSyIfmWwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9FD88455D;
	Fri, 15 May 2026 17:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F1323F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A79CD41D4D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUjRQqS6cjiP for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E38A41D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E38A41D26
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E38A41D26
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso30045f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867195; x=1779471995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VTp/tnFjwiuL+vyte08o+iWmYtXS5SZNbP+y8iLnnd0=;
 b=jWBn4iZFE5JekX8KOWJrSuIYOoc56dFuslpu0CGuXGCz1+T4SoLp21efp35mYFz+Oh
 8so9nZOYbigMIZ0vZ5Hg7TxI11mNRfdsRjjA0gazKdjMqvK+o0Bk0RiPYdxJLQM58fP2
 ghb0RQh9gjpZHEBg1DxSvZHpA5s7iiqnW+q5Dl6TjRK7VbzCgmgbjAAqvgzLe6qelEUK
 xXlVUMKFq/ML4RxZRADPPzCJMaWw9YveRs4YOGHT0Us9vuMEkLTwRnQto+rocM2jwrrE
 AJFpbiOvUsI99ThudUWAie3Qf1d0nndtgNQS8JOdBU78lip5BJGyDTtjGDikzCP9Vmr8
 dUCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8q0QWOJnY3F8YCudNISSQm3+ZONr3QSfWodBuxocWXw13RF1U9tjo+VYodWfiPunWz4AzbvOFo3ZQ=@buildroot.org
X-Gm-Message-State: AOJu0YwHdbPvbiUprEaD53LpHAUpRAcObunqvhuB+HOowV9YFwl4yvWr
 3kE7S6mcgq3NvNJgh8/fgIr1E53eVdBE0bBV5ANz4JGMbeSBFi7oZmw7FlVniFt0rGA=
X-Gm-Gg: Acq92OHnGt80Eih6xn6SkmcnwQ0re5rSNaQ+0NfLv/9oxYXYBpz04B5+FwtdoIXuR1A
 DcdJncFzVp5d1nCqUW2aSF4k6avDJ7pu+gq/sDfz6VRnOybs7kKPmkzOHZN499ApTDRzCAEErgv
 WukdFLker81hYGEDhyKrsj6taC34BsT3H2v3hdDlbLT/gSxo1iFAvM7jrz1/KIiSWcy3tMdnPUh
 56N9ApTsqzRdDdK/TcTyAWIh5QteemFGEhYlkfUhcL7mztoBeEY7LN4cugMxfZMKubmf0cMirPe
 uDqjEYhMR7pRmAm+0TFdXDoFCplnsGlPucdzosIlT+0i6/RbqzAaHXM1RI8Sl59w8htk2gpAdGz
 X9JFlrcNZ0d8Zg4zN5RGsjQ36ADwjK6dcLARB4b1S5WCwwN7xRgnbYezXoBLOmAQFDUCTN6HgPE
 xjaSyoYhZBs6kIsAHilXjiRCnnmYy6KyeITt9lllvYfcmr
X-Received: by 2002:a05:600d:8:b0:48a:5565:ec3d with SMTP id
 5b1f17b1804b1-48fe61f7a92mr68533485e9.22.1778867194761; 
 Fri, 15 May 2026 10:46:34 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm15619169f8f.30.2026.05.15.10.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:34 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:34 +0200
Message-ID: <20260515174634.530053-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-3-fiona.klute@gmx.de>
References: <20260426153334.1026982-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867195; x=1779471995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTp/tnFjwiuL+vyte08o+iWmYtXS5SZNbP+y8iLnnd0=;
 b=geRbIIchTESpq0W6W/Z1pERl1Bw0V0Py0jqD00qeNAxUiYTqzfxaKG2wdGrUPDy3r9
 LbwSbdTSOMEaSXS8a6EMFpXCLIWMPG37Ege/t/ELZzH0lHL4uuueHkqH3ixJ2jY8f1P5
 QT8FHlWkOBnw9hkoXjW0mMxzx2VwwEi4s+OGk6q7rV3rReKwe5wegUgZ++NJ1ZJKxIif
 H9jKPCcTtzAY4m7ZRi95ZTQHUsR1gZZZ4/gvGAWNht+5M1xHs0YN9ydN/W5gKQBeXQkM
 4dAdiK+qmv3ML7gpIz9/fauVmexJ16OblTcFeIukzkTIO8vX93NU4aBv9fY96BHDw43o
 Go0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=geRbIIch
Subject: Re: [Buildroot] [PATCH v2 2/6] support/scripts/pkg-stats: format
 upstream URL info consistently in HTML
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
> Use only one of the classes for "error" or "warning" status so they
> look different, and format the error/warning text for both. Do not
> make the text a link if the URL is None.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/pkg-stats | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index efb85a7405..a87bb23a8e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1057,14 +1057,19 @@ def dump_html_pkg(f, pkg):
>      div_class = ["centered upstream_url data"]
>      div_class.append(f'_{pkg_css_class}')
>      url_str = pkg.status['url'][1]
> -    if pkg.status['url'][0] in ("error", "warning"):
> -        div_class.append("missing_url")
> -    if pkg.status['url'][0] == "error":
> -        div_class.append("invalid_url")
> -        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
> -    else:
> +    if pkg.status['url'][0] == "ok":
>          div_class.append("good_url")
>          url_str = f'<a href="{pkg.url}">Link</a>'
> +    else:
> +        if pkg.status['url'][0] == "warning":
> +            div_class.append("missing_url")
> +        else:
> +            # "error" status
> +            div_class.append("invalid_url")
> +        if pkg.url is not None:
> +            url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
> +        else:
> +            url_str = pkg.status['url'][1]
>      f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
>  
>      # CVEs
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
