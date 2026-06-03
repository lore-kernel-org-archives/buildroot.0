Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC94CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7236A61B30;
	Wed,  3 Jun 2026 20:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKXPw0sChig3; Wed,  3 Jun 2026 20:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440E161B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780518468;
	bh=z9EqP+iCfwKNZg9w9cgi/PF1f8GQ8Ob/fMDuXaeXbbM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULOdU5uaIvZbfAQf0MWMn1OjwBOpK6ogW9qPHaySOzGCJslyad90clUsE/StjDP0P
	 f33FaetbZWHPS26lr62rtGWNANFOBKDgQFPvO5Hk3JCDmZNTvgUwLHNaJubaYrhvbi
	 9AHwI95yyyQdiAm6iLfqmgODalY05auX8+rWhIpM2Go4xzVRbZQbeG9n0lLnUZHLWE
	 5KwJjzOrOtlqJ0rKRFBCIp9ehZQr3ZPQhcvkUoEEkS2q1ta2LQ5IRhAcyqCck798JA
	 H18fhfx7NM+5AapQHIH9NI/vYqv2WD59iSJ91unB2kJchdr4iW76rM/+bp9hVBiGV1
	 0Eilvk4HmnY/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 440E161B2C;
	Wed,  3 Jun 2026 20:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CE52F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A66A4234F
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wenR96fHoESi for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 765AA42342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765AA42342
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 765AA42342
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:27:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 273401972; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 20:27:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUsBf-0000000EJp1-2cdS;
 Wed, 03 Jun 2026 22:27:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260603192009.4179993-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jun 2026 21:20:08 +0200")
References: <20260603192009.4179993-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 22:27:39 +0200
Message-ID: <87bjdrl684.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MphwbYAHayL3u6QC/KbKvTZwem3xDWyAezqLduDKLxBWY5wCp8gq8vLhwBYvUv8bt7zVeK3EuVMFLcse/Qq7TWpzDQJAqsegjfirSbf7RTIkXK8JUxkqs4usbbfFZr62Xk9T+jjIhcGlLSDW8K32EYgq0jQyCxTclvzjaEvyI2kUylKLTN8rz9MzgEe8pAM2RZxNib+SnatWs1j3QXbvtLwJ5SX9+PN7PMJ/vcytzJbHoPhf1+Bh1u4YVbMzdmSVPP13t0aUhAKF7ayRLqaf5QoLusKZMR5dk0ABdMXsrMNe+nlbPNOOZQtUKDh/avBx3fvcFJRvvYeVpiDmINji2w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=k4zn+yh+/e2agjIBGmt9XNAlN/sqV0kVl2s8pd7/HeQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MphwbYAH
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: patch CVE-2026-3276
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

 > https://seclists.org/oss-sec/2026/q2/801
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed after extending the commit message to make it clear that this
is already upstream, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
