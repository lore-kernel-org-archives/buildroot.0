Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF429C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E109404C9;
	Sat, 12 Sep 2026 07:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RocwEEt_EL5C; Sat, 12 Sep 2026 07:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AA86D404F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198796;
	b=Wdygl/smDSVuD8wRWyq3A/E0GFdsdqsNUFOBB7vH+oipx3gXDQeDYbdavEqDAC7TTFz4
	 sfrf/gDEANdBTbCzNp35+qNcVhcV1UV+OYwenoxnLwnFQaXi8NCVdvRF/jD6nTBi2VRMb
	 jfjKnkMBSnGYUZirmzhLyKuF3rmrPpWKxQtFZjfMsHImT60A+DTugRKqYGYPyTqM1fepb
	 HVJBVV2CN+VWNjvr+hj+v4ko5mRd4VQrYbTBx82UQ5Qk8/TNyIW0qXpTipvvtUVJ9FfaX
	 YfevDvHq5pvpblZPZpAlF9ne5jfRd03pSfjqfqEWpsWvRe+LbUXQbEhZqisL+CAuY0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZruwKafwf4CDwuYMzAQ+LzwTF3oiNPWZiOpzLEZDq68=;
	b=tKC4IytCCcbsPJk8GXKcbpwwiDRsQ7DNoNyKMSJHQ9xvJ+VWb3dsGf9tCh4bdIdc68zP
	 SqIb4LJgTujwd6dQLDHwi2CQPk2ycWWYYvNCioAj4oYKT0TsZkZ53duHZLDHrT95QqyGO
	 y6WpzAu0LJldUA5OknfELyWhUoVfrcty894A/vrkDz1gqXagDeYqv8vXHoBQtcnkhaO8g
	 EUouQT8uJJQMjPmKgf2iHIA/W6eJ9ZPe2mgCt5CV2uCw5S4TJwh5u7BriweOzDtOJoCfH
	 dDeKFq34F5rufX3cW1yrq0xAXLqy5LR8x26vShKh8O06d6qn31Vz06RgALqcpWEStbw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198796;
	bh=ZruwKafwf4CDwuYMzAQ+LzwTF3oiNPWZiOpzLEZDq68=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAB61AnYn6q+JAm/DJ54ITBMlRTPzHbFfkrVBj9hD1e5IjLN/nzBu0mfgiT49sN9Z
	 O0ZMr4iplqmbRwpsFplfwBG1i7uRNosKxcIvYgXttYn3E9W5MQoClW96a6poIDnKPO
	 +EHbUQiD1zEOymULJG468eiAneBJGsTMvCam5fR5Ky+DZIwIFx7HhfuefOcGF5J6s1
	 F2QxutiyQ06JrIiHjiiVwXrA7EB7p2mncRMJiHHRMS5bRwtwk330deY2QQWqEVvTH6
	 Gf65yCFL/pLB8hqcLxFY0Bj+390uLzpGCiCHa5j8syUiQiTksCGES2/U3RO6exYQ11
	 DHvZgjWZP+8dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA86D404F2;
	Sat, 12 Sep 2026 07:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8652E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A167580ECE
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rR_PYoM4FUl for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:39:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 95A3980ECC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198794;
 b=hwstt0Uu+5R40GvAyq3junE8PhDOTp5UyKuyKHEFAfaqinSyj8cgGy/ztZLrQy7yZ3bV
 T3qNnDpwny5MADxtJRfP2WcOu/FZ2KvX3SUa+ojCgqqgUqOQ8QOGRFJDdG6Su03LUy0vh
 b+QNQza4SYPR7dzyJrxlI4v8rEavfTEXAckdCs/Dk2EixhFz61sQiZCA0oU6zmRMyjWRN
 PaLJzdoTxbnvh50ghXx86qsoeCozB7Loqh+p8COFlyoEJtOebldGN88c67MKtu0nqZWLM
 RCJNcyyDLJsUyG5XB62gFqugR+E0iayiRPwq8S7QJp0Twtu3Y9yImpOq23nrURqeIKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198794;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=O/F7qM0RmzKmhbup3RELfaEr62YE0GDvsTUEExDF9IM=;
 b=ByjInk48v8Gn44QrMKLAvoOLHWRfjfWKK3UQbSZUdhoVFxZzsd1kSdW8+MG/balaJavM
 2NaWossH1Nd3K5THaCy1bRFTKffew6K7SbthRbXKFh/Oo7PI5iRTlxfDRWI6Gg1s03nGr
 GcNt7blSbYiXupWmYaihbJExAGZOb20StgauHYsD8Ecx30r3GlEGB6Bs2WgkDrv/0beZX
 8hpjN/DnZYLNNy/VsAwZK+dKy8E1y0o3NuUdB7sqfGLKNQi8ez7Flchp/3KRAbl6QNhkL
 AXHwQbMLYknMz5TJAokpFrhwH++jUOTKmnGUf7F3uithzx3nRVVvtDtno43ZuOXdqTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=eOJRTKh8; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eOJRTKh8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95A3980ECC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=eOJRTKh8y6UsLT2qEuhqMuRduWMTlT2d6APo9UMGUENLC7E7WcX0HvuZaJdHlzVAxOkE2GunWUvdveCMWUbWA3OZKprsyCgeWI5Uu3xtL3PpU53MTJCUXVqIJ3K32HPac2O/TT43GssIxlS3Hx2aR9w9HKEFMhMexAm4W7yHqHl0zHw5NEd0sOVIxDopb1Aiz1cFK60rUqfTdC9sBIyLjDksbhE+4UNgkJ/6woK2q6Jp5e+Ak/gd0KQajQo6BYbHYR3tPElJOcvEUbC5ebW1IsZGEf7hHrf16tOAfwBI5JDVd5fBDW6+uXDYCx2bkAe4W0hdQD/2SysZA32jiDCnQw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=gBf6OdX0nowdby4NElAB2UNfOO3EELGvTyUirryxsJY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 110910716; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 07:39:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5IKy-0000000FCkL-2kJX;
 Sat, 12 Sep 2026 09:39:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  David GOUARIN <dgouarin@gmail.com>
In-Reply-To: <20260911205709.772940-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 11 Sep 2026 22:57:05 +0200")
References: <20260911205709.772940-1-bernd@kuhls.net>
Date: Sat, 12 Sep 2026 09:39:48 +0200
Message-ID: <87ik4adikb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: bump version
 to 3.2.10
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

 > Removed patch 0004 due to upstream commit:
 > https://github.com/FreeRADIUS/freeradius-server/commit/60d60eed118b3655aea1922b1442bcbe8c9b6270
 > which removes the patched code part.

 > Added new patch 0004 to fix build errors resulting from the commit
 > mentioned above.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
