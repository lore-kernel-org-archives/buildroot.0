Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA5CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B03842681;
	Wed, 27 May 2026 22:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9GDOzw9CXJT; Wed, 27 May 2026 22:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEAF742679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922753;
	bh=YoVV0qrP271Oa4glvzk6PPFbNmb23PTRI/9eSdmEDKM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4IPlIRKtWK5Mzsejx2aYmAbQINMtFOLwOPIhNOVd7hfqjNHta4V95DHxVweERx8e
	 G0IS3N4XY0NgLYf+r22R8mwu0Qt2TESagOGkkk6sldSwT+rB90XsvpWezm+yrsIJhu
	 9fNsNRtNrqopD/OjHfzzoa7Zpnacvep/BEbPD+6PNZV5fxesfC0fgW4xmX8UAkLpAs
	 YG4M3ldw4ITHYBBXff151CHjEEEqzCro3z+Uo69416vVSfc4zSZ+n6QXVaJOeDM2iu
	 adCgkUIG36JZsJwW3JZ+sr+HNxGrX18Q5TmBgD11N2soimduUn1W9geCLxXBD5K43s
	 mt5XPJGEjLg7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEAF742679;
	Wed, 27 May 2026 22:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0DF28A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB8C6155E
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4MOGFTKmmyu for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD6DD613EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD6DD613EA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD6DD613EA
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -784450070; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 22:59:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSNDM-000000014sF-0h5h;
 Thu, 28 May 2026 00:59:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260526200641.939539-4-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 26 May 2026 22:06:41 +0200")
References: <20260526200641.939539-1-bernd@kuhls.net>
 <20260526200641.939539-4-bernd@kuhls.net>
Date: Thu, 28 May 2026 00:59:04 +0200
Message-ID: <87ldd4larr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=C2FzcxZdd62RFebR6Nv9teJNyNBYqBJAH0iTWZb7IU7mioPGMob1K/FeqMQHhsLHioNj737n1Q2Mguf4Sbw5ibdlHnip0tQYkQARNr65330PVcbB5ea1GV0dJKzi9zsQ7HcmEzlCI7ESGkEuvGDKgUjgsMVOQ2reWWkrxfETXMlTdYCtcjQ6QtCR+HD4TFTIuM7bgXUOp0BQoVuZtmdvEbxtWQf/r8Dk7NsSCTeMYodlcGwCpkP8caYnzrthcE1FrX8P9lWmLKQf8AiseNoMeAke/SduCeJnmRakrFjHiLB0MS4k+cC//Udqqim2GgzTlFhyqjGK74kM9fE8IzIFDQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Afnm0uoPcMbUoR69cPtrZ2L2qUtEJzkF9RcEAE/wByU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=C2FzcxZd
Subject: Re: [Buildroot] [PATCH 4/4] package/libde265: security bump version
 to 1.1.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/strukturag/libde265/releases/tag/v1.1.0
 > "Security fixes

 > - CVE TBD (GHSA-g2rg-wj66-w594) - Out-of-bounds write in
 >  process_reference_picture_set via predicted short-term RPS
 > - CVE TBD (GHSA-vv8h-932h-7r86) - Heap buffer overflow in
 >  de265_image_get_buffer via SPS dimension integer overflow
 > - CVE TBD (GHSA-g5hj-rf9f-7vxm) - Unbounded memory accumulation via
 >  orphaned slice headers in read_slice_NAL
 > - (GHSA-x27c-jp65-g395) - Quadratic CPU consumption in NAL parser
 >  (remove_stuffing_bytes, resize)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
