Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02225CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABC241224;
	Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtJpaxMaRWLv; Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01E3D41242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264286;
	bh=my/CRujaYsk35/BMyU3nbeB9ZKRizDyciqFMg/9lMfs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m/OLLDj9RWpAq//6MMPz7IC/Q8XQP1drqE5fjkhvmuH2CXn/ozQFKqBS20XYH6S2s
	 9I1xgbhWgHyKRDI1BfH2OcPtNKbyWFhXOFh4R8/FuTDXOO+DAsZYng3/XfSn1g1/ic
	 kjZLpYgfXxc1hTzc8cVmHoGAW84IEGTIxCyOsrJMYoZFprSDl8WvMZvgFMLXucebTW
	 SVNgd3xPcJSutNeMRiNNbh43DKGOf6RsCMRUTW0igdipjK6hhmul6geKK0HNqeu7fQ
	 BqpvOyDWSIaTy5F5NvvE/dR4Iz40L9kFEdcoD4LnST7KVu/GvBBwfy+ax8TvZAP+Ar
	 U+N4SwOAVKiJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E3D41242;
	Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84530237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7638A41228
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XG4kk3sE0Yau for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AEFD41226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AEFD41226
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AEFD41226
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so1234028f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264277; x=1781869077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=14RMcSNjGzR5ohiHgDIiVr/3WGrqIr4HhkuRWW6kh2Y=;
 b=rtezltoOJT5Lcj+uzXJbW/dNwE8ez95T30AxdTH09rsU02aJJes9J8c7kbgyYtlLK8
 QJpmcMbry2Fk+K2EthNqHMaMD0zOzTpCON1y0aSOHWh2zmEjjyHZG0c1cM60EDeJMjuP
 R1uGEBE8UyzprvLiODS/WmYCJXrKDUwOV4MHeDCYcPfO3Ft59q7qwYxXJgoNyJmeHcuQ
 p0/vPibV07dPpyl6KNpSnHlva3x/YIVFgevWf217i3e6Jux7/b1SuO+yiRgyqGyWwB5r
 sV8038OsQKQ9chRTO32GDzdvEIh0ujpB38eUErPE7RVTAU+2MSkiwphWz41DDykBhWpn
 XHtQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/T4kd/0mUZJ7fK196S+l1DzunisV3x2JipJadvlwAMYqL0PTwKdF3SM376gyyjwAW93eUIXWOcBq4=@buildroot.org
X-Gm-Message-State: AOJu0YyIUZkV7r97zd4rsxhrqeS8d2jk3d6fYuOXRDRgEuy3a/jTqz8i
 U7u1zb9ymBu8UWEhfKlSMJ8Fybs7v61OAbKxejNG5tS8AEYClCmvRzi07JHEOOIzXWjhjkwZ1Sm
 841s6
X-Gm-Gg: Acq92OGzKQjM4s/90zaArz5ZIWsIjOg5eSac+sTR2dM514Ou81H8choH20swHBI8if4
 LcDo4e92n6MuFy2k4yHRphiwrGTSSfw6B75yVs7lE2HjuvztSuiVZuaVkJNxLRXI58ICvmg970h
 KMOtmWEh/7ms4TW62tKos3CiDFI4AkEZKOT7bkRoqij0bFDmsyGMOjbs4V46OngfPmPc35frfO3
 Auva9dFUKdiByfFojw0AfqknW8jUbLg4yKRo2kj4VDGRNsaejdLbPqoMf/aFvVZX+liayamNbRx
 a00+OwMDYGkQmlczOvW7CyQHbMieXKoZU1isF2rA6taqJQojSxuoxL/WiEVH1H1jIpKFADv2bLC
 aQXbJxJuX9neQTUoa9p6HJBwNVseUpPHLDhZSE37KhWVahSCD6Kg825Dp+01w2DVHuVMtLVeVOw
 Si9QFNcnpeiBLICM4=
X-Received: by 2002:a05:6000:1acb:b0:460:156f:d15 with SMTP id
 ffacd0b85a97d-4606ce33aa8mr3403204f8f.19.1781264277441; 
 Fri, 12 Jun 2026 04:37:57 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm5086845f8f.28.2026.06.12.04.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:56 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:56 +0200
Message-ID: <20260612113756.252445-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531120522.2310476-1-titouan.christophe@mind.be>
References: <20260531120522.2310476-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264277; x=1781869077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14RMcSNjGzR5ohiHgDIiVr/3WGrqIr4HhkuRWW6kh2Y=;
 b=K7BWSnehY51f+loaGWoSAdn8EAt40uL6IiqLW961troh+DRh7YESROgUwQtoxVSzZ9
 Ye0NdglzW03zGiC4ESHKuH81KEJtTg8gTw9b+063a9vJc+5jzRWNcD65oHV9xM8t3nUA
 nt7jwQRosIfhqYLFRGGle89gnKlqFVVFTIj2DIYkucXgrK4GbLKNGIUaMkge7l8CavIn
 xwIsrVtVkraBpL4Z9V+4FWlm+jLRmUdsM6z79rKAekOOweMzsRVz8xxtxcCgvYirq9fj
 QBvmgUvLzQAVBFD24hgqeJQ08BStXeaLcsDt9vU/1KforaNaD9BHCjDrvfpEwbaUG6JV
 OpMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K7BWSneh
Subject: Re: [Buildroot] [PATCH v2] utils/bump-stable-kernel-versions:
 automatically commit result
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
> Since this script is often used to bump kernel versions in multiple
> Buildroot branches, it makes sense to simply commit changes directly
> rather than letting the developer do it by hand.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Changes v1->v2:
> - Open text editor when committing to allow the user to review changes
> - Avoid using echo -e
> ---
>  utils/bump-stable-kernel-versions | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 6303bf4010..9df2debd5f 100755
> --- a/utils/bump-stable-kernel-versions
> +++ b/utils/bump-stable-kernel-versions
> @@ -25,6 +25,7 @@ latest_version=$(sed -rn 's|^\tdefault "(.+)" if BR2_LINUX_KERNEL_LATEST_VERSION
>  latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
>  echo "${latest_version} -> ${latest_release_version}"
>  
> +updated_files_list=()
>  updated_releases_list=''
>  updated_versions='Update the latest kernel releases to:'
>  
> @@ -94,6 +95,7 @@ update_linux_hash() {
>  
>      # We were iterating over this file so we could not edit in-place.
>      mv "$HASHFILE.new" "$HASHFILE"
> +    updated_files_list+=("$HASHFILE")
>  }
>  
>  while IFS= read -r -d '' hashfile; do
> @@ -101,7 +103,12 @@ while IFS= read -r -d '' hashfile; do
>  done < <(find linux/ -name '*.hash' -type f -print0)
>  
>  if [ -n "${updated_releases_list}" ]; then
> -    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
> +    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
> +    git commit --verbose --edit --signoff --file=<( {
> +        echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
> +        echo
> +        echo "${updated_versions}"
> +    } )
>  else
>      echo '>>> Nothing happened.'
>  fi
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
