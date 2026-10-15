Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A78DCC6B30
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 03:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A37608E7;
	Thu, 15 Oct 2026 03:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7Zo9c0VXY7L; Thu, 15 Oct 2026 03:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 699A96084C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792033803;
	b=UrgYcZHBBbcZKWV8I/FCG74u0OQimvp5Ltk8CNvJ8IKJIPdAHrjOciUga1dPIMMmToAA
	 kc8+t7NyufszINqTKVv9wDhKN0cs1c3mivTRHmX1BA05etm1kK6LNWbAXULIAyDxZ8lDc
	 WZzqugHtXgxsi16KEURgwE/oKurvoinUbO+At/OZ5gScm5n+qmKY3TJzsRjEoYjPV74zE
	 natRc+DdTFhqQkobPlkd5gPqFly2G9acBD6BMUk+VPcr3fbxVQ68VPMRpct2p6LyZXpZ8
	 jIcxsUbTVYwI+M2U0hsmWv/R0VYG9Slhk3nPP5tkNyT4prf8x71QRHUihZCDSx+TM3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792033803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=dmg2P07J1MiqBhHu5a2tdTR858U9hYsSw030CV2HL7s=;
	b=GnYUenDjIIDAy3joW0SfW4mYMSWSpVcGSOGh6wRtDCb+ThjIiHuhVhGadcPXLJ4QIAVD
	 8DJkmA1783FrAp8CKxPZrFnvtzUHNFE2nhvqg0+2RAAYjocxD/DtJF+5sbx1HY7gcicyM
	 9AMsjRlUvOhLkDHTyTtcDcCS8Ab4CZU69ntASaLZvyX2nLEJ2SdoEGPQ54/oc8wLJM1jk
	 Id+BMtpI8OXwrxnarSc2yGa1swRdzRz5PYdgl6kQilepFU90auy/475+SaWBk2e61KuGl
	 n7JdXa+6xr5DuTd7BPxI2kgmKtj16neH6adusoF56KKde06ECZgPRtP21M+y1d80gqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792033803;
	bh=dmg2P07J1MiqBhHu5a2tdTR858U9hYsSw030CV2HL7s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DbnPB46Me2tWQozKQzHmFbbjof/bpWLcsygmqyZoEAA0kRy/D1s9ckyRb4URpWhi+
	 vit4UKhIumJQPH7NkS2LZuoybopCJ2umvChZ/bWyNjTE3NgKs8IwY8D6mXLZh7Lx8E
	 Jt6jhw3dc/gs+WLFlZxccRhXQx+xW3ycVZOPYNsFc+IZuLSvo6GoZdctRzjnkAwDQ3
	 GJI3KVsluHyoEDX6W7yWYWz9bLfsDfpIn5eJYlmxN52x+oW9H9i+jtuHir6LEKRrSB
	 Z7bHqKrA7AHF7wiXXZv+++USuloH/1gaUU1zT3u1Va8mDhzSlvEj4ZrLBjtds6qkb7
	 7xOXdcsutKMtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699A96084C;
	Thu, 15 Oct 2026 03:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id C82B7E4D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id C5FFD40223
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id LJeinboJ4dJr for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 03:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 54EE640053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792033801;
 b=KZObI7Wj0Ei3WLJ3YEPZwdEt1MIA08Juc3ILdo7s6Db05pIXzD2wLQaQYWWVm/mUHJh8
 sw+1N89BN6tT4QkJwlE0ZAuuNMI5AxE2Q76GU4X+tHuaRyb6rpkFguisp3Y4cApXwsEEy
 PFT6jzFEsRbEtmU8KYHgKhc3848CbTkXQsVJ+xVoh7pkfBu0kY7cBHB+juJsTH2AMK3Yn
 ugiddP4/96agnAHZeYgjkwNi7ZWqbP9GSOaz2pKz26nsruWmEpufdsjy6K7SR6ppLi4wC
 YwSIspQx1vx82qzoTMuY9LLqL2zqsac43II2cE2WGztleBvltVZvO8XlxPmYFm+OmqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792033801;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=N8/q9eD97fj0hnWCvXaGcliKdJ8Cc5/mG5qwAD5O+FE=;
 b=Q6xCKTtQmzB+iErxpGRnIHLzEgyJmqirGW7mDNePjmpIKkMH/Ws64EQUETl2VxPscDXk
 /GOcoM5lj9IDZOW7xhSd+o7xXuujjZtWZMLwRWl3Bc1uHojXhzDwhSdqDEOnPbNPQVmxW
 PwC3SZetWGCznPeMr0wOookTrAJ26Z26qlFIQl0RYbPlUaq5/iKPDkJAi0XMzrwE3jG7D
 b0f8SmqqW7Uw/aCBGwzA7pKT23F5JMK3GlnoZ4O7hSQNPWWTuW0xtp9IgYfKe7rJKZAWD
 QS9FkO89MYOb7gpp2sytcAuhato4Zby4AJyQ737oe5tpcZU05ATW6rfZaQxLIxCqKeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=ZjBCDEvz; 
 arc=none smtp.remote-ip=172.234.252.31
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 54EE640053
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id A941143B6A;
 Thu, 15 Oct 2026 03:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0B8DA1F000C5;
 Thu, 15 Oct 2026 03:09:59 +0000 (UTC)
Date: Thu, 15 Oct 2026 06:09:56 +0300
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <atBEBB1x4WI-GRh8@kernel.org>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <20261014164625.1474866-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-2-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 2/3] package/libtpms: disable building
 manpages
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 06:46:24PM +0200, Fiona Klute wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Libtpms builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  ...ld-sys-Allow-disabling-manpage-build.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> 
> diff --git a/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> new file mode 100644
> index 0000000000..20849db49d
> --- /dev/null
> +++ b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> @@ -0,0 +1,61 @@
> +From 6e688d2bd1e6e1545fdb25bcfeee28f78240cbfb Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Wed, 14 Oct 2026 17:31:09 +0200
> +Subject: [PATCH] build-sys: Allow disabling manpage build
> +
> +In builds for embedded systems (e.g. Buildroot) manpages are not
> +needed, and building them adds a dependency on pod2man. Allow passing
> +"--disable-docs" to configure to disable building manpages.
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://github.com/stefanberger/libtpms/pull/641
> +---
> + Makefile.am  | 5 ++++-
> + configure.ac | 6 ++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 03ed7e65..9d0ea053 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -23,10 +23,13 @@
> + 
> + SUBDIRS   = \
> + 	include \
> +-	man \
> + 	src \
> + 	tests
> + 
> ++if ENABLE_DOCS
> ++SUBDIRS += man
> ++endif # ENABLE_DOCS
> ++
> + ACLOCAL_AMFLAGS = -I m4
> + 
> + EXTRA_DIST = \
> +diff --git a/configure.ac b/configure.ac
> +index b19db106..0fc928c8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -282,6 +282,11 @@ AC_ARG_ENABLE([test-coverage],
> +   ]
> + )
> + 
> ++AC_ARG_ENABLE([docs],
> ++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
> ++    [enable_docs=yes])
> ++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
> ++
> + LT_INIT
> + AC_PROG_CC
> + AC_PROG_CXX
> +@@ -392,5 +397,6 @@ echo "Use openssl crypto for  : $use_openssl_functions_for"
> + echo "Test coverage           : $enable_test_coverage"
> + echo "Static build            : $enable_static"
> + echo "Statically linked tests : $enable_static_tests"
> ++echo "Build documentation     : $enable_docs"
> + echo
> + echo
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
