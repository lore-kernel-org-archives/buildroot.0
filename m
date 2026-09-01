Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB36C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CA4A8082F;
	Tue,  1 Sep 2026 14:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNxlPXJ-1jJy; Tue,  1 Sep 2026 14:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788271856;
	bh=xHxN6ar0u3UyAmeXU9d9aU15XngXJXDUBaYWHbTFHq8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfCE0hnI3nmjvXWL668KfgSIh6q9sz5mTvMq6tUFteR9oBui8ysAMsvcMJd+rMjyp
	 5PDngbLYlIelixfxr84CESxSBiRcrBS0YIh8ynBQB44eXtWhq9UFw+bIWe9GhQDAbX
	 Zg/Vz80uHKqAbqRcQDV2WhdvMmp4sta+WGxB/dbMnX4laE4Q1NMxbFlLrZMdLL8Q97
	 c8MDBNbXiZlYASJ3m3HVIfyBYtEgXbRQiLic6fYpFa9okOMPuEsFnMfzORPaIXR/cm
	 eV01b8ZtU94tZSUSioHa+q4qJuC/RCt8GGX0+xJRAHRELY1R0Gr9KzJ186EUES+/Mi
	 Ike49JY/ERtEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F05F80AE6;
	Tue,  1 Sep 2026 14:10:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9095B265
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771E24064A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEktTPBNLf_7 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ji6nHJqo
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73D1640648
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:10:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ji6nHJqo51s/k9KAhPsx91nE2JkTCJbxZ5ODT/rB546L6BzPdSlu2D9KUG5EAEOId2vGtuz6/Nm92NpvJyWIU7wc5hZPpXurx4bVWbW2WQQnocpjAqz29jWCwwnehUgfzxvpGpygX7rGZcMFmAWms7noL/osUavVPfwbwAdaXRO/h6VCFrwSiAe2m4Xaq5TTcBe9euCziNTdMMYvRu235ZWGh3frXd/WODHq6hrE+MZjPbw6e4qp4pFRtslLBWMlJA1L3coO9IuGU6oiXPb/YJQqDVwoBY2t7v5d8mJySLoxgjLg7X82E5i1mlY8bKaHK6S0YwWxODSUfZ6fB638TA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Uh+xt4Ny4Fko/ewrCO66rLWmzwtGY5RMptKx9uz2UMs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 444504965; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 14:10:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1PCI-00000003UPt-0038;
 Tue, 01 Sep 2026 16:10:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Vincent Jardin
 <vjardin@free.fr>
In-Reply-To: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 29 Aug 2026 00:11:43
 +0200")
References: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com>
Date: Tue, 01 Sep 2026 16:10:45 +0200
Message-ID: <877bl53vve.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/dpdk: fix example build issue
 when libvirt is present
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > When libvirt is present before DPDK is built, some additional examples
 > are compiled. One of them fails to build due to a missing <stdlib.h>
 > include. Let's import a patch from OpenSuse, that we have submitted
 > upstream, to fix this issue.

 > We couldn't find any autobuilder failure for this issue, but the
 > following defconfig allows to reproduce the failure:

 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_DPDK=y
 > BR2_PACKAGE_DPDK_EXAMPLES=y
 > BR2_PACKAGE_LIBVIRT=y

 > The problem exists since DPDK v19.11, so it has been in Buildroot
 > since DPDK was introduced in commit
 > d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
