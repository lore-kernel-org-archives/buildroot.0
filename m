Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B951BD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C294047E;
	Sun, 28 Dec 2025 21:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWYmv602uvJP; Sun, 28 Dec 2025 21:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A4E404B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766957386;
	bh=QTCu9IGSUbsXmxjz/AzvIeL7ClgPeBBsI5Saa6TiPyM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Jkbak9kj1M26p1EidBlkNAY0CN9Uo93XHgCAPdotdbKwEUrKrcbzxIX+KvREZ+wfk
	 Yt410vssbGf5JfRc1/B7S/CoXsq88+KEnZz9Ok5BNYxT6Q4t24/0zdNTlvb3z86IZY
	 oHGsryEmfDep/ygpChp5bMEVPnN8c4PlEMpqjEdSUDMjDlOeEAdJ7ivv8Mvj2+PhyD
	 P9ARMPBzVp+Y52guVJdpbqeM76QT4+QQVVO6G8fpTd8SgssT0h8MUO9orwou7iV3Pr
	 KGe9Y2jeST49ML8U7YDnR4YIzqZBG72gGkKpISlYyvcJt/J42L27gHDFKVxG1H5cGx
	 72LktyVAlqDdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A4E404B0;
	Sun, 28 Dec 2025 21:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8BD11E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9A7960A78
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHEUUE6-1qLj for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4FB0608FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FB0608FA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4FB0608FA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:29:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso37345465e9.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766957381; x=1767562181;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZIytZSUV+bb/difiK3WHA9Q4o40bIHfPdhlfPjSRRU=;
 b=cJOFh+eTQRTljO991bCeQjulCz3R4G7JKtq+BiOKoHaorpU1TKwwYRcojCkwU0CGEi
 viG9r6KQj1bpf0h7JrSz2hmndWDsKD6SDwOZQJiYamN2j/jWVN6a8sUErQ/qEEtcr8Ow
 TezP2KnUfsjWKeSLAvzRi5pV/45DsaY645dQXETWIs3eSGnDqEWH1pwpOAAbndAXHYpg
 m6kYs6aOmem8qJj/LwSwGCOR6BXf9uGow7q4obqJQZ1ldvJpnVM4nvNcuN03qJuUP8JG
 sM0TX8foj2tWg96VmEZrBeYlAe9lfizkPbkQAGpk5EhL8rwnK7kI6D8pf8WK7SzIvfC9
 z/iw==
X-Gm-Message-State: AOJu0YxOb+ccMM525OzBVMYBAc2mdlZuc72eo4Sbs1xU1OpVfSmj6yYP
 Y349FYSaKzD7239D4hhnvI0k0slIXkQx3CboS0h/rdPoYHQvUTPJ/gMoFvCyqpms+wAPtXtvsuc
 IhIixF3U=
X-Gm-Gg: AY/fxX5RV7ExqF2rweotwwfi9tWQ7w6DAfZ5Vm5Wew201Yled6vNyGhrZGsmr8GJdYr
 OwBUys3/xhqzCoUjLXukcpi08EvtihRc0Z1wwJ+polK8uTeOMpa1qidMITiFxgwEfRlGCCJd4JC
 KpBsM6ec2e8uLV85FvmyYIyxikkJPDdCC6WZBeetnLwYkYOHpa++EqCPBboXhgcA6ihXMUsOl7b
 HgkRLkREttjZiSIijTsWSTZ32Qs4Ef4EjcJDk+RFlxlrXEh7rf9kCaXZdJ3JpFQINu5ddy+vFZ9
 kdUxNSN6TJWLgePZzjrD/FH9ko40JBTXWGulrXx8Zf9SaXdiJgo2zOWPRMJjZP+TvDfBZ1PssGQ
 9CWPw1yZgHa0vJZQpnAfGx/cs6P7iRbb3LHThZXQhSDGyvRxm3NbIktH+lPVWjfY+d0G3uyLqmR
 2UzU/jvDVw0Iiz4cCiEAeTWbOdzpVSXzpQNWiQWxztrdUwTapmWbXiDsFm6kMYvXE6EpN6pTfgN
 PaeIKEmMtTZz1byYMHIKAkWAa9VYDGijoJwEGIyjD9vt5uk4rdJ
X-Google-Smtp-Source: AGHT+IH8+xJ9UTKcnEbOHnR4yuCVpVq/IibfAvdNBMdTrpb5PZAaBIPnx0kL8z4Ev90vpep8mVQFGQ==
X-Received: by 2002:a05:600c:4f4f:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-47d1955187fmr417099315e9.13.1766957379932; 
 Sun, 28 Dec 2025 13:29:39 -0800 (PST)
Received: from ?IPV6:2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3?
 (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab257asm59280768f8f.38.2025.12.28.13.29.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Dec 2025 13:29:39 -0800 (PST)
Message-ID: <0cfe302d-c663-4be4-9108-e543ed5a10a9@mind.be>
Date: Sun, 28 Dec 2025 22:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251228185637.58072-1-thomas.perale@mind.be>
 <20251228185637.58072-3-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20251228185637.58072-3-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766957381; x=1767562181; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZIytZSUV+bb/difiK3WHA9Q4o40bIHfPdhlfPjSRRU=;
 b=OEU2PJ6FDxIY3wg2s6eV1XvqADvA776oyi87O6gIxWcE+SH2YeXb3/64F4mEzWGDqo
 y+3sBVfgQUswVNERHBSzoqyDSXQrMtxJXFuO7S8lXt/c08xrbF3UPSo6cpM2wdih13+C
 fJP6kbHcdM/AfetJadt0K60GUYe3dgr6k5d4KJPWW3x3hz8ukTzT0DETVQt3qeK0MMll
 OcmcuQZb1PpckOJWRm9YpTbu9V9f1vPe/oH9rMb/pXMKI3pUq7enrGoaTWexNvhaIqJT
 IZxxhIu24J2osojLewGmpIYb37s1KoHz5ovBBJf10JFtdxd/GavytQUWGL7KicS+BK1Z
 rj5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OEU2PJ6F
Subject: Re: [Buildroot] [PATCH 03/10] package/mupdf: remove stale
 IGNORE_CVES
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This one turned out to be needed because the CVE still targets this 
mupdf version but the comment will need an update.

On 12/28/25 7:56 PM, Thomas Perale wrote:
> The fixes for the CVE-2024-24258 & CVE-2024-24259 were introduced in [1]
> and targeted the package libfreeglut.
>
> The patches that fixed CVE-2024-24258 & CVE-2024-24259 in libfreeglut
> were removed in Buildroot commit [2]. With this bump the IGNORE_CVES
> entries for mupdf were not removed.
>
> [1] 0f4fef076f package/libfreeglut: add upstream security fix for CVE-2024-2425{8, 9}
> [2] b1c77090ef package/libfreeglut: bump version to 3.6.0
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   package/mupdf/mupdf.mk | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 6b666033eb..9eecb84232 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -21,12 +21,6 @@ MUPDF_DEPENDENCIES = \
>   	lcms2 openjpeg \
>   	zlib
>   
> -# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
> -# Fix is in libfreeglut, but CVE applied to mupdf.
> -MUPDF_IGNORE_CVES = \
> -	CVE-2024-24258 \
> -	CVE-2024-24259
> -
>   # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
>   # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
>   MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
