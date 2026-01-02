Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC314FA3752
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F3460DC2;
	Fri,  2 Jan 2026 15:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFaLzg39GjUM; Fri,  2 Jan 2026 15:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0009460BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368927;
	bh=eaU1YF4YHUyYzSe3JpIpxA47dV4iyysROhZtdx5ICs8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bmhiJsnHtwIqNuCsZr1lah6CDYQbMf0kGaby+efSuTOExFgQC7Teh9BejZoQfxI54
	 b003PWTT5Hky5EjBqKkmC7E7J5xPveD/nRBVno0zGp5IwSZnGh5NstB9xAYrzDtF8y
	 HtJBsYBEaQ7qGIjgKaq11nDaFqM71S+D8LyanI351RBzslVj2EXErGFML0mJtWXQJ7
	 aYLOpe9Xl3XQ47h4xpQUM0JE0pg6xqPkmqJWgoa8kQM33UVBS8oIQcUj0SCtmtSZ3t
	 cQhuLa0peEb3hDjg8jnWObUtxBUV08cQdvb96VGZ+TR0NTwNpdTM7PYcu6/dHLcN5I
	 Hay1r6MhC4N2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0009460BF7;
	Fri,  2 Jan 2026 15:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAE70351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78BC406E0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvpZ6GAuGLwe for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDEA8406B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDEA8406B3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDEA8406B3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:48:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso558625e9.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767368921; x=1767973721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=73QVji0tTwRqzfwpzXUxSV+QGSmjgjC0v8PYboP9eV8=;
 b=pAj4xRyVWlxw1s60UUG059PPtzMbBCJbXlNyQwv/yZVjloqgQSGauJgNfp26JqcQVq
 Bv196XoYKevWLs2hxUwCjiWz2EjLZx8ZJ/xzzT6uEG3ta70zfC6RBqsHOTytt41BuTDC
 YgEYy8e9WU/uYeK2/FONK5mz4scTvxpVWK0PtgzMgS3bwlBQ3t0sz0Kop8dxcTV0NdEQ
 aAo/tZlsXnv9Leusx1MZ3ieMJQBTA8MWSlKj7todV+4tiGnl1BP/J5YojufkIKUpbSRo
 CsvxH/CQWmpoqU8+DrIUIZfuPlPmV/EkZ8OgCxZuRT9Qqx6JIqzMbGH8ppzcIrfJF2Fa
 rIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3UiKH4xWoRNMO9sbLX9qM6ie+03W9/XQrb54lVSplzXfqjCK+vqJUKBMLaLOldeP324xoMuOppBk=@buildroot.org
X-Gm-Message-State: AOJu0YwWzpQU6wAkUHZpwWldp/Q/DiYrbsZWN0iOK5z0WLvzbXWTn+BW
 SNnObCsZJXnX4OZXatXaGZ/H++BfhqXTldT4PoVFizSVL1l7hW9CveutTSIMH+2b7SXEB7oWcP0
 jZYDHGmA=
X-Gm-Gg: AY/fxX4eFZUpb3SduKHAxx6yQBXLzw5tuYf0TnD4OHOnLULNf96bj3U3n/C8gJdoepN
 scjfCFKWpoLK4UfQMhD46I3rjkiTxrP+Evh1iRBEGkDh2zhw977jVp114qIlbyqplJkSN6XoOKm
 8bSdTNtQAYa15juUW+5DhCESd7P3fGl7gnXQ3StOdy+CzMbkqGssQ+GCrfdOjcXCEf3zTAxSKKW
 4Yb/jkqFZcf6gDB0rmqVBmx5EPtEaDyzNWy8bmL57D6zCLAHVl/SsX16cpv67mb73SzyHsYiEN1
 Pq/OHBaXLnrIQZrH06L5EiuNkJbI3zd+5uLz53gWbJDX6qw/p1YRe8fLUqtd10e9HCiBlDvgy3E
 7jLVE/BZ9iy1nPeyPuLRGAnPvWbF1nC328k15O32URf8vgePVb3kz1njI6YyqvNhNhh96LW5K6Q
 4zQjv2uCaVqJNIftehFjDEgtwGAYAHV7KwpaJi9k73XNEtzA==
X-Google-Smtp-Source: AGHT+IG4KuEHESDWB+SOp/iArgU3hKmE1IyRZK22p0F225OlzHjYVFm+nTWMVPMfLG6JEGbzhi3OgA==
X-Received: by 2002:a05:600c:848d:b0:471:665:e688 with SMTP id
 5b1f17b1804b1-47d6ba8f45fmr3239755e9.17.1767368921560; 
 Fri, 02 Jan 2026 07:48:41 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193621c8sm745934945e9.7.2026.01.02.07.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:48:41 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:48:40 +0100
Message-ID: <20260102154840.708055-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767368921; x=1767973721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73QVji0tTwRqzfwpzXUxSV+QGSmjgjC0v8PYboP9eV8=;
 b=CtGPO+NOVU6QJ0KbZD6tzwmYdLH/ZS4vYb2Ym6zxtePvAQkTi+EhWeErfsFdy211Pc
 NB4n8xGeSqKZP2goHGB1jG6b/7WpW2oB6YiJc8G0zvo+qnTWYpo9Xd10MZ9vTrIukECj
 StvPJy6TnMKzeoBL2rYgknoYqPujwPFh7hWXVqUehv/qTqyJcI/RsmCnEW1yiq24G+KT
 0MBQ5KXGtv4YRvX0zcDh1h+vvIRfjA5p++nOFc0Bt1M4+mJHssqTeMVQJ6en4LFLWrK6
 9D1aD1jUtxs3N8xm8cZEvmcSH/mecbSyqO7mjoRrK3Xl8AatE3pv+JSmHEULO59t6pMv
 v04g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CtGPO+NO
Subject: Re: [Buildroot] [PATCH 1/5] utils/generate-cyclonedx: update
 package filtering for SBOM generation
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
> - Filter packages to include only those with external download sources (i.e., not bundled within Buildroot).
> - Remove virtual package handling from dependency analysis.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Hi Fabien,

Thanks for your submissions.

Regarding this change could you be more specific in the commit message on why
this is needed. What are the packages that aren't in the final SBOM when
applying this change and why we don't want them in the final SBOM ?

I think you want to remove the 'skeleton' packages from the final SBOM right ?

You can provide a analysis over the entire Buildroot packages by changing a
single line in `Makefile`:

```
diff --git a/Makefile b/Makefile
index d2257ed3a3..0735f39d68 100644
--- a/Makefile
+++ b/Makefile
@@ -920,7 +920,7 @@ show-info:
 	@:
 	$(info $(call clean-json, \
 			{ $(foreach p, \
-				$(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
+				$(sort $(foreach i,$(PACKAGES_ALL) $(TARGETS_ROOTFS), \
 						$(i) \
 						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
 					) \
```

Regards,
PERALE Thomas

> ---
>  utils/generate-cyclonedx | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index a103b7b707..29c73f3616 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -280,7 +280,7 @@ def cyclonedx_component(name, comp):
>          **({
>              "version": comp["version"],
>              **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
> -        } if not comp["virtual"] else {}),
> +        } if "version" in comp else {}),
>          **({
>              "cpe": comp["cpe-id"],
>          } if "cpe-id" in comp else {}),
> @@ -337,12 +337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>  
>  
> -def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
> +def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
>      """Parse dependencies from the show-info output. This function will
>      recursively collect all dependencies, and return a list where each dependency
>      is stated at most once.
> -    The dependency on virtual package will collect the final dependency without
> -    including the virtual one.
>  
>      Args:
>          ref (str): The identifier of the package for which the dependencies have
> @@ -359,9 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
>      """
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
>          if dep not in deps:
> -            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
> -                deps.append(dep)
> -            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
> +            deps.append(dep)
> +            br2_parse_deps_recursively(dep, show_info_dict, deps)
>  
>      return deps
>  
> @@ -376,8 +373,6 @@ def main():
>                          default=(None if sys.stdin.isatty() else sys.stdin))
>      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                          default=sys.stdout)
> -    parser.add_argument("--virtual", default=False, action='store_true',
> -                        help="This option includes virtual packages to the CycloneDX output")
>      parser.add_argument("--project-name", type=str, default="buildroot",
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> @@ -391,10 +386,10 @@ def main():
>  
>      show_info_dict = json.load(args.in_file)
>  
> -    # Remove rootfs and virtual packages if not explicitly included
> -    # from the cli arguments
> +    # Keep only packages with at least one download source defined
> +    # (packages with _SITE variable in Buildroot makefile).
>      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> -                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
> +                                if (len(v.get('downloads', [])) > 0)}
>  
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
> @@ -429,10 +424,10 @@ def main():
>          ],
>          "dependencies": [
>              cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
> -            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
> +            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, filtered_show_info_dict))
>                for ref in filtered_show_info_dict],
>          ],
> -        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
> +        "vulnerabilities": cyclonedx_vulnerabilities(filtered_show_info_dict),
>      }
>  
>      args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
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
