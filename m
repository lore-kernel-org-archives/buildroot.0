Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A198DD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC7C61753;
	Thu, 27 Nov 2025 20:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEtS5d9nCgeQ; Thu, 27 Nov 2025 20:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5E8616E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5E8616E8;
	Thu, 27 Nov 2025 20:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AEBE2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2119A404CD
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9o2AamvtRdK for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16A2540438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A2540438
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16A2540438
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E098B979CEF; Thu, 27 Nov 2025 21:06:33 +0100 (CET)
Message-ID: <7f0a106f-81f1-414b-ba41-acbdc13dbf85@rnout.be>
Date: Thu, 27 Nov 2025 21:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251101083000.2088619-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251101083000.2088619-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273993; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HNxgrsg8TUu77NJF10diCnAhPpYxe/CW6OH6QzRDoAA=;
 b=BWigi4mBNyeHL6mEfMrphEtxQu7QzfrwVi9Mat7WCa98UOxRF2DdWwBlzx46JQdIvM5HUT
 hDmosrkXwBnNcO+CWvl6Na7yrHGtO4RQB09tBlFnA0JkH5vYbz4PjiS4fRQ+S5NUjrtmPE
 AzSIyOWyImpQ/usa/yW7/klhvr+7e8i/nn9yIb4M4r+BZ4THa7EnlI4Yy6uu9vfjDzeSdn
 z2QUeK6KQLG1WJ13yI2IQh5Ncw6A8T3WiD8nFklLcze59WuG0C7WxXquukiR1eO24W3Y2V
 wUHiys7Le0d4q2TfIf+mcHEMDyjGF6QA2TrBdhK08N5uiAUEx3F3uOqDxJd3kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256 header.s=dkim
 header.b=BWigi4mB
Subject: Re: [Buildroot] [PATCH 1/1] package/enscript: Fix build with gcc
 15.x
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



On 01/11/2025 09:30, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/7fd/7fdda216e2ec57b9bcc1d2613b6546db35a29749/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/enscript/0002-enscript-c23.patch | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 package/enscript/0002-enscript-c23.patch
> 
> diff --git a/package/enscript/0002-enscript-c23.patch b/package/enscript/0002-enscript-c23.patch
> new file mode 100644
> index 0000000000..707674935d
> --- /dev/null
> +++ b/package/enscript/0002-enscript-c23.patch
> @@ -0,0 +1,19 @@
> +Fix build with gcc 15.x
> +
> +Upstream: https://savannah.gnu.org/bugs/?66845
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +diff --git a/compat/regex.c b/compat/regex.c
> +index c6907f3..87f2840 100644
> +--- a/compat/regex.c
> ++++ b/compat/regex.c
> +@@ -336,7 +336,7 @@ typedef char boolean;
> + #define false 0
> + #define true 1
> +
> +-static int re_match_2_internal ();
> ++static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
> + 
> + /* These are the command codes that appear in compiled regular
> +    expressions.  Some opcodes are followed by argument bytes.  A

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
