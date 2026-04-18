Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB45F99C8E
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEAC60AA8;
	Sat, 18 Apr 2026 19:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPHsAo6oJAjk; Sat, 18 Apr 2026 19:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C681260A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776540225;
	bh=FeB0kDdeFKEoxva331tcO17JHpCuPXrFRyR/7Eha3Dc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N0Jg1F8NaWMNTjkhJT6UnGJeB5o+2iOD5YcbX+ejx5KsBr7ScnPZDJZ88CYaHs+Bm
	 9XWXpG08OfVl7HtXqUnil3epViXtsov8HyxjYu7CkDIJLiANj08ktL9+0ZYao0xDfd
	 AdCEam/Wa/ZAQgNkTDSAjvdKVP2KJ3bSpEm9Cyaql+nLn4b+cduqF0AZU/BtDAZKXQ
	 gQuWUoQb29h+vF1QzCPlYKYX5G1JLSR7hngUt5R9uHrTPiVXwAmFC28xDKYnxuJ9ev
	 kXJaapTVZ2qg50yGMg39trZlszv8wkpNnxhxLxAUxY05O6vN0orK4rDsQqX1rLSKjy
	 FBNoqDNIAVsqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C681260A47;
	Sat, 18 Apr 2026 19:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 323DF347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08099802FE
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDslk8_9X77i for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 19:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25155802E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25155802E9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25155802E9
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:23:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A187F13F89A;
 Sat, 18 Apr 2026 21:23:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Apr 2026 21:23:39 +0200
MIME-Version: 1.0
Date: Sat, 18 Apr 2026 21:23:39 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418165103.696186-1-giulio.benetti@benettiengineering.com>
References: <20260418165103.696186-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <382d2c2e3c99a400ea9cc8dee363d71b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776540220;
 bh=3CR6129AZcyZmjRS55n3lS86KKwpYjxAglLQHes3amM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ncUJT2IgmKRhcVu+U6t/ZAyyzt8eDU1hN0iH36HfSZeJ0O3Ohm+KWqc8ftI/bGg6W
 EUmZza8tR4raSFIkaWIeR9VbFecEi2pFlL2fAZRSj5EZHyhPL4LWiyedFfaGNhrFpK
 +rpW/eCVPaBkzIHtPvgsjhbM0HUdRlCmK5M7sQLZyCOM1BgDnvXX5wWeonh+QOW2Wi
 OMtDFsvfvClJoT3yO7jswgzzXSN4colOrxSRoNsaubi3zzI2DdT6xeikwNWxcnKMtQ
 kZ0XZfeJbHJSZA89FXamZszHiOlYaClqwZ6ZCkkb0kWJeqE8Oykjad8HkRzVmu8ftC
 CP88f7FwX2Cwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ncUJT2Ig
Subject: Re: [Buildroot] [PATCH] package/dash: security bump to version
 0.5.13.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/04/2026 18:51, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759
> 
> Fixes CVE-2026-31323.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks. For info, I fixed the hash file. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7e24f892f6120d008e6a73617398ddc3111ee3a2

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
