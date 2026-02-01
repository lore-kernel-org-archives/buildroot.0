Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289EE6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17129606CE;
	Sun,  1 Feb 2026 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QGWVmM3-5OA; Sun,  1 Feb 2026 20:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4708E60688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978376;
	bh=yebHk85O2EIlsKJjQY+L5k2JuJ5spWxjnWIvifsgRwE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+HVTpjJFEJz4P13kt+PloYXTtkRNt28ku+UFiWQKdzMv98N7/9vVG+2FXa4bbhb3
	 tcG0MkGH9RsVUIQI35M4Nebt0qJa+66zGsmH1BuD2v4KzZMLh6GuhUdbN/8OFTZ8L4
	 6t6WsJ3ybiwagv/rMp+CrpbECU/91PcGJhHcZfD5KV+4uWrWsy5VC/FDJqpcXGra18
	 HcUHkazzHfRs/28waBxd4LmXZ5kEn8TIlnUlgR/IKft4bE8hJHYctJxNVFknAMeApI
	 CvJO64O3eDNVOD1Dbuv/FlYcXc/nEIBrvHkVmUSMSR7Ab1XA89IW2tZPgg9KhsTk5H
	 jP5hDmlg47O5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4708E60688;
	Sun,  1 Feb 2026 20:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A1C23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EF0408ED
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIVgk0G6JEEj for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D7A8408EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7A8408EB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D7A8408EB
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:39:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1815378250; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:39:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeDx-00000005k9q-0kJs;
 Sun, 01 Feb 2026 21:39:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260201184018.3381183-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:40:18 +0100")
References: <20260201184018.3381183-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:39:13 +0100
Message-ID: <87a4xs9p1q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nfxLHbQfHDt3HVcrErRPUEuijCoF5BWrMRMHvdDUrsO+ZPxChSDQqCIyccQc0J0tKR7n27kXIf3eI2hKGStU+3dzTnSt0XR2TByeO9tpx9Q8nOIPA/g/pJvgbTnJ1SA1AoJfPTODClnkdK7NNwrqFvrEvUysK7QIOO6dI6bLtwCcWx7VAPRF0HlU0BjMOnkf2D3VD1lQPSr9i33DvA7AegmaBpusb/gI+wCFutlF7BNVExfDrqLHZPPRi485B3KZ/uiN0q+KeiiftDEybyBugx3e881e+vWVdA8vNdghgUk5o5jZ/cdoVlBw/NaLYJ4kidF+TjbDbrFz9UtpzR97hQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Z8BPbiPcU5K1ZcFRY93HUW6YKSNoeU1b0IBBf6j51bk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=nfxLHbQf
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.2.3
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

 > https://cmake.org/cmake/help/latest/release/4.2.html#id21
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
