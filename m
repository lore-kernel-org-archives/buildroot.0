Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F81DC53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 13:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4263160899;
	Tue, 28 Jul 2026 13:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3gWDid-kbWO; Tue, 28 Jul 2026 13:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71EE66089F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247034;
	bh=UQDkuCvh6K+Zwc6ft4mC2MBU1NQfehKHi6539J1JnS8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaIvZNIADyc2WPvZXG+c+F4m/TS4DqO2yp/hleL6Rn3YbKOmRgOY/Kb26WDPr6/0n
	 gxdZsPkArpbwcELLfWlWq59uBrxyFGmY1s9kqv3qgQ0q9PzCORSGothd7OQJafj+q+
	 D1QwShHCm90sMcIT+2UaH6VYPNXUm/c13SivQcoOV6of222iIKMjVvz6R1sM0K1dt3
	 Wv2MApNfNLovqvz162mPb2DHzMO+WKH8PiL/ILkq5hMYjtQB3BUuo42dxauYCsMD6Z
	 kzp5/yCczklHtxNV9Dy6q/oPEHAhmr+2RGsfCwbIirgIQjbU7hsRjOB/TUswqiYsbf
	 P2mJNUX9gSmmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71EE66089F;
	Tue, 28 Jul 2026 13:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79BD32E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C03E40073
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9dlJOxtPpPC for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 13:57:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C39D4005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C39D4005A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C39D4005A
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 477687897; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:57:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1woiIt-00000000Exc-0RLd;
 Tue, 28 Jul 2026 15:57:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260727191220.102324-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 27 Jul 2026 21:12:20 +0200")
References: <20260727191220.102324-1-bernd@kuhls.net>
Date: Tue, 28 Jul 2026 15:57:07 +0200
Message-ID: <87se53qkss.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=d5BdmwTyNaf9ANmpgnOGnHVuwcCii3+Ag8FGFQdoeKtcYAZFsiCCulkQdiLxWalMvPM01G+CyEztEyQH/2a4+keQ+7RjV3GOjClhzFnd4r5whwfF8sE1cgyzi24/mRtPn3ScYU2186QWOgNqM6ryZLsHaNINuLQdXVqJEnwWNmbdKBf5plc1MUOEBNCAj68BxiWK08rYJuzqk8fiWL+CGiwOwiaNoXBDGSwieycUKcLvCyjhjRkVL2mk1k4TF3EeLheyi3wdtYIG266Fx9TGXMYuhkdK+q25jhAehRSfvOULw1CBqEKB98DgN3jERINwI+Cx9+FpvGfNTfxlIe+iLA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=XAUSXhAmIwcAW/j8k1Z8DN4AD0WDe+Nb/4eZUzs3bOk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=d5BdmwTy
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version to git
 c0cbd14550
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

 > Disable some new configure options which we do not support.
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/d1a23fe3f6f6e47d12e9caf831ccdff9d5357445
 > with the exception of bootlin-x86-i686-musl which failed with an
 > unrelated build error of the ffmpeg package.

 > https://patchwork.ozlabs.org/project/buildroot/patch/20260619142831.3664440-1-bernd@kuhls.net/
 > was added to the tree to fix other build errors unrelated to tvheadend.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
