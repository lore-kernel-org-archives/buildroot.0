Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D5CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EF140E3E;
	Fri, 16 Oct 2026 15:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEOMLoduOSyL; Fri, 16 Oct 2026 15:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6EA5940E44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163197;
	b=b2Ax7Vh79oEv0R8PmiKsM1eX70e8BIrOfP3M7laSHQjEDM11HGkAsRlLMCgYmmHoV0VI
	 0mWRD5isgpwMLrdF06+7ACit6JWwqFvXaWmy8T10N2/r8b+duPpa9jvd0GG7B6mvYFLVm
	 aQx9Jurdg7LYFB5CgM3omvbMcT/d2oR/F4oyJncULm3enXVszASzZYHuZI/LCM5Olub4f
	 E6T+OCh6z9OfBu3jVqDs4bqqlxUxcyK29W/yHyJYTtJjbjJsM11wria5KGIu9Gjbeu18h
	 6kx+0FZ5MMbZqAp4LLT36veNyoU6kDvm5vmK+4UeprzolWMzww6iNK4ZXdocQdyly2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+3FwKHuwW17nHTLLHFbXIYoUw22XxkGxY7TJL1z5+VM=;
	b=FGRDBAt+JrgIk9x4M4u99aT/0xJXbGA23ZUUMEkx2U7euq7YChGnisiiOq2hGzk1vKBD
	 8yO06Fv4fmyYfTBpHv52rRVpgGzdZlUwD+Jz9BNL72lALBfSWyS3TCiTZIOlb+n0nrYYo
	 8/KcXWKqW9hTqDWnRDZEW/7ugys2k82lFNtinVEI1k9I5CvqYWjCCzuI/wL/iggk4QCjn
	 NZZrUAITs1mpJ9nJzfwFRAfj62xzgauORWBypfosETQG075J2pR0rSm/TteJVnKXygcXJ
	 inHTSWRzBQ4LUiSHFd8aficFH1TAkHw5kcPDWU1UltuYcop/kyGyt1bY+GdaPYDaxEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163197;
	bh=+3FwKHuwW17nHTLLHFbXIYoUw22XxkGxY7TJL1z5+VM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eG9p9F88ret5hp/aUTFUiGYB3Mph3N0Q8GtINSfSwvu2vk9E1BzpG0SKo5iYVuzT2
	 +bDtm7Fnzn654YlNCWL/HiBzpSBoBjK6qBuaDU+0cvQswuXanp2lOMBzwwT0Kk8jZe
	 5QqdNLbzX1LW05ki9Cvj0oKaT/dPSLjjVUytOPnzQTykxdZ2J2lpjQ24deQkKuRVVo
	 AqMOFFaqqTJw2Q+ttrjPVUWyx6ZqyWU8jO+edeE5MEkFv7Zk87IrBcxcvKBa4Py1p0
	 +q7AH0xiIbAesYdV6CCc4MdAIZ39MFcI9b89alJR5LbWKxZn77JmqDwRVqwn4a1X2x
	 0Bga7Bsz4N3jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA5940E44;
	Fri, 16 Oct 2026 15:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 009F4255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C70608DC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViYu2RSNWek7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A58B560671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163194;
 b=FGFQmFOrDcrlosAg3SJyF/3YSR7AwI76+QxNlrow5x9jx+7G77nakW+Sdxa0ikOBZijm
 xANt7w4TN2SQninlHJl6b1hKQepNCIienU1R215Ujg9CY94UCO9/Z768tIxajHdsIUyQt
 UjhN0343UOuL1vt6cdqRaykW2PlL49v7uE4sxnaLyFw7MF6pE4jSZnld07jHLcqZ8uljS
 lHUMhxA0ZackSh4H+ROoNNOQ9evs9bBpnJmWXZaRnLt6n8m+jExBGCAvX8X3qDjcQCGpq
 0tHuvfNtraRNW7Lvd3dP6s0p8Ib0iErfANJfLRvFBzsVcrs1utDCP+U3au5ZtsPAwUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163194;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=5StkTHEXOiCEANa6/HgrdlrZYRHRjZJ7lE2aWKiYxCo=;
 b=WccF5zUZHNv90OeOVVLSSsnZ378zazmk/KW+1D9NldH8AToP1o2EazqUgflvpm6CuKHy
 o90y0ODt0JSzkoYztWs/pEhho/MBVdSfveeCITVAKDSn+1336/d+62QdW/3lm9G3s/lIG
 ckvi7qYtB5/F9JViTIy3s6NDsbbmW2xsZ0XAXUY5W4qix7WMRX3Ttxm9FVUrWz8D0BLZX
 afHEIHBurLq1hmOABwP1j69iNi/I+POfeyIZq7un+dj+o5JmiAEvatsjkKH6EX1acGRb0
 Bgch/neGNO+2eUPoB9OqIzo+hX+fk/zuK9Ka6CcvnUKSGgnbmg/iox1uM+FJHoxM5sQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hlCYGaLV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A58B560671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so300315e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163193; x=1792767993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5StkTHEXOiCEANa6/HgrdlrZYRHRjZJ7lE2aWKiYxCo=;
 b=zfZ99CeNKl1M+DxN/W1riZxBxHgecyhmhunPOk2HRw8JNfG2j7cQaT4GhbfbgDitUF
 N8e+J3ptWf+E039IAjND+Gk5G5frXtegRwqn9q/u4HEXA0q/++gDFMWQL/6wk/k74n5h
 UOswiWbJTevSm/rJV7zYoimHThXiiEAKb8TzNzib1IsfTojXeZogEnBR4fN0PGsQ9s0n
 M3R0oNclucVjFhkSpenfzVfwVYugUDBVZjh69ewqTcfh6XQLdj5CAvKVa8pDr7tlE0bx
 s7YD6riMsFsNYsNfB4YspHCxXaEQR/Fd1e/K6sm2u0XDt4MeHzioUN+XFYUE+2kmYDqf
 s33Q==
X-Gm-Message-State: AFq9FYJBrwJqvBfb9fgpi9F/EFjtrjCPs48RTPqMzrbnNGPBdOSe/lSR
 k3Txlp5FcybsTtNAUF9b2z0lhlfN4+nKHBjQ43IcrNJTgvEtTrfNr0Wind0MIgjOIpsdiPADD0X
 0xFl0UbE=
X-Gm-Gg: AYBFou2+oKsVlHU8V13G/mIny4d8io4IeGqF0XiDwKLwRL3kqbXaAd1DRckGAYBEffT
 nt1iRSqLBuBTeD868AGKQ76qvMlL4osJlwlAn/x0lYQ4LfMYaOXoPwb+9kaQGD+stS2rK+nrTDa
 aNi7+EawhvI5hQHd9WUtA1mWecoTrYU85OLaEol5hyIfInrxZoMa7bQr6JD4u37Dvzubn01r/2T
 tbjlJtgHAdAMXg1ph+pTOs7JyMPQRh7SV8Usu5s3Gn4hLR1vaCtx/3Dfyr0MUMteQyTE9LorZUJ
 Eq0iWlhw8eipOS4XshILvTgXitPQgIOWs84ZjdOaO4YnRdPE3cLpPWDekACbymWq2VK942a0DHQ
 rL54VQz9x7jOBHZUv2of1pcXj9N81VZLJE1DBldKoZ6L5seYj9qaZOgJzwHvdWIuHUK+Ud9WGLI
 JFKX+vpVWniqN1vD8PsXwMh2H5ScUPAGxqbcsT+FVGV7nAknX2gfYOsNHJOuMIQyHQYVOZ1lWVy
 acCV8Urx98aWv5l8Fbe3RiYi2ZN5azklmEIEW0Zb+Q9YuptcyrG
X-Received: by 2002:a05:600c:a4e:b0:4a1:80d8:aed5 with SMTP id
 5b1f17b1804b1-4a1d75e39b9mr1637925e9.6.1792163191473; 
 Fri, 16 Oct 2026 08:06:31 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b303csm151788365e9.8.2026.10.16.08.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:30 -0700 (PDT)
To: buildroot@buildroot.org,
	yann.morin@orange.com
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:28 +0200
Message-ID: <20261016150629.77126-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2948b55509525f0a19b4bd9ad26757d53261cc00.1791263777.git.yann.morin@orange.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/gpsd: backport security fixes
 for CVE-2026-58459
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - add proper metadata to patches  (Julien)
> ---
>  ...f.py.in-Quote-double-quotes-in-title.patch | 50 ++++++++++++++++
>  ...prof.py.in-Quote-back-ticks-in-title.patch | 48 +++++++++++++++
>  ...prof.py.in-Quote-back-ticks-in-title.patch | 60 +++++++++++++++++++
>  package/gpsd/gpsd.mk                          |  6 ++
>  4 files changed, 164 insertions(+)
>  create mode 100644 package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
>  create mode 100644 package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
>  create mode 100644 package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> 
> diff --git a/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> new file mode 100644
> index 0000000000..8be7040fa5
> --- /dev/null
> +++ b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> @@ -0,0 +1,50 @@
> +From 5581ba196d826a984fbfaf792b7d58535f9911ce Mon Sep 17 00:00:00 2001
> +Message-ID: <5581ba196d826a984fbfaf792b7d58535f9911ce.1791178679.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Wed, 1 Jul 2026 17:55:57 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote double quotes in title.
> +
> +Someone could use the double quote to break out of the
> +string and add gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
> +Upstream: https://gitlab.com/gpsd/gpsd/-/commit/5581ba196d826a984fbfaf792b7d58535f9911ce
> +CVE: CVE-2026-58459
> +Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> +
> +---
> + clients/gpsprof.py.in | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 5c18f50ff..261e72665 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -198,6 +198,10 @@ class plotter(object):
> +         if 'subtype' in self.device:
> +             desc += "\\n%s" % self.device['subtype']
> + 
> ++        # escape ", and \n, for gnuplot, to not break strings
> ++        desc = desc.replace('"', '\\042')
> ++        desc = desc.replace('\n', '')
> ++
> +         return desc
> + 
> +     def collect(self, verb, log_fp=None):
> +@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
> +         # Ship the plot to standard output
> +         if not options.title:
> +             options.title = plot.whatami()
> +-            # escape " for gnuplot
> +-            options.title = options.title.replace('"', '\\"')
> +         if options.subtitle:
> +             options.title += '\\n' + options.subtitle
> ++        # escape " for gnuplot, to not break strings
> ++        options.title = options.title.replace('"', '\\042')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +-- 
> +2.43.0
> +
> diff --git a/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> new file mode 100644
> index 0000000000..53e1cac1cc
> --- /dev/null
> +++ b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> @@ -0,0 +1,48 @@
> +From 1a6bb7bcbdf58aa940132e630870af061dc88537 Mon Sep 17 00:00:00 2001
> +Message-ID: <1a6bb7bcbdf58aa940132e630870af061dc88537.1791178680.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Tue, 7 Jul 2026 13:41:54 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
> +
> +Someone could use the back tick to break out of the string and add
> +gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
> +Upstream: https://gitlab.com/gpsd/gpsd/-/commit/1a6bb7bcbdf58aa940132e630870af061dc88537
> +CVE: CVE-2026-58459
> +Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> +
> +---
> + clients/gpsprof.py.in | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 261e72665..202214769 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -198,8 +198,9 @@ class plotter(object):
> +         if 'subtype' in self.device:
> +             desc += "\\n%s" % self.device['subtype']
> + 
> +-        # escape ", and \n, for gnuplot, to not break strings
> ++        # escape ", `, and \n, for gnuplot, to not break strings
> +         desc = desc.replace('"', '\\042')
> ++        desc = desc.replace('`', '\\140')
> +         desc = desc.replace('\n', '')
> + 
> +         return desc
> +@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
> +             options.title = plot.whatami()
> +         if options.subtitle:
> +             options.title += '\\n' + options.subtitle
> +-        # escape " for gnuplot, to not break strings
> ++        # escape ",  and`, for gnuplot, to not break strings
> +         options.title = options.title.replace('"', '\\042')
> ++        options.title = options.title.replace('"', '\\140')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +-- 
> +2.43.0
> +
> diff --git a/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> new file mode 100644
> index 0000000000..f2e875bb02
> --- /dev/null
> +++ b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> @@ -0,0 +1,60 @@
> +From 4c06658e988f4ced1a7a574ce082a22ef625df56 Mon Sep 17 00:00:00 2001
> +Message-ID: <4c06658e988f4ced1a7a574ce082a22ef625df56.1791178681.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Tue, 7 Jul 2026 14:23:56 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
> +
> +Second try.  Also quote "terminal".
> +
> +Someone could use the back tick to break out of the string and add
> +gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
> +Upstream: https://gitlab.com/gpsd/gpsd/-/commit/4c06658e988f4ced1a7a574ce082a22ef625df56
> +CVE: CVE-2026-58459
> +Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> +
> +---
> + clients/gpsprof.py.in | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 202214769..e91367ee3 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -200,7 +200,7 @@ class plotter(object):
> + 
> +         # escape ", `, and \n, for gnuplot, to not break strings
> +         desc = desc.replace('"', '\\042')
> +-        desc = desc.replace('`', '\\140')
> ++        desc = desc.replace("\x60", '\\140')
> +         desc = desc.replace('\n', '')
> + 
> +         return desc
> +@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
> +             options.title += '\\n' + options.subtitle
> +         # escape ",  and`, for gnuplot, to not break strings
> +         options.title = options.title.replace('"', '\\042')
> +-        options.title = options.title.replace('"', '\\140')
> ++        options.title = options.title.replace("\x60", '\\140')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +             term_opts = 'truecolor'
> +-        sys.stdout.write("set terminal %s size 800,950 %s\n"
> +-                         "set termoption enhanced\n"
> ++
> ++        # escape ", `, and \n, for gnuplot, to not break strings
> ++        options.terminal = options.terminal.replace('"', '\\042')
> ++        options.terminal = options.terminal.replace("\x60", '\\140')
> ++        options.terminal = options.terminal.replace('\n', '')
> ++
> ++        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
> ++                         'set termoption enhanced\n'
> +                          % (options.terminal, term_opts))
> +         # double quotes on title so \n is parsed by gnuplot
> +         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % options.title)
> +-- 
> +2.43.0
> +
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 7fd8cec8ab..b23bc4c065 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -9,6 +9,12 @@ GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
>  GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
>  GPSD_CPE_ID_VALID = YES
> +
> +# 0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> +# 0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> +# 0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> +GPSD_IGNORE_CVES = CVE-2026-58459
> +
>  GPSD_SELINUX_MODULES = gpsd
>  GPSD_INSTALL_STAGING = YES
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
