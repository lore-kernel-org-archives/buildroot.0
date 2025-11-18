Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802FDCEBF93
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E6060F07;
	Tue, 18 Nov 2025 07:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qaR-HmwQ0aS; Tue, 18 Nov 2025 07:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85DB06076D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85DB06076D;
	Tue, 18 Nov 2025 07:10:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0872D1BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFF9606E1
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFByCA9TNRNR for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8F3A6076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F3A6076D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8F3A6076D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:10:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1118996809; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Nov 2025 07:10:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vLFqj-00000001lEo-2mT8;
 Tue, 18 Nov 2025 08:10:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Alexey Lukyanchuk <skif@skif-web.ru>,  Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>,  Maxim Kochetkov
 <fido_max@inbox.ru>,  James Hilliard <james.hilliard1@gmail.com>,  Julien
 Corjon <corjon.j@ecagroup.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Jesse Van Gavere
 <jesseevg@gmail.com>,  Nathaniel Roach <nroach44@gmail.com>
In-Reply-To: <20251117214234.1115937-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 17 Nov 2025 22:42:33 +0100")
References: <20251117214234.1115937-1-bernd@kuhls.net>
Date: Tue, 18 Nov 2025 08:10:01 +0100
Message-ID: <87ikf77r5i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IWDMMEY2XGFxbqeECQtJBbF7prCQA6nB+HDkADiGReJxmaHbvZMhgn9e+rH2mnYMDfAA27oALB2EasPhz9krt/0k0GrxvhFIebum4eMKgzIEE/h6HuUBVyVQaPf4Wz6MCBxTyHjNsJ1gzVVUEpPPT/kyXLbG7s+Wc7bDE/5SXrCfBIaJWsoACI/zFH6MIqu77praMXOv9DC1yZsnEifM12VhvJ5X5ZacHAjnOA1wqf/lziVm9qVdL+yTx1oAdVECvro9jUXFpEUxG+S9NUhrlKBdoIgsyC7rftlUIlkE/LJWJHrbz7UlQiWOXk4dkj+Kers72AAoyEWc62zDibzc+g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=V6J0j5aebbTh3LHApyJq52N23j5Sxbf1+ELdKH77xqk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=IWDMMEY2
Subject: Re: [Buildroot] [PATCH 1/2] package/timescaledb: bump version to
 2.23.1
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

 > Changelog:
 > https://github.com/timescale/timescaledb/blob/2.23.1/CHANGELOG.md

 > This bump adds support for PostgreSQL 18.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
