Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37231C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9F660BC2;
	Fri,  4 Sep 2026 11:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vc6ffS4uBV3; Fri,  4 Sep 2026 11:54:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 25D7D60BB4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522866;
	b=Syq4NdhgPJK18qiC32gK17eO5Jncei5HohvRSTxJYm5XmD3ziHXirhMw9L1u/z9cHyIb
	 7KOicU0IuwzE77uvnPmi29w31d2HRqCoKnKyAMhn7zjuY3jteumT+foAuvOiUzKro+N6A
	 8YEY+RMsuSoJh1aegLN5hCzOHuKffzjav6s0HvVpttQ+KQ3kzzL/Eyu8L8D9L+08gcsD7
	 6ffHcIEA1SOQW531JCUHHA7XNn3X++x1JhMV/6BUqtBvPQgPLQ3/YUTvWhOTJ1i8gvOCG
	 RuxuZwDQoveiRfnPHzCO4IhxFpd1JM6oobvD1FPDldjDIKvqHayXl1Ue0lIDT4+NhVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pVl4I/rU4GIvuUGsBzHaE2VXVw1JSJTva70/dxo9+l8=;
	b=e01gkQO026qR3lgx3+UIJyxjPlvlSx0WDbii0PuDhs5pj0+5iTH0UoERHGKkB5Wj/1bb
	 ZEUxj8QUERgow9Gd4JK0PaIcEJo2XnnyeXnL4mgQzKL02fIQCaOmeVcpEfjsuoWH0AcO8
	 j2/kUZIX7f21H827Keuf/iOvFQQk7061UIMvMeL7V4l8Km6dY2yDK/e2qGZFwGqgSxwWR
	 7hmFEbW/IlqTRsiuZktUF3CBGihJGIWJzo9qcD1SsIVrjg/F2rUHs9QjBotWgXYftiiNi
	 IkHXsQWzsUSTgYHb+qhyyzpzB9wNttvVwerZPPxhFu1EMyPI3lP9YPXgMixqOnrEYgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=WP8pd3sb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522866;
	bh=pVl4I/rU4GIvuUGsBzHaE2VXVw1JSJTva70/dxo9+l8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7yrYY0/000K85KVnOLY4pAe63vMEylVB2L6ZY5Q7LEJXgrCOdRFC0i6J1TLipbQi
	 fEHVcA2vWdvwxFYSVL7+GvOJpz8uTxRMjc8vx9jGi6nb3ZCRil0aMtHRPsoqB85RMR
	 7Kk2VtPolQUpHwfm5pFy2sR28fUK7DyNIniOGoj9z7qZCSN66YsQE0cVZL5NGGKPJm
	 He5PVz4ZLYnPnBtiBK49Pog+ZzBTbsMxyFE1IMBsufG3rALuMvhEeZKPorW9xHZ7+x
	 KPaD/qDl61k2hBwDrq7HX9qawuLCw+r7Vekce86u9JlxUO2uIFm5HqFFUYF9q2c3SN
	 rTDYsoWckyX5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D7D60BB4;
	Fri,  4 Sep 2026 11:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00AC92FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB0D560BB4
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBpiDR4LTpta for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9850607FF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522863;
 b=CqcbmLdeND6jpgl5pOAHp0qABLmbRX0NbNZW7JHsCBwQTvY0j1UbC2YCOIwp2jqQXbCU
 MSd8+5ZhhMKgXh4hD7KIK1m+tx+nob2RbCbcYAa8PQyGMqjAm4flG/RGhj8VFN7qsi8Xr
 5NHX4JR/wE4oOiSfqVQLvvTfu4tvWfG6Q1JJU30AGS/fU2qDenUC3ekvqv4L8+DQp0Jn2
 Eq+aFsZAx5KEbMVEanKldTA+vw64TCb7Sy30Ecv9coEkO0Qxijph5aH1nvhuQPe1vS8f6
 hgN4Tq4TVeA7GR3usnDTahSXerNt3aE8mQ9uD8bmOyy9UWMFhlMdcIUkPEXDxCCTFAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522863;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=Nx3lAAuycSsiU1HwLJv7m6qhKZSphfxBT4MLheWHvEg=;
 b=K7GYz6NL8k60CZpBcsr7qPhh9ScShwjTuUmRGB2BSqdqGnjt+xwwfvZp4Xq6PJyi4Ie1
 mFqtk4OEG/uGbtuAKdsmOQrzZRvrM/UwmHF8WdQ8wdkG11xHOArH1sHf996jfPp33taUE
 V/NVdb0vsYh3eUWbGLr67cqb83p/LrEtABbSyr+x1ogwQo5ztTfB9Y8un3M/Iu3e9n4EF
 s/fqqe6R8gnUu6oQy5DW6sejmvi3IdIISl5dvjzh/xgh6l+ErV2ot7f66is3M/BeykdA8
 MksNShKxWJ+FDJP/BtpNZ4RGpKmT244DWjGfrVkijAKc5B58q65RM8/zSKOTxnxY7Kg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=WP8pd3sb; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WP8pd3sb
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9850607FF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=WP8pd3sbOyAF/xit2GmOefsW1gSGo7FQ1ByWljaJgL0Fx4AXk/IQ89d2XWI/TDb8ic2Db3pfJU+DVgLaexL+8B+W3QpVt4L+1i9yUPJO2u7q4eo41v0Yn4Fs4OQqhDFXmwLn2KxFWyaKyTVSyCI38BpEkXl2tJ3JP4pCYjoLbiFkoJVeWuzICBxaXR2Zt98eAzes4KQdH6KDmmrQT6usZtX3o5bdOyGiKEzNc1QrVILPHv7peJkJ4TrVAGauoUTuh9ysBrz685+YUVB4VSvK/rOySWdgQP+4i+6ypicdayu72eKwX6VXf0FzMGqzrScnXnGzdEJxswdcRVeWou2wSA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=uEMnPCEWc1Yjld6+iiuhcjPxfcR+pcn58lPIYUEm23U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 280461336; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:54:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x2SUt-00000007M3Q-00f6;
 Fri, 04 Sep 2026 13:54:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Will Newton <will.newton@gmail.com>
In-Reply-To: <20260904070045.110534-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 4 Sep 2026 09:00:45 +0200")
References: <20260904070045.110534-1-thomas.perale@mind.be>
Date: Fri, 04 Sep 2026 13:54:18 +0200
Message-ID: <87v78lnset.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/erlang: security bump to v26.2.5.21
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

 > See the changelogs:
 > - https://www.erlang.org/patches/OTP-26.2.5.16
 > - https://www.erlang.org/patches/OTP-26.2.5.17
 > - https://www.erlang.org/patches/OTP-26.2.5.18
 > - https://www.erlang.org/patches/OTP-26.2.5.19
 > - https://www.erlang.org/patches/OTP-26.2.5.20
 > - https://www.erlang.org/patches/OTP-26.2.5.21

 > This fixes the following vulnerabilies:

s/vulnerabilies/vulnerabilities/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
