Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80970C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 07:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D4E80B33;
	Sat, 15 Aug 2026 07:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43vuD7tO1cnF; Sat, 15 Aug 2026 07:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC5780D7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786779550;
	bh=H7ujel7UKsTug+frsyDmcqprGG6gXqiNGNNo+1IBr/U=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X+OaHWzUQtC/hNMf7E+jIZ2Ze6HrbpAbosNpOgRaWCHz+1XT0Y+USKGF3wevFGuFz
	 QtU4r7GBP75gRe3vaytp+d4NVl6IGZbBxOFK+JXV7nr7qq52fDrM7w0GaWwJD2Rx1I
	 ZinmjtJbeCcv/h2wh58mL111qRnbplZhYNSUpIbUpsMZ/Rs0qsOcWjUMJeh+RFaVg1
	 Le+2p7UGUkSEdAXDhLLR+ggnHbTJKKY5u2FvoWPtdVrprHIy1BKAXN1CweDfsqrkO9
	 gG3wRv6LqkervA3Oe+3HEMRu8Nfg2KQVKnOKdyUYaP3cJ/9d4pdmqG2ltMee8ZIx5+
	 AjSNqfh3bUvLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC5780D7B;
	Sat, 15 Aug 2026 07:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E5C2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 07:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE28A80A7B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 07:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpYuR10XhSAO for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 07:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFB2C8131B
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB2C8131B
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB2C8131B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786779545; bh=+CQtRmBZujOxbxxY2aIGk0YQ8RJUs0P1WyOSRBhU7/8=;
 h=Date:From:To:Subject:From;
 b=a9CNwilA+v1ensB3UJOpx+eYmZBPcB/TZ+f+3TxeJN3jPd53flD4b10X6qoYJtJfM
 iqHUnrdy1g/lGhoD/LzW72KXfpGvTR1gfHoqcc0NS4Iy2ZxpHgv0bjkV4yY9VwP/0v
 qJ4cZB/cUrptvpxtGJkJslqs3Ki/YZpYTBZCOCliS8Lwcw+/dTRCtMvU3d5DZROLDF
 p/3KhsJzamNWrXmc2R/eSnQ7fb5r6q48GcQM1eeEX89M5wITuOD2Jmal0iqlG++w9s
 EPFMCjT2MGPRhz4HeHs3IBdzBi8AQBwyBp4ja6VqKsKl6moh0i5w925MTTPkv2i+XU
 oTlziW9kq0xRQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 18F3731E0B24; Sat, 15 Aug 2026 09:39:05 +0200 (CEST)
Date: Sat, 15 Aug 2026 09:39:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoAXmAflyCHEGz7V@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] FENV support in uClibc-ng
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

Dear Buildroot maintainers and developers,

I am planning to submit a new package for chawan, a 
nice TUI browser. It has JS support and needs FENV support in
the C library. Can we globally enable FENV support in 
uClibc-ng? I measured the size for a default aarch64 
build with and without FENV support enabled.

With FENV support enabled:
608992 Aug 15 09:07 libuClibc-1.0.59.so

Without FENV support enabled:
584416 Aug 15 09:24 libuClibc-1.0.59.so

Should we add another option for 24kb?

uClibc-ng also gained support for uchar functions a while back.
tpm2-tools needs it. It adds approx. 5kb to the C library.
What should we do here? Enable uchar automatically, when wchar is enabled?

Or is there another better solution I am not seeing?

I would like to support more packages by default for uClibc-ng users.

What you think?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
