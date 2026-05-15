Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5E2CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD89E845D5;
	Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COrS0_X6RRQn; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1522584650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867207;
	bh=piR7xqYRymkJKCA+MSgn9o0r/ODiIWHfnDA22KPKQ5c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bp++fGfOhp5eiMKE+szGiozDK8NRa0S8EKh7j8fM6qqSL+Hxig2W2rkKmkfOUPSyf
	 C0ok60zswjLP673CKFabTeBpnZtWVRE0GmQicjThMDnJNkdJzkKJm80iwQ0JvyC5G9
	 /trLdlY1fktzRjZpz49MwpfupHnEViR77zKjK5BD92r4ySi950l3PalGnDGg6MTgeB
	 b6rULFObeo0rCRwxhUo2WdacDQUOH3lyOHFjQgtpsWJq1KS5GgnLCMOmsks39tYVoF
	 c5RidJHzkFDy61rTaK+QlJn/h6KZfpl1Pe3ngkY3sXdgJt6P0m7KsE5hWybmM3PK9c
	 iGLwvA9747cfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1522584650;
	Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA6523F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12D1741D4E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JQYcIC1GPWd for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D713241D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D713241D5C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D713241D5C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso26233f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867197; x=1779471997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mk1TaUih0sBFyy8ZQ3D+J4L6R8Hc9rJG03qVq37JPTE=;
 b=br3tRwQxdolU7FKoC0CHhHFeqZ2Ya8GdfmfEM6Iomv03lan5Zb5fQ29/4QnNdfdxEp
 GxrLeNPV/Cdj/mcVaAnOcAW13vDtUbMIJqECXPHNrbJ3rKotp9g+vIehjiSxySeUfCyE
 DaS9DTQ4CtMAjlw6htfutGosfl+Y/lSJcHTJgBfeWPMjm2V1R5fP2MPju/JXWsQy0xQK
 G7KPE6oAXJHk/cz4LCuWqKbOvDLZIazj1nO/WEuYBOsdfJt8EeTDr7JVYPeKXBnM45Pd
 brIScxCfNKngyN07WgWS0Vn0b9C53gQGBtID220OGOqHnDpaqB2cdSAhDsWR1Mz3j4au
 l7NA==
X-Forwarded-Encrypted: i=1;
 AFNElJ87StuH7SBCtwB0ahduA9PQhjdoQllMIinnvP9XsRmhM/HecInMLehLwD4XhwFhzkzvKThsnc0QuoA=@buildroot.org
X-Gm-Message-State: AOJu0YxmuzZ8krWkJXer5vyfYgSzDP1ttM3yHjQxp6WGr5M1ASzMI7KV
 cU1zmHLiW1TzmHPmUBnsMM/3vVSzHlgS/V7zr/D5lAzIohTGC+A0ZbpHV+/XcN6056zq++Bpou8
 QwB9/
X-Gm-Gg: Acq92OF4zXMEOze1OEzNX1pRjdjpuiCiV4TqQwU/DHB9kXY5k4JkkdJPEad3xsL6625
 pnLg8AMSnNHS0vK3negkzCGCAA1Bamw+s1s24PpaPLvvdnUr3t9fNej3damWi0sSy+f3pbeNto1
 4EPtNt1TtcwEVQ6kLlopRUUxdxDwbq1e12/R0GNR7uJFd6H2/z6vql4/QR5fpN2iLTWTP5YJhv1
 xfBJXTYf4vcPSK68ILh9HxdamN2JvWNYj9ngEJiz4wuZ8qeEFz14febl35WTZ0zg9N/SQb2m6XX
 w7+70q3uoB9uF/o02nZYmdGKTIdcy21GsBHyCGDHvYcvj1WPgo9f0uhdm0ER12knatmF0EOj+Qz
 ku+MrO6EH+qwYER1v+hJoYNGgGXpD7gqZTDL9p1Cyamtp58MJ/3glqGL3RsFmDTNHEAXCFgXppE
 WtVuynfib4eZmnNZDsUwrcnBh6AbIOjfSqX8Mvvs267tUx
X-Received: by 2002:a05:6000:25c7:b0:452:79c0:f7f1 with SMTP id
 ffacd0b85a97d-45e5c349e9amr7115921f8f.0.1778867196698; 
 Fri, 15 May 2026 10:46:36 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm16321921f8f.12.2026.05.15.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:36 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:35 +0200
Message-ID: <20260515174635.530154-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-2-fiona.klute@gmx.de>
References: <20260426153334.1026982-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867197; x=1779471997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mk1TaUih0sBFyy8ZQ3D+J4L6R8Hc9rJG03qVq37JPTE=;
 b=bLCimvYt2nJ3qWVcXxRwakvAPsD62HW8PvgJziDW0mwFgLWjmSN/lXCPfVEgAqZWgR
 DOBujiR9WltDFLPIJu24n8Xj3wsVypw1YoLKWpYil74dzpeNOVYm3v4TDcltpEXvXGOf
 Eb2jP7Ge7IMH4tMUlryjIEPxp5SfvTQnD/7PYJxuMXmu6cgiryIX54XlMpU6HPMRrHVM
 mVEul766UbgfkzJsV159+Zuixu/BkwIL6mEn03Y+xAdWjPOdWWF94CjLStlM5mLiAou8
 QCj+mH0iHeUy7s1wyw2DrTrdPW+JTNbyIZcWUzKJqLn7EZxVmufsF1/JVpRQFPitiDp1
 ORuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bLCimvYt
Subject: Re: [Buildroot] [PATCH v2 1/6] support/scripts/pkg-stats: search
 only Config.in{, .host} for URL
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
> The previous Config.* glob also caught linux/Config.ext.in and
> package/php/Config.ext, as well as some backup files created by
> editors (e.g. Config.in~ after editing a Config.in file in Emacs),
> leading to wrong results depending on directory listing order.
> 
> Also use "with" to automatically close the file when the block is
> left, even on error.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> This cannot solve the problem we have no structured URL information
> and don't look at which option the URL is listed under, but at least
> it's less wrong.
> 
> Changes v1 -> v2:
> * Try fixed names instead of globbing all directory entries
> 
>  support/scripts/pkg-stats | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 55aa63c861..efb85a7405 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -148,17 +148,17 @@ class Package:
>          Fills in the .url field
>          """
>          self.status['url'] = ("warning", "no Config.in")
> -        for filename in os.listdir(self.pkgdir):
> -            if fnmatch.fnmatch(filename, 'Config.*'):
> -                fp = open(os.path.join(self.pkgdir, filename), "r")
> -                for config_line in fp:
> -                    if URL_RE.match(config_line):
> -                        self.url = config_line.strip()
> -                        self.status['url'] = ("ok", "found")
> -                        fp.close()
> -                        return
> -                self.status['url'] = ("error", "missing")
> -                fp.close()
> +        for filename in ('Config.in', 'Config.in.host'):
> +            try:
> +                with open(os.path.join(self.pkgdir, filename), "r") as fp:
> +                    for config_line in fp:
> +                        if URL_RE.match(config_line):
> +                            self.url = config_line.strip()
> +                            self.status['url'] = ("ok", "found")
> +                            return
> +                    self.status['url'] = ("error", "missing")
> +            except FileNotFoundError:
> +                continue
>  
>      @property
>      def patch_count(self):
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
