Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73838CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF5A831A0;
	Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMJWcXOkta4S; Fri, 19 Sep 2025 12:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A67E830E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A67E830E3;
	Fri, 19 Sep 2025 12:56:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A731290
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A3740C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYlfe10WyxyG for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFBBB40C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBBB40C14
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFBBB40C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso13960455e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286587; x=1758891387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCpBVrbct2UEa8VYmSqZT6Nif/gIxItABmKgtgzbgew=;
 b=igtiZYkbSECG+JEg63QbnGPeAURa63lzSL9WXzPKq7iSwhNBirCuIGFXM72eJAT16K
 9h8wCXSYQT2E9ulTr2tm1ix9+41zsZlUZe9WY2WTiXV7uqR1NrDf/AEut/aOLSF5hegW
 LtKkyAQpavTWRXtQg+u18I4XdrcJGB8/Hk1CWUQ1+WjkD9iCAki42ugDZQqd5tVtN488
 qwJr8G9LJaK7h4h3ppNFZbssIweUSqNkZtuKszKgf3/7Rp+rkV1vr4yzdANBPYUFPONN
 gblkJ7daqGRTPIiB3nPR3hd43G99NH7dhgj8nRax6GE5LfTa018CreYdKPcuowqEq+Mh
 jDdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSaAPnqmdcmJe0cfr08OMDMogSIu3v4Uf+pjnOfBJW32JssBGbEsl0j38KWPJ9g7pE3fVewC7fezI=@buildroot.org
X-Gm-Message-State: AOJu0Yw/2ytGIPUzJOAwdgIHovkxE6K1MTXnpgbE/vfuywPePyaZwqE0
 1hHf5KNo6RDwdnN7o+R/Pjw8c2Ht7iVZOHeE9GwBG3TtUionlrMetw+E1rQ6d7+nqHxuCkoT01m
 D9RDZXR8=
X-Gm-Gg: ASbGncvS8xzVdjY4A0lKnYfVxhznPw84kyLUsgqaWncwPrMhGfLny6lNvKep8hbSR5G
 IioOuik2AZo7Ev+UVsES86Kt3JxE4X4x+07ih+6prWxn4hpj84cDBGLvT3aCznfVJWj5YdVwCJj
 cP/wZdRnkMxED2GYQ+xM1W5prpG9wWRkjZYPNFs4y1CgDlRkF5mjxhTh1L1c1TbU3EMeVDmWVQ/
 88tTfOlVRqg+nqC0FGPwrCERYiyHCDgTmMEctlLNbO9CMiEiiMdynVzKfm3uVRn/8lsyUiNUfm+
 RvVDKxfAdaYTkGJ9Qj6OR6hGS0u3N7cRZHw5U7F9OcoSEmOJBkYLAIY8lJy2/6Ds38PpuQom6Fy
 7DNziUfmDbKneFhw=
X-Google-Smtp-Source: AGHT+IGq3X6VOcqqMCHEoyBGSOS0pwm7wSa5t74Fagfpk3fgVBL/Vk/IOrRx2ZTL8WGCswFXAwrTvA==
X-Received: by 2002:a05:600c:470e:b0:45b:8ac2:975e with SMTP id
 5b1f17b1804b1-467ef72c4a8mr26258105e9.26.1758286586957; 
 Fri, 19 Sep 2025 05:56:26 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm129124725e9.23.2025.09.19.05.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:26 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:26 +0200
Message-ID: <20250919125626.136621-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911171334.593571-1-bernd@kuhls.net>
References: <20250911171334.593571-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286587; x=1758891387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCpBVrbct2UEa8VYmSqZT6Nif/gIxItABmKgtgzbgew=;
 b=bZikGfZaTYJTRisb8qYZT6qBnwLUnimMjGq47TcldpUS9oOm7Tgc6FPYX8Dy3F2q/4
 qembvlsHBM8zDydp8G7nd6fsvyXWIBNaKYWAkdoNatSnjr1TXnCT+qHQ3UApAXfdNHJn
 Ky2CG9/Uo52vC7LFdRoX8zyXNt67aS56kr1kQf5kgGEUSwoA1XGJJOreEB4z3EPlrR4z
 p0RuQlZpkb6nrjRpbGHnD2Ve7HVCpaLLgT8ay6FMz/vD775jRJVNsw6R+FtUp/BmBfo4
 quRR/FEIXEiPwF3mYqnpZVbk3sygYYkEPhEhKOtglGdBAQrgcZcRzf1RQGjmkZ5JkREF
 daVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bZikGfZa
Subject: Re: [Buildroot] [PATCH v2 1/3] package/kodi: Fix build with curl
 8.16.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> curl 8.16.0 bumped the enums to long, see
> https://github.com/curl/curl/pull/18054
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> v2: added note in patch about patch origin (Baruch)
> 
>  package/kodi/0002-curl-8.16.0.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/kodi/0002-curl-8.16.0.patch
> 
> diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
> new file mode 100644
> index 0000000000..31ffa7b964
> --- /dev/null
> +++ b/package/kodi/0002-curl-8.16.0.patch
> @@ -0,0 +1,24 @@
> +Fix build with curl 8.16.0
> +
> +Downloaded from
> +https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
> +
> +Upstream: https://github.com/xbmc/xbmc/pull/27224
> +
> +The upstream patch is aimed at the upcoming release of Kodi 22.0 which
> +saw many changes to CurlFile.cpp so we use the fix from Alpine.
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
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
