Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3AAC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D526640942;
	Thu, 12 Jun 2025 19:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up0SvTZxgAjk; Thu, 12 Jun 2025 19:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE2440923
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE2440923;
	Thu, 12 Jun 2025 19:56:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E89AB1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE7E460DA5
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5emF6OPYzHj for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1BE060E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BE060E1A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1BE060E1A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC9581C00EF; Thu, 12 Jun 2025 21:56:49 +0200 (CEST)
Message-ID: <97c27f03-fbc0-49d6-9353-0c7049f0e41f@rnout.be>
Date: Thu, 12 Jun 2025 21:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20250526142413.29398-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250526142413.29398-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758209; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w6wJGO8bPuhV57tUIF6HX6P7Z5Rn5I9ukbE9B/Ccx+8=;
 b=kQwEq5ZfbMVCqLQbmPU1yhiimKgtRISV7jTOkBA035yFyRvRG7Yr9x5BP8+jw7LQ/TRuhP
 oUyBD4SakU0ArTjIc2ZHbZrln0N9NBnlO9eXQab9SJ4pjTas7bMXbmet6GQMfGnLyKjr9Y
 syqrMe26A7a8Xx+JWMykahQFJ2GhXLqmPS4gD3cftQ3djkgYMXgHRKyqbGm4765QUoZcuR
 Z1E6M25584oSK05qNuC+ZYYnK/rT/UXx+FYUF81nUl8GSZn5QYRdhrvneTrBMBpgGqP8qO
 Y/ngDHGaFGTsiDqmgtjm/MLXzHsb0HJS/vVfijcZnQir/SFfuO8V/JXEEbSjiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kQwEq5Zf
Subject: Re: [Buildroot] [PATCH] package/assimp: apply security patches for
 CVE-2025-3015, 3016
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/05/2025 16:24, Titouan Christophe via buildroot wrote:
> Fixes the following CVEs:
> - CVE-2025-3015: A vulnerability classified as critical has been found in
>                   Open Asset Import Library Assimp 5.4.3. This affects the
>                   function Assimp::ASEImporter::BuildUniqueRepresentation of
>                   the file code/AssetLib/ASE/ASELoader.cpp of the component
>                   ASE File Handler. The manipulation of the argument mIndices
>                   leads to out-of-bounds read. It is possible to initiate the
>                   attack remotely. The exploit has been disclosed to the
>                   public and may be used.
>      See: https://www.cve.org/CVERecord?id=CVE-2025-3015
> 
> - CVE-2025-3016: A vulnerability classified as problematic was found in
>                   Open Asset Import Library Assimp 5.4.3. This vulnerability
>                   affects the function Assimp::MDLImporter::ParseTextureColorData
>                   of the file code/AssetLib/MDL/MDLMaterialLoader.cpp of the
>                   component MDL File Handler. The manipulation of the argument
>                   mWidth/mHeight leads to resource consumption.
>                   The attack can be initiated remotely
>      See: https://www.cve.org/CVERecord?id=CVE-2025-3016
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ASE-fix-possible-out-of-bound-access.patch | 29 +++++++++++++
>   .../0004-MDL-limit-max-texture-sizes.patch    | 41 +++++++++++++++++++
>   package/assimp/assimp.mk                      |  6 +++
>   3 files changed, 76 insertions(+)
>   create mode 100644 package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
>   create mode 100644 package/assimp/0004-MDL-limit-max-texture-sizes.patch
> 
> diff --git a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
> new file mode 100644
> index 0000000000..427b7a4888
> --- /dev/null
> +++ b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
> @@ -0,0 +1,29 @@
> +From 65c95bf3207b81fe522811d45780d72ed41d9c1e Mon Sep 17 00:00:00 2001
> +From: Kim Kulling <kim.kulling@googlemail.com>
> +Date: Wed, 12 Mar 2025 20:17:38 +0100
> +Subject: [PATCH] ASE: Fix possible out of bound access.
> +
> +Upstream: https://github.com/assimp/assimp/pull/6045
> +
> +CVE: CVE-2025-3015
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + code/AssetLib/ASE/ASELoader.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/code/AssetLib/ASE/ASELoader.cpp b/code/AssetLib/ASE/ASELoader.cpp
> +index eb6b37dc9b..c63edcf6bf 100644
> +--- a/code/AssetLib/ASE/ASELoader.cpp
> ++++ b/code/AssetLib/ASE/ASELoader.cpp
> +@@ -731,6 +731,10 @@ void ASEImporter::BuildUniqueRepresentation(ASE::Mesh &mesh) {
> +     unsigned int iCurrent = 0, fi = 0;
> +     for (std::vector<ASE::Face>::iterator i = mesh.mFaces.begin(); i != mesh.mFaces.end(); ++i, ++fi) {
> +         for (unsigned int n = 0; n < 3; ++n, ++iCurrent) {
> ++            const uint32_t curIndex = (*i).mIndices[n];
> ++            if (curIndex >= mesh.mPositions.size()) {
> ++                throw DeadlyImportError("ASE: Invalid vertex index in face ", fi, ".");
> ++            }
> +             mPositions[iCurrent] = mesh.mPositions[(*i).mIndices[n]];
> +
> +             // add texture coordinates
> diff --git a/package/assimp/0004-MDL-limit-max-texture-sizes.patch b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
> new file mode 100644
> index 0000000000..ae7e54f35d
> --- /dev/null
> +++ b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
> @@ -0,0 +1,41 @@
> +From 5d2a7482312db2e866439a8c05a07ce1e718bed1 Mon Sep 17 00:00:00 2001
> +From: Kim Kulling <kimkulling@users.noreply.github.com>
> +Date: Wed, 12 Mar 2025 21:29:33 +0100
> +Subject: [PATCH] MDL: Limit max texture sizes
> +
> +- closes https://github.com/assimp/assimp/issues/6022
> +
> +Upstream: https://github.com/assimp/assimp/pull/6046
> +
> +CVE: CVE-2025-3016
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + code/AssetLib/MDL/MDLMaterialLoader.cpp | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/code/AssetLib/MDL/MDLMaterialLoader.cpp b/code/AssetLib/MDL/MDLMaterialLoader.cpp
> +index 2cac8a1e26..2e09992e89 100644
> +--- a/code/AssetLib/MDL/MDLMaterialLoader.cpp
> ++++ b/code/AssetLib/MDL/MDLMaterialLoader.cpp
> +@@ -209,6 +209,8 @@ void MDLImporter::CreateTexture_3DGS_MDL4(const unsigned char *szData,
> +     return;
> + }
> +
> ++static const uint32_t MaxTextureSize = 4096;
> ++
> + // ------------------------------------------------------------------------------------------------
> + // Load color data of a texture and convert it to our output format
> + void MDLImporter::ParseTextureColorData(const unsigned char *szData,
> +@@ -219,6 +221,11 @@ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
> +
> +     // allocate storage for the texture image
> +     if (do_read) {
> ++        // check for max texture sizes
> ++        if (pcNew->mWidth > MaxTextureSize || pcNew->mHeight > MaxTextureSize) {
> ++            throw DeadlyImportError("Invalid MDL file. A texture is too big.");
> ++        }
> ++
> +         if(pcNew->mWidth != 0 && pcNew->mHeight > UINT_MAX/pcNew->mWidth) {
> +             throw DeadlyImportError("Invalid MDL file. A texture is too big.");
> +         }
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index a4614a01a2..39ad234546 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -16,6 +16,12 @@ ASSIMP_INSTALL_STAGING = YES
>   # 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
>   ASSIMP_IGNORE_CVES += CVE-2024-48423
>   
> +# 0003-ASE-fix-possible-out-of-bound-access.patch
> +ASSIMP_IGNORE_CVES += CVE-2025-3015
> +
> +# 0004-MDL-limit-max-texture-sizes.patch
> +ASSIMP_IGNORE_CVES += CVE-2025-3016
> +
>   # relocation truncated to fit: R_68K_GOT16O. We also need to disable
>   # optimizations to not run into "Error: value -43420 out of range"
>   # assembler issues.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
