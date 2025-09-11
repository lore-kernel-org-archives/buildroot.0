Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADFCA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 04:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B8941CF2;
	Thu, 11 Sep 2025 04:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaYuZoY_HPiF; Thu, 11 Sep 2025 04:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE2F341C62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE2F341C62;
	Thu, 11 Sep 2025 04:54:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C32BE20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 04:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DEC941614
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 04:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkrcYUVgQPxf for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 04:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E03040C6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E03040C6A
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E03040C6A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 04:54:07 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 5CFA044071F;
 Thu, 11 Sep 2025 07:53:41 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250910200608.2114508-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 10 Sep 2025 22:06:08 +0200")
References: <20250910200608.2114508-1-bernd@kuhls.net>
 <20250910200608.2114508-2-bernd@kuhls.net>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Thu, 11 Sep 2025 07:54:02 +0300
Message-ID: <87plbxfv2t.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1757566421;
 bh=m0qp3MxihPjQGErjLdV+9IRaqrXdeoUH6ULfrFwbDFU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LEPNMnEhp/gzhGSJfcZZPZoaM1qdFANdoFtsBxHqPKqQi+8zYLayp7h2oI9AStBP3
 tK+/VdGlpuYQlsX4M1g7Z1ogRtfwytKKCQPcNuuNExf4L3yyMlydYto6PyPIzhLlzh
 2wKmRdOdmnSt8pRA2f7Y6ko9oFbkePBxBBEqAVaMsYvyaW41xZhpl7x9Srfjq0bB/h
 pWpiu6ccsbN72m22U5HMar2bwDkzX1FGki/GAxrImRQIqWDgtKRj4N98Aq/p1Q7sTZ
 lHV35amOlf58ieJSg3Z/MXiuqLHewCuMsZw0ZKUBjIxv7iT8rblXDLfsiQ9CEV2vgs
 ffr3otySTUtcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=LEPNMnEh
Subject: Re: [Buildroot] [PATCH 2/2] package/kodi: Fix build with curl 8.16.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the libcurl security bump and this fix. A couple of comments
below.

On Wed, Sep 10 2025, Bernd Kuhls wrote:
> curl 8.16.0 bumped the enums to long, see
> https://github.com/curl/curl/pull/18054
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi/0002-curl-8.16.0.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/kodi/0002-curl-8.16.0.patch
>
> diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
> new file mode 100644
> index 0000000000..ad71f339ca
> --- /dev/null
> +++ b/package/kodi/0002-curl-8.16.0.patch
> @@ -0,0 +1,21 @@
> +Fix build with curl 8.16.0
> +
> +Downloaded from
> +https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
> +
> +Upstream: https://github.com/xbmc/xbmc/pull/27224

It would be nicer to apply this libcurl compatibility fix patch before
libcurl version bump for the sake of bisectability. I believe this patch
should to be compatible with libcurl older than 8.16.0.

I guess you can't use upstream pull request patch because it doesn't
apply to kodi version we have. This patch description should say that.

Thanks,
baruch

> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +--- a/xbmc/filesystem/CurlFile.cpp
> ++++ b/xbmc/filesystem/CurlFile.cpp
> +@@ -44,7 +44,7 @@ using namespace std::chrono_literals;
> + 
> + #define FITS_INT(a) (((a) <= INT_MAX) && ((a) >= INT_MIN))
> + 
> +-curl_proxytype proxyType2CUrlProxyType[] = {
> ++long proxyType2CUrlProxyType[] = {
> +     CURLPROXY_HTTP,   CURLPROXY_SOCKS4,          CURLPROXY_SOCKS4A,
> +     CURLPROXY_SOCKS5, CURLPROXY_SOCKS5_HOSTNAME, CURLPROXY_HTTPS,
> + };
> +

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
