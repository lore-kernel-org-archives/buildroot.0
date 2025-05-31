Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FFFC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4321440681;
	Sat, 31 May 2025 16:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqgwBDI5-rXo; Sat, 31 May 2025 16:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B0540687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B0540687;
	Sat, 31 May 2025 16:46:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7611D235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D456072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ep3v_05SKRn for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F73A60728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F73A60728
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F73A60728
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C269F1C0D89; Sat, 31 May 2025 18:46:23 +0200 (CEST)
Message-ID: <811eee02-ae8b-4127-8324-d9396a179932@rnout.be>
Date: Sat, 31 May 2025 18:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250501084226.46927-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250501084226.46927-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709983; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kbY8BUu9OGGUWNnEp7rcAihQQachXxRCRkKyZQvNmBk=;
 b=aU7XCwPZL53VkTaR4CaYaFubwCrVWYhufbNSczItowpv6zP5O5MaX+k3DqjTM5gPnnowVV
 KcI/cuP9HmQjPdC/mpO+fwkOILSBjFs9mPp4lL/O9LT3zqlrCbOM3zSMPan7wVt8Z3ivx6
 F0eVJ6uyxNJ6TYwW4aTubkj1zffsKs0qnLVHOFfqTW8YSf+hrCy0UCbvIKWSttCJ80ozNS
 8///Qitv6P+T0h9bbzCWEiwI5qw0EJ24tgTWIcP6Phedl7DZa7Qu7t/GKLjtAFebpd2LWs
 IzaHWD7+vnlm1RMd+htYjBptY5ZPVXQTvjcV0C3h5ZVXYBM3pG5QJ+Lbec+wEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aU7XCwPZ
Subject: Re: [Buildroot] [PATCH 1/1] package/protobuf-c: bump to version
 1.5.2
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



On 01/05/2025 10:42, Kadambini Nema wrote:
> Release notes:
> https://github.com/protobuf-c/protobuf-c/releases/tag/v1.5.2
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/protobuf-c/protobuf-c.hash | 2 +-
>   package/protobuf-c/protobuf-c.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
> index ea7262028c..c7eee9e7e1 100644
> --- a/package/protobuf-c/protobuf-c.hash
> +++ b/package/protobuf-c/protobuf-c.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
> +sha256  e2c86271873a79c92b58fef7ebf8de1aa0df4738347a8bd5d4e65a80a16d0d24  protobuf-c-1.5.2.tar.gz
>   sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
> diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
> index b1e8c25496..3df6a2edad 100644
> --- a/package/protobuf-c/protobuf-c.mk
> +++ b/package/protobuf-c/protobuf-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROTOBUF_C_VERSION = 1.5.1
> +PROTOBUF_C_VERSION = 1.5.2
>   PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
>   PROTOBUF_C_DEPENDENCIES = host-protobuf-c
>   HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
