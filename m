Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8B6CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BBF6F543;
	Sat, 30 May 2026 12:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Guto3DAZBmf; Sat, 30 May 2026 12:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DEA86F545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145777;
	bh=MBSz9cJDk+gVToD4TN0WKdv4M+OKAYL49tEdZ8xp9r0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=R/IYVJI7RqVrcLy6ZkuGVcNhVaT0H7SswzRRfxZMBaqZc4b1Gyf+5XEPqp9+K0vpZ
	 awTXyhd04Kg6t9qzlS9i4R0dBIi6mCsOb2AGhPbqQHkUmNk+blpt2cYebENg2KOCkW
	 YJQ2yP//eAoD3FmCdaj+rDbswuN6DjQD+64CjXVMeENpBhjSfGU4suLprTW75JlZnm
	 e73zBt2Je2hUNSvojaaf1Hb/68bLb8VzN2YlAzFpbC48Dbl2zf6K5/wlreBfCo6Mtg
	 vEBa7qM4ZXS3Wn5L17p1foadpTeOubPKCHUZtsWku6trxP0Y3CfuxPjhLS4sc77A8a
	 RyZb+HPWzzx7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DEA86F545;
	Sat, 30 May 2026 12:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA31E218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACE456F565
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDvQyms335yT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC8276F559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8276F559
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC8276F559
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D19E5B97C710; Sat, 30 May 2026 11:18:59 +0200 (CEST)
Message-ID: <52878ac0-0dd0-4433-a816-1145b248c2a2@rnout.be>
Date: Sat, 30 May 2026 11:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260529175156.572429-1-thomas.perale@mind.be>
 <20260529175156.572429-2-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529175156.572429-2-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780132740; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1wpnOnPckhRLezKsegZUW5XAHDAqlBtaNWcYxtVf5e0=;
 b=iNkW5uPZmUumUmatAhpQ+t+TR2w7F4naqtliZZe7Qv0NsNuSmnGpWgLwDnBVYAwazqlIB5
 lU9b8ixtdKXvDkct8pmkGssmKQMPfVDW2KI3opy/erGc3NXjvysNO+TE5PAm65IDCdlgSq
 agJv5xc7/VjytXGiuAPmQMjCcDNn1MRQrxEaLn7f/PXCueUVP8VmDbc2PbrEWJJvpAPBdt
 JapCnfl/yWDJYWhGis8+Ix22ZLFdYbJJpfxV0IZDeJk9a+1XFq+HQT+4QpiC7MyQIN5pTT
 HLhr8+Dlufmy5U7NGrE7rpIk8yqUdqlgZ4yVtSGPQxmTFfNuNKf8IWmpjSCR0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=iNkW5uPZ
Subject: Re: [Buildroot] [PATCH v3 2/2]
 support/dependencies/check-host-cmake.sh: verify version argument
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



On 29/05/2026 19:51, Thomas Perale via buildroot wrote:
> When running 'make show-info-all' without a '.config', it is possible to
> trigger this script without passing a version number.
> 
> The 'show-info-all' target is special because it forces the reading of
> all packages without requiring a .config, so BR2_HOST_CMAKE_AT_LEAST is
> unset and the script is called as:
>    check-host-cmake.sh cmake cmake3
> 
> Without validation, the integer comparisons below would produce errors
> like:
>    check-host-cmake.sh: line 37: [: cmake: integer expected
> 
> It's possible to trigger this by adding the following file somewhere in
> you path:
> 
> cat >/bin/cmake3 <<EOF
> echo "cmake version 4.3.3 CMake suite maintained and supported by Kitware (kitware.com/cmake)."
> EOF
> make show-info-all

  The same issue also occurs with pkg-stats though there it's not fatal (it just 
logs on stderr). So I updated the commit message and the comment and applied to 
master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   support/dependencies/check-host-cmake.sh | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index fadeae9f6b..ab577008c4 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -6,6 +6,18 @@
>   major_min="${1%.*}"
>   minor_min="${1#*.}"
>   
> +# When running 'make show-info-all', it is possible to trigger this script
> +# without passing a version number. The 'show-info-all' target is special
> +# because it forces the reading of all packages without requiring a .config,
> +# so BR2_HOST_CMAKE_AT_LEAST is unset and the script is called as:
> +#   check-host-cmake.sh cmake cmake3
> +# Without validation, the integer comparisons below would produce errors like:
> +#   check-host-cmake.sh: line 37: [: cmake: integer expected
> +# The following lines checks we have a single digit number from $1 before
> +# continuing the script.
> +[ "${major_min}" -eq "${major_min}" ] 2>/dev/null || exit 1
> +[ "${minor_min}" -eq "${minor_min}" ] 2>/dev/null || exit 1
> +
>   shift
>   
>   for candidate; do

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
