Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37ABC54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF2D81E12;
	Wed, 20 Mar 2024 20:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwFB9ly97xSO; Wed, 20 Mar 2024 20:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225828135C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225828135C;
	Wed, 20 Mar 2024 20:24:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA171BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 033428130A
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1B6X8awi6l5d for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96B48812E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B48812E7
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96B48812E7
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:24:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso3662571fa.1
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 13:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710966240; x=1711571040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CiDB9jXBYVasESZL138BMWH0ha3rGbvq63az3xAVXEw=;
 b=O2MBQi0+BdRtASwa9ELkQGYvLOqclgbm1TR6bIzc1usptZrRHre9F3oxHQ5xGOmCXz
 v7s+vSWg86etplPZMUwwz7GYZaMq+5MGqZ9dAiT+FSKb9BhVHLI2RXxl4W+KWE1LOSyB
 2cM30HTEiDMhGFZkrMp+mnUUj5cwPl+gtRB3CAN+GhkKjzs4vnbgAUa8+Nn+OSquGnCi
 LLFy1fADotmDJWG6tQ2pU7jdBUpQar5v6BpyScA2FGyWA/5HImuB4rCB7HB38hBecd7v
 7F5qQKQWbgg1fOrdrGyvTwv4RCNdtopTzL/WrBVpc+6wkBxcOGixwpUJJKGveTwDC7LB
 J8Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyR0ox/kAdJ8c8Ix1SxLsy4CQMMXGPPtvSFjrIDwTwyOE3/VUg061w7JJIfu0yeRcaFlPUrh1LqfWnuZK3FftLnPMP/R7zPg==
X-Gm-Message-State: AOJu0YxjLp6YF+5PpFifkJm8iSBG9wHw81+J0qt5ZcQ8XrZr1af25KVA
 It71FF+R7ije8A0xVQqUY3Dti0q4RYjUKhT09ZKWZH+c9Y8V6bVBuEUq1EduxSI=
X-Google-Smtp-Source: AGHT+IFexe4+nmIVmLQ9pP3TA/cYjWzVnrBePVMte64ek9j13pFX9JPtLhvBul3EHCFnUNEhqoKlsA==
X-Received: by 2002:a2e:8785:0:b0:2d4:986b:b58b with SMTP id
 n5-20020a2e8785000000b002d4986bb58bmr42821lji.35.1710966239913; 
 Wed, 20 Mar 2024 13:23:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c359600b004140d326399sm779246wmq.1.2024.03.20.13.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:23:59 -0700 (PDT)
Message-ID: <74b240b3-15e6-4387-b261-b48da41c8b71@mind.be>
Date: Wed, 20 Mar 2024 21:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240318220420.356343-1-yann.morin.1998@free.fr>
In-Reply-To: <20240318220420.356343-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710966240; x=1711571040; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CiDB9jXBYVasESZL138BMWH0ha3rGbvq63az3xAVXEw=;
 b=di+67xq/QGVn48ZAJIQ6AncAxGxiuxl0PzZr3tispY6DdY08UdOGOsETxS3hPV7oyY
 XVeUjIMk0z3bXO5SXX214xoSSxw+0XL1HsnTepAsmGckHgn2k60QfOvK2B0bx0p5G0sk
 oltnBFp+isY8qrfE81w0/opyst3vlZ+Gbjgq+rBpf0X7NqyTP1iffYGHAscCQWWwqUNC
 StAcm7DQRzD4MEChrTxbKwEsxx60G9dmmdZkKZzNUBL922ePg8IHrRvZulY4XJvAa8F6
 pYBFs7YIppZvdPrMzP6vOHo2HbDrhI7VNXHV+iV4UVsGDNy0ciX4MMHJBqi0Wf9qo+e2
 vpOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=di+67xq/
Subject: Re: [Buildroot] [PATCH] support/scripts: use FKIE git tree
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Yann,

  Since this is quite urgent again due to pkg-stats being broken at the moment, 
I've applied to master (mostly) as is, but I have a bunch of ideas for 
improvements, below.

On 18/03/2024 23:04, Yann E. MORIN wrote:
> Currently, we grab the per-year CVE feeds, in two passes: first, we grab
> the meta files, and check whether something has changed since last we
> downloaded it; second, we download the feed proper, unless the meta file
> has not changed, in which case we use the locally cached feed.
> 
> However, it has appeared that the FKIE releases no longer provide the
> meta files, which means that (once again), our daily reports are broken.
> 
> The obvious fix would be to drop the use of the meta file, and always
> and unconditionally download the feeds. That's relatively trivial to do,
> but he feds are relatively big (even as xz-xompressed).
> 
> However, the CVE database from FKIE is available as a git tree. Git is
> pretty good as only sending delta when updating a local copy. The git
> tree, however, contains each CVE as individual files, so it is
> relatively easier to scan and parse.
> 
> Switch to using a local git clone.
> 
> Slightly surprisingly (but not so much either), parsing the CVE files is
> much faster when using the git working copy, than it is when parsing the
> per-year feeds: indeed, the per-year feeds are xz-compressed, and even
> if python is slow-ish to scan a directory and opening files therein, it
> is still much faster than to decompress xz files. The timing delta [0]
> is ~100s before and ~10s now, about a ten time improvement, over the
> whole package set.
> 
> The drawback, however, is that the git tree is much bigger on-disk, from
> ~55MiB for the per-year compressed feeds, to 2.1GiB for the git tree
> (~366MiB) and a working copy (~1.8GiB)... Given very few people are
> going to use that, that's considered acceptable...

  We could "solve" that by not keeping a working tree at all, just a bare 
repository, and use `git ls-tree --name-only -r origin/main` and `git cat-file` 
to extract the JSON files. It's probably much more efficient than os.walk as 
well (though os.walk isn't much of a bottleneck, I guess).


> Eventually, with a bit of hacking [1], the two pkg-stats, before and
> after this change, yield the same data (except for the date and commit
> hash).
> 
> [0] hacking support/scripts/pkg-stats to display the time before/after
> the CVE scan, and hacking support/scripts/cve.py to do no download so
> that only the CVE scan happens (and also because the meta files are no
> longer available).
> 
> [1] sorting the CVE lists in json, sorting the json keys, and using the
> commit from the FKIE git tree that was used for the current per-year
> feeds.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   support/scripts/cve.py | 76 ++++++++++++++++--------------------------
>   1 file changed, 29 insertions(+), 47 deletions(-)
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index 7167ecbc6a..88c7fde577 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -19,10 +19,9 @@
>   
>   import datetime
>   import os
> -import requests  # URL checking
>   import distutils.version
> -import lzma
> -import time
> +import json
> +import subprocess
>   import sys
>   import operator
>   
> @@ -41,7 +40,7 @@ except ImportError:
>   sys.path.append('utils/')
>   
>   NVD_START_YEAR = 1999
> -NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
> +NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/"
>   
>   ops = {
>       '>=': operator.ge,
> @@ -81,41 +80,24 @@ class CVE:
>           self.nvd_cve = nvd_cve
>   
>       @staticmethod
> -    def download_nvd_year(nvd_path, year):
> -        metaf = "CVE-%s.meta" % year
> -        path_metaf = os.path.join(nvd_path, metaf)
> -        jsonf_xz = "CVE-%s.json.xz" % year
> -        path_jsonf_xz = os.path.join(nvd_path, jsonf_xz)
> -
> -        # If the database file is less than a day old, we assume the NVD data
> -        # locally available is recent enough.
> -        if os.path.exists(path_jsonf_xz) and os.stat(path_jsonf_xz).st_mtime >= time.time() - 86400:
> -            return path_jsonf_xz
> -
> -        # If not, we download the meta file
> -        url = "%s/%s" % (NVD_BASE_URL, metaf)
> -        print("Getting %s" % url)
> -        page_meta = requests.get(url)
> -        page_meta.raise_for_status()
> -
> -        # If the meta file already existed, we compare the existing
> -        # one with the data newly downloaded. If they are different,
> -        # we need to re-download the database.
> -        # If the database does not exist locally, we need to redownload it in
> -        # any case.
> -        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_xz):
> -            meta_known = open(path_metaf, "r").read()
> -            if page_meta.text == meta_known:
> -                return path_jsonf_xz
> -
> -        # Grab the compressed JSON NVD, and write files to disk
> -        url = "%s/%s" % (NVD_BASE_URL, jsonf_xz)
> -        print("Getting %s" % url)
> -        page_json = requests.get(url)
> -        page_json.raise_for_status()
> -        open(path_jsonf_xz, "wb").write(page_json.content)
> -        open(path_metaf, "w").write(page_meta.text)
> -        return path_jsonf_xz
> +    def download_nvd(nvd_git_dir):
> +        print(f"Updating from {NVD_BASE_URL}")
> +        if os.path.exists(nvd_git_dir):

  It would be nice if we could automatically recover broken clones. I had hoped 
that we could reuse (part of) support/download/git...

> +            subprocess.check_call(
> +                ["git", "pull"],
> +                cwd=nvd_git_dir,
> +                stdout=subprocess.DEVNULL,
> +                stderr=subprocess.DEVNULL,
> +            )
> +        else:
> +            # Create the directory and its parents; git
> +            # happily clones into an empty directory.
> +            os.makedirs(nvd_git_dir)
> +            subprocess.check_call(
> +                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
> +                stdout=subprocess.DEVNULL,
> +                stderr=subprocess.DEVNULL,
> +            )
>   
>       @staticmethod
>       def sort_id(cve_ids):
> @@ -131,15 +113,15 @@ class CVE:
>           feeds since NVD_START_YEAR. If the files are missing or outdated in
>           nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
>           """
> +        nvd_git_dir = os.path.join(nvd_dir, "git")
> +        CVE.download_nvd(nvd_git_dir)
>           for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):

  There's no real need to keep this iteration over years, we can just os.walk 
from top-level (skipping the .git directory by deleting it from dirnames). But 
with git ls-tree it's even better of course.

> -            filename = CVE.download_nvd_year(nvd_dir, year)
> -            try:
> -                content = ijson.items(lzma.LZMAFile(filename), 'cve_items.item')

  Since ijson is no longer used, we don't need the complicated import any more. 
I removed it.


  Regards,
  Arnout

> -            except:  # noqa: E722
> -                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
> -                raise
> -            for cve in content:
> -                yield cls(cve)
> +            for dirpath, _, filenames in os.walk(os.path.join(nvd_git_dir, f"CVE-{year}")):
> +                for filename in filenames:
> +                    if filename[-5:] != ".json":
> +                        continue
> +                    with open(os.path.join(dirpath, filename), "rb") as f:
> +                        yield cls(json.load(f))
>   
>       def each_product(self):
>           """Iterate over each product section of this cve"""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
