Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EFBFCD0C6
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 07:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852EC608FD;
	Wed, 18 Mar 2026 07:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_7NIF8zALIW; Wed, 18 Mar 2026 07:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13685608F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773819821;
	bh=lvbaK9GQFOsw+u+++22UYDEiNo3hsHvpzsRK+o2wEOw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eON9f91BQ6p+Rphl6AcI4KP6EVkYQe2NYs+VdfyEXrkrO4LKquNvOS5h4oEAd+qKR
	 OAGwwm1ZxxkLpWibtM4FBeUyxKFoPW3xBKNj+g3gjHnSXfjPcOcTxBXrjXDcgB+E/v
	 qQbf1lP8Cr3jsiiwz4j4OIyNicEfAG5pKuXTwqwFt1Elq9i390AreWalxGEIjk3Imi
	 ek+wiOd5MLR0VUrLhZtI/ovSIAo0epHoa0mJwwJwe0QygOcZfSaAa58Ccv0cF62HgW
	 mxrOBK5suvFSX7NGCJecBzuMoLFB5nClzm2a2jLeNozF3XSauN89pjcTH9fNA3z4aR
	 36ahwSwiaEEwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13685608F4;
	Wed, 18 Mar 2026 07:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE46D3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A3240F4B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0t2FF3pdH3w for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 07:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E096E40E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E096E40E6E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E096E40E6E
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:43:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -321597989; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Mar 2026 07:43:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w2lYw-00000007V7r-3u1L;
 Wed, 18 Mar 2026 08:43:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
 (Christian Stewart's message of "Tue, 17 Mar 2026 23:14:08 -0700")
References: <20260314230517.4160-1-christian@aperture.us>
 <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
Date: Wed, 18 Mar 2026 08:43:30 +0100
Message-ID: <87eclhh9b1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=vRHi1VDfi64PaHj8l4iafZvXdlAyJdnBMlIb2io+RoGyeVWimoUGYOR5Zoa4i9+Y3FGUUNRe5s7/rdFfgMXLQwIgCETrUTnL+nFHFMo6hY4pWwBh3TJ0wEr28qzcrcW1NiN8aBPkjOjPJOAOVb7lktrSfFAlD4lo9oZ9GxsCjyUcPa6C9bqgKV7eSipxl2/EqfTDR0yTQdR9TxIcKzHLH6jYwr4v3YanL+Rcp1Qg3AIwlRdYjuCjwXx8JZ6ZQiv2eb1IvkVdI2VFvbdo4Lkun10knxKIuw2inYEZPPE929nPTcfb/QSVKb8DfwUFbM+jYXAyoIVrfvKBG7/yDoc83w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=FFXwDngKEteKLkWaJzTlxaprpNXEfBH9hPitG0LVoNc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=vRHi1VDf
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix
 build with Linux 6.19
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

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > Hi all,
 > There's now a deprecation message in the aircrack-ng repo:

 > https://github.com/aircrack-ng/rtl8812au?tab=readme-ov-file#these-drivers-is-deprecated

 > Maybe we should drop the package and instead support this one?

 > https://github.com/lwfinger/rtw88

lwfinger, that must be Larry Finger who passed away in 2024:

https://lore.kernel.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67xndazaeoyjwblhuzichscyxoz@5ttdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c1385e18f8e0

Given that it is a backport from the Linux kernel tree, do we really
need it? The rtl8812au support seems to have been added by commit
4f8ec8927bc292b2a (v6.13-rc1).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
