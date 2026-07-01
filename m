Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444CDC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A8E40861;
	Wed,  1 Jul 2026 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofP43lCppUMD; Wed,  1 Jul 2026 20:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D0B40761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936346;
	bh=P0r3ZMxHbAR/2Dr58FSmqdjb0ldgdwzHu4tZ4UySgnk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlOpZVd5Ftk8A6/ElApq9+18LAoy4LCIbKnKLOodIOmQAkK8t34/2eewwOAvBJATC
	 AAz/XsRLpBplIENreJtqWnYbAE/xy6W/903GAYvofBhlG8lltl9YqpPxHoqJhcMgwA
	 NMjyprCAeE92A/M9WSobE3d0bAZh1wCalGO2Om8byptKG1viAQcsjBqzWsVfQVYvy8
	 7PeZlDewHlR981dHy/Egh33amdXuyXFsxkydDug/jZiCF50xxNUTegZcKJFpM8U2/q
	 l9pSkAVOhXRy3Z9PDXAGATrdg/Q2Yi0flpHtqw3esxMKlJuoyD6SDqD032F4G24wnz
	 h0CGBy8nFzA8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D0B40761;
	Wed,  1 Jul 2026 20:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33987127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 197DA40131
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EuD8lYme7s0 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D47D940061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D47D940061
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D47D940061
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:05:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 237175826; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 20:05:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf1Bk-000000032qr-41qx;
 Wed, 01 Jul 2026 22:05:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260619092004.3158146-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 19 Jun 2026 11:20:03 +0200")
References: <20260619092004.3158146-1-peter@korsgaard.com>
Date: Wed, 01 Jul 2026 22:05:40 +0200
Message-ID: <875x2yqxuz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=vpputwcC89IvZjiaMHSodJNUyHrHkZta5hOmmJELhw0zOijHZSjgIA4LGqQy2saMYVZdCUPIGwVRpuWvpx8JsrMVp18htFsUSG7bzPfY8X8Nmk/NMX5SUeZXruQMFn1yhACv2M6XtgnN6DaOHDuc10VaMrbY6x0TmZLt8H+1d+wo8hx2C4k0Vkn1vjrV+UjjiwM4l2IcJ6vyVIeQWS6Vl8MRqOciHn3SZOa0j4nS3AkGigUSn+7VZCyC0DQb5JFCLJMevf6MB6zZk1VaDENlyNaaMHbzcYqUpL5uNJy0eohVoRBL+eAGu9sXoBQ3kOYFOmMEE/GbUao4kuvZiWKW3Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=QqkUeu31eS6lahOvP8cvZJ7qSOLZo60I/EM0GRwnmZ8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=vpputwcC
Subject: Re: [Buildroot] [PATCH v2] package/agec: new package
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Agec is a simple file encryption tool that implements the
 > age format in C with minimal dependencies. The tool supports
 > asymmetric encryption based on X25519, and a passphrase
 > encryption based on scrypt.

 > https://git.sr.ht/~min/agec
 > https://age-encryption.org

 > Encryption is silently broken for files <35 bytes, so add a patch submitted
 > upstream to fix that.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Add patch submitted upstream fixing encryption of files <35 bytes
 > - Add runtime test

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
