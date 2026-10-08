Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E64CA6017
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0CD4090C;
	Thu,  8 Oct 2026 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9qPmM9biDNF; Thu,  8 Oct 2026 22:10:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F2A640925
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497436;
	b=iZd7bmv2L4jCL1jp0fs39s8Ph24FiRbAWFPBeHmj3rW1HmYFx7TivsuYpAWkbjJly1t3
	 PSpPhgzu6yojgcvVTWDLRFUsX/MPBh70x9jM9u2RB4vBL72A0i2g/36chKcPP7gIPMc/+
	 Yq2qUaspxrCWf5MazjTxtclGMUmwhyrd374TGNN4RD0npUK2ZvEO2+ocUPVoFfGZmxZes
	 hIi06deGlgy3zUDl3rp9lNBK1gzuTmC/xtX45hmlOTmoTDvfPCfaajoRYX4W3J8UiAxmj
	 S9/dBdQSernte7iAUTcJ/1tQENtv7T5xBhyxMYW3eh5om2Drtr6D7QeM4xqOpaEqVyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JQc/StbwViPM/xtf6Bm/v3usZPOHgqc+yQbOnSyxDPI=;
	b=ZXq2h/T8kYRMiTfeg+yVXkOk+KvZgFxP6PjviBmw59T29nshThX43ue53HCCk+38ehM0
	 MROu1qmR0Gq1CpYq60EmJSgLVIZg/tu/LctyV0AwDKVsmmDVtcOY1+VFORnzLD79pAcAM
	 rv0Ofck7hYOeCrF9x+y0mD3sgfn8yJgx9R89/l5USL15WNh26kemwnoBzv0yvyYsjn5oy
	 8RFDJrls/1U/fcfYKMVBlJ0OHqXs4fTXg4JA99uGORJIpghXcVxyjKKL5JQqOGjeSpR3U
	 Ni7NnA3FpGIqEd85mHbFGA2lyaD56I5epQxpgAlWLWhNf7JPJIEOAEzC5orTYgFRuAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497436;
	bh=JQc/StbwViPM/xtf6Bm/v3usZPOHgqc+yQbOnSyxDPI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4PeuTLFXdU+Mx7HHtpftTwbVstQR/HVIguN5aKCt1ctc+zlIUd/JbubgZAfENrkC
	 EtQ+IznFZbgRPiCm0k4fMX7Zb0YskQ9QqbOPHPLkTaSREQl+PUJSImBApJDhWcameQ
	 HPa3Moc5ny5MqcGtgmpc+03BdrBu9dB64PZE9ltiNnH/WoiNb2Fr6zm7wyLXcgswPC
	 Y1v/dEPbs2CpWA9cOY7qkjTGv2Uq6efoZBm3nuUP6g8X0v+ZP4oH0o2yZsyZ3NoIhU
	 tJzMRPGAPxhboHWD8y0O/i3iAUFgii+RzsUHIcGk8J8AVBKePVRM5qms4Y3h5fwv8Z
	 /DXE91SRogQQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2A640925;
	Thu,  8 Oct 2026 22:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 700832E0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56772813CF
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrH-FN8zzyzu for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EA189811FB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497432;
 b=Td6IF3yVVIKbAFnl3B6Jw8NMSnhknNbrigIDZFs5W2/mla9n/12aFSJ5R/pPFRz/CVqu
 TplEdO8zI6ybnbVMYNwJfXZb1KAZ41oaa9seEUOSIF2EP+vzDpLOUA1vELmYzIOjZfnv/
 Xx9bCC56jvanu8zz41MC7GeBwvUaM/xBn9vxqc0aElNVakMdrKIAV1Fyx0zwhIRNqwnlA
 4v0AfaeME3zREKwscYwZ3pgMq1N0HnCPjSpyhTQ3Vykv12a6X8i9dPIj07happdrATBkC
 +74IBQHXjBMj3oysp09L3KQnyZP+QxEtPeL/PYi67QdpT4ncU9Bl57Ofj6n2zUxc4Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497432;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=t4ucssU5qPEKWptbNwupnbWRn2MQF+M1mcL/cuzqdIo=;
 b=LCzowHmKOKDLRdPIAZx96+g5d6ITKZ9XX4P3Qnn9QWIETixo5Hcf9rD1HiVpwmaGHpR4
 BlgSY6ONsd+HE9AgA34v44r/NVLAolJ3N7CK1fBkoZEim2sTvxJoBQqs+IBZ9pQiOMvvB
 8iqoU8aKqjYyJX0jbJBkVZPnbbYcMHZWltpuI5dfrFBFsBAZFmg6r5+sBJ++ZIV7k6l2P
 irtAQDHjCOq6/rP4V9yGad2lrEEPWu2aUSDz8Hqw3d8nq1Yr1iY5wX1OlGql8huZMsDFh
 Zc0R6KENSwMmHZ6j27PpcnmvM0hH3015oFVxciJtupWbey/A8naNjBXMWX49n2inolw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=lyGUzUp9; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=lyGUzUp9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA189811FB
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=lyGUzUp9Sn4lPSJeDx9DmdLrmhiQSzujWJKhOhOw3x8LWVfEIOSkYuUuNp4CdsOa3zxqFF7uAlQuU+LsRECe72QZmXdl95f7ZW9F/uC24X7DL8YHJ0MZiFF0ynpH87WrA/3aDIgzCX2wY+oSmRdrTOvJvZRmS/nD+4PF9o0bxRQMzenu8CakAC21p0NapICDf9zZtLLl9mbUVPXNtZ/a9IG76OmiG5RZUn1+sOKuEHCZhRLt0UJxQ56DeaHGdkIcsMDW56UyNXD5DIAMOCJD8OP76GqUQbG7pdFtDA4+cU/g+qmc/8u6UaKCQXP7OPT/+7/Wg3PFTMUc34k3WZcQDw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=2RdMQYHszudERopvKm3dtIO9rbnAiuxaLazUm2Fle8Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1679475024; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 22:10:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEwJj-0000000FShk-24td;
 Fri, 09 Oct 2026 00:10:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261008182912.3700979-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 8 Oct 2026 20:29:12 +0200")
References: <20261008182912.3700979-1-bernd@kuhls.net>
Date: Fri, 09 Oct 2026 00:10:23 +0200
Message-ID: <87cxtjzvw0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.14
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

 > https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags
 > Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
