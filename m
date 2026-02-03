Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027F4E8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA36C817D3;
	Tue,  3 Feb 2026 08:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlcWda_5gdCn; Tue,  3 Feb 2026 08:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95B68186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106416;
	bh=yBctBIByxB2QaBudePtrdU2laz2pmdt+rOgHTU5ZJN0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDvWGkeUY4a6GWek8NdiE7+rRPT8iKzIQCt7f36LAu+iI14JbSFzvYQIsdE2hFRYJ
	 X0H7cnFQ4rG44CpOF1LQmbfp+TqRRplL1SHoGjMb+J+rFlV8pKxWsoHG8hb343aYK6
	 WU89k7gTmQUULr/f4VRe6MGt7q9T2+t0s/CmimIfIQ4cWydAa4iADEZNA1kFBAttiF
	 9JoazfeZ8ThiUIWokP1E4d4lQRcD1FPDVyhfwckW0cbk3N4zJZpm4FANs3mUSHytvU
	 eAqBg6m/ZVVDXo1dMkMfUCjQRg4al5Z3VPcJ5P/o1NiBr4ObKW9YGAlzu+WKaCJJXX
	 yAn5cw0ny/FMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95B68186A;
	Tue,  3 Feb 2026 08:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71120F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E6D76066E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPPC7w54gCUY for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 337936066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337936066D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 337936066D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1354282047; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 08:13:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnBXO-00000008B4u-28sl;
 Tue, 03 Feb 2026 09:13:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann
 <buildroot@bubu1.eu>
In-Reply-To: <20260202212814.2607588-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 2 Feb 2026 22:28:09 +0100")
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
 <20260202212814.2607588-4-thomas.petazzoni@bootlin.com>
Date: Tue, 03 Feb 2026 09:13:30 +0100
Message-ID: <87v7gent1x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GebrOGCtuj7s4QiW4ZhqxDsdd1u98JbGm3Kh0LnjXS4LjZugbcB3C3lysDu2pAmC6Z4Zx42RmS1DbVGOwQLetkV5aR7esB9AHlCWli6JBm+oGZxeDOVARTqtbfjzNQQ2lksQ82/sm5fTl0nRKfMgEHciTDLqR1sQkDUutRLpI6qc6Oou4FNxV5w4aae5kBtDcpIxE+dUW8ShvJM/QhWHqxGe/tNSgjGqX8+LqIxIo7a+YkFOm4J/vkuhAotheXQr2lcuPgQLm6/g2s2pZvmwPoiktTf0B3LgzAvzvA+yNQNVF6k3oyZlavXe+1BweCXJo80uJs2ZBVkaeedaNtujrw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=P4yWAzJgVNYHSHvDZ6bwuvbzuOsQByWJNxRFi1B0h7U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=GebrOGCt
Subject: Re: [Buildroot] [PATCH 3/5] support/config-fragments/autobuild:
 drop somewhat duplicate toolchain configs
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

 > - br-i386-pentium4-full.config as an x86 32-bit toolchain test is
 >   already reasonably covered by bootlin-x86-i686-musl.config

 > - br-microblazeel-full-internal.config as a Microblaze toolchain test is
 >   already reasonably covered by bootlin-microblazeel-uclibc.config

 > - br-powerpc-internal-full.config and br-powerpc-603e-basic-cpp.config
 >   as PowerPC 32-bit toolchain tests are already reasonably covered by
 >   bootlin-powerpc-e500mc-uclibc.config

 > - br-powerpc64-power7-glibc.config as a PowerPC 64-bit toolchain test
 >   is already reasonably covered by
 >   bootlin-powerpc64le-power8-glibc.config

 > - br-riscv64-full-internal.config as a RISC-V 64-bit toolchain test is
 >   already reasonably covered by bootlin-riscv64-glibc.config and
 >   bootlin-riscv64-musl.config

 > - br-s390x-z13-internal-glibc.config as a s390 toolchain test is
 >   already reasonably covered by bootlin-s390x-z13-glibc.config

 > - br-xtensa-full-internal.config as an Xtensa toolchain test is
 >   already reasonably covered by bootlin-xtensa-uclibc.config

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
