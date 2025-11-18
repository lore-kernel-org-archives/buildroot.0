Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49315CEE351
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BBA41BD3;
	Tue, 18 Nov 2025 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfiumveiHBvu; Tue, 18 Nov 2025 19:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E13EF41BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13EF41BC3;
	Tue, 18 Nov 2025 19:52:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A12158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCA1F84643
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al-JDiw31Xuw for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 19:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A09E84640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A09E84640
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A09E84640
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:52:23 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:ff88:ef02:4977:60ef] (unknown
 [IPv6:2a01:e0a:12:eba0:ff88:ef02:4977:60ef])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 7CDE1C1646;
 Tue, 18 Nov 2025 20:52:20 +0100 (CET)
Message-ID: <54e47f21-a57a-428f-9152-09e3e2a20929@grenoble.cnrs.fr>
Date: Tue, 18 Nov 2025 20:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20251118145303.2215064-1-thomas@devoogdt.com>
 <f1f8a97e-f13b-4a9b-a17f-ce723845af9f@grenoble.cnrs.fr>
 <CACXRmJji00qR9uUbPtaj52_C1DjFS7x93JhwnVT+3b_hiZAktA@mail.gmail.com>
Content-Language: en-US, fr
In-Reply-To: <CACXRmJji00qR9uUbPtaj52_C1DjFS7x93JhwnVT+3b_hiZAktA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1763495540;
 bh=cf49HwOYsetOjD/VFGJKPSbkyPvQNpfSv7N0fll1c4o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CZbGd3odPZywxHxH88PzaBX4+n/tde6MKsRphOKNGgpnqcuNfMNOlmyAdThxbjgGm
 GfSSRNNM23/3UHyM+l7wamhev5gpHO8djIEBTfIDm/r0p+86VLF9uMZgyZRcv0I45V
 elgs90BWn2d/TmXFG9K34W+KW3bHp4nkZtm8mlel09T86wDHIG/FXkrJscY2U8DoAG
 /8zJvfyPzqk6nvCb0cVFRtDpOvPs/ndV6c20gmnKSR23Q8+OP12ezjyYMQ+Y11Y1ob
 KiTJpSLSHgQKNSacs3i8/BNyvLFSzgaa3G+TQbqzB6LeaQiqB9bhHRMNWGoLYrT5we
 64X4ESZmHPdUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=CZbGd3od
Subject: Re: [Buildroot] [PATCH] package/yq: add new package
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas Devoogdt wrote:
> I don't see any indication that yq might need jq, [...]

Oh, wait, I was confused...

It turns out there are two independent implementations of yq[1]. My
Ubuntu desktop uses the one that is a wrapper around jq[2], whereas your
patch uses the standalone implementation[3].

So you are right, no need to select BR2_PACKAGE_JQ.

Sorry for the noise.

Edgar Bonet.

[1] https://unix.stackexchange.com/a/774103
[2] https://kislyuk.github.io/yq/
[3] https://mikefarah.gitbook.io/yq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
