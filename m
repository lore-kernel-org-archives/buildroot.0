Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D0CD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E3841DD9;
	Fri,  5 Jun 2026 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 965_2AdZ3Lv3; Fri,  5 Jun 2026 19:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A967841DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780688076;
	bh=139IRPUEdbvgFMEz+59Hrw7eb2Nl9khU9iyt23ZSe0I=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BuzIn6fyfyrQGSqiOYYo+dXFKBITZZpFj+VEHC9Io9raiR3DHIfFE2xboABPmYuqC
	 jQZ6EywT+w6aD72gPZcgJXa4gvqS6a1nQt2bzLZblNCzO9XSmwUO3YjMcFlO+AwxB4
	 5CsuK5W7aJuulpTBRAqasIvDMOGGyJxu2ESqdkNPA5e2ZL21wp1EmWWr0TZ6+kUIrc
	 OUJkNYO5W5nGWPmA9vBz5h1SbQEoLmlmyt3y+0FpHLJ+hgFnoBfTmddrRgiI5Ll1eH
	 xb4SUlsKIsSxDpeI0OkRdhcLJTkPZGH6IVX3PoqGPHqEvBByI2VuWRKWYMxr97CEIL
	 JTz1bIPPz9AZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A967841DBA;
	Fri,  5 Jun 2026 19:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C426115F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58AD60F4C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 19:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAGD7RsDXwp1 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 19:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FBE660F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBE660F4B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FBE660F4B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 19:34:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1639473191; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 19:34:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wVaJI-0000000082z-2HLl;
 Fri, 05 Jun 2026 21:34:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260605181420.383958-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Fri, 5 Jun 2026 20:14:20 +0200")
References: <20260605181420.383958-1-romain.naour@smile.fr>
Date: Fri, 05 Jun 2026 21:34:28 +0200
Message-ID: <87y0gspyrf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=m/IwAji/O5m6BKTv+1CyffwoOBi9R8XTYzQGonE/jgCy8yeU2Lj+XDjLvusuzQtYZzpY4o/jxnOcnwiVFONHK0Hki6ScPCYVtjHbjKOeu/1L1rHo94WhxfrWgRFoy5IM9TDMSGEFosXdcbGzNfuKw71nPMMAHTifJ+leuFmr5da4W3CALICmGMaoH76ejNDlCHBJlxQLfxfyK/DEgL9m6Bcw/1dYDE0ZZJGZpq8yZ4RlxnBOiQ2lqgvnHYDelvIl9IaenTi5B6JcrPYpAJhzRu6f0/Yne0MG8LUpSNp9JD486+5xyEQsVKBLslb17NPnxE7pnbjA9Y+GGq6Shp5/Bg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=y+x9g2g/z4WWb7keC6oq6gFHZzSs8ELoitOj2f01wvk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=m/IwAji/
Subject: Re: [Buildroot] [PATCHv2] support/testing: TestJailhouse: backport
 gcc-15/std c23 from imx-jailhouse fork
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > The jailhouse runtime test doesn't build since the last ARM aarch64
 > toolchain version bump [1]. This new gcc 15 compiler use a new C
 > standard by default (c23) but since the jailhouse build system
 > doesn't specify any versions of the C standard, so it doesn't build
 > with gcc 15.

 > As reported by John Ernberg on the mailing list [2], jailhouse git
 > repository has not seen any activity since 2023.

 > As suggested by Julien Olivain and Peter Korsgaard [3] backport
 > gcc-15/stdc 23	from imx-jailhouse fork as a short term solution.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843463

 > [1] 8d413d61792724877bfd886fe3ba519fb5259566
 > [2] https://lore.kernel.org/buildroot/20260601204735.888967-8-j@j-ernberg.se/
 > [3] https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > V2: backport gcc-15/stdc 23 from imx-jailhouse fork

The prefix should be package/jailhouse, as it is not just about the
test. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
