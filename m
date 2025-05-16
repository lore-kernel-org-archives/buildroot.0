Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FE8C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B110D60AC1;
	Fri, 16 May 2025 10:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEgLnBmwLqlY; Fri, 16 May 2025 10:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0FCB61047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0FCB61047;
	Fri, 16 May 2025 10:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F121AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A74D6103E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj7P6DowEmFm for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3484660B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3484660B26
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3484660B26
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:48:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEB8C1C0FE9; Fri, 16 May 2025 12:48:48 +0200 (CEST)
Message-ID: <417fa38e-5b15-4825-938a-94897c058eed@rnout.be>
Date: Fri, 16 May 2025 12:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: thomas.perale@mind.be
References: <20250430143303.551581-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430143303.551581-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6N62+eeo9YO54lL1+oMhNEcT0iSvEkNLBA9N5yesPlA=;
 b=TZWwHST49wf91tX25dWWnastynbPXSZN70itEGMRvuDi4E/UIuPD9KbokW2MqBGwfHMg1j
 9cCmjmkdDI9WKZC7vGvTVDFXsDi7m8J/Xb1gWcNkX3OB9H74Kof8UnT7+LOzqstt30u06K
 2pVyh/y275jjFq2utTtOXDG9eJ98TQmYD0aNjwNDk4WN87onq+cE89jmxYiyuNWS40/zNr
 XSilCDGYcffEpfQvzgFxs1D1exUJX08tvZe+KzQXj20ytIj6w6RMt6jmnHPpm2KNzizWLU
 43CqT3H0wqvXfqcOyrNqIne7Ev8k++pFq7ImXIzMenz3ZuJOImGeZW7FAGdbwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TZWwHST4
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.2.11
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



On 30/04/2025 16:33, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> 
> - CVE-2025-1492: The Bundle Protocol and CBOR dissectors could crash
> 
>      It may be possible to make Wireshark crash by injecting a malformed
>      packet onto the wire or by convincing someone to read a malformed
>      packet trace file.
> 
> See https://www.wireshark.org/security/wnpa-sec-2025-01
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/wireshark/wireshark.hash | 6 +++---
>   package/wireshark/wireshark.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 642bc5866d..8b3245551a 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.9.txt
> -sha1  d1abbe110451dab9e57c9ee1fe0892e0d6a7d515  wireshark-4.2.9.tar.xz
> -sha256  62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3  wireshark-4.2.9.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.11.txt
> +sha1  f4e908e73ab90982e7f712e0a9b5f4cce85ca058  wireshark-4.2.11.tar.xz
> +sha256  dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18  wireshark-4.2.11.tar.xz
>   
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index bade68f258..72415448c4 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WIRESHARK_VERSION = 4.2.9
> +WIRESHARK_VERSION = 4.2.11
>   WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>   WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>   WIRESHARK_LICENSE = wireshark license

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
