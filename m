Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A3FC2A077
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 08:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B7680FBA;
	Mon,  5 Jan 2026 08:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPQEhRb1boR4; Mon,  5 Jan 2026 08:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3196780FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767602972;
	bh=9OawxypnNtodz79ip2KP6PoxtGzIZtA5jLEsSuHaF14=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibfD530gvrVXeendOCldo9NRMCDYSxcD/Pk1Ig4JKnEDVAbz493JopKIaUrzuoGCH
	 /XEecoid1OzeaIzK4gPpCpn0JRX2mYTDw3vo/qACjBh1pG4TVrLlpaDq2X8OPa9o/s
	 go3l71bhapxGeNyN5TTAyoLGkJ/vtzQwVxWuy5XXac5m4VchRozqP5/ZubSjSxQUb9
	 UebiVgXIbyQUjFycabx4zcLM5xqkaN5avjXd5POkyvwI+MZWUX1CW222AkLxl7m5Pb
	 QwAqy0iqF4dTCCQ7cxz2CwkKJHqGUp+oVHS5tzixyD5tKoiCle6wgJ2YEOuQi6tGYI
	 cwjPn1m26IJXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3196780FF8;
	Mon,  5 Jan 2026 08:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F2A6E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A996087A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3W5DtklbmUd for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 08:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D09D607B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D09D607B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D09D607B4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2034230554; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Jan 2026 08:49:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vcgHD-00000002WIp-2CHe;
 Mon, 05 Jan 2026 09:49:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org,  Michael Hennerich
 <michael.hennerich@analog.com>,  Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260105081456.2799173-1-philip@philipmolloy.com> (Philip
 Molloy's message of "Mon, 05 Jan 2026 08:18:20 +0000")
References: <20260105081456.2799173-1-philip@philipmolloy.com>
Date: Mon, 05 Jan 2026 09:49:23 +0100
Message-ID: <87bjj8xx4c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ENShIBdJbgK3fudRtFDNn/66DZ/441SJY5UUuiRTB3+/LpGfaBV7XDNhuNxYlZRZKj++pmlxz3OZI7dLmrL/5ighVDr3LmgtPlPKIWauOvOYJ8EkCxa9zgKPubBDXCyBONRoVnfMeASudzTzzyfyYFdBfaYDWDMaN/tFHeUUiKX+Z14xgX4WihDbqjjwa/z4D+2kDGDAmF5TuFvMPJ7k9YTqNzq6hOioNc70RJWP4LZs/EQeCucAzEROkFuGj12Drfovvr+3Vt5JFOzOwxZQRz7RyTqW31gYq5jt0lFKFa44yloGGL5OS4l12PtLXQ9rayDliruJFgnqeS+pnQXb8Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zms2ox0fKEMBLJis2xMiS8PQIgufjh61+AtmoMvnhFY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ENShIBdJ
Subject: Re: [Buildroot] [PATCH] configs/beagleboneai_defconfig: fix
 whitespace
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

>>>>> "Philip" == Philip Molloy <philip@philipmolloy.com> writes:

 > From: Philip Molloy <philip.molloy@analog.com>
 > Signed-off-by: Philip Molloy <philip.molloy@analog.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
