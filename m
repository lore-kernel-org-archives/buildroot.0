Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ED7CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 14:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CEC61314;
	Thu, 18 Jun 2026 14:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZ8JM6bqgPkY; Thu, 18 Jun 2026 14:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42965612D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781792847;
	bh=sOajMAoMBErZHaM1DU9Ut6C1AQYmuQAgEaV346f74Ac=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJtABZffE1BoSA1AT+FatFY1uqYQSDPXaGP2rDvv5xpogxgLaHj2xPFUx2sNp+go7
	 w45SrA+a77iv1fa/1DEr834DqkC1UnwcyIZ20yKIYcj78cYf5QP56tcmbTIPIYCChv
	 LrPu5qZlXSqd2UvpDQPmfIWjtbCQIu+JOmPbRIEXBfQmlix7+q8nfaHzDnYxzZZ/Hu
	 iT3N/EftRFLCHu/CkDORhjFdl9jW/osxw4a9ceLj6Xz/SdA/f+2Oi0/vq7WlYqHhez
	 GpW8n8OOsCNxg3+KJR+JYio58MXzqRFpXf4flX9fSNs2cemEB7cbDtqsk5nPy9uUHP
	 t9XeJAmBXdarw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42965612D2;
	Thu, 18 Jun 2026 14:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E78CD131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC650612F7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RB4qVQY3pM2M for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 14:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7329E61204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7329E61204
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7329E61204
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:27:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1732140469; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:27:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waDhy-0000000CS2Y-05y5;
 Thu, 18 Jun 2026 16:27:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: yann.morin@orange.com,  James Hilliard <james.hilliard1@gmail.com>,
 buildroot@buildroot.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
In-Reply-To: <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu> (Marcus
 Hoffmann's message of "Thu, 18 Jun 2026 16:04:42 +0200")
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
 <ajOHeaIobPebbK+f@yd-6wlzhs3>
 <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu>
Date: Thu, 18 Jun 2026 16:27:05 +0200
Message-ID: <87qzm3exfq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SxGG8U7+QbvBBy5iTHRTccNqCFU6Cl3lh0IMUH/AylVG5saUSGfXYwy5M+aoXONhfxgmGb3IP3gQMdqsjJQ0BHZLsft47YUeerJjHMqWGsq1E3C6srXMmZUOz563Wt29UnSowHW+nUfTU4nofUvKu92F66/JCdDSVQzb1fQ2JwGWRkIK/T67QoH/7P4bXsoKhxJkiZi+Hymxa9DyWo2zaim0UJSpTs6K0mL78G8K+uIp6JdUCybC/SPtoup3/H2cAdjMlKWas2DmTt5kpZ0Aqfw2tva1femtHOTrqbKcXr4iIRD0SWurLtj8pPuO35hsNZ0eAFPmOG8xoU2XwzXuIg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ikqsqD0m2dGR7DaRf81v4Wm/JvwCR9SHmFHOvJiBAUU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=SxGG8U7+
Subject: Re: [Buildroot] minimum system/coreutils requirements
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

>>>>> "Marcus" == Marcus Hoffmann <buildroot@bubu1.eu> writes:

Hello,

 > James already sent a version which does that and it seems okay to
 > merge if anyone actually needs this on old versions.

 > It's not super great though because if someone where to add a blake2b
 > hash for a non-python package which then someone would try to build on
 > an old distro it would still break, I think?

 > I guess I'd mostly like to know if this complexity is actually worth
 > it and if we would want to at least define a minimum supported
 > coreutils version which we could bump at some point to get rid of
 > these checks again.

 > Opinions?

I would not be against just requiring b2sum on the build host. This is
presumably not a feature we would want to backport to 2025.02.x, so
"enterprise" users will most likely only run into it when moving to
2027.02.x.

In Debian terms, coreutils 8.26 was included in Debian 9 which was
released 2017/06/17 and will go out of ELTS support on 2027/06/30, so it
is not a suitable distribution to use for the duration of our 2027.02.x
anyway.

I think time has also come to drop the check for realpath / relative ln.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
