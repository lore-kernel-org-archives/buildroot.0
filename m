Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EE7C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E62D606C4;
	Fri, 25 Sep 2026 14:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDG2X0lyIbit; Fri, 25 Sep 2026 14:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 399F0606E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347653;
	b=bQeEhUHCizuYH1cN6XRKbWgjl0ifou970biKysTqQ1kNYUC/g0chqKz3UzXqlj7fUUmU
	 EnhQeh9+P0F9+69n5hYP39Vt6YOPlKPNZOORxUODM6WgU9jP2mZKZ04+bjqumWTVANkCg
	 sCGtTiPVLhRfT5it7ErJt1fibfptGNpEXs7XdFjQ5Cz/FVE5xUC8XqhY3DvTtYFghrVpl
	 XRJkMDTJeony5QNPMKxdey1v0S4A9OZLkL0L51tfjzwk0Zh4aMrPm2Yab0GivvxFo/bP+
	 jU9OjPBIsCtCUPB9R3K+pMwGwN3r2bdgA9Y/xtyjfY9K1Xsm/Y6099odGgiQoyD7DiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hz46UcSPJ+o2WZOa/Lp3KShzUTOODJYkRB6coYt858E=;
	b=q3XQ9lRLfYG2jYoxJjPksi3qevHsVeKvU/EizJoy0IOqtwI6aOpXZBkAvHRP/yZDduxQ
	 rWRcSGvLpKYx2+/s58nxqKCcp0XLGdI1ZYPiFTgOg6BDRB05xrIkjJCliq4vUPc43bpPT
	 mE+sVLYoWcZ3N+t2Z4owgR5ljgMrhbmhOcTrsM9ds1UhhXpcYMn3OCnDUyYn9hBB1fQ+h
	 sVXpl/6Zl88NdfPi+cXeMNW4Fn979iKV2e4K24X9VPkKkTnHmhb9bsT1UvehziyjO8FHR
	 cFESo3f1fp/6/SsSNzXcoQdNJtMy17fo2sVk9x3dwPcPA1Fl0IcRmOkW92csRbQP07w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347653;
	bh=Hz46UcSPJ+o2WZOa/Lp3KShzUTOODJYkRB6coYt858E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mS/sxIjyyvclqsQITaWpE2i3AOnDql5Z7KrKXnxBLSiPf6uz4b46Y3ti0cbKG5xjW
	 Zc5LXEj2zQZLGiTPmwXoInu/1sRF1VmbGpWoUsEuBJ38uRrWk0kzwChj5N8OZkJU7g
	 tD0PverLIlCyLlkk18tS8K5CIvsEeVrtQXVYpZNBujCLs8be5/eBWG3TAGEcGPhK43
	 sGNLeo0Ta8+zVhC9FEVt5DHg2TTPpDSg6IpHbWigh8Dsv+NRm6iVQQ2loIooBi+3Cs
	 Sp38I1HUtC+gG1HVJIEDpnExc/RwhN8cYBkrOYY2RGo5V1K5RKxKpcqiW8y8HR6U9g
	 GSaiydYf98j3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399F0606E5;
	Fri, 25 Sep 2026 14:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C26C332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2A43606C4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ObsOc4SFe_1 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00FFD60E95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347649;
 b=QF2P2Pl/1e8Kt9UCTrwyY4wkU5Wlpw1XINjA6C97TuZzqh6ATDT3e2qyZAoVxXx6dDGN
 fFOR0TsdFe9UABCnteazBkwfIpc05XVLFDcjudqDaPCYdTZ6r8UYhxZRym0T4kc+6ap+9
 fPDHkIlmsqiInrrZVIpj30ccvhm1JfvLaH1/w6BdCVKB/1EuORnSHpLthx9CM+xgqjSD9
 x15/uv3Umtn27PUweWz/0F5wo7i0Cb6poPM/1sh3Shd637qQR+RgwZX3fkdL/v6O26FJh
 O0NGDGW2UcZU/RspbS77ecZoZEWohEcTsS+SH78lO5q1pg5WB2r4TBvOsROOTi/HQDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347649;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2GUKdps+paWXQITTfPnCU7PZ1dYRzc+7+PhXWxOf4Vc=;
 b=Re4NcBhztu1wgvn3IBcM3OfAlwd320KhHZLcXQ8hUwJJ9BItcoglsAyXeenKxIyiCxLl
 fiwryWbAGJ3OneUyShvZhDvAbS7zI/NJNlLutFVPNY4KdAXYH0jAHbErpxXdzPueUQezV
 ReoW83hsaeG/8S1YlUVseqFJ2OXzkid8DDAltTcUn0X3lvI3fsI+fj/xLwL99oQmGWRUa
 aphHlRD/5wuPm8gr4Vf+MqtU4mKw5KQkAT+nO+L8umJGDjxDYTjJ7l/3pA2oC9pFWQdfv
 tefCTcYdZLIL9yIqUr8aTN+UKzNHZhD4Uno7v0PlXmxWk9KdCBrl/lULVaUh8Ye5cFw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ONnnN0Cp; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00FFD60E95
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:28 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so7649675e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347647; x=1790952447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2GUKdps+paWXQITTfPnCU7PZ1dYRzc+7+PhXWxOf4Vc=;
 b=U6aME0BwlFUW1U1B9rlLOElZXfwAO/DplXJnvHHO1KLQ4cw7/Ee27x4+D2POIRwRl3
 bexUY9Cu5sRAQXQWPR1GHcHJsnsKRoG/cQOCW8wNNSGW8JHn8aYOM9U14FjXvCShcmLy
 K8y6Sm4KSl7tf3/0tOcsG7ve+c6LJC6K5qcpk5Rx+MPdNphxpxC03wpQwFtwAkoLKtmb
 6aN//kHPwpCp7OKg9cbuPnPKg5o3BrsRUR7Tvaxi2EwyEzWjc0cbH+vu1oKHxnmX7rFo
 tVFcM+nsV0wtPT3Nsphm4eIeUGr6LQRqWRrIz5pc6rJfiJ1LeGR3mglVBa/285jbQ3Aj
 fGgw==
X-Gm-Message-State: AFuF++mEmCEDcW5vkxCbbgAU2oJBqwqhcY5atZb0gk+qf9usoQsp0vdA
 Ia7kkDsL6rl4YwWPiet7rU1CDrAWSi9NqCwPemsG+QlC93+FhbaluUplAXG1ZsMoHt96vvoqlAM
 moNavlizmPg==
X-Gm-Gg: AYBFou1f4YX82K5erjFdFSUuyPvAsSHm47RByg63tLR3z4oKGwzDOtQ5ErpTJq31o+e
 EaIxKoRa+UTufQfpheLAeGv2eSw1LqPgH13rTIx0yqliReeE98Td1G1ndbzsxMrNUAhm8wkkfZY
 76pf+7WhOTeKwPiK4fSqChQd5yoI0/0ve7fXwym0i/I+bQF+Y4YUKS6xPHfxsAh0MLnB9ISXaP1
 1hBMhoGdFimB41WhDw+NyD6y5RdHVhKXTNeL4jmNBf9Dg9gXaat85f1srdaqN+wuxXOCy5wWiAo
 PVDN/5imxsQU0ZuYzhLj8vsGyB8euppc7Ug6DRZXGVw9YGN43troip7P+ki2n8+9t12URctcfWq
 GsvxTa7zZ29KKIZF5aJqCUYqKj0TF0qGjWdBImc19rvjVTFDVKyl22GJodelZO04KCpBoCOfvNb
 ifKnNgJ1M6ccUrZYNDt0odxhtuVYWkfuCB++TRSkILJ4Uc55h2KMEaOMXsb7L9TuTfM3ihseReK
 XEWy/ZMMNCpYsra8DYBzYfr/MODYavpu2X+yGK/fQ==
X-Received: by 2002:a05:600c:1394:b0:49e:6bc7:4e1b with SMTP id
 5b1f17b1804b1-49fe66bdefcmr108246005e9.15.1790347647121; 
 Fri, 25 Sep 2026 07:47:27 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5ce4941sm153414145e9.6.2026.09.25.07.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:26 -0700 (PDT)
To: buildroot@buildroot.org,
	Franciszek Stachura <fbstachura@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:23 +0200
Message-ID: <20260925144725.4101145-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920105553.859978-2-fbstachura@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: sort latest
 version by state
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
> pkg-stats columns are sorted either alphabetically or numerically. This
> does not make much sense for the "Latest version" column.
> This commit orders the column by whether the package is up-to-date or
> not.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/scripts/pkg-stats | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 2b2194b9a5..842e78f8c0 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -44,6 +44,11 @@ RM_API_STATUS_NOT_FOUND = 4
>  
>  HTTP_HEADERS = {'User-Agent': 'buildroot.org pkg-stats'}
>  
> +LATEST_SORT_GOOD = 3
> +LATEST_SORT_ERROR = 2
> +LATEST_SORT_UNKNOWN = 1
> +LATEST_SORT_NEEDS_UPDATE = 0
> +
>  
>  class Defconfig:
>      def __init__(self, name, path):
> @@ -766,7 +771,15 @@ addedCSSRules = [
>  
>  addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
>  
> -function sortGrid(sortLabel){
> +function byInnerText(el) {
> +        return el.innerText;
> +}
> +
> +function byIsLatest(el) {
> +        return el.getAttribute('data-latest-sort');
> +}
> +
> +function sortGrid(sortLabel, sortBy=byInnerText){
>  	let i = 0;
>  	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
>  	const git_hash_regex = /[a-f,0-9]/gi;
> @@ -786,10 +799,10 @@ function sortGrid(sortLabel){
>          columnValues.forEach((listing) => {
>                  let sortArr = [];
>                  sortArr[0] = listing.id.replace(sortLabel+"_", "");
> -                if (!listing.innerText){
> +                if (!sortBy(listing)) {
>                          sortArr[1] = -1;
>                  } else {
> -                        sortArr[1] = listing.innerText;
> +                        sortArr[1] = sortBy(listing);
>                  };
>                  pkgSortArray.push(sortArr);
>          });
> @@ -1011,14 +1024,20 @@ def dump_html_pkg(f, pkg):
>      div_class = ["centered"]
>      div_class.append(f'_{pkg_css_class}')
>      div_class.append("latest_version data")
> +    data_latest_sort = None
>      if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
>          div_class.append("version-error")
> +        data_latest_sort = LATEST_SORT_ERROR
>      if pkg.latest_version['version'] is None:
>          div_class.append("version-unknown")
> +        if data_latest_sort != LATEST_SORT_ERROR:
> +            data_latest_sort = LATEST_SORT_UNKNOWN
>      elif pkg.latest_version['version'] != pkg.current_version:
>          div_class.append("version-needs-update")
> +        data_latest_sort = LATEST_SORT_NEEDS_UPDATE
>      else:
>          div_class.append("version-good")
> +        data_latest_sort = LATEST_SORT_GOOD
>  
>      if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
>          latest_version_text = "<b>Error</b>"
> @@ -1038,7 +1057,7 @@ def dump_html_pkg(f, pkg):
>          else:
>              latest_version_text += "found by guess"
>  
> -    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" data-latest-sort="{data_latest_sort}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
>  
>      # Warnings
>      data_field_id = f'warnings__{pkg_css_class}'
> @@ -1170,7 +1189,7 @@ def dump_html_all_pkgs(f, packages):
>       class="centered hash_file data label"><span>Hash file</span><span></span></div>
>  <div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
>       class="centered current_version data label"><span>Current version</span><span></span></div>
> -<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
> +<div style="grid-column: 9;" onclick="sortGrid(this.id, byIsLatest)" id="latest_version"
>       class="centered latest_version data label"><span>Latest version</span><span></span></div>
>  <div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
>       class="centered warnings data label"><span>Warnings</span><span></span></div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
