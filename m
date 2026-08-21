Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1758BC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 14:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3D180835;
	Fri, 21 Aug 2026 14:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKITRKmVFHes; Fri, 21 Aug 2026 14:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787323458;
	bh=s1iZGmW+B9yX9U79YoEkUtjFNFgn+GbpGeGNHFLqlzE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/i0iAsEVXbZfeozT9/pwS4PDErZ2LAmoiZnU3bJpEfDCG2iGFYLIK9QIfdiAdpl3
	 Cg7neOuAJxHEi14ucjsTEQ6pZTd42aerlvF4W6YUGA4c4nLUPTOAl6F+MKF1opx1Z8
	 Yj+7P/64Oe24/rZnf81QA7da71kZhC/BDzVay/hZpMW8A7+YPCoggIDVfXmoIoFDKF
	 2j5NWRyb89+4WyA2MUxhgydpAx7J31ge48dbIMAoraxe1nczEd38tjlpYR+AYP+SVJ
	 8RP/mZnCZeiDPcMgYVBWcgnE5HCNzSYoNeAocDrNEd8oemlxnL7Kk6qzko6kZJscbk
	 f06C28J5Fp+zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F3F8087E;
	Fri, 21 Aug 2026 14:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACED4336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F4B340CB3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVN2B1Ka1C8L for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 14:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=SBKg6OQH
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E741440C90
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:44:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SBKg6OQH/59YA2cRa1ADnDI6XT+tkZIAKA/JOeI8F7n5TaPjbsicpXpKfRNNUYBmRXunPIfqKDVwSnTNd8HRRys8vBcH+3nffi21SLBgeg+KBIlfe4ine4gRZmMJTqVvbTrUDgiS+xbCSKWG+uWSgfl+ZSWs6kwPr2ilj6l/d3BMNPM/u1lEz0P06Q510VIABldQKHUsmHtn2vcjrz3E2wFo55fwyO/5EA0GoQ4CnYafoeFR2HSFjlFz7hXOFx192LOkT3mdWAqlE0ovDBHr8C91VwueExzATQS5C4y8SNnbjixtdRy9S4489tT4tmt2nqty0X/TCeXlUBIdtVBAvA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VOqDHUIHLUxBdmuoj4Qedjo3yTS653LA8k2R48/SEF4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1011033242; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 21 Aug 2026 14:44:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wxQTT-00000006XJL-22Ru;
 Fri, 21 Aug 2026 16:44:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>,
 romain.naour@smile.fr,  Jimmy Durand Wesolowski
 <jimmy.wesolowski@mobileye.com>,  guenther.harrasser@mobileye.com
In-Reply-To: <aohFF1WM2HaL7WU9@windsurf> (Thomas Petazzoni's message of "Fri, 
 21 Aug 2026 14:38:26 +0200")
References: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
 <87qzkmq21f.fsf@dell.be.48ers.dk> <aohFF1WM2HaL7WU9@windsurf>
Date: Fri, 21 Aug 2026 16:44:03 +0200
Message-ID: <874ign8rf0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openssh: enable DES when using
 libopenssl
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > So basically, the idea is that if we have OpenSSL, we don't have
 > crypt(), but we have DES_crypt, then we use DES_crypt() as
 > crypt(). Otherwise, the crypt() call in the OpenSSH xcrypt() function
 > remains crypt(), and things blow up when you're building with glibc
 > and you don't have libxcrypt around to provide crypt().

 > So indeed, we have two options here:

 > - Always provide a crypt() implementation by making libxcrypt
 >   mandatory for OpenSSH as a whole, not just for the server-side

 > - Require OpenSSH to provide DES support, which is what Jimmy was
 >   proposing.

 > I honestly don't have a strong argument. My vague feeling is that DES
 > being obsolete, it feels odd to be forced to enable it. Though perhaps
 > libxcrypt would in fact provide exactly the same obsolete crypto
 > algorithm?

 > Peter: thoughts?

I am not sure what openssh uses crypt() for exactly when the server is
not built, but perhaps it just ends up building a bit too much?

Anyway, given that we already use libxcrypt for the server part and
libxcrypt supports a bunch of other algorithmns than just legacy DES, I
think it makes sense to just move the libxcrypt select to the main
option instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
