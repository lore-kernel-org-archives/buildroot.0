Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84B5CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 601D961AC1;
	Wed,  3 Jun 2026 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXjA_h_fizRE; Wed,  3 Jun 2026 18:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70FD361AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780511076;
	bh=OEUu7py+QFmYJyPtr35CaYBv32/oxvR1nyEpMzWnGyY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faky1YlmiQ9VNKD4pzuZXLAsCTpXFnPmHB1vYoYZ7jRe828J1tJI2J6KEENEmkpzU
	 1hAIoT51ye5cRf3dCE4E723xFrP/1eHLz85MGO2hHLRoUvIi3wK2gLJnNavRSbJWEv
	 ogYvtR2S/zYdZr9PD8bySCDsykAsiwtEIYYDd2+GlfIMmLBBIX2En6RtJDEF9GFftA
	 4pkJ55UCEaTx373tmT3ok3GJMICY/27tjTZfAYGBediXS67LBkOha7T0w/70bevpqW
	 WD4LcGew4Hd6TyNAoAx2SK5voUm2tivuFH0I1/t4psUI82nx8hcQhBfIuZz2MC8Nz8
	 fZxAl/G5y2Jgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70FD361AC2;
	Wed,  3 Jun 2026 18:24:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25CDD192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17122425E1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXoeYu57hslR for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 902CC425DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 902CC425DF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 902CC425DF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:24:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -509689628; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:24:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqGF-0000000CdiE-3ciE;
 Wed, 03 Jun 2026 20:24:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260603151317.3499635-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jun 2026 17:13:16 +0200")
References: <20260603151317.3499635-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:24:15 +0200
Message-ID: <87a4tbpjn4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RmY3dmTlgkppVcEO7eDBIM7DUCdvqFqcHccYJxn2Jq3xjPpqduYLbZnpSY9vdDr7opv3HCddWbcHjfYzkby9lihefPijvUJggsgEUsQsJNQQjpRmcd/0yXPK7EhH0uvOAZM27cUf41u990Bi9hJXjUFeSHZJlZbLcpzJrwCVFmbq38BRm3VfqNAz2USf66c/dTBpfWFZ8NuQKavCRgWdt2r7/DZHSJEcU/8kpNRQt2iuZFYJ3E4n6274WnSTNf8MLt+XMg7mlYMRthcZPYuAFZLZt/CoaOiS4COlsUcDTHvLjJl/NH32nySX3pqiB7D+PNr7+d4eMIG7TgfwRwmKEA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=EHO/RAdc/9jk5ap13ya4A0KSylznf7uR2GSez1L2gpM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RmY3dmTl
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: security bump version
 to 1.6.18
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

 > https://lists.gnu.org/archive/html/freeipmi-announce/2026-06/msg00000.html
 > https://savannah.gnu.org/news/?id=10898

 > Fixes CVE-2026-50031: https://seclists.org/oss-sec/2026/q2/794

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/27487f8f0d8776aa7d84a6e415932322eaf01505

 > with the exception of:
 > - bootlin-microblazeel-uclibc
 > - bootlin-mipsel-uclibc
 > - bootlin-powerpc-e500mc-uclibc
 > - bootlin-sh4-uclibc

 > due to build errors already present in version 1.6.16:
 > https://autobuild.buildroot.net/?reason=freeipmi-1.6.16

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
