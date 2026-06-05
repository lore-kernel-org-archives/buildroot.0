Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC644CD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9288309A;
	Fri,  5 Jun 2026 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSGDqASRFy37; Fri,  5 Jun 2026 20:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A91CB830C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780689844;
	bh=RxGigsG8/KoTu9TpgaXhqrkgx7t5cbbZedbk8iXTiC0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=az10kmAdHA7O6qmc1I5CzyoKiQuEBXyag0MDMTI7h0H2MiOctdQmTsadI4OOYWd/C
	 z3MC75fENLuRNUkP/ksXBWhBNpC/GjUkkepVIg0KX0zP0J6qkbl0j8ENWl1Y/9b1Dr
	 KJ3Op4NefmHIkx/tQNFmOy2eHp6nxus0usHu5nO/AFV6tUs3dhi/6tT/tiSZhJp4MU
	 RIm5MRY8RrrCE6LLCJpe+nG74FJlCJK7nJXk9oa4ieh5pzIepJxOFU3u/aMGB8SnN6
	 AZxErpbzNBl15qWMzW9mPcLnAT8QMgZFAAEpn3eqSYKhQyoQkS43WeDw9mx729OQet
	 zBv3k/N2hECkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A91CB830C0;
	Fri,  5 Jun 2026 20:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A88D0388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D3E6104D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Yd12GFMbbSs for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 20:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61AB06104A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61AB06104A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61AB06104A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1010354208; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 20:03:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wValn-000000008VD-4AkG;
 Fri, 05 Jun 2026 22:03:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260605181438.392320-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Fri, 5 Jun 2026 20:14:38 +0200")
References: <20260605181438.392320-1-romain.naour@smile.fr>
Date: Fri, 05 Jun 2026 22:03:55 +0200
Message-ID: <87tsrgpxec.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NnsaaYJYBh1w9/ExmUX8vOc39bvhUz2HY7G9YHOWE88VwO2UhosDHjUUurlGE6giCof0tlAfcUq8jLZyX8uYcT+cDLbEPOxZs4RHcc1BGCaEr1L4uVBfrex84y6m0vd3Ba8IsDNL7eCDLyODdj4Bvh1NCDDVPpgWzJkz5oTckH8G2jvYDy66AbyX3KpovfpZbUuhR0g2M8MerhCNB/8xFXAffFTcEW+v/Pbfw93mL8bvKsO/UN2IJU1CXmtpm4Lqr5GZNjNjfdiMsDDiQihaIRLMTRBJLYKXzlaO3mb0LRcnvYpbIwz1SRVVgBFz19ylmTwvzQNoCMTr94ZbQakr8Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mmsofbKLaA7Z3KPX9l5I4tcEpZ7DKYXk6b5vRGUV4+s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=NnsaaYJY
Subject: Re: [Buildroot] [PATCH] support/testing:
 TestExternalToolchainCtngMusl: disable yescrypt
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

 > The TestExternalToolchainCtngMusl use a really old toolchain generated
 > by Crosstool-ng. Since it's used to test our external toolchain infra
 > we want to keep it.

 > But this test doesn't build since the last busybox bump to 1.38.0 [1].
 > Indeed, Busybox 1.38.0 added yescrypt algorithms that requires
 > explicit_bzero() [2] introduced in Glibc 2.25 [3], uClibc-ng 1.0.47 [4]
 > and musl 1.1.20 [5].

 > Add a new busybox config fragment to be used by old toolchains.

 > While at it, apply the same change for
 > TestExternalToolchainBuildrootuClibc (uClibc-ng < 1.0.47) and
 > TestExternalToolchainBuildrootMusl (musl < 1.1.20).

 > Note: TestExternalToolchainBuildrootuClibc configuration is reused for
 > TestExternalToolchainCCache.

 > [1] 5a27004cffb6bb034ff80cfac42a87bbd208755d
 > [2] https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
 > [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
 > [4] https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
 > [5] https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843888 (TestExternalToolchainCtngMusl)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843887 (TestExternalToolchainCCache)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843886 (TestExternalToolchainBuildrootuClibc)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843885 (TestExternalToolchainBuildrootMusl)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
