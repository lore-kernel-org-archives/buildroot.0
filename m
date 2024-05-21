Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB917C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A31A540473;
	Tue, 21 May 2024 04:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9OVevQCXZg6; Tue, 21 May 2024 04:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66F2240125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66F2240125;
	Tue, 21 May 2024 04:48:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2527A1C4F49
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBBA4050D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPVBwsIpn5Aa for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C27B404DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C27B404DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C27B404DC
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:48:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1715613F88D;
 Tue, 21 May 2024 06:48:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 06:48:16 +0200
Date: Tue, 21 May 2024 06:48:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZkwnkFdeA8BXoQZF@landeda>
References: <20240519172955.457904-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240519172955.457904-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716266899;
 bh=Gydp7dSC8H8RxYLghkGJbdmezUKfUSIT0U4GDZdQfR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxe15x+t03ybz7g0tcVR1QbwBS/B4Zc4sYOM8x7hD6kjw1hVEkxb407asSIJ2pMdB
 IneVYwpbS+YUXvNTtFY80O/I1B8BsG3isYDyZKa/nD5wwlu+XDLFRsjH+IYIi64j7l
 +TlkTwgCWRBnq+yhJWM7R/4YDmaFith0AWcyqvuqMqcmCTjPO5z2j5blYQqDWTsntg
 CN149OhRNoi6phDjH2c2vU1RByC4yudSUY7JAmYukAzcA7GV3mM45CzkrEbFTuDo5g
 PlBS+KM1yYtIOZVm1lxqx2oF9IBr2TpBeqrXHMdeMbOg+DNEN9tpZHS3XzZyHj2ooP
 Pndim5ZqSxBZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dxe15x+t
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: security bump to version
 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-19 19:29 +0200, Fabrice Fontaine spake thusly:
> This release includes security fixes:
>  - CVE-2024-27282: Arbitrary memory address read vulnerability with
>    Regex search
>  - CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc
>  - CVE-2024-27280: Buffer overread vulnerability in StringIO
> 
> https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index c729c59453..4ac6200bca 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
> -sha512  7959c5753bfa0bfc4d6d74060869aabbe9815c1c97930659da11b917ee0803ddbbd80e869e00c48b8694b4ba48709c3b6493fd045568e36e902616c35ababf01  ruby-3.3.0.tar.xz
> +# https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
> +sha512  c58e9be9b5ab48191fbf7d67e13f0ec42ee71ed338170e0f7b246708e9cfc617ce65098f5ce7ab32d4305e785642d3e44253462104d5b9c4abcb1a4113f48347  ruby-3.3.1.tar.xz
>  
>  # License files, Locally calculated
>  sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 00fa0e0f65..fcc637c5ea 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 3.3
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
>  RUBY_VERSION_EXT = 3.3.0
>  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
