Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB6DCA6015
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DEE6084A;
	Thu,  8 Oct 2026 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSD5YOuhuQ5s; Thu,  8 Oct 2026 22:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D46560808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497442;
	b=JdV6BflcNdwSkRGpbiYY1ftRX+uz0dAC0fEvLs6Ga/849pnwg+c/f5xpEMHJiFlpoTX5
	 wHXeWMtKGOe4s/HsNcrWS8R+UUm5MLxCjfOB3kepjp1W4D7HcYd+ZTamp8enOJNyshaCM
	 hSFtHBr8GPyeRuaak0M5rD6lwYNL1l9XQkBbBDd5wrlr78fHlT2u9LITBTSmlpNXWV2tM
	 9mSp2/X03PH3hXUVSggFdnRBz+N42JAkvN7zIc5p6LT+M6KIxXLLx5J0Q6kN/n2ivdue6
	 Fufr77Qf2yDd2cVMq0+36G/9PdSG7ZCt12/i761CVKR7WAJaWgt9HsJF3i5Rzpc1u3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DMYvp8NytFfiVKM8PlLLECzYubyuTJhJ/P7Ik/1w8J8=;
	b=L/1JcP9mkeagLz3VQG7oWv1M2EdRrw3iISkPlDMMc9VgFrVvw8SGUdo1hQTitvFH/I11
	 Bh9uKcd40OdgOyH+SQuZi/Q4c4X2QJnLYwsSbZvqdzrBaAHxH4sq74u5HbEGaIy5P468Y
	 bTwf03dGkZlXhJ07xfONisPULDEgnnecNtcl51B5kTZuuOEsPUFZpwHBeJkrKm0DMaDVR
	 Xe40jSZJcxEqfTgKttpSwm8iGshSuxDj5v4H4UzbmkKQbMhu3cWhgvIzwDITlrW3Rjgyj
	 soE+I80K6I0GrPIOnCHx/lDvdBQjRtrw4/3fWNt6X4PIS9s5MDWNEyXiKJERfyPgM9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497442;
	bh=DMYvp8NytFfiVKM8PlLLECzYubyuTJhJ/P7Ik/1w8J8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFoICyH/tAW6IBeOpMFoDnXR307ZkrzF64aPMI0aZx+Vnh8/KJK/VUstacP/G783Q
	 fHU/eKHusm7Qu9ae7yJZZXLq5hQoNTvnDKG1PT/qgWY5cSyKoqQuILEiidq2IH8KgG
	 zjOVWpwNROGnFThEgKD4J4ueFa352BTsp1UTkpuZSeiKpT5TSWHBOQNd1Gx8TEv9MH
	 bCNSUkhw2kSwSnFQ6kZLrXZM7Kjs55gzBpm+sHyXup0ttTpvGMoAdG1JfKQyFxpZEU
	 XP/dAtUIyQKOehBaS8XVgg5+JD/cbqDRIswbyDUR2RJoOGXHsniVuVJK47TvzbmDlq
	 by8fI/WMN74gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D46560808;
	Thu,  8 Oct 2026 22:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 467792E0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285B6813CF
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvZQoMIkCxZ1 for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:10:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17DC081412
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497440;
 b=HKTYw60ipiotTSfK8Yp4i64zGg+QkXud9TqBBJrM5861mWL6TAgGG8yRXm7ObcJszHE5
 UuZUSl/5PON2zePC2iJ7h15OKwuVvJMT3zAkQLBO0sYxEXDdFV2M5phcLRgD6nW9R4s8h
 CkabVZK26q2abdIsfIUmXo2t4xZN818vUGkyM9lcZQI88/ZcIESTMlZGCpUdmHmpBq+A/
 8CuZShYhFH+8gNS0lMFeF1+G9ZyLBTsdg/bvBpUzNXBT6tL+yLSmc33pRcEyMwSV4uevp
 Lq25fBzyhJ1KXsKJD8CRiAz7y3/Zk68kX2FBrPGzWZcF26kRrLbFpJv9DX8HN+07bng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497440;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=FJEF/OZIoDNtnwypsTNk0QtQbGjAzyBoNwQPToghlPs=;
 b=G2UzXoZM/1HstGMvNuxZV3qnkzSGzgG32ILvlsrVq17CTBWIYNof6nc4w2Z6kpodYfSc
 899tgxbLsQvs2+dV+PXDIqkWbCXQga7VZdBkREiaBomJYyiKmBP75WTjNKfJ7Mo9Kfxbj
 FJwMzPZFG9bJejXnDLaA8D0Nw3SWzRV0yTbj9/b5B3PqPWF5rxSTxQOQcRiNx99QEbBLX
 PTdGBysGtf3UU1OlQPD8+YdrgR4MpujMMrhRx/UWZNSyzo/JXywhXvJD2gg7B9wNAxl2d
 yd6h5GpW5UKx+pTtxdmwyUi4NgnGJFg/sS+meRTqP1acRLd3fi+Id51tbkcJ/Mr/kxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=lmLk3ft9; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=lmLk3ft9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17DC081412
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=lmLk3ft9byfchTtljrvAa2gITpY/hBA8LqppRuzxU/zOKmDs7YVGTE+/M2h2iYFZfxss5bnTdRNPaG/3G5xdKd4Dv5ljX+y7vQOSgfGLJLz2yeyZTD7v//JyWgSgwDWEjrKbAZYDoOBXGc+aEQZ9w7TPpsXMvsT/im/BXoanKzlqcWhaJoP9zl3TX9XDL7p/lzT0jQtI0Yy83OwDezdrP5ahm73kCWAzmErAGCfg0ngbUemg5HS3bj/JchoKxlW8oR4V0x01AQhZIwQokCrzHbVdxTfhVWXqhuGQaHKSDXnTNn3j6V1HQe0NICPed7gFyU7vNdxJHxKssd52sd8MuQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Ct/Ot0tzu+V7WvDuhm8UXgThZDXiwKXQ3EtcvAC1kMc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 487014196; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 22:10:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEwJt-0000000FSi2-1Xc7;
 Fri, 09 Oct 2026 00:10:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261008204640.3755842-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 8 Oct 2026 22:46:40 +0200")
References: <20261008204640.3755842-1-bernd@kuhls.net>
Date: Fri, 09 Oct 2026 00:10:33 +0200
Message-ID: <874ievzvvq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.27.2
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

 > https://go.dev/doc/devel/release#go1.27.2
 > https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ

 > Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
 > CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
 > CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
 > CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
