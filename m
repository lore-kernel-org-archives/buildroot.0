Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE7D4335B
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E640182337;
	Thu, 11 Dec 2025 22:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XDaWW2MNFs7; Thu, 11 Dec 2025 22:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AA482333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765491740;
	bh=UPWXClV+xLRTsLLlxrdtzmGrdTxB70ePLPNfe54NSB8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDohiB+WEqXlXyzaHSyMAgyvTsFGo1kHgea7wdgJfqPIP6TE1FShGojQRFPgXPF1Z
	 B4SAnbeYGFxHVLEkSzXEwXCFo23xywybJXTzULrI3u/HyOaLb6PKN3dcOGVbw9XeV0
	 sVPrh8qrmyEBuWb3jMap0oUu5FGlNySWGPJbnGuBVP9QRZ0BlRc8W6pax8KbIOa4mo
	 R/mOhDczbUPwzr8x/lME/cVyL2qLlBstJC7pRfM15OA+WqJycopOQYxUHmWsJZed7A
	 G8mOyvvfh8GEQN5gLDfOzlJcL0fTHotf0VoCyGw3B7SCmgAhT19MXUwJFC141zIl4t
	 9sZj5tMipj6Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AA482333;
	Thu, 11 Dec 2025 22:22:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 847812C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76FBB40B77
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVOB9_f0AYvW for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC94D40B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC94D40B75
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC94D40B75
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:22:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -724915734; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 22:22:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTp35-00000001CKO-3pUM;
 Thu, 11 Dec 2025 23:22:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251211191953.3189198-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 11 Dec 2025 20:19:53 +0100")
References: <20251211191953.3189198-1-bernd@kuhls.net>
Date: Thu, 11 Dec 2025 23:22:11 +0100
Message-ID: <87o6o43bho.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Xr4LXktDgTNbTBiMg43jdlSVR9Bpw8uE2IPn++ZTjxBaZw5WKk2xDmScS9rmSwVneP0D2rzvnWqHKcFcdiFzykygUsuu7TXHgp0IQIw0LPPW8BCsE6F5f5WOVAZRTC6ldPx0ANScECtzhuX/7UulaBshoT7ooiy2WKBWpp6wuueWwjuskHL2D9uCxF9Pimv/WxP072tRDRLE1gkHxSvo7/uJah/K/hcY+WtJAIM9RsqWCTVwt/y6Qj0Sa3x48VhodQtgTz75myMXezpymKNgr4SJTTDndDWEoH5rFpFwXCSL6fqX/kY7szR9UkowyxB89Y8F9MUIy2kPFJVCpLKh0A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Rxt9jCWpk1A4jwo0yPUjIgY1LXg4iP3suxWaKmEwVB8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Xr4LXktD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: security bump
 version to 4.61.0
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

 > https://github.com/fonttools/fonttools/releases/tag/4.61.0
 > Fixes CVE-2025-66034:
 > https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
