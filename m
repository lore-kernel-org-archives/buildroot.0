Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB90CCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E12081088;
	Tue, 18 Nov 2025 07:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdA8n6tx6Ubv; Tue, 18 Nov 2025 07:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2028101D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2028101D;
	Tue, 18 Nov 2025 07:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC5E1BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EBAE4159F
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0FnWGeECCMZ for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 056174159A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056174159A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 056174159A
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:11:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -618462242; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Nov 2025 07:11:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vLFsO-00000001lHR-3c46;
 Tue, 18 Nov 2025 08:11:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Alexey Lukyanchuk <skif@skif-web.ru>,  Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>,  Maxim Kochetkov
 <fido_max@inbox.ru>,  James Hilliard <james.hilliard1@gmail.com>,  Julien
 Corjon <corjon.j@ecagroup.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Jesse Van Gavere
 <jesseevg@gmail.com>,  Nathaniel Roach <nroach44@gmail.com>
In-Reply-To: <87ikf77r5i.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 18 Nov 2025 08:10:01 +0100")
References: <20251117214234.1115937-1-bernd@kuhls.net>
 <87ikf77r5i.fsf@dell.be.48ers.dk>
Date: Tue, 18 Nov 2025 08:11:44 +0100
Message-ID: <878qg37r2n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NI1j15eJOFJ5EQYofNoHQEzekZNncZwezuyImAdOd4+k540aoUULlnnXYdhp6TmWbb7v6R24zkdz0iv30IXDVRTE/21m2+aTF7dtnNTROEpPxHGC3HBYTxH/GcELJPznvleAwXc9v8IUxl+UgKWbl3YZLKENyb9D35Iu53Aq2Z2C37XsB+X+fWn2fPsEk0XUkXF76bqpBuwhqdWZSAGjfAei6SVxaIKbwh/bzKiFqgJqEc+rd+CCZUv8MFIVBJmbCvm13L8v1yExKNkytdBmbL+nBptA40VHxf6rOdHVj+E1UoxIvcTNRqmzSjXj8bvc6kpriTCxX+dvlFSQZ3/wqg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=BTD6nvU8K3rAIFRYmN/4yRT89YCmgIzuujO8L7CG+hI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=NI1j15eJ
Subject: Re: [Buildroot] [PATCH 1/2] package/timescaledb: bump version to
 2.23.1
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> Changelog:
 >> https://github.com/timescale/timescaledb/blob/2.23.1/CHANGELOG.md

 >> This bump adds support for PostgreSQL 18.

 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

 > Committed, thanks.

Sorry, I changed my mind. I think it makes more sense to get -rc1 tagged
and then add this and the postgresql bump to the next branch.

I'll get -rc1 tagged very soon.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
