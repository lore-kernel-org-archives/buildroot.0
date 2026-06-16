Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02F7CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 17:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B1D615FF;
	Tue, 16 Jun 2026 17:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIa22CxN-66o; Tue, 16 Jun 2026 17:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C97461672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781629776;
	bh=4INsp39m3qoY60Lhuc4YLuNCTM/R49xbRZTa4XkcGIM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gGve83mamSJOEU5k2HorL+2vWpAmfe+r8I/RMl/z+V+bppBsmjIiPBfXrPBg1oFRt
	 xYrWbpvziKeRz8tDpG1+qEh9gOMUbN/fGlg5BennwooM4tHKrL+XIsBzltxvXXX9nE
	 fR03w/1noUVJl4Ijjz4DpDYK4AYecuWqvMEy/5eSy0/Dd86dEnYclZhq2Io14SBnrE
	 BtccTIkabZeidEk/fmzpEpT6jSkjvUBCpCRT2aA+amWr0e1dUqaeFi6eYwLzXG+l4A
	 LarVjLfWmUMhAmqLEmnd/toffdf2QyqRKNpBgCZFYQ/EJqcJudI61nVC/FWucNIUyZ
	 BR3mAgWmSQojQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C97461672;
	Tue, 16 Jun 2026 17:09:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 580DD169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AD5240210
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxP_Kge2fstV for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 17:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21E124015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21E124015A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21E124015A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:09:33 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 15D622C89186;
 Tue, 16 Jun 2026 19:09:31 +0200 (CEST)
Message-ID: <dbd17e1e-bcf4-45ea-9e8e-5b9032f902b2@bubu1.eu>
Date: Tue, 16 Jun 2026 19:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260616013113.3899641-1-james.hilliard1@gmail.com>
 <20260616013113.3899641-2-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260616013113.3899641-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781629771; bh=qarjrKefa59d4TclMb29LDTfKTtubMgzctZTP5EVLl0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eNjWibCH3THQHD21bxeseIDLdpDsnIUnK8KTA7jSy5P+dWgJRtYo5RO0Mbr7ivsDQ
 VgY7G/gsvnnHZWYxyDaVGC1/5EDzFAtwvfGrEFvrtlzIwEoHEL+Zv88Xe08Feewl/C
 sVSjRoxmMCsHOFXMMKy5g2f768LocS2cFUGPKfwydSoEiWkkVvEYEHJT+xZluiwWZY
 85BVwFG/TtsvVYsDSw1gkHwy6mW6ifyEJniaVKTue3s0W9tATyGWgenI1OeVJaNqkQ
 FWWCxQSZRzW0AXEy+1f7TtEViTo6EHmKPFgCOpHXenhb5Ol74ujD3fr5w83ixLZzT8
 e1T4kteiScjdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=eNjWibCH
Subject: Re: [Buildroot] [PATCH 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,
thanks for this series. A few comments below.

On 6/16/26 03:31, James Hilliard wrote:
> Python packages downloaded from PyPI currently store the complete
> files.pythonhosted.org package path in their .mk file. That path is
> hash-based, so it changes for every version bump and adds churn to
> updates and backports.
> 
> When a Python package does not define _SITE, look for a blake2b-256
> entry matching its source archive in the package .hash file and derive
> the files.pythonhosted.org directory from that digest before the generic
> package infrastructure validates _SITE.

What do you think about going one step further and also calculating the 
SOURCE variable automatically if not defined?

The luarocks infrastructure has FOO_NAME_UPSTREAM for this, which is 
used to automatically calculate the FOO_SOURCE variable, for pypi it 
would be $(FOO_NAME_UPSTREAM)-$(FOO_VERSION).tar.gz if not overwritten, 
I think?)

And then FOO_NAME_UPSTREAM can also be set to package name minus the 
python prefix, unless set explicitly? We only have a handful of packages 
that diverge from this pattern, mainly if they are called 
python-something upstream or if we packages them as a generic tool 
instead of a python package (i.e. scons). There's also (I think) two 
packages which got renamed upstream and IMO should just be renamed in 
buildroot as well at some point. But anyway, this will cover like 98& of 
our python packages, so I think it's worth having and documenting this 
as a default?

> 
> This keeps the per-version digest in the .hash file and avoids carrying
> the same hash information as part of the package site URL. Update
> scanpypi to omit the generated _SITE assignment so newly generated PyPI
> packages can use the resolver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   docs/manual/adding-packages-python.adoc |  5 +++++
>   package/pkg-python.mk                   | 10 ++++++++++
>   utils/scanpypi                          |  9 ---------
>   3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
> index d6bae299a0..a66af1e7e2 100644
> --- a/docs/manual/adding-packages-python.adoc
> +++ b/docs/manual/adding-packages-python.adoc
> @@ -82,6 +82,11 @@ All the package metadata information variables that exist in the
>   xref:generic-package-reference[generic package infrastructure] also
>   exist in the Python infrastructure.
>   
> +For Python packages downloaded from PyPI, the +PYTHON_FOO_SITE+ variable
> +can be omitted when the package +.hash+ file contains a +blake2b-256+
> +hash for the source archive. Buildroot derives the hash-based
> +files.pythonhosted.org URL from that hash.
> +
>   Note that:
>   
>    * It is not necessary to add +python+ or +host-python+ in the
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 32ace4aac1..0ba93d8fae 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -454,6 +454,16 @@ endif
>   
>   endif # host / target
>   
> +ifndef $(2)_SITE
> + ifndef $(3)_SITE

The usual pattern here is doing:

ifndef $(2)_SITE
  ifdef $(3)_SITE
    $(2)_SITE = $$($(3)_SITE)
else
   [...]

Is there any reason to not follow this here?

> +  $(2)_SITE = $$(shell \
> +	awk -v filename="$$(notdir $$($(2)_SOURCE))" \
> +		'$$$$1 == "blake2b-256" && $$$$3 == filename { h = $$$$2; printf "https://files.pythonhosted.org/packages/%s/%s/%s", substr(h, 1, 2), substr(h, 3, 2), substr(h, 5); exit }' \

This is easier than what I came up with, nice. :)

> +		$$(wildcard $$($(2)_HASH_FILES)) \
> +		/dev/null)

Not a huge fan of passing /dev/null to awk here, can we add a condition 
instead that guards against there being no hash files and then errors out?

Relatedly, we also need to guard against no blake2b hash being in the 
hash file and thus no SITE being extracted (when none is defined 
manually. I think this should raise an explicit error as well.

 > [...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
