Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3CCC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CBEF6154B;
	Tue,  3 Jun 2025 06:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQe8xDVSjCIq; Tue,  3 Jun 2025 06:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9D1614F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9D1614F7;
	Tue,  3 Jun 2025 06:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E807C255
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE22041132
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Hv9cP_ktdxo for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AC21400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC21400B8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AC21400B8
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2035D1C140E; Tue,  3 Jun 2025 08:22:12 +0200 (CEST)
Message-ID: <ef695a65-8a87-4223-9bd3-0dbaa4e677a8@rnout.be>
Date: Sat, 31 May 2025 19:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20250516070520.3454317-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516070520.3454317-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931732; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bJnyWWzWjFtlNmBM8nfVSB/16j7tx6TRnhVuwrH9fLE=;
 b=H6ysxor9B+MlX2ZjSuAYw5vq2eCkvE1y1i6ET9EAAi7nJtklPtcXAc7T1zX1EVzRCwdSWV
 xwVZYPgJ5Qc/yotEZ2ATggUCA4MC2h8U65AuDLbwgWHCBoMnBcTfbs831oXIi0bcn7cgq7
 l1D7XmK1llSWpLHdYK2rK7OqD7OAhZbs2qZGbCNkTJFAglIMJGCBZ+9nMv80I7X8LNuKAp
 A+5yvptQVmYQxyLeDSOee/DG8XlBbrtMQMgQWYHXYE+KEsJkmYWWZhhOhNDD283rw4VIUF
 7B9S1VJ1l4faS/MJTbmUFMfSdDU2cRGOZEY5ktfPfEIYbAfv+3g0JG1daWvYvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=H6ysxor9
Subject: Re: [Buildroot] [PATCH v1] pkg-cmake: force check_language(CXX) to
 be false
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



On 16/05/2025 09:05, Thomas Devoogdt wrote:
> See the code snippet below, which typically is used to check if
> C++ support can be enabled.
> 
> If we manually set CMAKE_CXX_COMPILER to /bin/false, then cmake
> will assume that it's fine, without having a real check. Otherwise,
> it will do a test run but somehow it falls back to /bin/c++, even
> when cross-compiling. Fix that by setting CXX to /bin/false.
> 
> ```cmake
> include(CheckLanguage)
> check_language(CXX)
> 
> if(CMAKE_CXX_COMPILER)
>      enable_language(CXX)
> endif()
> ```
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-cmake.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c7032312fb..ba287d244a 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -102,6 +102,7 @@ define $(2)_CONFIGURE_CMDS
>   	cd $$($$(PKG)_BUILDDIR) && \
>   	rm -f CMakeCache.txt && \
>   	PATH=$$(BR_PATH) \
> +	$$(if $$(BR2_INSTALL_LIBSTDCPP),,CXX=/bin/false) \
>   	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>   		-G$$($$(PKG)_GENERATOR) \
>   		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
