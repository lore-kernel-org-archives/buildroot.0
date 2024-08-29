Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADD9C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB2460648;
	Thu, 29 Aug 2024 06:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3_rYUuaJf96; Thu, 29 Aug 2024 06:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E26860A54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E26860A54;
	Thu, 29 Aug 2024 06:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B04871BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABAC3818A2
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZf3jY5irPY4 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AAEE8188D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AAEE8188D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AAEE8188D
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:41:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C0C163536712; Thu, 29 Aug 2024 08:41:11 +0200 (CEST)
Date: Thu, 29 Aug 2024 08:41:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Federico Pellegrin <fede@evolware.org>
Message-ID: <ZtAYB74DQ9dxUnOy@waldemar-brodkorb.de>
References: <20240829023115.8437-1-fede@evolware.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829023115.8437-1-fede@evolware.org>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724913671; bh=AgW+EJODPzNOONoep+ENwvSCa9yyX3eIN7ZZjWIzkF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0rzDqHRLyBAZOSO8WOK70FMNutLoFWMBXfUUHNQor3IlsmFJaijaWoU+7YqjnwE8
 eQC1RqRTi+BdI8UPEAVOr3IH8l3W8Rc4SMotjdM96aAiB5NjR/0yWkatZTx07PqtHF
 7Er2u9rx/Ntlb4NtFrobCnhg0AYcWp+Mb3lNeIQcO2B6qrnxPgqhIdTBDv2I729oIb
 ncnJkkWuMl0P3GKBEaNmR3jqy0RydHNNLRQuJ0d1OEUBE8ngOxXBWuP5ofGHclS4Xm
 y8UWvYcrexY6CNdMQQFBKLs84LX7+BRA6/BQT+ehvIbQwEmwMPOTCknY8j/ktIuZgK
 NG0NeX0bwMBBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=K0rzDqHR
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix install when
 building in parallel
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

Hi,
Federico Pellegrin wrote,

> When building in parallel, the package will randomly fail in
> install phase due to a missing make dependency.
> 
> Already submitted and merged upstream:
> https://github.com/netsniff-ng/netsniff-ng/pull/239
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

You also need a SoB ine in the patch, and a Upstream tag.
See the documentation here:
https://nightly.buildroot.org/manual.html#_additional_patch_documentation

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
