Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4242C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 15:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9849F406FA;
	Tue, 22 Sep 2026 15:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toZdMEMJldnT; Tue, 22 Sep 2026 15:25:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5318540801
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790090753;
	b=PCSUgnXbjREUtvrogfGujw4UQfkEBmMgC9m9r3aVtazQATzkm5Zq7F52hF66dZxQxyKj
	 TbXOUYakgd526juTbx4f4i0nIVLDiiQLab0S8o6sAb/mQrXyb4vIm72T++Hn10QUAeiWu
	 XjB9kmgSqZVcvf2OYhqUNmKhmHcHvKtP193AOWhzzZWBo/awKjiOH7nE/pdduu7cgxRI8
	 SsXQlsj2G0hEe+CWtxVRRbp1+avSzi0J28fmqaKn7zo8TfIerq4BF+OgsKm5GH3W4b/ps
	 2fE0V1BRXaBEFEynmupotCKsUecvSS6P/SKLEi+D8e2MUzLs3/5jFcoQtlkjoinlpvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790090753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=le8c6xrm/usoDn+m/OIDwAlPMCQXCdal+RH0R7uUi9k=;
	b=J9pPJYn2mpYjdqgqdtE5kGytN5GteOqKWyyswwqSAsI/XHXWtSun9AjajAGzJI0rQZcK
	 R15EM6GRLTrWsOGjSlgyKV8KOmBepPohEs5IVVkDcFuuOCOXh7e8B/lJCmfR4C6ZhxUWs
	 8ws+QPFZfOmxB5dJwsIKLsrtmqlTToSIJQlo2RDZ4Wtk8lO1uNxriNOR905bC2qFfatDe
	 1twtOqm1chRQFx4GqFisGCyWdYkfS8maPZYMFj0apE9wbROR/xwgypppexy7O3npx8QAp
	 ND0UkCrMpOQj55mhEecBTqWuW/JXe5deJHqazM7zg7M+MjtTUBkdJ4mkGma2W2rAFTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790090753;
	bh=le8c6xrm/usoDn+m/OIDwAlPMCQXCdal+RH0R7uUi9k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oC/gpNHS3+RWjGN4knRfJhp8RAZcMwbB6YmFYEGQDMJj8nImXpL93Mcg/+AwBtM2+
	 u8AM0ZY8JhFTxTFHdz5EIiq54fC+2c+VfJJOo5SvD15pKvF3uLhj5uVps2VFIo9z29
	 icHXotYYlf0WZG6l8p5mV4Iv0OXUmUKLu3ufyXLCX6j4PnTzTcxvoJ9cEt/hhMEzhZ
	 V08Pb/FDtG2sU8R+6Kw4unfwGBK9AX/dJk493JT/7az+oQgEMgv0f+mbaMhLf8rELu
	 UY5tUDgn8GE9ihR30pOlzIDRu1PbvJ+P9DeyQSSFLyd8ttkwtrzgarkJdcLQJcFwDW
	 q129gjifn8nUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5318540801;
	Tue, 22 Sep 2026 15:25:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A06633A9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 15:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 861BA4009E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 15:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lf-w1FCJ_bii for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 15:25:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4D5564029B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790090750;
 b=kvpho6UDy3zCZH2b5oeeTUT88c3NPSl/fV0dC5zNOFlC3syUbMDnQVXZUi1kgyxnf9lr
 nMnbnHraF17/uPAvti8JXO761y66pL1a1HPy8PEeITuZBWfzCLTurIgqiTmC+5H8BwqN8
 XCEzQGJnDSVGvbMI+RTi6JM6kOLGzwQtDM1DlomJemHV5QfK7behyZ1FciW7sRzufkzoz
 VDFV3svPhJnk5MPz7Ov66vE1TpDMqNEqyeoIUku5rAxl/gA+t4hDu3bO58jL+NsnlDiT7
 DDaQgfu110bPpF37o7D8e93bFm9EtV4w95Lt6QTq3H+oxw+GuhWfrsi+gz1sL1dbuGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790090750;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:From:To:Cc:References:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=It0lmnvBDsM6Mx2owaOr/kduWXciygAQZG2rvsixjjU=;
 b=AZr1izkI8G+MEQOGZhYUrYTuLRmDer1SIniSbg+mM456xQ31tdgvMalxvouX0bPDDGKE
 p1X+VUG2YwpczIEzq8hY3kK2ccqQT11z0Xu6WIyZChzLihiieeAnlsFEfCkuXPzDB0NCp
 HEZiocCf3JIbNnnRHKChMrj4P4BLWwQuOoE+v9kqpirRlLorBASd3Em0dtfEKjvlPloEU
 8ijoxmqSi7KikHhBdbVV9IVCs2nbXdpunyOLeVOpZ8iag3J7VMPhAdWs71GB4CGXOr4J5
 64fT784v4OJSlYTnzOpTf9kiMVbEP4iSDkCGvMuQK6v+3LEtHfZ4dmiqC+JJulVrnhQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DPKXdj1A; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D5564029B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 15:25:47 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso29329515e9.2
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 08:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790090745; x=1790695545;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=It0lmnvBDsM6Mx2owaOr/kduWXciygAQZG2rvsixjjU=;
 b=XeIxGIs5cl60FljiY0bcDSZMsUTbAWDaTYqVNPAT6Kki6Pc47LuqI2iYLq6O0C/Rzo
 +U+DfqCvQpCPCsbdskbL18B/rPg3Dpq2v1lBJoMVsbVuD3ImT7mllUJZuNIHlUdm+jgU
 VJ/7DRKfzDy/Owyb7l+4K3vTrdgFsqAk/89L9yLqGgQRrEGsIPBAElXHaps3QAidncmx
 xShm7FdwsyB9phC0k4F0tXN6zEcCdU/xFcoddTEidaWZRIKKgSyg6aP+hQ5vEflU9gAu
 nuZ+/b6DNn5bwZKMY68N30j4lW2Zj3OUmdyIDFc5cUE1L4OK2QfxS0D8kt0C26MWTCMs
 fv/g==
X-Gm-Message-State: AFuF++n3QR8NMs27DyGqUf3oSmRuUikZV35Mv64HTLaXmAFmIYj9SzKl
 win6o+nY1RaVPOGZZPG2BRNLLiK3p97vl2T3UJ/ChMkuhhdhcM1BxdESuvHP/wu+I7H3he7+jqm
 T4Fu1
X-Gm-Gg: AYBFou0cM/ApWxsyS2JTv8EZ28hs2NiOAerw54qxCCVBy7ChuG7lMMVkF+Wlc5v0Gpp
 TMHmHV1fTwfoxHO5ZqcI57s7Eg9tttpOf6i20iX/c7ZhPip497yGY0lhIiswn9u3sy2RtuVJuhi
 cqBobeMB52dEb1Q1k5gg74G3tF7R4fg4sqOtXQpGZqlLoIBGvfPxin+ik51rS06p0LqtLFTgV6U
 hQZihYcoUMnkwWy+TqK+n3y+Sg2iA+Xs8zjJCUOyvMzhzzEh1D/SVWPrsPIYu7gUlRd+2akKTks
 kvTIrEgnuL8RgDiOhpYJ7STPhAio5+r1Iker9EZq+CQ9tcMylV9fleXnSw4YKZqkT1xuLgbxwPV
 E2EmkOcoAcjTSGtN4bOz02coldJsigdxT0inJ1nJ4vM6IHjrDwTtPa5GduBQHCzIUyXeVtRx6S2
 R1sQ7yEol3UttCf3y/MMLBC5iESn8bz7dc2Jyh9BZrc4fa1dGlGkxe7XrQxsR2E4BPEy9jXA+V6
 1ZtyGr99THkul7qFqIaHG2hlxVrNXu72jgN7C11PmDJEoZdJ8svLQHV9Q==
X-Received: by 2002:a05:600d:8496:10b0:49d:17d4:d6ad with SMTP id
 5b1f17b1804b1-49fc57414b7mr131030075e9.23.1790090745209; 
 Tue, 22 Sep 2026 08:25:45 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fddff0ff1sm2702665e9.14.2026.09.22.08.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 08:25:44 -0700 (PDT)
Message-ID: <35f6c12e-e143-4874-b09f-55164ecbef7f@mind.be>
Date: Tue, 22 Sep 2026 17:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: arnout@rnout.be
References: <20251013142140.68026-1-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20251013142140.68026-1-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH] docs/website: auto-generate the downloads
 page
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

(This email is primarily intended as a test for Patchwork)

Looking back at this patch, this looks overly complicated.

Titouan

On 13/10/25 16:21, Titouan Christophe wrote:
> Separate the releases data from its templating on the website.
> Each line in the table on the releases page has the same information
> repeated multiple times, such as the release tag (like "2025.02.7") that
> is present in the text and multiple links.
>
> Consequently, when publishing a new version of Buildroot, it is likely
> that we're using search & replace in the HTML file to update them all
> at once. However, other fields, such as the release date, may be
> forgotten in the process, as it happened recently [1]. Moreover, the extra
> surrounding markup makes it more difficult to spot all information to
> be updated at a glance.
>
> To make things easier, let's define the releases data in a concise json
> file, and generate the downloads page from it with a python script.
> This also makes it easier to update the templating if needed.
>
> [1] f32e6aa226ccbc9a53a47c736a13e57bcc78dc67
>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   docs/website/download.html      | 116 +-------------------------------
>   docs/website/releases.html      |  94 ++++++++++++++++++++++++++
>   docs/website/releases.json      |  25 +++++++
>   utils/generate-website-releases |  72 ++++++++++++++++++++
>   4 files changed, 192 insertions(+), 115 deletions(-)
>   create mode 100644 docs/website/releases.html
>   create mode 100644 docs/website/releases.json
>   create mode 100755 utils/generate-website-releases
>
> diff --git a/docs/website/download.html b/docs/website/download.html
> index d5b849ca9a..08c53bc3f1 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -7,121 +7,7 @@
>     <div class="panel panel-primary">
>       <div class="panel-heading">Download</div>
>       <div class="panel-body">
> -      <table class="table">
> -        <tr>
> -          <td></td>
> -          <th>Series</th>
> -          <th>End of Life</th>
> -          <th>Latest release</th>
> -          <th>Latest release date</th>
> -          <th colspan="2">Downloads</td>
> -        </tr>
> -<!--
> -        <tr>
> -          <th>Candidate</th>
> -          <th>2025.08.x</th>
> -          <td>December 2025</td>
> -          <td>
> -            2025.08-rc3<br/>
> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc3/CHANGES">
> -              Changelog
> -            </a>
> -          </td>
> -          <td>2025-08-28</td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.08-rc3.tar.gz">
> -              <img src="images/zip.png" width="24" alt="">
> -              .tar.gz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">[PGP sig]</a>
> -          </td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.08-rc3.tar.xz">
> -              <img src="images/package.png" width="24" alt="">
> -              .tar.xz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">[PGP sig]</a>
> -          </td>
> -        </tr>
> --->
> -        <tr>
> -          <th>Stable</th>
> -          <th>2025.08.x</th>
> -          <td>December 2025</td>
> -          <td>
> -            2025.08.1<br/>
> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
> -              Changelog
> -            </a>
> -          </td>
> -          <td>2025-10-11</td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.08.1.tar.gz">
> -              <img src="images/zip.png" width="24" alt="">
> -              .tar.gz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
> -          </td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.08.1.tar.xz">
> -              <img src="images/package.png" width="24" alt="">
> -              .tar.xz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
> -          </td>
> -        </tr>
> -          <th>Stable (EOL)</th>
> -          <th>2025.05.x</th>
> -          <td>September 2025</td>
> -          <td>
> -            2025.05.3<br/>
> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
> -              Changelog
> -            </a>
> -          </td>
> -          <td>2025-10-11</td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.05.3.tar.gz">
> -              <img src="images/zip.png" width="24" alt="">
> -              .tar.gz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
> -          </td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.05.3.tar.xz">
> -              <img src="images/package.png" width="24" alt="">
> -              .tar.xz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
> -          </td>
> -        </tr>
> -        <tr>
> -          <th>Long-term support</th>
> -          <th>2025.02.x</th>
> -          <td>March 2028</td>
> -          <td>
> -            2025.02.7<br/>
> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
> -              Changelog
> -            </a>
> -          </td>
> -          <td>2025-10-11</td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.02.7.tar.gz">
> -              <img src="images/zip.png" width="24" alt="">
> -              .tar.gz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
> -          </td>
> -          <td>
> -            <a href="/downloads/buildroot-2025.02.7.tar.xz">
> -              <img src="images/package.png" width="24" alt="">
> -              .tar.xz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
> -          </td>
> -        </tr>
> -      </table>
> +      <!--#include file="releases.html" -->
>   
>         This and earlier releases (and their PGP signatures) can always be downloaded from
>         <a href="/downloads/">http://buildroot.net/downloads/</a>.
> diff --git a/docs/website/releases.html b/docs/website/releases.html
> new file mode 100644
> index 0000000000..5f95f334da
> --- /dev/null
> +++ b/docs/website/releases.html
> @@ -0,0 +1,94 @@
> +
> +<!-- This fragment was generated from releases.json
> +     See utils/generate-website-releases -->
> +<table class="table">
> +    <tr>
> +        <td></td>
> +        <th>Series</th>
> +        <th>End of Life</th>
> +        <th>Latest release</th>
> +        <th>Latest release date</th>
> +        <th colspan="2">Downloads</td>
> +    </tr>
> +
> +    <tr>
> +        <th>Stable</th>
> +        <th>2025.08.x</th>
> +        <td>December 2025</td>
> +        <td>
> +            2025.08.1<br/>
> +            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
> +                Changelog
> +            </a>
> +        </td>
> +        <td>2025-10-11</td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.08.1.tar.gz">
> +                <img src="images/zip.png" width="24" alt="">
> +                .tar.gz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
> +        </td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.08.1.tar.xz">
> +                <img src="images/package.png" width="24" alt="">
> +                .tar.xz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
> +        </td>
> +    </tr>
> +
> +    <tr>
> +        <th>Stable (EOL)</th>
> +        <th>2025.05.x</th>
> +        <td>September 2025</td>
> +        <td>
> +            2025.05.3<br/>
> +            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
> +                Changelog
> +            </a>
> +        </td>
> +        <td>2025-10-11</td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.05.3.tar.gz">
> +                <img src="images/zip.png" width="24" alt="">
> +                .tar.gz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
> +        </td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.05.3.tar.xz">
> +                <img src="images/package.png" width="24" alt="">
> +                .tar.xz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
> +        </td>
> +    </tr>
> +
> +    <tr>
> +        <th>Long-term support</th>
> +        <th>2025.02.x</th>
> +        <td>March 2028</td>
> +        <td>
> +            2025.02.7<br/>
> +            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
> +                Changelog
> +            </a>
> +        </td>
> +        <td>2025-10-11</td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.02.7.tar.gz">
> +                <img src="images/zip.png" width="24" alt="">
> +                .tar.gz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
> +        </td>
> +        <td>
> +            <a href="/downloads/buildroot-2025.02.7.tar.xz">
> +                <img src="images/package.png" width="24" alt="">
> +                .tar.xz
> +            </a><br/>
> +            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
> +        </td>
> +    </tr>
> +</table>
> \ No newline at end of file
> diff --git a/docs/website/releases.json b/docs/website/releases.json
> new file mode 100644
> index 0000000000..476abb9963
> --- /dev/null
> +++ b/docs/website/releases.json
> @@ -0,0 +1,25 @@
> +{
> +  "releases": [
> +    {
> +      "series": "2025.08.x",
> +      "name": "Stable",
> +      "planned_eol": "December 2025",
> +      "latest": "2025.08.1",
> +      "latest_date": "2025-10-11"
> +    },
> +    {
> +      "series": "2025.05.x",
> +      "name": "Stable (EOL)",
> +      "planned_eol": "September 2025",
> +      "latest": "2025.05.3",
> +      "latest_date": "2025-10-11"
> +    },
> +    {
> +      "series": "2025.02.x",
> +      "name": "Long-term support",
> +      "planned_eol": "March 2028",
> +      "latest": "2025.02.7",
> +      "latest_date": "2025-10-11"
> +    }
> +  ]
> +}
> diff --git a/utils/generate-website-releases b/utils/generate-website-releases
> new file mode 100755
> index 0000000000..4ff62df121
> --- /dev/null
> +++ b/utils/generate-website-releases
> @@ -0,0 +1,72 @@
> +#!/usr/bin/env python3
> +
> +"""
> +Generate the download HTML page for the website from releases.json that lists
> +all actively maintained releases
> +"""
> +
> +import json
> +from pathlib import Path
> +from sys import argv
> +
> +THIS_SCRIPT = Path(argv[0]).absolute()
> +BUILDROOT_DIR = THIS_SCRIPT.parent.parent
> +WEBSITE = BUILDROOT_DIR / "docs" / "website"
> +
> +COMMENT_HEADER = f"""
> +<!-- This fragment was generated from releases.json
> +     See {THIS_SCRIPT.relative_to(BUILDROOT_DIR)} -->
> +"""
> +
> +TABLE_HEADER = """
> +    <tr>
> +        <td></td>
> +        <th>Series</th>
> +        <th>End of Life</th>
> +        <th>Latest release</th>
> +        <th>Latest release date</th>
> +        <th colspan="2">Downloads</td>
> +    </tr>
> +"""
> +
> +TABLE_ROW = """
> +    <tr>
> +        <th>{name}</th>
> +        <th>{series}</th>
> +        <td>{planned_eol}</td>
> +        <td>
> +            {latest}<br/>
> +            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/{latest}/CHANGES">
> +                Changelog
> +            </a>
> +        </td>
> +        <td>{latest_date}</td>
> +        <td>
> +            <a href="/downloads/buildroot-{latest}.tar.gz">
> +                <img src="images/zip.png" width="24" alt="">
> +                .tar.gz
> +            </a><br/>
> +            <a href="/downloads/buildroot-{latest}.tar.gz.sign">[PGP sig]</a>
> +        </td>
> +        <td>
> +            <a href="/downloads/buildroot-{latest}.tar.xz">
> +                <img src="images/package.png" width="24" alt="">
> +                .tar.xz
> +            </a><br/>
> +            <a href="/downloads/buildroot-{latest}.tar.xz.sign">[PGP sig]</a>
> +        </td>
> +    </tr>
> +"""
> +
> +with (WEBSITE / "releases.json").open() as f:
> +    print(f"Reading {f.name}...")
> +    releases_data = json.load(f)
> +
> +with (WEBSITE / "releases.html").open("w") as f:
> +    f.write(COMMENT_HEADER)
> +    f.write('<table class="table">')
> +    f.write(TABLE_HEADER)
> +    for r in releases_data["releases"]:
> +        f.write(TABLE_ROW.format(**r))
> +    f.write("</table>")
> +    print(f"Wrote {f.name}")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
