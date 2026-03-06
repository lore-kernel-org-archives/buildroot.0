Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A2F01807
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 08:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E049E40C7C;
	Fri,  6 Mar 2026 08:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qnR8-0hq6Z4; Fri,  6 Mar 2026 08:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BE340C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772784437;
	bh=e6hyzwWiH1SJ42duwWcFnPutHKOQbe49zd9TpLsdmKk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfdfvLUqY2F2BJYOTuDHoeb6n1wLgEyZnfbPdvJrBRj46dxyH8Z4ZKscexbYAKyfH
	 DPDQ0juenEw4xWETNihIsGtYI9BYrF7QYqrX7MuueXi/qYwVI+/Bqt/bNz6gpBU4us
	 khoP7YNl2i2EQW04Lk108d5d2HsvN4edBFvRYIOWcgrcETWqHxUNcFLyotbL979H1B
	 Et/LPuK/kH5ZZWf57Iofeirk9az+883nRAfzZn4nPE641X10UpFsLxgrsJ9vCCS1eX
	 yjrye7niEd9nphYgTFY2RCwmAIyYCRYYFdf6fsW9cgoLp0AmD+phjN05gzpnLA2k7Z
	 K/4MKDxOwplgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BE340C81;
	Fri,  6 Mar 2026 08:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFD58339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 08:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A725560903
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 08:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RCiiIoQ69_h for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 08:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 266C660824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266C660824
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 266C660824
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 08:07:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -564788398; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Mar 2026 08:07:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vyQDF-00000003EWz-01cG;
 Fri, 06 Mar 2026 09:07:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <5c104076-e333-42a6-b278-fea3ec139fb9@gmx.de> (Fiona Klute's
 message of "Fri, 6 Mar 2026 01:49:08 +0100")
References: <20260305002951.3614234-1-fiona.klute@gmx.de>
 <874imuikpx.fsf@dell.be.48ers.dk>
 <5c104076-e333-42a6-b278-fea3ec139fb9@gmx.de>
Date: Fri, 06 Mar 2026 09:07:08 +0100
Message-ID: <87v7f9gz4j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PDF07hK3i5cUXomZLUu4tKpWKCb0TVZA9x6yeCB43xK0depYCYtFLA/HFrXgvS8awJOJE8V5hJjaXp5y5u16HIrREBzGLwxCH9PUlH66fpgz1JosPrnOk9jW4L9vV5hxK+Ny82cillhODE4TB71t8MTq8r/LNspLfDDQEpcU/MtD8PajkkFVN+qpJXE1RqUMq9ueeLtXx6d9DvMdv9MpXU7x2mKr/vtE7ZNGegNrKgtcJY0zkCTqaX4r4Jo3PVwrqkMLBwyh6lNFuQ59fLVM5vMDxLs4e8Z5g0zuRfPbzQzklxs6N+K5IrfMkcBNZ26nz6GJFhwDaCn5lsL7itYmmA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=oVkAtgYgpsFEF6d8HjGfzfbE7H1fxe7tFjaU7iga2jQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PDF07hK3
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.5
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

Hi,

 >> I see that there are now some options for reproducible file systems.
 >> Maybe we should use those in fs/squashfs/ if BR2_REPRODUCIBLE is
 >> enabled?
 > I haven't looked into BR2_REPRODUCIBLE too deeply yet, but it sets
 > SOURCE_DATE_EPOCH, so according to the squashfs-tools documentation we
 > should be good implicitly [1]:

 >> As an alternative to the above command line options, you can set the environment
 >> variable SOURCE_DATE_EPOCH to a time value.
 >> This value will be used to set the mkfs time.  Also any file
 >> timestamps which
 >> are after SOURCE_DATE_EPOCH will be clamped to SOURCE_DATE_EPOCH.

 > I'd be curious to hear about test results. :-)

Yes, looks good. With:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_REPRODUCIBLE=y
BR2_TARGET_ROOTFS_SQUASHFS=y

Which does pull in a /usr/lib/libstdc++.so.6.0.33-gdb.py that leaks a
host path, but that is an unrelated issue. With that file removed I get:

md5sum output-test*/images/rootfs.* | sort
5fd5fdb2abb8b29bb0a008ff3c611842  output-test1/images/rootfs.squashfs
5fd5fdb2abb8b29bb0a008ff3c611842  output-test2/images/rootfs.squashfs
9e4f0f2f32b1cfe3de3e68dd26786fcf  output-test1/images/rootfs.tar
9e4f0f2f32b1cfe3de3e68dd26786fcf  output-test2/images/rootfs.tar

E.G. identical.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
