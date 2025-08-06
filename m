Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A50C87FD1
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 07:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7178608B4;
	Wed,  6 Aug 2025 07:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwxUQ5fRLDAT; Wed,  6 Aug 2025 07:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E981860880
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E981860880;
	Wed,  6 Aug 2025 07:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 268D3D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 07:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185FE4038F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 07:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIhobex_NqtD for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 07:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9AC840198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9AC840198
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9AC840198
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 07:37:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 390268345; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 07:37:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujYiT-00Fwwc-2H;
 Wed, 06 Aug 2025 09:37:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87y0rzkkf7.fsf@dell.be.48ers.dk>
 <FR5P281MB5078D44083ABDE1AAC41FC828722A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87ms8ejodi.fsf@dell.be.48ers.dk>
 <FR5P281MB507889A3AEA35D1FD5240DA7872DA@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
Date: Wed, 06 Aug 2025 09:37:41 +0200
In-Reply-To: <FR5P281MB507889A3AEA35D1FD5240DA7872DA@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 (Hans-Heinrich Hansen's message of "Wed, 6 Aug 2025 06:14:00 +0000")
Message-ID: <87ikj0kiii.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pbvYhy3rygejNZtx7kla+QcvsR3R5UFz/BWgwpzs9Ise8EVbIFRuHClMO68Cwnb0q9xqovVVOUg9J2035rUJF4MgzeY7spZGO8amZ2KbgsV15gDMYntZ3j8s8js8d3Pf6sHjxq4yAorfdCMG9+Xtj/FjtGZr9+hgbnf3wfJcy9Q7OhGrSuqud09gaibGa0ZVNlsTbDhS0mlrP0lwFNXXjtVJFSydK5XEOzVOfUjtzymBzYBSMJfQy4mEJyPBslAmwKvLZK68gRoBWsPIsYVu5FCJjRUTOPz5GhKjgqbfwz5FeRi3z5cGWRtC5QwgkgoDhV4fZXWioZ3b9neHs20zLg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=c0KaysaL5eBHAeEF6WDAosnn15mh6g/nVB6Z8HPNV9w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pbvYhy3r
Subject: Re: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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

>>>>> "Hans-Heinrich" == Hans-Heinrich Hansen <hhansen@avt-nbg.de> writes:

 > Hello Peter,
 > thank you for your assistance!

 > I've enabled again the loadable module support (CONFIG_MODULES=y), but
 > it seems that the source code (EIO_IS200_DRIVER_SITE = $(call
 > github,ADVANTECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_DRIVER_VERSION)))
 > isn't downloaded. I think that it must be found in the
 > output/build/buildroot-config/br2/external folder, but my
 > output/build/buildroot-config/br2/external shows only the following
 > directories and header files. All header files (created by buildroot?)
 > are empty:

No, the output/build/buildroot-config is simply an internal
implementation detail of the kconfig configuration system we are reusing
from the Linux kernel. Your package tarball should be in
output/dl/eio_is200_driver (unless you have customized BR2_DL_DIR) and
get extracted in
output/build/eio_is200_driver-082e737c59aa92bba2c29db46a06cdd0e5beb600
when building (if enabled in your .config)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
