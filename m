Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079B8EDEBF5
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B2382410;
	Tue,  3 Mar 2026 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMXuMwjz0PB7; Tue,  3 Mar 2026 21:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E94B823AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772571990;
	bh=/AVd4LZG39XU0djsdIi8/WDKgdJ89l1P8uBHvI/zvSk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UiQ7nP3WFNoGEePX9RRalo/woNcw4tQEDLC9Y2c1uKCkL3nC01Z063z+CgEvsINmP
	 9cSpl6Uj+gkxoUVAxi1M0eUteupAmswELCHPmK+z1MUh8dGu6k5VXE3nCm9iyVshmK
	 WyjZFyBNz+V59tBqQRnUsdaaaWl0N2/c3Lg9hiOiPOCX5U2xs+KS1fkrQ2SoeITEGy
	 X91sG01kggCrqKMtVF4jii6SwwW8VZZHrYQ83kpjnk1uj2/kqvSxYlQw6mUOfbcv7F
	 USrIDwIGnDO7N5Wc5YD8aQNKMsoZv2HCW8xzC+Z8151bsVCkFnBzT9p05pIzcZG851
	 D71cXu7UrLu/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E94B823AB;
	Tue,  3 Mar 2026 21:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB59231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEF4540202
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASF-Z7sPmWA4 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EDFB401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDFB401EB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EDFB401EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1251333206; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Mar 2026 21:06:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vxWwf-0000000Glz6-3p6s;
 Tue, 03 Mar 2026 22:06:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260303105825.1234428-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 3 Mar 2026 10:58:23 +0000")
References: <20260303105825.1234428-1-neal.frager@amd.com>
Date: Tue, 03 Mar 2026 22:06:21 +0100
Message-ID: <87seagipwy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WIO0hejlDIEQx4HkjeV94UFD1NuOLZaN2NUQf+KEWBmLCN/VvM5g+eRHcWqm9PEidBWhCAWasignOri+G/sPLuMpYZS5H5dESDrPqFJSYovENSX65DGXo27PSnuITrd52/iBdTGVqCxY0327UluRHzO6etUTDrxmF7t6QtiQQb1+Plwm6x8jKmRfDZStWee1f/Wlk9JZZPgWuUAAbnZrlb+595V/1EtGo/2KmRic6v6Ui2RjbJ9Miefb7UDtNo9c6ik0eqjq9wPNwQL/vthetBZZmHmQ84F8WoyGFdbmSgDDsXRJh1k4pN1R0rutwDThDrADnSrJbe5UBDLyOZeaYg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Di2b1C0NeZQxCpZZoX6Kl7gbnT23H3v1cVQGk06VtLY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WIO0hejl
Subject: Re: [Buildroot] [PATCH v1 1/2] board/xilinx/linux.hash: add license
 file hashes
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
Cc: kory.maincent@bootlin.com, yann.morin@orange.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Now that custom Linux versions can specify license files, add license file
 > hashes for the Xilinx custom Linux version.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
