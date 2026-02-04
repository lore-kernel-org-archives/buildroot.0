Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC41E9536E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A8C60A9C;
	Wed,  4 Feb 2026 09:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxmb6Vi6iQC4; Wed,  4 Feb 2026 09:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD97360A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198920;
	bh=xLsZCI2+68wl/ePWtkg2fj1XmLVHG7C+H0PMCCJ76OI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bbe17SXxTAUZplDlv5mFTg0SsjLwwOWDSUTAuudDszSapJE1lKVowQJjMGnHN948k
	 xotro64ErfbbGHKqTTvHVIj6ix8YhET4nbnAlfHH/7bJuBZR+ISyo1/shRh+svT+Hf
	 /tVybIgdDJsBDDFTPSktQBSk3yine9q4OGoocapi+Fli6b6xukGKLdq/5GFxgzVxSF
	 U/gKq5gmlQBEfYl/TM05ZZoAvsJzuzqra8NUB8/fxhmuYCJv+Yuip7QbbQseXc83cI
	 mDyGfS/FcJJsO49JO09vldQN9ibp+0ZpJT+snr5O+mBjENw4HOnfWZQtyGUg6mBprM
	 erz7SZdoQi2ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD97360A9F;
	Wed,  4 Feb 2026 09:55:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32097F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E3E681A65
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab1aX_l7jK_X for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 037F381A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037F381A5C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 037F381A5C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:55:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -662445930; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 09:55:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnZbN-00000009Wfp-2g0w;
 Wed, 04 Feb 2026 10:55:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <520804aa-cb63-4ca5-9355-76e3497376c6@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 4 Feb 2026 10:49:19 +0100")
References: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
 <87ldhahxqv.fsf@dell.be.48ers.dk>
 <eec3c48e-3ac5-482a-a85f-074ccf485fe6@benettiengineering.com>
 <87v7gc7sds.fsf@dell.be.48ers.dk>
 <520804aa-cb63-4ca5-9355-76e3497376c6@benettiengineering.com>
Date: Wed, 04 Feb 2026 10:55:13 +0100
Message-ID: <87ms1o7rzy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nT5bS78MU7tc/0HICH2/Trc2ySbPlj2tNUYyPfqQDAjMwve/JvQSG3mLr3GjBKV1tAwDrU+3QdsGWZenbj/TL9d4cYs3MVJR2fp7gZrowAPResRBQzkag8EPrD9+gk3VVB7liMR2Fmw4hS6MAnhEYHqUZr2Mk5usRFVQeZhBgJURZJ9YBV2TPWcNzqhzYrXHMZYd8ELImOWxIQVx35lSCk6UTdQsNQo3OU8ks0asTMa8xm1ePwCXevUwJi8pnmlm+5x+u+tmmmtRzfgi5QzTAOjHZ/IRKiVYJhcgwF0stSpYDXTm4i0awOMgUdZXKm6fAXqsRlG69+P9IcqT712xrQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vFs7fQlqkCerUPsEnX6SaWKkbeUjZXZs2932N0QKBsw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nT5bS78M
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.17
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

 > On 2/4/26 10:46, Peter Korsgaard wrote:
 >> > That's why I've pointed only those 2 CVEs. Was it correct?
 >> No, they were fixes for issues only introduced in the 9.20.x series,
 >> so
 >> we were never vulnerable to them.

 > But if we were bumping to 9.20.17 they were required, correct?

Yes, if we were to move to 9.20.x then we should naturally not move to a
version that introduces new known vulnerabilities - But as the version
we used before was not vulnerable to those issues it would be wrong to
say that the version bump fixes those two issues (E.G. the LTS
maintainers would think that they have to go to 9.20.x to fix security
issues, which is not the case).

> Otherwise really I don't get it

Hopefully the above makes it more clear?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
