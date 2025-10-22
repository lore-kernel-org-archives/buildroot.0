Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF7CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884C3614FA;
	Wed, 22 Oct 2025 16:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnHJhTHTgBzh; Wed, 22 Oct 2025 16:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8CA614ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8CA614ED;
	Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D39A670A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA59F40888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIfOikVCkvAf for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D013400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D013400FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D013400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A905FB979192; Wed, 22 Oct 2025 18:43:24 +0200 (CEST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:23 +0200
Message-ID: <20251022164323.286534-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009201429.71928-1-thomas.perale@mind.be>
References: <20251009201429.71928-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151404; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=X+RqTy+V0ov24qRLeh0ooBtIdEQ/BrF4b318GL3fDSg=;
 b=oXtO41KIqofwpclizAHfhHBSH8aV0h6GlnPDRyNUTF+GFqFJoZjgXpS1nZ3hIv27PLtcZb
 TCSYuJultP26TGpCb1ZP2L0Auog+w4U0J6x2P298WIs1jyYssWw0+DUnTVoQgmKjeYBxbj
 nkOvGHxg9II5Q4yZEfhXDO+hOANG0MvXmexGVYQfa7JmngZ3aDoJzymYQBr8rRvPzPkWUu
 XOEn1r7XGFlenrHubdbesUnnG3844A/EpHVX8iGu+EriI21XRasdUGNQUSpygJAkvjL+7N
 1XLCfI+Bcf65mepD+YXSrIFFepdZiMod5co47XZERkEZyYp1HuWzW9hzwfhNfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=oXtO41KI
Subject: Re: [Buildroot] [PATCH] package/zip: add patch for CVE-2018-13410
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2018-13410
> 
>     Info-ZIP Zip 3.0, when the -T and -TT command-line options are used,
>     allows attackers to cause a denial of service (invalid free and
>     application crash) or possibly have unspecified other impact because
>     of an off-by-one error. NOTE: it is unclear whether there are
>     realistic scenarios in which an untrusted party controls the -TT
>     value, given that the entire purpose of -TT is execution of
>     arbitrary commands
> 
> For more information, see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2018-13410
> 
> This patch also includes the patch 0009 which address a buffer overflow
> when passing unicode characters that doesn't have a CVE assigned.
> 
> Tested with `./support/testing/run-tests -d dl -o output_folder -k tests.package.test_zip`
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  ...009-buffer-overflow-unicode-filename.patch | 23 +++++++++++++++++
>  .../0010-buffer-overflow-cve-2018-13410.patch | 25 +++++++++++++++++++
>  package/zip/zip.mk                            |  3 +++
>  3 files changed, 51 insertions(+)
>  create mode 100644 package/zip/0009-buffer-overflow-unicode-filename.patch
>  create mode 100644 package/zip/0010-buffer-overflow-cve-2018-13410.patch
> 
> diff --git a/package/zip/0009-buffer-overflow-unicode-filename.patch b/package/zip/0009-buffer-overflow-unicode-filename.patch
> new file mode 100644
> index 0000000000..860b453735
> --- /dev/null
> +++ b/package/zip/0009-buffer-overflow-unicode-filename.patch
> @@ -0,0 +1,23 @@
> +From: Shengjing Zhu <shengjing.zhu@canonical.com>
> +Subject: Fix buffer overflow when filename contains unicode characters
> +Bug-Debian: https://bugs.debian.org/1077054
> +Bug-Debian: https://bugs.debian.org/1093629
> +Bug-Ubuntu: https://launchpad.net/bugs/2062535
> +Forwarded: https://sourceforge.net/p/infozip/bugs/81/
> +Origin: https://src.fedoraproject.org/rpms/zip/raw/f41/f/buffer_overflow.patch
> +
> +Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/14-buffer-overflow-unicode-filename.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> +diff -Nura a/fileio.c b/fileio.c
> +--- a/fileio.c
> ++++ b/fileio.c
> +@@ -3502,7 +3502,7 @@
> +   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
> +     ZIPERR(ZE_MEM, "local_to_wide_string");
> +   }
> +-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
> ++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
> +   wc_string[wsize] = (wchar_t) 0;
> + 
> +   /* in case wchar_t is not zwchar */
> diff --git a/package/zip/0010-buffer-overflow-cve-2018-13410.patch b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
> new file mode 100644
> index 0000000000..399ab37bc5
> --- /dev/null
> +++ b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
> @@ -0,0 +1,25 @@
> +From: Florent 'Skia' Jacquet <florent.jacquet@canonical.com>
> +Subject: Fix buffer overflow when using '-T -TT'
> +Bug-Debian: https://bugs.debian.org/1093629
> +Bug-Ubuntu: https://launchpad.net/bugs/2093024
> +Forwarded: https://sourceforge.net/p/infozip/bugs/81/
> +
> +strlen(unzip_path) + strlen(zipname) + " " + "'" + "'" + '\0'
> +The additional space required in the `cmd` buffer is 4, not 3.
> +
> +CVE: CVE-2018-13410
> +Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/15-buffer-overflow-cve-2018-13410.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> +diff -Nura a/zip.c b/zip.c
> +--- a/zip.c
> ++++ b/zip.c
> +@@ -1437,7 +1437,7 @@
> +     /* Replace first {} with archive name.  If no {} append name to string. */
> +     here = strstr(unzip_path, "{}");
> + 
> +-    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 3)) == NULL) {
> ++    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 4)) == NULL) {
> +       ziperr(ZE_MEM, "building command string for testing archive");
> +     }
> + 
> diff --git a/package/zip/zip.mk b/package/zip/zip.mk
> index 0457ba9414..0a66c146bf 100644
> --- a/package/zip/zip.mk
> +++ b/package/zip/zip.mk
> @@ -12,6 +12,9 @@ ZIP_LICENSE = Info-ZIP
>  ZIP_LICENSE_FILES = LICENSE
>  ZIP_CPE_ID_VENDOR = info-zip_project
>  
> +# 0010-buffer-overflow-cve-2018-13410.patch
> +ZIP_IGNORE_CVES += CVE-2018-13410
> +
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  ZIP_DEPENDENCIES += bzip2
>  endif
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
