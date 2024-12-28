Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F628E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 17:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152AF606EA;
	Sat, 28 Dec 2024 17:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggYHsTNMKWmk; Sat, 28 Dec 2024 17:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C8E606F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C8E606F0;
	Sat, 28 Dec 2024 17:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97832E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857CD403F7
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ceezLi7vBYn for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 17:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64428401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64428401FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64428401FF
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:49:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 12C9713F88E;
 Sat, 28 Dec 2024 18:49:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44422])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 18:49:36 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 18:49:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228170136.3164815-1-thomas.petazzoni@bootlin.com>
References: <20241228170136.3164815-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e58f4a81ac8144d3bc78869007cd9856@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735408178;
 bh=NLY2N+9X/NtvQ2OfmxoblPkjEkpKeKATjWMTW0NzxvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EGRcH9NM/aXHe8GWQtosCbPNtiOdZ2kocBQQHjonzMaA5L2IXiUczFOfRDO+HNjtl
 f24Hp8N4ihMvwyATHpyh3SmoY72avFNJ4WU407AbcjUmEK6IupB9g4//4utVHStZpa
 SSYVfG3D+dPLTF9y/f+aTsRwKjCW+DZnfxpRTIYcIT9aOMnIRZW1e4fxI172sfuByK
 AwSLQTMux85REi2RBsMT5yOhhvqigRhZOKLHJ8Yq6+ulGNvgXreetMxkcs1x9FDn0S
 PBVSQf+tMug7x1VXc6oLvFMkZ/FrwfO+iBtoAQMlFyVTQrZ3AJwHLUuQqVqrXKmYfP
 OyozFaRNnp3dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EGRcH9NM
Subject: Re: [Buildroot] [PATCH v2] package/mpdecimal: bump to version 4.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/12/2024 18:01, Thomas Petazzoni via buildroot wrote:
> While 2.5.1 -> 4.0.0 may seems like a big jump with lots of versions
> skipped, in fact 4.0.0 is the immediate next release after 2.5.1.
> 
> Changelog at:
> https://www.bytereef.org/mpdecimal/changelog.html
> 
> Build tested successfully with test-pkg, including with the one
> reverse dependency of mpdecimal: the python3 decimal module:
> https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1604635008.
> 
> The license file was renamed from LICENSE.txt to COPYRIGHT.txt. The
> license is still BSD-2-Clause, but the formatting changed: the license
> text is no longer inside a C-style comment, but just plain text, and
> the copyright years were updated.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
