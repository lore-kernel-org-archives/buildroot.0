Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17359C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A23E383A73;
	Fri,  2 May 2025 10:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCxITCRi0G9t; Fri,  2 May 2025 10:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0E283A55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0E283A55;
	Fri,  2 May 2025 10:27:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5679EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B86CD60AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIc3_ChMSRdp for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5702260B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5702260B05
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5702260B05
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:27:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A8401C1112; Fri,  2 May 2025 12:27:26 +0200 (CEST)
Message-ID: <fe97692a-d9dd-4cb1-8c3d-71b029dbc496@rnout.be>
Date: Fri, 2 May 2025 12:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=umS4WAxeafZwMBmetXgf23mYkpN3uKOCIQ2cENHzOwI=;
 b=BSOsRYTQnbQCVvYQF4cpjeE9VtgPgpyjy39gwxOJM2PF2dyjKT6dsbNh5oQobojDE7nhvh
 y7OxLHKX2YQovhqDrxrct+KrOTZ+yPraZJe3Y0jicCPOW86jrwY4q9qCBkTOr6LLwqcd7R
 MoLCdwZz5f4zyOZOBUV8stdzW3B7raPA8lLljR6orZzwQ4ycid5OWgImm9cY7DgKsba+5c
 4BPu41lL/xbM4OeCcZeiixLPDLtL0HcOGb3yJ5Op9auEspElyfyM+SOGq4CWwSk1mjsvqn
 bsU2qk7qQQoN/SpgjZPo55bo67CCqsrMTxf/EhGzZy+himfcoWIMUDeBhUW+/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BSOsRYTQ
Subject: Re: [Buildroot] [PATCH 1/2] package/libv4l: backport upstream patch
 to fix time_t issue
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



On 14/04/2025 14:19, Thomas Petazzoni via buildroot wrote:
> libv4l has some really special code that is built explicitly with
> _FILE_OFFSET_BITS=32, which doesn't work with _TIME_BITS=64, causing
> build failures when BR2_TIME_BITS_64=y. This build issue has been
> fixed upstream. While how the upstream patch exactly works is unclear,
> it's the patch that upstream has decided to implement to resolve the
> build issue, so we simply backport it.
> 
> The issue exists since at least upstream commit
> 99f245f5e2826c7ae3ac8de530bc2fbd906eb62b, which was merged in
> v4l-utils 1.26.0.
> 
> Fixes:
> 
>    https://autobuild.buildroot.org/results/616608ef2a44efff67fa21b3263b341da82744c4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...on.build-fix-arm-_TIME_BITS-64-error.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
> 
> diff --git a/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
> new file mode 100644
> index 0000000000..db59eae7e6
> --- /dev/null
> +++ b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
> @@ -0,0 +1,37 @@
> +From 6faf5e963eadeab8b7d47d5b3c14f06e0ae1da01 Mon Sep 17 00:00:00 2001
> +From: Hans Verkuil <hverkuil@xs4all.nl>
> +Date: Sat, 12 Apr 2025 12:30:13 +0200
> +Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
> +
> +Undefine _TIME_BITS to avoid this error on 32-bit arm:
> +
> +/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> +
> +Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> +Upstream: d517cfdcdc16533ab7e06e97c07ca089cf261aef
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + meson.build | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 269a9da7..31927cda 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
> +     # As the library needs to provide both 32-bit and 64-bit versions
> +     # of file operations, disable transparent large file support (fixes
> +     # 'Error: symbol `open64/mmap64' is already defined' compile failure
> +-    # otherwise)
> ++    # otherwise).
> ++    #
> ++    # Also disable _TIME_BITS=64 since this is allowed only with
> ++    # _FILE_OFFSET_BITS=64, which is now 32.
> +     '-U_FILE_OFFSET_BITS',
> ++    '-U_TIME_BITS',
> +     '-D_FILE_OFFSET_BITS=32',
> +     '-D_LARGEFILE64_SOURCE',
> + ]
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
