Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8241CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 22:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC22984BF4;
	Fri, 29 May 2026 22:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLEWjHI0P59t; Fri, 29 May 2026 22:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC26584BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780094580;
	bh=auTvWnHp7Q02WqEpO9W6bv9iBuVAENuZ+ZsD2CPBdn0=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Chim57dic0c+uReS/0OhLXr0Ef5aMDC3iTnzI4Ba/mh3inHs/pUgZWu9Pu8dX5Vz0
	 6+15qx0yDCeR1amaPId5C1sFO9361yr/rEJL8boos1zXriSHltatTD+d8FYi6fksdL
	 3Vg5nrcYNd7xwGTWCArXpd74GerSY4BDaSs5dlTfVU8k/7vbu0/4D+E5z0vXEO0CuC
	 k2H0KGB2uWzkGBRUQXk7w5dApfbbGNYSHqzT1Oj5qXOsWx+IrqC3o49UzNBlFr+87k
	 Nvs7w4LeUYlriDRxHcTHCcucY9DRcKgb7Pcz8VyBSeZAvmQftYD1x9IvhY4ObSlLbS
	 qX+suhECy6faw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC26584BF5;
	Fri, 29 May 2026 22:43:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80364D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFD142818
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0qqlR6BW0iP for <buildroot@buildroot.org>;
 Fri, 29 May 2026 22:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6044842814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6044842814
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6044842814
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:42:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1591664162; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 22:42:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wT5ui-0000000492J-1405;
 Sat, 30 May 2026 00:42:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
In-Reply-To: <CAMwDAPjhsGd3RDLi+6B5ENzXiT+wb-PB-5HG5NfSp83skFz4tw@mail.gmail.com>
 (Ferdinand Bachmann's message of "Tue, 19 May 2026 16:51:42 +0200")
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
 <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
 <CADvTj4r-B5eHr0K3XchEy8g_umaYXos953A-FnARLg+gG=Z+Zw@mail.gmail.com>
 <657bfb7e-7963-43ba-aa6a-a185c3eb4dbf@rnout.be>
 <CAMwDAPjhsGd3RDLi+6B5ENzXiT+wb-PB-5HG5NfSp83skFz4tw@mail.gmail.com>
Date: Sat, 30 May 2026 00:42:48 +0200
Message-ID: <87jyslalcn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VN2tf0YptP55+bZCpv3vC1M17QQeidWSPVktHheBfhSlEBjzQx6QvCWAPCa82gfw3w0oc3na3nMjMLKXfKyhQn3h/x7rwR219+2TN8ie4sSoRyWbn69JZsbnYx5DC5P1YBmBFNHKApV9Fxa4LLJr08WpMVteagR8/Fp3Bs5Cma03+e917HX0fmVC6EV8x1jei9pjICeYrL49/6CnxfBA1mWan22vJKsWGbfaIvWuD1R81TatVU9q31ZNmEPwrB7Fxf6jS2Ki6mjApORgqkDTh6nF+3lJAJNjiJvyus/ifTsGo6qJEVFHwxyGDj9b+5FpZOKGU47kvhNoNwXFUYTgHQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=m2AGemOQIN1UyC+gyd+enVynRaDQ0xNIRArE82Stt9I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=VN2tf0Yp
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 buildroot@buildroot.org, Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ferdinand" == Ferdinand Bachmann <ferdinand.bachmann@go-e.com> writes:

Hello,

 >> Actually, if it's really a uutils issue, please report it to Ubuntu. They are
 >> very good at fixing this stuff quickly. I expect the issue to disappear shortly.

 > This was reported to Ubuntu as
 > https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2151454
 > on May 6th. The bug has not been triaged by the Ubuntu team yet and is
 > still marked "new".

 > As of today there is no fix package available. The upstream uutils fix
 > PR https://github.com/uutils/coreutils/pull/11505 is still in review.

FYI: The upstream issue has been merged, but no new release or updated
Ubuntu package so far.

 > If this takes too long for a fix to appear upstream it could be a good
 > idea to mention the workaround in a news posting for the next release
 > so users aren't confused by the build failures.

I have sent a patch to detect the buggy version and inform the user how
to change to the coreutils version here:

https://patchwork.ozlabs.org/project/buildroot/patch/20260529224037.987748-1-peter@korsgaard.com/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
