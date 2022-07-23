Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF3C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40A0D40920;
	Sat, 23 Jul 2022 16:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A0D40920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNAZ9SyYLjpF; Sat, 23 Jul 2022 16:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B10D402B1;
	Sat, 23 Jul 2022 16:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B10D402B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5311BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F554018E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F554018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BR330i-k_qXM for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F94E4031D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F94E4031D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:11:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso4003093wmm.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u/9Avj+qTTxie6ALcW9gh+6LmqKI2mypPNKFdm4Ju+o=;
 b=N9LFP2DOY+Yp1SmFaCogb7KSdHKE8O+N8pkdQM6UhGBn+XP/hwjPhbWrwkFq9gdOYg
 Z6tMk9NTZRGncU1m1TPpw4J1ME/kuAJhxeZWD0eX8s/3sHuLqFk8kZlvXboZ77KNEmt+
 r0WJcqh0CNS66srhFIo8A6weO+YI6+KV7CwAm/1vfxAhTAZh5q8nybU6yw27pCWPiRbG
 Jc2jhDuWu27rsMwqiy3jqN5BU6nZhJqmKnj1pv7Jwz/eko+zJoKB7PGR4P3jxBXJdYvr
 be57gHvdJcEiOCAb23ITcANMCF9FYTfnvAjGYPZlabjdhqIVqKlY7uhucYYqm4IjXXbp
 hD4Q==
X-Gm-Message-State: AJIora+JTGUJyFFA6hck5guePyyhxsZWs5QlABQmFOoR+ejHx4NXjeYT
 WcMV10mL+GJXxoZnt+/PA7/EF8KUtzf77w==
X-Google-Smtp-Source: AGRyM1vmtmWyx4alZnGt9Ewrx4kZYlsfQ6MMis3VijSXRSbTY9qd+x+R/hkOD/ldZf4M5uiXylWBlQ==
X-Received: by 2002:a1c:e90a:0:b0:3a3:10d1:cece with SMTP id
 q10-20020a1ce90a000000b003a310d1cecemr15387545wmc.92.1658592678998; 
 Sat, 23 Jul 2022 09:11:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adff50c000000b0021e5757fb4csm6535628wro.88.2022.07.23.09.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:11:18 -0700 (PDT)
Message-ID: <ef52d1f1-754c-0761-e9b3-24ed613d594a@mind.be>
Date: Sat, 23 Jul 2022 18:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
References: <20220722191558.809011-1-sen@phobosdpl.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722191558.809011-1-sen@phobosdpl.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=u/9Avj+qTTxie6ALcW9gh+6LmqKI2mypPNKFdm4Ju+o=;
 b=UJ68ht53Ix83ORHJ7YDWhd79Lwlk9to+egtnUL0mjMeHDgxZQ+vqpEu3bslFfMFD/i
 h/QR8/PKCKvJWUTqfxSW7A4NwZNVnedr5FAfYAah6vKEuF4oFMU9iieBkr0gZGsx5ZVO
 xbkQi8Xv1JcNnr+B07qmM0dGRnCyoWUFG32noWD+5LTdjhzog0LRr8OdAhp2My7uDZXH
 NXJbtKVy8waXeKSN7M0TiLJwmFHgEuhEb+uzghfIIf9FOPXqB8kZJvJ2QHVzHa7kyIpf
 rxt8hNoU+oKeBek3Nqsm7UA6ro2CXeYBD2YyD8U/WnapG9zAnr9cJDUjgIKf6fTBo45M
 mlWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UJ68ht53
Subject: Re: [Buildroot] [PATCH v3] support/scripts/pkg-stats: migrate to
 CSS grid and inline javascript
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 21:15, Sen Hastings wrote:
> This migrates pkg-stats.html from html tables to CSS grid, allowing
> the use of newer, simpler javascript that is short enough to be
> inlined, instead of relying on externally hosted javascript.
> 
> Javascript sorting function was rewritten from scratch in ~55 lines,
> short enough to be inlined directly in the html.
> 
> Tables were redone in CSS grid, but with care taken to mimic existing
> "look and feel" of prevous implementation, albeit with slightly
> better responsive behavior and default styling characteristics.
> 
> Column labels are now "sticky" and stay stuck to the top of the
> viewport as you scroll down the page.
> 
> Also, css was rewritten in fewer lines and table elements were changed
> to divs (for grid support).

  I don't really understand any of this, but I trust you did it correctly. The 
output looks OK at least.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Other small misc fixes include quoted hrefs and document language
> declarations to make the w3c html validator happy.
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> 
> ---
> v1->v2:
> *   added new entry in DEVELOPERS as part of same commit
> *   sent patch with UTF-8 instead of base64 transfer encoding
> v2->v3:
> *   rewrote sortGrid to remove all UTF-8 characters.
> *   also sortGrid is now slightly cleaner and only uses arrays.
> *   patch *hopefully* now us-ascii and will *not* be base64 encoded
> ---
>   DEVELOPERS                |   3 +
>   support/scripts/pkg-stats | 405 +++++++++++++++++++++-----------------
>   2 files changed, 226 insertions(+), 182 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5c3c24ff7a..0246f80713 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2565,6 +2565,9 @@ F:	package/libbson/
>   F:	package/lua-resty-http/
>   F:	package/mpir/
>   
> +N:	Sen Hastings <sen@phobosdpl.com>
> +F:	support/scripts/pkg-stats
> +
>   N:	Sergey Bobrenok <bobrofon@gmail.com>
>   F:	package/sdbus-cpp/
>   
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index f67be0063f..6dc206d2bc 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -718,89 +718,113 @@ def calculate_stats(packages):
>   
>   
>   html_header = """
> +<!DOCTYPE html>
> +<html lang="en">
>   <head>
> -<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
> -<style type=\"text/css\">
> -table {
> -  width: 100%;
> -}
> -td {
> -  border: 1px solid black;
> -}
> -td.centered {
> -  text-align: center;
> -}
> -td.wrong {
> -  background: #ff9a69;
> -}
> -td.correct {
> -  background: #d2ffc4;
> -}
> -td.nopatches {
> -  background: #d2ffc4;
> -}
> -td.somepatches {
> -  background: #ffd870;
> -}
> -td.lotsofpatches {
> -  background: #ff9a69;
> -}
> -
> -td.good_url {
> -  background: #d2ffc4;
> -}
> -td.missing_url {
> -  background: #ffd870;
> -}
> -td.invalid_url {
> -  background: #ff9a69;
> -}
> -
> -td.version-good {
> -  background: #d2ffc4;
> -}
> -td.version-needs-update {
> -  background: #ff9a69;
> -}
> -td.version-unknown {
> - background: #ffd870;
> -}
> -td.version-error {
> - background: #ccc;
> +<meta charset="UTF-8">
> +<meta name="viewport" content="width=device-width, initial-scale=1">
> +<script>
> +function sortGrid(sortLabel){
> +	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
> +	let columnValues = Array.from(document.getElementsByClassName(sortLabel));
> +
> +	columnValues.shift();
> +	columnValues.forEach((listing) => {
> +		let sortArr = [];
> +		sortArr[0] = listing.id.replace(sortLabel+"_", "");
> +		if (!listing.innerText){
> +			sortArr[1] = -1;
> +		} else {
> +			sortArr[1] = listing.innerText;
> +		};
> +		pkgSortArray.push(sortArr);
> +	})
> +	pkgSortArray.forEach((listing) => {
> +		if ( isNaN(parseInt(listing[1], 10)) ){
> +			pkgStringSortArray.push(listing);
> +		} else {
> +			listing[1] = parseFloat(listing[1]);
> +			pkgNumSortArray.push(listing);
> +		};
> +	})
> +	sortedStringPkgArray = pkgStringSortArray.sort(function(a, b) {
> +		const nameA = a[1].toUpperCase(); // ignore upper and lowercase
> +		const nameB = b[1].toUpperCase(); // ignore upper and lowercase
> +		if (nameA < nameB) { return -1;	};
> +		if (nameA > nameB) { return 1; };
> +		return 0;   // names must be equal
> +	});
> +	sortedNumPkgArray = pkgNumSortArray.sort(function(a, b) {
> +		return a[1] - b[1];
> +	});
> +
> +	let triangleUp = String.fromCodePoint(32, 9652);
> +	let triangleDown = String.fromCodePoint(32, 9662);
> +	let columnName = document.getElementById(sortLabel);
> +
> +	if (columnName.lastElementChild.innerText == triangleDown) {
> +		columnName.lastElementChild.innerText = triangleUp;
> +		sortedStringPkgArray.reverse();
> +		sortedNumPkgArray.reverse();
> +		sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray)
> +	} else {
> +		columnName.lastElementChild.innerText = triangleDown;
> +		sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray)
> +	}
> +
> +	sortedPkgArray.forEach((listing) => {
> +		let row = Array.from(document.getElementsByClassName(listing[0]));
> +		let packageGrid = document.getElementById("package-grid");
> +		row.forEach((element) => { packageGrid.append(element)});
> +	})
>   }
> +</script>
>   
> -td.cpe-ok {
> -  background: #d2ffc4;
> -}
> +<style>
>   
> -td.cpe-nok {
> -  background: #ff9a69;
> +.label {
> +  position: sticky;
> +  top: 1px;
>   }
> -
> -td.cpe-unknown {
> - background: #ffd870;
> +.label{
> +  background: white;
> +  padding: 10px 2px 10px 2px;
>   }
> -
> -td.cve-ok {
> -  background: #d2ffc4;
> +#package-grid, #results-grid {
> +  display: grid;
> +  grid-gap: 2px;
> +  grid-template-columns: 1fr repeat(12, min-content);
>   }
> -
> -td.cve-nok {
> -  background: #ff9a69;
> +#results-grid {
> +  grid-template-columns: 3fr 1fr;
>   }
> -
> -td.cve-unknown {
> - background: #ffd870;
> +.data {
> +  border: solid 1px gray;
>   }
> -
> -td.cve_ignored {
> - background: #ccc;
> +.centered {
> +  text-align: center;
>   }
> + .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
> +   background: #ff9a69;
> + }
> + .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
> +   background: #d2ffc4;
> + }
> + .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
> +   background: #ffd870;
> + }
> + .cve_ignored, .version-error {
> +  background: #ccc;
> + }
>   
>   </style>
> +
>   <title>Statistics of Buildroot packages</title>
> +
>   </head>
>   
> +<body>
> +
>   <a href=\"#results\">Results</a><br/>
>   
>   <p id=\"sortable_hint\"></p>
> @@ -808,13 +832,13 @@ td.cve_ignored {
>   
>   
>   html_footer = """
> -</body>
>   <script>
> -if (typeof sorttable === \"object\") {
> -  document.getElementById(\"sortable_hint\").innerHTML =
> -  \"hint: the table can be sorted by clicking the column headers\"
> +if (typeof sortGrid === "function") {
> +  document.getElementById("sortable_hint").innerHTML =
> +  "hint: the table can be sorted by clicking the column headers"
>   }
>   </script>
> +</body>
>   </html>
>   """
>   
> @@ -841,73 +865,87 @@ def boolean_str(b):
>   
>   
>   def dump_html_pkg(f, pkg):
> -    f.write(" <tr>\n")
> -    f.write("  <td>%s</td>\n" % pkg.path)
> -
> +    f.write( f'<div id=\"package_{pkg.name}\" \
> +	class=\"package data {pkg.name}\">{pkg.path}</div>\n')
>       # Patch count
> -    td_class = ["centered"]
> +    data_field_id = f'patch_count_{pkg.name}'
> +    div_class = ["centered patch_count data"]
> +    div_class.append(pkg.name)
>       if pkg.patch_count == 0:
> -        td_class.append("nopatches")
> +        div_class.append("nopatches")
>       elif pkg.patch_count < 5:
> -        td_class.append("somepatches")
> +        div_class.append("somepatches")
>       else:
> -        td_class.append("lotsofpatches")
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), str(pkg.patch_count)))
> +        div_class.append("lotsofpatches")
> +    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +	\">{str(pkg.patch_count)}</div>\n')
>   
>       # Infrastructure
> +    data_field_id = f'infrastructure_{pkg.name}'
>       infra = infra_str(pkg.infras)
> -    td_class = ["centered"]
> +    div_class = ["centered infrastructure data"]
> +    div_class.append(pkg.name)
>       if infra == "Unknown":
> -        td_class.append("wrong")
> +        div_class.append("wrong")
>       else:
> -        td_class.append("correct")
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), infra_str(pkg.infras)))
> +        div_class.append("correct")
> +    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +	\">{infra_str(pkg.infras)}</div>\n')
>   
>       # License
> -    td_class = ["centered"]
> +    data_field_id = f'license_{pkg.name}'
> +    div_class = ["centered license data"]
> +    div_class.append(pkg.name)
>       if pkg.is_status_ok('license'):
> -        td_class.append("correct")
> +        div_class.append("correct")
>       else:
> -        td_class.append("wrong")
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), boolean_str(pkg.is_status_ok('license'))))
> +        div_class.append("wrong")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +	\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
>   
>       # License files
> -    td_class = ["centered"]
> +    data_field_id = f'license_files_{pkg.name}'
> +    div_class = ["centered license_files data"]
> +    div_class.append(pkg.name)
>       if pkg.is_status_ok('license-files'):
> -        td_class.append("correct")
> +        div_class.append("correct")
>       else:
> -        td_class.append("wrong")
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), boolean_str(pkg.is_status_ok('license-files'))))
> +        div_class.append("wrong")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +	\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
>   
>       # Hash
> -    td_class = ["centered"]
> +    data_field_id = f'hash_file_{pkg.name}'
> +    div_class = ["centered hash_file data"]
> +    div_class.append(pkg.name)
>       if pkg.is_status_ok('hash'):
> -        td_class.append("correct")
> +        div_class.append("correct")
>       else:
> -        td_class.append("wrong")
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), boolean_str(pkg.is_status_ok('hash'))))
> +        div_class.append("wrong")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> +	\">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
>   
>       # Current version
> +    data_field_id = f'current_version_{pkg.name}'
>       if len(pkg.current_version) > 20:
>           current_version = pkg.current_version[:20] + "..."
>       else:
>           current_version = pkg.current_version
> -    f.write("  <td class=\"centered\">%s</td>\n" % current_version)
> +    f.write(f'  <div id=\"{data_field_id}\" \
> +	class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
>   
>       # Latest version
> +    data_field_id = f'latest_version_{pkg.name}'
> +    div_class.append(pkg.name)
> +    div_class.append("latest_version data")
>       if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
> -        td_class.append("version-error")
> +        div_class.append("version-error")
>       if pkg.latest_version['version'] is None:
> -        td_class.append("version-unknown")
> +        div_class.append("version-unknown")
>       elif pkg.latest_version['version'] != pkg.current_version:
> -        td_class.append("version-needs-update")
> +        div_class.append("version-needs-update")
>       else:
> -        td_class.append("version-good")
> +        div_class.append("version-good")
>   
>       if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
>           latest_version_text = "<b>Error</b>"
> @@ -927,74 +965,81 @@ def dump_html_pkg(f, pkg):
>           else:
>               latest_version_text += "found by guess"
>   
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), latest_version_text))
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
>   
>       # Warnings
> -    td_class = ["centered"]
> +    data_field_id = f'warnings_{pkg.name}'
> +    div_class = ["centered warnings data"]
> +    div_class.append(pkg.name)
>       if pkg.warnings == 0:
> -        td_class.append("correct")
> +        div_class.append("correct")
>       else:
> -        td_class.append("wrong")
> -    f.write("  <td class=\"%s\">%d</td>\n" %
> -            (" ".join(td_class), pkg.warnings))
> +        div_class.append("wrong")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
>   
>       # URL status
> -    td_class = ["centered"]
> +    data_field_id = f'upstream_url_{pkg.name}'
> +    div_class = ["centered upstream_url data"]
> +    div_class.append(pkg.name)
>       url_str = pkg.status['url'][1]
>       if pkg.status['url'][0] in ("error", "warning"):
> -        td_class.append("missing_url")
> +        div_class.append("missing_url")
>       if pkg.status['url'][0] == "error":
> -        td_class.append("invalid_url")
> -        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
> +        div_class.append("invalid_url")
> +        url_str = "<a href=\"%s\">%s</a>" % (pkg.url, pkg.status['url'][1])
>       else:
> -        td_class.append("good_url")
> -        url_str = "<a href=%s>Link</a>" % pkg.url
> -    f.write("  <td class=\"%s\">%s</td>\n" %
> -            (" ".join(td_class), url_str))
> +        div_class.append("good_url")
> +        url_str = "<a href=\"%s\">Link</a>" % pkg.url
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
>   
>       # CVEs
> -    td_class = ["centered"]
> +    data_field_id = f'cves_{pkg.name}'
> +    div_class = ["centered cves data"]
> +    div_class.append(pkg.name)
>       if pkg.is_status_ok("cve"):
> -        td_class.append("cve-ok")
> +        div_class.append("cve-ok")
>       elif pkg.is_status_error("cve"):
> -        td_class.append("cve-nok")
> +        div_class.append("cve-nok")
>       elif pkg.is_status_na("cve") and not pkg.is_actual_package:
> -        td_class.append("cve-ok")
> +        div_class.append("cve-ok")
>       else:
> -        td_class.append("cve-unknown")
> -    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +        div_class.append("cve-unknown")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
>       if pkg.is_status_error("cve"):
>           for cve in pkg.cves:
> -            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
> +            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
>           for cve in pkg.unsure_cves:
> -            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i><br/>\n" % (cve, cve))
> +            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i></a><br/>\n" % (cve, cve))
>       elif pkg.is_status_na("cve"):
>           f.write("    %s" % pkg.status['cve'][1])
>       else:
>           f.write("    N/A\n")
> -    f.write("  </td>\n")
> +    f.write("  </div>\n")
>   
>       # CVEs Ignored
> -    td_class = ["centered"]
> +    data_field_id = f'ignored_cves_{pkg.name}'
> +    div_class = ["centered data ignored_cves"]
> +    div_class.append(pkg.name)
>       if pkg.ignored_cves:
> -        td_class.append("cve_ignored")
> -    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +        div_class.append("cve_ignored")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
>       for ignored_cve in pkg.ignored_cves:
> -        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
> -    f.write("  </td>\n")
> +        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
> +    f.write("  </div>\n")
>   
>       # CPE ID
> -    td_class = ["left"]
> +    data_field_id = f'cpe_id_{pkg.name}'
> +    div_class = ["left cpe_id data"]
> +    div_class.append(pkg.name)
>       if pkg.is_status_ok("cpe"):
> -        td_class.append("cpe-ok")
> +        div_class.append("cpe-ok")
>       elif pkg.is_status_error("cpe"):
> -        td_class.append("cpe-nok")
> +        div_class.append("cpe-nok")
>       elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
> -        td_class.append("cpe-ok")
> +        div_class.append("cpe-ok")
>       else:
> -        td_class.append("cpe-unknown")
> -    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +        div_class.append("cpe-unknown")
> +    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
>       if pkg.cpeid:
>           f.write("  <code>%s</code>\n" % pkg.cpeid)
>       if not pkg.is_status_ok("cpe"):
> @@ -1008,79 +1053,75 @@ def dump_html_pkg(f, pkg):
>           else:
>               f.write("  %s\n" % pkg.status['cpe'][1])
>   
> -    f.write("  </td>\n")
> -
> -    f.write(" </tr>\n")
> +    f.write("  </div>\n")
>   
>   
>   def dump_html_all_pkgs(f, packages):
>       f.write("""
> -<table class=\"sortable\">
> -<tr>
> -<td>Package</td>
> -<td class=\"centered\">Patch count</td>
> -<td class=\"centered\">Infrastructure</td>
> -<td class=\"centered\">License</td>
> -<td class=\"centered\">License files</td>
> -<td class=\"centered\">Hash file</td>
> -<td class=\"centered\">Current version</td>
> -<td class=\"centered\">Latest version</td>
> -<td class=\"centered\">Warnings</td>
> -<td class=\"centered\">Upstream URL</td>
> -<td class=\"centered\">CVEs</td>
> -<td class=\"centered\">CVEs Ignored</td>
> -<td class=\"centered\">CPE ID</td>
> -</tr>
> +<div id=\"package-grid\">
> +<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\" class=\"package data label\"><span>Package</span><span></span></div>
> +<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\" class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
> +<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\" class=\"centered infrastructure data label\">Infrastructure<span></span></div>
> +<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\" class=\"centered license data label\"><span>License</span><span></span></div>
> +<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\" class=\"centered license_files data label\"><span>License files</span><span></span></div>
> +<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\" class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
> +<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\" class=\"centered current_version data label\"><span>Current version</span><span></span></div>
> +<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\" class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
> +<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\" class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
> +<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\" class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
> +<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\" class=\"centered cves data label\"><span>CVEs</span><span></span></div>
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\" class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\" class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
>   """)
>       for pkg in sorted(packages):
>           dump_html_pkg(f, pkg)
> -    f.write("</table>")
> +    f.write("</div>")
>   
>   
>   def dump_html_stats(f, stats):
>       f.write("<a id=\"results\"></a>\n")
> -    f.write("<table>\n")
> +    f.write("<div class=\"data\" id=\"results-grid\">\n")
>       infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
>       for infra in infras:
> -        f.write(" <tr><td>Packages using the <i>%s</i> infrastructure</td><td>%s</td></tr>\n" %
> +        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
>                   (infra, stats["infra-%s" % infra]))
> -    f.write(" <tr><td>Packages having license information</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
>               stats["license"])
> -    f.write(" <tr><td>Packages not having license information</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
>               stats["no-license"])
> -    f.write(" <tr><td>Packages having license files information</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
>               stats["license-files"])
> -    f.write(" <tr><td>Packages not having license files information</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
>               stats["no-license-files"])
> -    f.write(" <tr><td>Packages having a hash file</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
>               stats["hash"])
> -    f.write(" <tr><td>Packages not having a hash file</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
>               stats["no-hash"])
> -    f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
> +    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
>               stats["patches"])
> -    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
>               stats["rmo-mapping"])
> -    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
>               stats["rmo-no-mapping"])
> -    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
>               stats["version-uptodate"])
> -    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
>               stats["version-not-uptodate"])
> -    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
>               stats["version-unknown"])
> -    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
>               stats["pkg-cves"])
> -    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
>               stats["total-cves"])
> -    f.write("<tr><td>Packages affected by unsure CVEs</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
>               stats["pkg-unsure-cves"])
> -    f.write("<tr><td>Total number of unsure CVEs affecting all packages</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
>               stats["total-unsure-cves"])
> -    f.write("<tr><td>Packages with CPE ID</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
>               stats["cpe-id"])
> -    f.write("<tr><td>Packages without CPE ID</td><td>%s</td></tr>\n" %
> +    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
>               stats["no-cpe-id"])
> -    f.write("</table>\n")
> +    f.write("</div>\n")
>   
>   
>   def dump_html_gen_info(f, date, commit):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
