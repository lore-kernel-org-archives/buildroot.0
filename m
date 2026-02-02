Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC27E73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2BE40A72;
	Mon,  2 Feb 2026 13:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H73FYjQacr0T; Mon,  2 Feb 2026 13:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A97D840AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038316;
	bh=+jZbnXTPrCT2VAUngB1RphliFooLI38uv8f2hZhsVGo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oS81A+FfRXhlWrcVlAncLIcKN2BmckbS1OJ51oX0B6vbNnErJHJ0MKdG8+niP3qtt
	 EpfA+GbhSDAmUzeGlXD7Qi6FE7C5zZGYOtGXBczSD33v6yiMt577CrilFNvwGJceJD
	 bPfsNHY8ud8ZxTrSownwvjJji+IQiBCkYEaqhyfYrz29mI1rLgWQS3mlAh3qyfiKXh
	 Uk7Ke3uKxuwrg9N7oQlMxtmf4h5paHtF5FCx154Yz36yq+S0S07YjB7ki9lxDivVsf
	 GsoL7ybUlC+xBEzynO6oqfDhsfSbuV1KMOeCEgqqa3quvZQvr2pc3NF282Z8P1LKMZ
	 hQqr18g4xzNwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97D840AB0;
	Mon,  2 Feb 2026 13:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA261E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0079E40AB0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwvvEnLVGeQD for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D983E40A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D983E40A72
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D983E40A72
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1114854737; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 13:18:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmtox-000000063br-1sOd;
 Mon, 02 Feb 2026 14:18:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org,  Marcus Hoffmann <bubu@bubu1.eu>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260112221240.3743863-1-Mr.Bossman075@gmail.com> (Jesse Taube's
 message of "Mon, 12 Jan 2026 17:12:40 -0500")
References: <20260112221240.3743863-1-Mr.Bossman075@gmail.com>
Date: Mon, 02 Feb 2026 14:18:27 +0100
Message-ID: <87v7gf2sik.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=opWsfqBcjh9dm2w/Rq8r3RXvq2kBHhfqfdK8mem/2oEH3lYjXybIB08ggGkeqCGYz/fwXr92H6TjRaVwMCha5kohdRHE8BRZo4TJCGXMxm1QqUbCUjOa2oN+W9o295NkgVijqVUJvyLIUiwTnLzRmIkUTOVbT5hkdcDpNOEuQ44+eVu6JgKyJ3O3KXxi3mE6amWYvxDS3CgVlV0nwXVbHJEA0gIPjHC5RAf1GgTspJWX/IE0f7MJOux6uc+vB3H6Gj2rXtcuxlQAxDjVujmCbc2xeTMAEAgxugfrDphJxxpaeje66moQxC/IU1BlDfjYjO/GPolsWseRRRk77uxmYA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=34guixfQUVm4LNICRx7qeGsqTiudXLqi7xGqCTsS0qA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=opWsfqBc
Subject: Re: [Buildroot] [PATCH v2] package/picotool, pico-sdk: Bump to 2.2.0,
 add submodules
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

>>>>> "Jesse" == Jesse Taube <mr.bossman075@gmail.com> writes:

 > pico-sdk and picotool 2.x.x adds support for the rp2350 bump package to
 > latest version.

 > picotool needs mbedtls for --hash --sign and --offset.
 > Clone submodules in pico-sdk to provide the nessasaary files for
 > picotool to build and link mbedtls and other optional libraries.

 > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
 > ---
 > V1 -> V2:
 >  - Squash commits
 >  - Fix typo of nessasaary
 >  - Switch to version 2.2.0
 >  - Remove git@
 >  - Use 2.2.0 instead of ref/tags/2.1.1

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
