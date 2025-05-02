Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71251C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E6B82093;
	Fri,  2 May 2025 10:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92aT88_HbAjF; Fri,  2 May 2025 10:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0598981F90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0598981F90;
	Fri,  2 May 2025 10:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6948F229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A98460B09
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYgCFW_bYmB1 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 774A260B70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774A260B70
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774A260B70
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D9BD1C0D8C; Fri,  2 May 2025 12:17:27 +0200 (CEST)
Message-ID: <ed5cd9b1-b4aa-4e7c-a0d1-be191e249415@rnout.be>
Date: Fri, 2 May 2025 12:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250414063041.3385071-1-fancp2007@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414063041.3385071-1-fancp2007@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vsXmnsnh8f4kvIE8QwPRT1FdpaSfJnSz6WP6otK815w=;
 b=B0tmw6lbEMwUngO56latqSt/Ck2L9tvnexgocsuiPprtQhJu5OlyrAw+9rZ1cEnjdSWbrl
 oOZYdV5csmfptfOkDFHwEWKdeRA5J3acjS3usfLRk1sJCBRf/ZR1DZvxwnxKR4554WtCS1
 2ejtxOPoZqW3+JWkBOOuTF5yuZXPOEI6TL6UlVtcT9QAGIMg8DPCGhZ0C9tors8/KXmS4v
 c7IlW6QYMeaAqF+6JH7d9VwR4j24I6cDFMa5mJU8Hm6sR3U1UuneIRBXHPKLoWh5snAVoz
 q8bA3EMk1ChyhpLvOmTZx8Eg5sBxO73WQotuuvmkk0HcheLt37ihk2quIR5FFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=B0tmw6lb
Subject: Re: [Buildroot] [PATCH] package/openvpn: security bump version to
 2.6.14
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



On 14/04/2025 08:30, Scott Fan wrote:
> Fixes CVE-2025-2704.
> 
> Release notes:
> https://sourceforge.net/p/openvpn/mailman/message/59169015/
> 
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
> https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/openvpn/openvpn.hash | 2 +-
>   package/openvpn/openvpn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 3c95ff4965..432b1c2afb 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking signature
> -sha256  1af10b86922bd7c99827cc0f151dfe9684337b8e5ebdb397539172841ac24a6a  openvpn-2.6.13.tar.gz
> +sha256  9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a  openvpn-2.6.14.tar.gz
>   sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index e484a4e80f..ce916dba04 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENVPN_VERSION = 2.6.13
> +OPENVPN_VERSION = 2.6.14
>   OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>   OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>   OPENVPN_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
