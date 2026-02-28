Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1C6FD0040
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 22:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A0961042;
	Sat, 28 Feb 2026 22:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUYz03D0QIU4; Sat, 28 Feb 2026 22:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE61E61036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772317277;
	bh=bP/jws4cA53DQAddv2hQNsOETreRDRTUb/6hnJ3C2eU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCh7sVrWnL+f6O3fJzw18KAZdgW9n4QNqYdUvcgrLYh8SOM47ZW1vKCbohmTyYVj5
	 znGFbg9U8t0GFvQN7gltaF5C2FkDWG8SuB994NF4crLNmSSgmmhE85ABJHiP9DjgOu
	 estelFFoQzYH535O5f6tEExS9I7x/zPDg/7d5NYLAoV60HO8536TYnqsawG8Z2aZyf
	 Vr5YghWSFgCHvi+PVenKt0KibfLR7Ww8GNFH0i4GxR7t44aTnLmywmX/TgtKmpVmf5
	 3riikKqJmhC4SoN6VI5giV602xLNmGSuPNy7uNvdg0/Jp5mHTgJtqWkXxIDFr+7u75
	 2wUQH5aCzYXCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE61E61036;
	Sat, 28 Feb 2026 22:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1D218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD05C41B79
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQC9B-J_tsKt for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 22:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0E7B41B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E7B41B71
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0E7B41B71
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:21:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2010814099; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 28 Feb 2026 22:21:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwSgO-00000009nG7-0WaD;
 Sat, 28 Feb 2026 23:21:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>,  Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de> (Fiona Klute's
 message of "Sat, 28 Feb 2026 21:41:04 +0100")
References: <20260227192112.3792145-1-fiona.klute@gmx.de>
 <871pi4prz5.fsf@dell.be.48ers.dk>
 <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de>
Date: Sat, 28 Feb 2026 23:21:07 +0100
Message-ID: <87wlzwo6gc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AxljStjqdg1VxC2pdn2UkM7fWmmSpVEHtHiq7x5o/RoHVvOOofrizFoah0Ji+Fx7S/9bP67QMzxeTYAcAA08QH+wV6Y2MreTiGkBTsTH9xJK/Z30ny2ObUAAqvhY3mWujMBLZa+p4NPFXDmQH8vm1ZICp6aDPcGCSkjq9F6RebWFVC+1qMd+mxOUMc8X/NsYLxZ/xdfLOCz1wx3dYTRzMLrRXYMvPt/+YO316eZ41E0567obvuEJxHiDzMXbGaWLxF1MVJvALfb8FQdzQ+ztgN6mJCBuGaWkFQcaso7GhnFCnHazws6S6CF7ViaZsp9Q/tFgAHWiKjBzWRTlUeZgxA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=2FqR5+DB+5zbbxKRnI3meCCzLPAmjfocYDwW+3cDs3c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AxljStjq
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: transfer config in
 environment instead of class variables
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

Hi,

 >> Wouldn't that work?

 > No, because with the execution order in support/testing/run-tests that
 > is the *first* call (so it would still happen, except on pre-3.14
 > Python where "fork" is the default), the second one (which then causes
 > an exception) happens in the Debian-patched "mp" plugin of Nose,
 > specifically when it's loaded. Otherwise we could just catch the
 > exception and ignore it if the start method is what we expect.

Ahh, true.


 > The main issue is with Debian, of course (without that incorrect patch
 > run-tests would work as it is), but relying on a specific
 > multiprocessing start method was always fragile. For stable branches I
 > think it'd be fair to point at the problem being a Debian bug, if this
 > patch (or something similar) is considered too big to backport. The
 > buggy Nose version is only in unstable & testing right now, I hope
 > there'll be a properly fixed one before the Forky release.

What we could also do is to only add the workaround for python >= 3.14.x
(which is not yet in Debian), E.G.

if sys.version_info >= (3,14):
  multiprocessing.set_start_method('fork')

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
