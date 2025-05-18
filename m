Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DB0C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C61A6064D;
	Sun, 18 May 2025 14:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo0TxGVJNgoB; Sun, 18 May 2025 14:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C53C60A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C53C60A5B;
	Sun, 18 May 2025 14:46:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 179B21BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1ABF60AB4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwxSpXMcQzSW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 172636064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172636064D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 172636064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D6BA1C1060; Sun, 18 May 2025 16:46:26 +0200 (CEST)
Message-ID: <571f4bd7-5867-40f2-ad6c-69b8e7f83a37@rnout.be>
Date: Sun, 18 May 2025 16:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250517153342.8919B86F8A@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517153342.8919B86F8A@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579586; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VzREE/MD74tLs9+wvutNCZPNHGtkhMys85+V6y+8gKI=;
 b=VQcXoMqKPDPo3D5ug4uLNmTlH2kBBG7bFUPkcG5DGW8XLQZwKqsHKwYsgyFMpGX2dvj43f
 XHhU1UjuOcIIkVa2HK8E6RfMnBDm1AYR4vyrBQzwUqE5skrjqvo72VxhSslGgodvwkQpIG
 fNC+pS3G0pAKRWkRjGj0JYZOoN7NyiGju2ptG6b+IWm1K0NQHrAF+2VmwMP96b2bhUQFFN
 adFs9Tpa4ZvLoRF64Ir3beL6fWcvDlfcG2vodft4VjDebYTwcomF2EXFY6mYk5ATwmd0HZ
 cbuyKWNszI4Pl1Vmb2Ph59/djiKiaSWOlooytQ3wIG0k0SQtbyGGX+wzYleZfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VQcXoMqK
Subject: Re: [Buildroot] [git commit] package/go-bootstrap-stage1: fix
 builds on GCC 15
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



On 17/05/2025 17:33, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=a2356a9e0a1a6d24c11bb74dd8ca3136c5c1c6cb
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> GCC 15 defaults to -std=gnu23, which adds the bool keyword, causing
> conflicts with stage1:
> 
> https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords
> 
> As a workaround, force the build to use -std=gnu99 mode.
> 
> Signed-off-by: Felicitas Pojtinger <felicitas@pojtinger.com>
> [Peter: extend commit message]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> index 3e4ee57432..83cb278f68 100644
> --- a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> +++ b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> @@ -17,12 +17,13 @@ HOST_GO_BOOTSTRAP_STAGE1_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE1_VERSION
>   
>   # The go build system is not compatible with ccache, so use
>   # HOSTCC_NOCCACHE. See https://github.com/golang/go/issues/11685.
> +# CFLAGS and GO_CCFLAGS have no effect, so overwrite CC directly.
>   HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV = \
>   	GOOS=linux \
>   	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_STAGE1_ROOT)" \
>   	GOROOT="$(@D)" \
>   	GOBIN="$(@D)/bin" \
> -	CC=$(HOSTCC_NOCCACHE) \
> +	CC="$(HOSTCC_NOCCACHE) -std=gnu99" \
>   	CGO_ENABLED=0
>   
>   define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
