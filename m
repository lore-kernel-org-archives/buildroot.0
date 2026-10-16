Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F5ECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162F181544;
	Fri, 16 Oct 2026 15:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8GHBbwdEbVD; Fri, 16 Oct 2026 15:01:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 24FD98150B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162893;
	b=BGxEHAn3ltyyr07EslH1Ep+HBNYlGeSm+q1wiimddVdjrwsN5vfN8eN5ouhIYerROwIU
	 TnEgWf2gJeX4Db8pp3crCQUVyOHwCraNPa7RYRnCSPUBZx/w04Ypv75Ht3sQH3fPLBxSc
	 pNBdWW9MRyJqE1itWUwTsWKWIPxMZL8QLTmxf/eMw07m8w0YwwyTTGRZl8OrwWidgq+N/
	 VmJVjvIwWq5kqv9BVUB/y7cd1/qJnFTHYONPQSKL70fFtWjQg9Dixu7+QAqX79Dr1U2N9
	 3Ky7h76i0/4NpRVYLtLZvnYMiT8bLPvwYrLAUqP9W4WNG8q3V9oUdUvtK1T/snF+Sgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162893;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=haFuUytD0NPyeSPFTyxU+qGDsl3uD+182MQMidPcxsA=;
	b=kdiK3d1sWXBGEqVmK9nkmanrm7p45W9Of1L7QbD9nyJS1ZV9ysayZ5fVL4OmA/2wXwTg
	 4LiSAMOxAHDNkwpIe18AHKXcdqhNcgHQ0tgg3pWRsgk/aVntfSX3V7KA9GXtn7oH1R9zN
	 sKgH2ZKPngJI6/Nvk2NjVOGh+ByFE7VSV6AR459sb9PuFizMUALSfgU7yDMkrbK8xMFGu
	 C2jlso774Clbr6zV5R6xYpZFuwYbNIWGCV23jQVZsqT0ui9ICVxN7ejmgUspNXEpy6m55
	 rA8SZy995IqVGZAm1b4hAJr+piNOCo9G5Euzt5xaaTSbhiQoTTdRaEJdL/W0sP9Z5Rw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162893;
	bh=haFuUytD0NPyeSPFTyxU+qGDsl3uD+182MQMidPcxsA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eTfWZ6esMutQqKjTMxyEBvvUWg/flQnhHLTZCBehRmEVmG+gVE8b2W/4yxtAJofHc
	 xJdGvNxJvchcX6KbaDOGJUIWk6KTuaVUYCaZiDfEB0OcCkfejPfejJcZmW1f9GbRe1
	 bE/hsuIHLMssB9JkxMD+T/DvkaJaqy9Q8O1HYO+TIXuPe2EwLFmSOspigXaVIHRmDW
	 BjoKcEtWPYqC2AYiix6BpnyJGtT4aKbn/CWHE8RJVYdZKezbOqLoxDjjmsT6PETozf
	 zEczlZPR+YpfoKwdxXEr1TS6m8kikk9UMejOzYgzby6fmKd33LDodiXJ8eYe+UKzNZ
	 gtcSahzg3zojQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FD98150B;
	Fri, 16 Oct 2026 15:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE3FC7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E05748150B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2c4SfguMv7h for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B8DC2814C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162891;
 b=LXvM863aSKajpevrUuCucIqLGd4c9nPez2OiA38n8uNHSR4AgzQ4ybDDUt1ACn8v8K8b
 8LNpAy41HMsSlwqd+HvlVc7hwhTfTqGA+XTtPUYaisWgfCP2cYQf4jtIVHMD6EoNtPeoH
 qhGvVsOXs6UOalHBCURcEc1OfapD+xCCuGtLx+WFhMpBGkvddSY7SE1Teg6la4vHRkxsv
 mJ0O52JOHsxSjTCQQaz6MUQ1PfTCCRaUGfZexkpa7klMxDLB2PMx9EH908UQSEQhiVY9e
 MO2fFaKxLDqwdcRBHHJFUr1wBy966sH/GRbFWxOswDZx+OYEWiImxPvy4/vApUXEDFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162891;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PbTe3SnUpjnjWRo7gLffUG8faj/5fPuUs53F0wxIDIs=;
 b=aKi2VLQ/dus66M21pwugS1iUNWGa748oZ+U3289Ctt1g7x+ijYC50icBrPaGMZnKnBih
 Qc14nrDgLoqbcvQu0shlTH+i8OM/BiGFpAXdVWsWNwPrB8AxQzxPOEHAAj3nVV+nJH7dw
 1pg9Kgl16f3cjNuZRK/UOkvBM198GhXJLbpAXA7zE9fCCWqNAW4jv1eeCFFFLrtbi6m/t
 kpPPg5rTdvG3fnrQukDVMVzpzrb4ugp0DbS+60IMqLyeLziluKhsQWxWQ9M5/8McJUU10
 sdcZOCWU8yDM+uXV8jcwY3ns1raWj8uwtkSRwXbxHMzIeNv97R3MF5+gPbjCKSjkumA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Vd755QIB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8DC2814C4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e04773687so51841f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162888; x=1792767688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PbTe3SnUpjnjWRo7gLffUG8faj/5fPuUs53F0wxIDIs=;
 b=GGN2Hs/YWXvmhvdQaHi4rn5WvRZ0Hu7q2mf4voVI37ZMDXr16eY0Wnt5+QDdUCyD7H
 gs9Zsov7hBsV+vJ/J9THk2aOd2/Gj663XugYRp+G3SDBh2yelM4Dj/bFrN0yUf3njQ3D
 O3d3AlfT76HJ+s46Edk3FXInGOR6xSHWhXgXFJ+7vuAAMdzm5Z3DS8jRIF+fq2Iw+iyv
 1Zenz+FnMklBO8sHWB9kwjaXavdZUoU+AKRplRC+vDQ2OzVTUUhgBBNHNT6RXWozyTNg
 KiOTGDwlvpsUCLipGFUk1+LWlD5ReLQ23Tv45ZCzDjg7xvtl+gxGXwmrbPEsKOyE2Vjk
 l37g==
X-Gm-Message-State: AFq9FYLw2TECGDURQHJ6aZ0qx6Ple2a2fDPS+bCY4rSO9efAx8v7ba33
 0ieHAEnRWjOW6aNYbCRjsRMIpw8szVcuEwpl1ckOxGHZmf8uMuW7Eqsvsl1dZLUohJ656FM1JHv
 1gJI9X1g=
X-Gm-Gg: AYBFou0MCJ5jPf6T2KsgHAd3yo1K8v7udqVCENhH+yWlgfg0ohvBomdWehGOMclfabM
 EHpMsrUb7D1c4FCetcZQ+pY3wLb7p5CELbJrzcuRmYFfObxUJNBA6/DYjQAshqyQANE7iV6SIqs
 wZAlGrViM6JvcjT/EJz4I0cOFPahOILpfeWR6LOo2FbpKZ/JUd/bAe0GPCwNZ8EmwfjT2xFV2Cf
 ev+9yyz1r+mz0PmeGY1jkA3yC419fz2vhTTbTxEja6Ku1i45aN7DZdI3U19HlDUu/lPBDUR9MlN
 Ul9103pZSngQDjMPipkvZFYhkSf/pTcfG6amWT1er+Qlo2+ehjEcuuEj0Xlgd3TyXWLMfPWoNvo
 lFy8Rttahs/lA5S3xd8z4TR/WuP7m8lwT2oRsFLcjpCyI7lLip+I3PnSS4qEk77kjZFFY4J1P3v
 MH7cVyjOs+y04Bx8szto4CwOYl7QazH3w9iDX+a0XT36X1j5IbyM6yC5TLHBVO61219osr5NGt5
 rxkqVDKss019+CaNC05b1i9x2RpNUWssv1ue9ndIw==
X-Received: by 2002:a5d:5d03:0:b0:485:8cc8:1f5f with SMTP id
 ffacd0b85a97d-48dbace3a64mr42114263f8f.42.1792162888315; 
 Fri, 16 Oct 2026 08:01:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ecac3sm6062417f8f.27.2026.10.16.08.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:26 -0700 (PDT)
To: buildroot@buildroot.org,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:23 +0200
Message-ID: <20261016150125.60057-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5] icu: fix static linking by adding
 -lstdc++ to pkg-config
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
> The ICU library requires C++ standard library when linking statically.
> Without this, applications using pkg-config --libs --static icu-uc
> will fail to link with undefined reference errors to C++ symbols.
> 
> This patch extends the existing fix for static linking to also add
> -lstdc++ to the Libs field in the pkg-config file when building
> in static-only mode (ENABLE_SHARED is not set).
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Acked-by: Andreas Ziegler <br025@umbiko.net>

Applied to 2026.08.x. Thanks

> ---
>  .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> index 36a3d1f696..d74aca8088 100644
> --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> @@ -13,14 +13,26 @@ http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
>  
>  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>  ---
> - source/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +This patch currently addresses linking against stdc++ for shared-library
> +builds. Add -lstdc++ to the static build flags also, to fix 'undefined
> +reference' errors when linking programs like xmlcatalog (libxml2)
> +with musl static toolchains.
> +
> +Upstream: Inactive-Upstream [Buildroot specific]
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + source/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
>  --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
>  +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
> -@@ -279,7 +279,7 @@
> - 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
> +@@ -276,10 +276,10 @@
> + 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
> + 	@echo "Name: $(PACKAGE)-uc" >> $@
> + ifeq ($(ENABLE_SHARED),)
> +-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
> ++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
>   else
>   	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
>  -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
