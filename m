Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44242CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 06:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E937C42CB0;
	Sat, 30 May 2026 06:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbzVr1fEIZmW; Sat, 30 May 2026 06:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB9042E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780123651;
	bh=FAk+/hoSSwEagk2mG0A8CzV6PnxIhwnVzrvJ37zdBOM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=bTguKZGVqI6nNqPT+zjinDXsOBaqlZDUnGNLpvw3qfczF+ocRpfdVdwk492LXvWwT
	 TvlTY3DYvkfR+T7OdywY/ZeIUrFJxD53eRVoZ6TemWtDwrBggHZytV0qJ1fbidR7je
	 ifOECAXzznivXuQzcYd+TEJZqbr0ECk9X3Ef0TBvqFr1HprPQ/BcKXaF0APwKCTLV7
	 pgtYFY467GTx1hQCgUS5Ew9FN7PEcpt4TNzRwZEmoYYt50HDzQDicsHDvdgFg/RRNJ
	 bGdCTT18M4BPY3LhoeyNpaAS93ParvuSUKF6lhG5jM5AZmLf8IhbmKeWzA8IxW5uRt
	 lg2T2J5tuJvKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB9042E50;
	Sat, 30 May 2026 06:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F92AD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1296F4F2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bGDF9BD0lsO for <buildroot@buildroot.org>;
 Sat, 30 May 2026 06:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81C956F4F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C956F4F1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81C956F4F1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:47:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10FBEB97C44C; Sat, 30 May 2026 08:47:26 +0200 (CEST)
Message-ID: <a68e0512-90f4-4247-b176-94988016d7c2@rnout.be>
Date: Sat, 30 May 2026 08:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260529224037.987748-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529224037.987748-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780123647; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=cLuUPzBK9ADdZBMcGX4/pxFuc5M+6Re/3Ac9OEaY62k=;
 b=b56dfeO2dXgALNhqFO9Ohv01kcLcKFX/ymL1nQN5dPJ/QrS+mTQ6uCYUwkIrw4N59KlFwJ
 UOg8Zwnlr5cFbvPg3pgfZHtVYr7r1bgV7wJEF96KGMopuPnAcI6nka4GnpS8UvTQIgIgXy
 TKBQo4Q1B6fMiJcPEbQvZlnvGUS6AlPmBW9kb4R0WjS737ezGB39s7VQolhqSn4LhsWuiC
 mqENqmePmvFli8KsyhLUbqZ3P9q0JMlKFLzZDw3mhwyG1ac/ob68Yb3VuyPsy626Fw/hdz
 iZMZfRA3diyS2EGDhqxAfdEr6R6SWO5+uixDmck3nEU9PYAuoFIC8Srr/W9nvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=b56dfeO2
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh:
 reject buggy uutils install
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



On 30/05/2026 00:40, Peter Korsgaard wrote:
> uutils install 0.8.0 as used in Ubuntu 26.04 has a bug in the install
> applet, breaking a number of packages:
> 
> https://github.com/uutils/coreutils/pull/11505
> https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2151454
> 
> The fix has been merged upstream but not yet released or packaged in Ubuntu,
> so detect and reject the buggy version and explain how to change to the
> coreutils version. Once fixed the version output will hopefully change.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/dependencies/dependencies.sh | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 9c2aeaf23f..8e97f0912d 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -190,6 +190,17 @@ if test "${missing_progs}" = "yes" ; then
>   	exit 1
>   fi
>   
> +INSTALL_VERSION="$(install --version | sed -n 's/^install \(.*\)/\1/p')"
> +if [ "${INSTALL_VERSION}" = "(uutils coreutils) 0.8.0" ]; then
> +	echo
> +	echo "You have an uutils 'install' version installed which is affected by:"
> +	echo "  https://github.com/uutils/coreutils/issues/12166"
> +	echo
> +	echo "Please change to coreutils install with:"
> +	echo "update-alternatives --install /usr/bin/install install /usr/bin/gnuinstall 100"
> +	exit 1
> +fi
> +
>   PATCH_VERSION="$(patch -v 2>/dev/null | sed -n 's/^GNU patch \(.*\)/\1/p')"
>   if [ -z "${PATCH_VERSION}" ] ; then
>   	echo

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
