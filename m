Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD0EA812E
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 15:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31E8E81320;
	Tue, 10 Feb 2026 15:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK6dLwVH3Mtm; Tue, 10 Feb 2026 15:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76926812A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770738316;
	bh=Wu7U3tRiXjLboriFHqfw1j3GaKLFWPbIPlsE3XNzgE4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=g3Md5dDAojiJk6DXwhejgddWLOzl9/KNEhHCi2Y1ik+SC2n1YL4IW9MyCwppE0RJV
	 1YtlX2EXYMToxbrklGrzJ3l1zEHpnL3wPdEm7SOqjnTdIGjSRyBbCTmbaYSj6iJJ4q
	 bsc+PESx2DQtwboJeWNzr6k/3nKrDI07cJdK02+lZsrKe5SNA5gxgMRRDJ75ngp5rv
	 Aq0i3q9OtmR30+nMeV+saooH08RltsfVgokQRBmKfHjvhrXdPYdOSnapuNgvSmqqFr
	 LipGYC6TZpc1FCbLoQJdu3xpQRlklIUOdq0fop4UNsbxeGPn4mBUhv/E3SSrIqS8uP
	 4l/u5ZMmyc6IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76926812A8;
	Tue, 10 Feb 2026 15:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C624219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 618408127D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqXPNnFCxH1z for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 15:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7506F812A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7506F812A8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7506F812A8
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:13 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6D47C2C801B0;
 Tue, 10 Feb 2026 16:45:11 +0100 (CET)
Message-ID: <cca72048-2c9c-44a8-b964-340dbd148aa4@bubu1.eu>
Date: Tue, 10 Feb 2026 16:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260209203132.3837056-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260209203132.3837056-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770738311; bh=UrYE8jtm59baCSp1r1TSkBpEsFUapaNF9pdZIR43x84=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=tbSbYN9eG/M4PCP5229Le8rce5VOpueJCWSM1uiWqI+ExEZ2bEEg0wM7XOFh4Ashk
 3xyWuFpXUXyqyODR1C4CbddOnewGOP9rQteeG+CxnPIq7d1uFKpZ1ayHnHRFkl4eHX
 7H0SHpXfon+YMaeGZKYIYmqD55SVm8nPdUPmfhF55QKClsGxGv5f7SpDfyfdzmcYgD
 edvkErJ7zWjQz5zuUe8MY6knBfZD+LPzBSG8AbMLBgDD9vasVrTdZDPYPh5C6ZIkub
 BN9BgB4ZAS8qGhjTpxg5asM7tw7oJwPQ9lDTq4mdzp8CtQghThdxQR7J7fNXVqaTz6
 MT+sMrBZDMHWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=tbSbYN9e
Subject: Re: [Buildroot] [PATCH 1/1] package/m4: bump version to 1.4.21
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/9/26 21:31, Bernd Kuhls wrote:
> https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
