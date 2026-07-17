Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB4C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EA480E49;
	Fri, 17 Jul 2026 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsy6reXkZiQE; Fri, 17 Jul 2026 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92B980E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784319472;
	bh=wawX8wXFzrvR1NNGOh0DR/5GZgSo30oP0nn4H1Q2lZw=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4nYnjYwDNKd9vgx9TvX+aut6FRL48fxjHYcVIktcV+M+9BaCU9AeBpvUy8s9RVoA
	 Ow33TSu9RzgFZaKLrzKe2/XtARr3eSG9g6Twgdf8774OJV3EOX6ZUEuYlYLiUi5pck
	 GukVNb0+NFMRzDeB6lzWmm5Hb+txwoYLGqYL3xP9HxpgpgpiejU4kaHrSek7jJDnn0
	 NeeOaLMcB9Qlf0VRGqXzKyTpklKSHDuSdaWvmHnx3aC1buspWR5KaYTUdeLUV0vDYJ
	 RePv0fol3AKBTiIjsZ7z39GPv4H7eoA8oBNK/vh+5Tav3h+gBXFIjdCVXLj/zDMdmj
	 7kR4alpf/x7mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92B980E50;
	Fri, 17 Jul 2026 20:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7458836E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 20:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 719B880E50
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPk2wQcHf7Gk for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 20:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70BC680E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BC680E49
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70BC680E49
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 20:17:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1173389924; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 17 Jul 2026 20:17:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wkp0A-00000000EP0-3mSt;
 Fri, 17 Jul 2026 22:17:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ans dhdij Bdkb <ansdhdijbdkb@gmail.com>, buildroot@buildroot.org
In-Reply-To: <CAJO3WigJJMVOKW43ujKRuOQSjnACgnT-7=n7XrVXTy6HyXc+Qw@mail.gmail.com>
 (Ans dhdij Bdkb's message of "Fri, 17 Jul 2026 23:35:49 +0400")
References: <CAJO3WigJJMVOKW43ujKRuOQSjnACgnT-7=n7XrVXTy6HyXc+Qw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 17 Jul 2026 22:17:42 +0200
Message-ID: <877bmt74m1.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hIgOaqYuS5bNXKhecOclDpwYk9zJ6+VzY3dNXyo5X0mu8NRB2/VNBvIwkMPeeVbgdDoc+/DxfwcD5X0R9WwXs53gmMlYe+v4i1EqLrLYM/FJST5mlPxp+5yern6A7FrFixMDA1jy/VQC4fiJg4CG6XLoN0qqAqM4HoE8+PRp8nfUhbqWphfZInn+fPvCh9ooe8rA4eHOzxeNdkgKTEjUDCExJuE9d/dzB/pK6ZgvY4wSrBl+oiTpv3GIxch6EBd4JqRs9ZxeEyQKlcuFWE6OGeEKZ4xFWHoU0Fdl1xaei/DCIn1jQZV7pJq05nhIeZGzLBZYYXiEATRWkP/FRDmlPw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ain6dlmPztOO2hyU8fRIen5Bqy+2ZV6Fnu1MZdkcApY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=hIgOaqYu
Subject: Re: [Buildroot] Please bump the WireGuard buildroot package
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

>>>>> "Ans" == Ans dhdij Bdkb <ansdhdijbdkb@gmail.com> writes:
Hello,

 > Hey,
 > As a user of your WireGuard buildroot package, I thought I'd let you know
 > that wireguard-tools version 1.0.20260223 has been released. Could you bump
 > your package?

I am not sure I follow? The wireguard-tools package was bumped back in
March with:

commit ef12f5bb2c79a533e978cbaaf911b5ba96e97439
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Mar 20 07:53:29 2026 +0100

    package/wireguard-tools: bump version to 1.0.20260223

    For details, see the announcement:
    https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
    Signed-off-by: Julien Olivain <ju.o@free.fr>

What Buildroot version are you using? If you are using the 2025.02.x LTS
series which indeed does not have this version, can you explain why you
think bumping the version would be good there (E.G. specific bugfixes)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
