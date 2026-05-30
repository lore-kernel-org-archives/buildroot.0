Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024E3CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB9142E10;
	Sat, 30 May 2026 09:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hhk5P3TU934t; Sat, 30 May 2026 09:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A86342DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131777;
	bh=7Z755Wpx7P1siWEqiUatFFya6SFSSiONPSzrqgHtQ1s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rM/n4ZZiYbMklTDCYF+yQv06UYxhZNxC4VZC/xNoqKfJz1obi1c66ksTf8f6P+zA1
	 AX7RktKxn0vo1Sbw2RXxyx9mgeoa6IZZqZDivmHXFtoOXE1j5lw6j7oBSYE80N/9xM
	 ky3FFajt036acUbYCy0/O2mf1zb3OwBbuwn1HMfpjrn0DDRbEb5Z+iF4DJHpq/AXNP
	 0MzNyDTYhitoLSp2uZvW+f4E3r5W6Xge760oRMVPPuIFCuwybaO8+HIece2Wcbp/S+
	 S0bSF2/KQrdoJ230QO7PjVWgDY/Tcbet1iLiqoED6gbKW8rAxeAKChZ5yBwQo2enNu
	 R81wCOgcPPWWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A86342DE8;
	Sat, 30 May 2026 09:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A4DE12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 495D0850AB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKyCJAoOt-6E for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49609850AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49609850AA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49609850AA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:02:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -739516661; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 09:02:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFak-00000004jg4-0Yvl;
 Sat, 30 May 2026 11:02:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-5-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:12 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-5-thomas.perale@mind.be>
Date: Sat, 30 May 2026 11:02:50 +0200
Message-ID: <87y0h16zid.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jS9TV5KlvCQHiqYZtpXXTqZnpG9JkoLy3dtlScvCSNHNiOiQ+5gRkCjm9k+2asZMXaI0TAkVwC29wH9VmFi0P52Eg28oRolBrI2Z37p20cTUs+t2+65bUO6zgbBEgCXne19s0217GpWcl3VgwsLNeHuhQxCb/9lyRRF1lsUPPpkW1PyRpfSsKcEHnYshMnDjHP60NA6EsC2vCsIn/b08YJx52Uk20nKR8rpg38RexzFKCX2h8tvaiTt2RHXfxVzcNXhfmQMzOyNuxZDhDdtQexeZ7A93WhbfybmT4D1L9snk7kV7VhKS2f0ejvGViJ5jlFBQs5vjpjOnyw1WUtlBbQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=npTyt8PD4gAKRIV+7+Bp5h5TIe26tcdkTUWabCeozbg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jS9TV5Kl
Subject: Re: [Buildroot] [PATCH] package/icu: update CPE vendor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The CPE "cpe:2.3:a:unicode:international_components_for_unicode:*:*:*:*:*:*:*:*"
 > is valid for this package.

 > Also remove the no longer needed "ICU_CPE_ID_VERSION" subst since [1].

 > The previous CPE hasn't been used since 2020. While the new one got two
 > CVE assigned since 2020.

 > [1] 5bf0db998b package/icu: bump version to 78.1
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
 > [3] https://nvd.nist.gov/vuln/detail/CVE-2020-21913

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

I think we can also remove the comment about git tags in icu.mk.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
