Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8347FEFB56
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A352822F3;
	Fri, 27 Feb 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoYFHSCRwxsf; Fri, 27 Feb 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BADA822DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772203786;
	bh=EaUzCJPTbppRLVbDSPWgjaJKKB0I+9JX1oopQ5Z7p3Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iawRKQHsBijP04+uu4pOZOpwqN8kI2RsfjKETvK2mgLt71RaNYTbaLXeDYOjA+mL9
	 LL1XsqywzhbCS0xyw+rNY4IyNYQsY5ZqjdaM6XPlJ4LjoiyDEX7IU5adXwRg7BQvfn
	 8kJOHk8ynNpl8xrvnymBDPQEhGRFMMbsp2pUxkbNxiOw9MI44M7e+9hfejI0qzpMC8
	 kZsNpSSo6u9S8xnu25s1lBNKcHCcaDv+5K1PAAwQTE4KmzyA0E0d2BCgZYHfhiJj0n
	 FbRgmNY6eQf2i4aS+f5s4sd5vG5ysmnqfAFTiKbh7lQi58zuULuge4N0g2fym02r0g
	 j5XZmb32e6SnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BADA822DC;
	Fri, 27 Feb 2026 14:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED0D11F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE6BA406A5
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgBiPqYzA-G6 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 14:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0D2B40691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D2B40691
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0D2B40691
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:49:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48378136adcso12739825e9.1
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 06:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772203781; x=1772808581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e+1bUaxcWIvz6dt0yk1RzOUNB7P1cWlVI9dvZBloT7A=;
 b=BYHTo3zPUXo/mixZaVMPi90sHCGYLhw1WyDRY8nOM/0BnLl3HVWWjg8vJWgOzHhP4/
 Z3JS5mwaerqoyVLHeBDuOJPcFKQoRntdqYr2QmJ6lTXTQi8Dwom+eMe11SBhjyhHc6L/
 +AxoJqPMN2YwXOJKofVijdkzgXRjKniF1V+6xff1VF6WqsqZCOACF2ewXT1chcIfApun
 lX3jyyjch2nbs2Fim7qJcP5pQckAqAHSn9Dh2fwuxnThjfrNgqPNJ+GZU0OvkAurTs4E
 0sq0xB8qfWSlthocO9i+L78NrZsl+adFPHVPFviWWQHkAc9CSpQfaq2BNhA8nQ36PxQQ
 emCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlgMRRO5O94EMLG/N6zMxRIirOFsLphA3/sqmSLP08pd0d1m9AKBZRctAYq1Jb0S8zmuQR1i/FTNA=@buildroot.org
X-Gm-Message-State: AOJu0YwvesBYR3DAHuKCuRRbS68mf/n/dMJLG/jThdC0JlX0Ik3lDPHQ
 QnGs2rPr0qJ30bjDyE+twDRLtugsRAjijWAJBkKvlgx6VI1IKJEzbmqtex4KeHNZ4yQ=
X-Gm-Gg: ATEYQzyAFAcDJ9wh6lIDpabNMTnQECSIrUANZmXcJsD6tispnNc72PokBE75BFinB9x
 2K/y15Mn3jq1WdEN79aODlJMz2f8qnFo/8BQoDxx4q69Aitrnq0kqYOJ6TkRMm4GOqFoC69BIh+
 zRVB+iOiDXZtT1PMt8p4nNbTEKJ9igQfFjUI5WcIzSIN+C721bk3txT3SwCk2tkFHEtUMKo9tOG
 XAaFFsnjRH92+2M5/okVxPXfJO9lE7dMIu6qK3coz3t4vrDGja9mYdbk+/jvR93HyyEID6ZJwjf
 +l9otsJ3iVw+vANQlRLeEQs+0KPwR//8H8py0nX8zq9DQ6mq4RqDBSA6I0p1tiejt+fI819MEm8
 KzyiL70KtBp++fdW9BJTp8bKqcAWafTQyQlIiw0bbUXvBEKThEdu8FJ1nOujZXT1AsSQTOwld9c
 QhKJVZ+V4XS3+K8Ws=
X-Received: by 2002:a05:600c:3b18:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-483c9bc1f39mr50769895e9.13.1772203781233; 
 Fri, 27 Feb 2026 06:49:41 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfabb84esm201847905e9.0.2026.02.27.06.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:49:40 -0800 (PST)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Feb 2026 15:49:40 +0100
Message-ID: <20260227144940.104688-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226142023.1064241-8-martin@strongswan.org>
References: <20260226142023.1064241-8-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772203781; x=1772808581; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+1bUaxcWIvz6dt0yk1RzOUNB7P1cWlVI9dvZBloT7A=;
 b=T/N1YWKFp7gjvO0KxYSfrvVuhpVWfvz2IVlyR2pp0IBEkgMT0sf7uwoWYky0B9pfiP
 EhXNy4MqqFi7kUV6eE81Lm4cP+sQRwgcHHCxv07OoqfhYokJEC/LLuCAK03Joe4JHcIx
 xmOeJBjWazgZOlu7mTvtTPpB1R7IMB1e+4gup4dpzi/A6CnPHSanQW/UeeZToreoUY8F
 zrL9U2ZujRK8bttcbcPp13TperGuHqy4KqSp1HhBaghqxPi7nyfbOQlLf16vpRtJH56m
 qqWnL2ZV3p7rDA6QptODnDg4LO1AgzcdSMBRIjMZOZzKWPW0+G5ABB9GfQitHjxwoOSa
 S0PQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T/N1YWKF
Subject: Re: [Buildroot] [PATCH 7/8] utils/generate-cyclonedx: allow
 excluding vulnerabilities section
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

Hi Martin,

In reply of:
> Some standards (such as TR-03183-2) require omitting vulnerability information
> in the SBOM. Add --no-vuln to allow excluding that section.

Interesting to have such insight, do you happen to know more which are the
requirements for TR-03183-2 ?

Regarding the `--no-vuln` feature, I think we could actually extend the feature
to be able to generate the vulnerability in a seperate file. I think it's a
feature user are interested in as it allows them to have an external VEX.

This way if you have the external vulnerability report you can just discard it
if you don't need to provide it.

PERALE Thomas

> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  utils/generate-cyclonedx | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9920000e6714..48573ddf9a3b 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -445,6 +445,8 @@ def main():
>                          help="Excludes skeleton packages from the CycloneDX output")
>      parser.add_argument("--no-host", default=False, action='store_true',
>                          help="Excludes host packages from the CycloneDX output")
> +    parser.add_argument("--no-vuln", default=False, action='store_true',
> +                        help="Excludes vulnerabilities from the CycloneDX output")
>      parser.add_argument("--project-name", type=str, default="buildroot",
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> @@ -514,12 +516,13 @@ def main():
>          "dependencies": [
>              cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
>          ],
> -        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
>      }
>      for ref in filtered_show_info_dict:
>          include = filtered_show_info_dict.keys()
>          depends = br2_parse_deps(ref, show_info_dict, include, args.virtual)
>          cyclonedx_dict["dependencies"].append(cyclonedx_dependency(ref, depends))
> +    if not args.no_vuln:
> +        cyclonedx_dict["vulnerabilities"] = cyclonedx_vulnerabilities(show_info_dict)
>  
>      args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
>      args.out_file.write('\n')
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
