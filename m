Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D269BCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F2C42E22;
	Sat, 30 May 2026 08:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOo4Ex7p3oKY; Sat, 30 May 2026 08:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD59440D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131588;
	bh=Vwkain1Q5qE3lSbelFOkcO0NBnI7QUIFeDGuknR1s6g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fi4rFkfhXGKUnQOdTok+uIF0gr22QiITtm7ct1BvLSE3SxTS20gvIlk9sCMtDr6UG
	 zEbRzd3VOReMlP3cN4Fw3g2I0X2/u+2g0OSOwW8DGvMW6Gi1qcE++SWGn3YQuhDDVH
	 KqKaU8NblDSkVCMI5rG9G2jIlaXEqP/+1nfJEf+daCmh1CSpUd+kwyKCj41lSvxc24
	 Orwt/5Mli5AUNOK8XA/zDxgUNOQP3j45DXVT5yvtaVHlLh58cyyoy2kXJmKYZFqzkg
	 m0egfFZ/u8tFdYrjlCeDKJnC9oc9HfHvQ5Gd9XiO4HiTRNRGFA1HKD0w21TWoiKO/M
	 7+cM8MNp6/ZDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD59440D97;
	Sat, 30 May 2026 08:59:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1784F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B08A940D97
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id befz7ghLd8Lr for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9050040D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9050040D35
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9050040D35
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:59:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1240658933; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 08:59:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFXh-00000004jVl-1MnP;
 Sat, 30 May 2026 10:59:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-4-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:11 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-4-thomas.perale@mind.be>
Date: Sat, 30 May 2026 10:59:41 +0200
Message-ID: <877bol8e82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CfdiMUxnmE+Vcrew3nMDR3VOklYv4G7swwGQG0SqtXyhFRb4F2B/Dcuyb+ySdRtZGjZiMNV5v7Y91D7hXJ6VXvrD8lUBQfKISHAD7G2/VF7zAQCUZuykUQgo6WMqwFnHtNP/zVDuwP/HZvJSzUhwnHQBhz2N/QDsOWQi6c//yGR7MfdzcEZkBhN3Myyhvc/0K4gr7r3tFnrUAAo9AxEPz31+K/rd8DYh3/qN861UvmjHVZyDnHhXfDha5yATWHOmLOlE1Kxsm87SgUg9g+beIAejaxA7vpIFh4D8TuCC9H+dbPc55BECiuQWR13ccJbhyIDQm6l09JDbfDH2RU+klw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=8U28L6g+obdzudskcKPh0zsNhgehA/INn5LFKyElBng=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=CfdiMUxn
Subject: Re: [Buildroot] [PATCH] package/cups-filter: update CPE vendor
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

 > The CPE "cpe:2.3:a:openprinting:cups-filters:*:*:*:*:*:*:*:*" is valid
 > for this pacakge.

s/pacakge/package/.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
