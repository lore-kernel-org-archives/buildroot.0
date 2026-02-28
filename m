Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D67FEE4EE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19A160F79;
	Sat, 28 Feb 2026 19:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MylNxf1igqHt; Sat, 28 Feb 2026 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F9960F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772308266;
	bh=XamQYj28WbEgWupKAOpEFBGNKOaRn0USDVYOqSLwzms=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaEVKYJLeUEDEP18oznocyeNMqDondvtK7ITtNvp77pX4r0sj+RMEEQ2mYUqYvH22
	 7Kt0P+GZVLDjCeyfVEzpzHBdfTKo5mxN/2fMA+8YWzbofx7PgasrXryIIuvlVtLa1h
	 uYk5yXsmjnHmQ7JolZispJjA3y//EJq+ZVmYTRUkIBBshCZqfi2VDHcokUyS5ylqg3
	 Ol+ItgD0rwMPdHnJPIDkpsiYAdmwfqgJDitXw6gC6QoCGZBb3I50rC40878wwVJZww
	 QxJ6pXiwWM9YnG7qK5ex7M8a9dcs2LpuMQAUDbU0f+ZoSEQ7ssk+/L5CLcjgu0G/RH
	 XnPvCO8ANcuhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F9960F7B;
	Sat, 28 Feb 2026 19:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F9218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA0760F7B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIXCjY5IGL19 for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 19:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7946A60F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7946A60F79
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7946A60F79
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:51:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1093273050; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 28 Feb 2026 19:50:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwQL0-00000009cls-1hfN;
 Sat, 28 Feb 2026 20:50:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>,  Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <20260227192112.3792145-1-fiona.klute@gmx.de> (Fiona Klute's
 message of "Fri, 27 Feb 2026 20:21:12 +0100")
References: <20260227192112.3792145-1-fiona.klute@gmx.de>
Date: Sat, 28 Feb 2026 20:50:54 +0100
Message-ID: <871pi4prz5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ClLhiQ3py1gsYwBDIM3bI5e6ji7PkLw5QCk5AC6lz/77ZkIifo9ZioC7JVFZgAaZ82eUJCEiJOgdMgNEFdMugEKg8n9juU1nj9nrb4lPf8n6gWkMtaohjR4Qwhq6odY0rgLw+8nvSt8Kzm+PsB5xP3uJSSPZB0PgBarZurm9YjOdEzMvIlcGTU0zMfSxWgS6TxiZOU5RYkoSJbRSRvrcSdV02Db0Fq37mjVN9E8CuIuRT4N3yMx6+ZrAPx2uZtfFjHCWqicr5zilxElogzmvepwHlIz3inWv4YgOyaKGMJMyG8/efD6qfY7rh/35HgnbXZVE0dIVr0qOOwbgh4uQnw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=DGxqVTWAPMDEPehulC/Zx75eZBV8ykoUY5MMRHmDCiE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ClLhiQ3p
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

 > With Python 3.14 the default process start method in the
 > multiprocessing module for POSIX platfroms changed from "fork" to
 > "forkserver". Unlike with "fork" the new process does not inherit
 > loaded modules, classes, etc., instead it has to load any it
 > needs. This means that class variables modified in the parent process
 > are lost, which breaks the way support/testing/run-tests sets
 > configuration in BRConfigTest.

 > Instead add a method to serialize the configuration into an
 > environment variable, and read it during
 > BRConfigTest.__init__(). Reading is skipped if the environment
 > variable is not set so test discovery (not execution) works without
 > configuration (e.g. utils/get-developers uses this).

 > The (de-)serialization could be simpler using a dedicated
 > @dataclasses.dataclass class, but the dataclasses module was added
 > with Python 3.7, while support/dependencies/check-host-python3.mk
 > specifies 3.4 as the minimum for Buildroot.

 > Remove the "fork" method override added in
 > 3d2141bceefda32bef06ddda594eaf8665913276. This fixes a crash that
 > occured in combination with an incorrect [1] patch added to the Debian
 > python3-nose2 package with version 0.15.1-2 [2] because setting the
 > default multiprocessing start method twice is an error.

Looking at https://wiki.debian.org/Python, python 3.7+ was included
since Debian 10 (released July 2019, EOL September 2022), so I do think
that we can start relying on 3.7 for new releases, but for 2026.02 (and
2025.02.x) why not just change run-tests to do:

# set_start_method() may only be called once
if multiprocessing.get_start_method() != 'fork:
   multiprocessing.set_start_method('fork')

Wouldn't that work?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
