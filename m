Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7964D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1728435B;
	Tue, 13 Jan 2026 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iN_LfItl4XeU; Tue, 13 Jan 2026 19:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD34984353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333639;
	bh=E6sJ2LXgMk1gxV0vdpgRM4VVBYiwHgkeJzG+LgqSU+A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ixw37jewFGlYhrX6LooOTwjX5uUvEkZdrDLqfMpcP2+OXB/YRrjMdSr1LmWT4eocA
	 H8BmZUSIlhrLdPjRglZFl2OQanPqvLKnLKSvPhSzczxF9Ct1GTb+OzZBzui3CWiW1X
	 1kjXQcJ3kgXr9WHO9oaVvIzQHZskVq/CyaxaIqXE9fd8h5mQ5PDEoLH5gj1g0VAJgX
	 x0ZMJQuGKk19NzzEW6+AFLtjeFRSlPVWxi6fXQvvVk0yJQh8vfyo7zP5DN5hR1I6fG
	 5fkXGhkCN/Dd3uRiJDckQIfBWnldYD83+EWwx/4GYLns+f9oMu1ZXg4Jfw6w/Nt6/E
	 F4QR34/xiuLjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD34984353;
	Tue, 13 Jan 2026 19:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68455231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A7884342
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9iUdFZG38Oc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CEC384352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CEC384352
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CEC384352
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FB03B97A863; Tue, 13 Jan 2026 20:47:15 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:13 +0100
Message-ID: <20260113194714.99610-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-3-thomas.perale@mind.be>
References: <20251230081917.18676-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333635; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Brm4LOnbIz8YVFYxm0o+IBMF8b7PXXa+j5jgPqQKQMQ=;
 b=Dun055GE5t5wDDfsG5VC6Yw3ouY8I1cjwrACZ7tXnx6Sg7zgA4ylihja7eYQlrKDKAzfxS
 LaI2YqvZxHNQ43Q0P0n30kp+/3EdTwi0HSfTt1v05Zl2VEUcGpNtsfNVu+sdNee7MBuz57
 Q7x+GZZrnASsSWc6Ay1gTpNrxrUJMf5Z42R5h+BiMH1EUJw7Nnhr6WPNwqp1+fhSLLp7y8
 V/GAT9UplXu6+E8oE/jmMcKKT+/EtJk0Q/vYlWFDE3aiXtyzNudIHfKg0qNazUAWFeTxk/
 PnJHR+15dnN63FPXbZbvE1Xhwl1D9ZUWQOtSAQRWRLdBr+lfZL2255RvAE3sDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Dun055GE
Subject: Re: [Buildroot] [PATCH v2 02/15] package/shellinabox: add CVE
 trailer in patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header
> and adds the `Upstream` trailer.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .checkpackageignore                                           | 1 -
>  ...02-CVE-2018-16789-fix-for-broken-multipart-form-data.patch | 4 +++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 4df0438291..94916ecc0f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -948,7 +948,6 @@ package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
>  package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
>  package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
> -package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch lib_patch.Upstream
>  package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
>  package/slang/0001-slsh-libs.patch lib_patch.Upstream
>  package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
> diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> index 4b15f419e3..5067833056 100644
> --- a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> +++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> @@ -4,7 +4,9 @@ Date: Fri, 26 Oct 2018 11:51:15 +0200
>  Subject: [PATCH] fix for broken multipart/form-data
>  
>  Malformed multipart/form-data payload results in infinite loop and thus denial of service
> -[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
> +
> +CVE: CVE-2018-16789
> +Upstream: https://github.com/shellinabox/shellinabox/pull/446
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   libhttp/url.c | 3 +++
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
