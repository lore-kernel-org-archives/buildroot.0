Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9CAC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 15:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DFD40BE9;
	Fri,  4 Sep 2026 15:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzK_-V709ieq; Fri,  4 Sep 2026 15:01:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EB67340BD8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788534075;
	b=fH03kGqNT/DdDVCkooyZCJIxlbJiWxEyIih+3tY4Uqe7SLBMsl2lU1JIgfpS7fppP4r+
	 FSlGjjTRE/Yb9bWB5nBAQjSxHWcD9c1IJR2RqEHgcBbHVeVFQVBhtyZjSs/61CcZfKu/4
	 9rtHXn/o5QHuYHFBi6mfTf98s/5qhQ4Gncqt8r3AScC8RRIPyNnJD0lcSB/RxRsgFO+1w
	 n60rMab6GEu2KEivCJ9UvMrWZCLENEhZCTcaCR2MAJTy/QiNtOpuF2vvo8mPxcq0ng4fu
	 hOShRh3hoIPuqImu3FVUhQ5pbEELSngb5T4aTqpUhAG/ClAkZjpMWXowlwtaphJNJ/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788534075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q4Om+Cge9uVQ+bDjOl4HT4hUELARComt+9mvDv0tEtE=;
	b=KxPunXhjFZ/1+rsCkB/MV+6cP7KeGgjRx+J2jA8pFV1hHyoiXgnBx5Tb6euSLnd89CWn
	 Ytu4Nv9dY9LRuEQM/tMAgLLGRumaffikq4MtCpjPpcxuG6mR0SjSAjcSaSZrJHb4nTfJf
	 0YAVRlYx+YWz3Ht1r49nx3cPTeLxjhLP9vjI0dNuUelpy/LfR27je5g7YW3SeIBXOKDZ6
	 0og/wljYjhcGbmSWhGiTOjI+oU3sQLD7IDwauzeFf4oMyBad2Y+HvtiitOeHeoFzOads7
	 7j7d6naYtE0V1H5DNdZevzatvvHvqhQ83jDjcmv0ozHcFTVbeZWMjuAhYl0s2+j+usw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FGl6AoT0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788534075;
	bh=q4Om+Cge9uVQ+bDjOl4HT4hUELARComt+9mvDv0tEtE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9r8p7DRWwEFj5j0ROHVcpVu7fWS2lh1eFjjJP8INFBePOQsmHafzirKy6uNGUF62
	 rVzKFejLp4Fs2zQifzu7xC4YhkZgEVo8OHkmxGuP9hDPe1zlF6rX5of+Dg3EugeSwJ
	 F/L3MQcgZEqkdZwiJOajremTJbEPEmr7h4coZl9tsiAaQ1LfigLoQDKJ3F+Pq7gr+B
	 Db+aVUtVbp7Spibt+qEzy63G+KWN2x6+sxu4S/MmnyfDw4u3vt69k5ibE0D4LjHMKL
	 YYh4YyBsWEgri3tOiC9onTL1V1jq1s4/CCru9FrUx+9IQl92r2PRs3agzj/rcXg7eN
	 oCiOqJjwMh1Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB67340BD8;
	Fri,  4 Sep 2026 15:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E16F877F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C789640BD4
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ms4xi-ugQjKY for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 15:01:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CB0CE40B7F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788534071;
 b=LzflmimSB4jNcf8UI0PP9eLQZBKWSLlrB/dNLpzBLv+tZcMdseFdmPAtD7rBSH0/5CXT
 BuW2bjoGmsE2Enm6evn4+yJyIrrn9oFdcARGH/UqEC3BEmQETr+Yqa029edZdaCRiNPi2
 ivxTVcgn7Bf2Pexl8RdCniQdJTXTB3oNVa32ST8UIG45Lqu0Nt8RjnwH6oXj54q00ljtZ
 8gjWVD/9a3BpJmq1IHKA6En32SgYBMwvlcCz8Luf/P2F8FWXDPrPuhWhKQFaQaC2h8p1W
 EhBTRdI6TlnM3TZM4DExO+shLSCgjKxnG9s50Ywsz0wjhuhGFyVUxrJoP5Ryex6fosg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788534071;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=dUGXbJFQsahyjMv9MxIk29EWmWtqu37sC/ndGtvBIXI=;
 b=PhfYxbUtKWijqI4TM2egZyNzxi2nIvWDNq149gZCVjIKfGSA9buL5l2PFxu6JsjXubzC
 ImPLOO72KwV9vPm1dT4gPi9Dli78wFw6b47HB5SqEM4Dai/y6Y3iXUlKJJK1GPzE2j2A5
 TN7m9GJnRFnmg8rBMY1Envqta2GqQ18IM8JYzPlO1CUiKSygVX58e6DSlAzrxOP1QfB5O
 bwCoAjoa9sGzXIHJ9WnOXF0iI/GCsgk6+cxx+MOurSAxt3fwyM+hXKdvSv2Y3hzhTU9Cv
 CzfDrVB03m1XIxfbYvPj4/h5Apdel8AoK/wybfjrTAeQ/exgF60OReFJkvMIH6+gHqg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=FGl6AoT0; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FGl6AoT0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB0CE40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FGl6AoT00V2+sDRQVuenBki7XkevoG5ze813nc1gvHQ2gk2yF+i1xkTGgJI+oPQMJetPKuE4jVi9TlUG6vdg2CrLcXK6ft9PmXbrM17AgUDqFXkAtGY8X8bLAm9LlrjZ4KxpS9ZqPHo3aHfcYJsOSBOHb58wb8CXeTAh+8ts7ELGnOp/di2CjcSTcLKPZ1W9WJYya1mAJzp7h9zhr8YlWP/sN1MdORtzefMHaLdXKcp/pSdDjQS2G4HhCoXaJpN6KNzUwdme4o1KjiJ3NVwkg7slGACyLyj2FdB/T2TBIT7PKuzbktbZE+WNt9/CBmGLFP6Q+s9vKL85MklIzVW1ig==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=hbusL1ExCgUCK0Lp5umysZmC2UmDK+6U86TOkxHVFKE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1036358790; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 15:01:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x2VPW-00000007Vxm-477L;
 Fri, 04 Sep 2026 17:00:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260904134140.479400-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 4 Sep 2026 15:41:40 +0200")
References: <20260904134140.479400-1-thomas.perale@mind.be>
Date: Fri, 04 Sep 2026 17:00:58 +0200
Message-ID: <87v78lf4d1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/website: add Othermo as a silver
 sponsor
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Othermo offers manufacturer-independent operational monitoring for
 > energy centers and boiler rooms. They connect a wide range of peripheral
 > such as meters, pumps or pressure maintenance [1][2].

 > Thank you for sponsoring LTS maintenance !

 > [1] https://othermo.de/
 > [2] https://www.linkedin.com/company/othermo-gmbh/

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
