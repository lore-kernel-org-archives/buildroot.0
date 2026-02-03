Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F43BE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F12160825;
	Tue,  3 Feb 2026 09:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbeovYC9uqXv; Tue,  3 Feb 2026 09:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64F6E6083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109339;
	bh=RV9SVi40FLfsfs53M9qmLdU4NG6A8E9Xnpq0HVO9rl0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiFG71Y11UY9gAUVtEUp8g3ClBplkQFMtu26bUtZVK83uccQ2wJ6gRHdBBYtJmK3N
	 0dgVn+ow6WAgnDVTpKrsIeAFx/shzYk0ocuxc8WQrDL3eJ0Um3GJhDY7Z9Mcu3mUaJ
	 UE4QzfTUApEG/SXKNl5lBdFdVczBU3ChOaxXGdsBMGAjYuwlM/7ONsIStTFygJl0Vu
	 Kw3hpYlaQT3kd1Fa6unNDHcflXzULYHSHaJ048Dak4lVp70z6Us3gamxuadzrKZ27u
	 aMFmjKlPhOXCCDORjYm6NcFjGpWw2wZy7QadOEtMidyuAI1UFaRby7w2QeFCEULZDe
	 rit0Xz6MxYfgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64F6E6083F;
	Tue,  3 Feb 2026 09:02:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57F4C1A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A43C40446
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38hzGgbf3ybM for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79D9A402DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D9A402DD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79D9A402DD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1143104091; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 09:02:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnCIU-00000008Nmz-14u1;
 Tue, 03 Feb 2026 10:02:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251227132148.704963-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 27 Dec 2025 14:21:48 +0100")
References: <20251227132148.704963-1-giulio.benetti@benettiengineering.com>
Date: Tue, 03 Feb 2026 10:02:10 +0100
Message-ID: <87zf5qmc8d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sRQTCAuX5tUFatx4bGC0gINF1LCX3r4xy+D7prGVoK1GfZYGfefqV/yquStYPxemOOU0qk38nCpeMcndYWZxgs/CwmYBwUfJ1Nh7PlKlml3aJ31WY8ctBWQcLJB+4tFJ4mvmTR0QVnpNb6Z2rtlTrj3PccX8xiYI6V7Lu3yw/yCDXWKsnkJLMICa0eZeARH5x1m94tZ4lQ61mBikbMiVYrGBpIC0OLFTo4KPk5BYiknrC0tgekyTw46rPUdo0PaDjuAYiA6CYly7iKTh/DTs19Pp0Jy2INuHavhi6e8NpLi/mM2N52dTHFr5A49YQgWTYugqvvbhA/IGQmAXCqIvWg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=nqyIyy20B5v7aP5Z/OxX6UALeNtNnVetO2wvmW+U6JI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=sRQTCAuX
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.1
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > For change log, see:
 > https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=a768fcc0aafbe50a37d2d06bba23eb6671d3a9b3

 > NOTE: Tag v0.5.13.1 has not been emitted.

Could you report that upstream please?

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/dash/dash.hash | 6 +++---
 >  package/dash/dash.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/dash/dash.hash b/package/dash/dash.hash
 > index 4697d958a3..df0f6044bf 100644
 > --- a/package/dash/dash.hash
 > +++ b/package/dash/dash.hash
 > @@ -1,7 +1,7 @@
 > -# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
 > +# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
 >  # After checking pgp signature
 >  # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
 > -sha512  428de1f65ab77d5fee88bbf4ba8642d77abfda223a4ede423d09db9faa4f0347199b3be841d63b93a7ed68f714ef54ff41b2dc936e4b7ebb19b74499ed4e6a01  dash-0.5.13.tar.gz
 > +sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d 260512 dash-0.5.13.1.tar.gz

That clearly does not work.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
