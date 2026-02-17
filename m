Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BDE68143
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 08:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375A760EB6;
	Tue, 17 Feb 2026 08:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtlpXndhdaI0; Tue, 17 Feb 2026 08:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C2A460EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771318159;
	bh=F+kUhEbC0OiL+YeHndO53VrFzwvtKOoKlNixLQLdx4s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0Cc/uBdAM9dPVd4lMVvSVnDRONVtN8B/LrAxz4v0DPgkAMuHJUXLefEnxk8QNQVS
	 d0b0KCNyW2jOlEvlC4UPYahAh/l/j83vZSVOx0OkXqDuekuJmIp35uRUXkWXUUCBwc
	 9/q6KMIUNe/mZiHJRi5FCE71fR36ZiVLoHO3J9U2eTB9RisV/55UcKIRt7iH9L1epg
	 uFqPxI11PVVBfo8ZaQ08uXdHJ2XUtQ9UeO4DfYtMnPXKMjG0xEA0ZbnMvs+iDEP+gW
	 N5oP+7g/kMO0uH2x/LShVYiBtwld7Un8Q/paqtyLCnoGn01BphRy09nVUA7+8uQcki
	 czc71rmTqboQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2A460EBB;
	Tue, 17 Feb 2026 08:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4609A206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A93940E7F
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMHDukhbtqtt for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 08:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 069A7406EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 069A7406EA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 069A7406EA
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 71730933;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Feb 2026 08:49:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vsGla-0000000BVoD-46xx;
 Tue, 17 Feb 2026 09:49:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Norbert Lange
 <nolange79@gmail.com>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20260203134550.1375006-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 3 Feb 2026 14:44:56 +0100")
References: <20260203134550.1375006-1-buildroot@bubu1.eu>
Date: Tue, 17 Feb 2026 09:49:10 +0100
Message-ID: <87tsvfiwl5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Tu5sbLGJQsjZYlD3mpiluNyOFSsBGyylKZQOrSkXAKgjhl7p/6wXAa/r3neNwrKn86mk0wpCze9/aF+N/XKOgI7Ms6RjOCdt+dH7GToIP50V9lmR+elJ/w6Q2qDl2h7GFAw2cv5NfrPkY72qhUBUMQmfP2smJ1PyIqnrgc9usdkS6/e3VlasanZDP1YbnNc9Vv1zGX3KTHRyS3nI4tkX4f/8wpu5fBTezuLpvGWirOF6hvZ1UilggYSGJIf2/GzBgWQjeLCQPywe85+Isrrj49UPfISxuKAYxlALBMTgWH84AljsJvWmxki1+pM/HdgwS3VnuTeqH4/pjpORTUiL9w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ohp23lHHJS8Iu2DuSN4tWnDJAaMVdvCg+ILHG/CYGrg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Tu5sbLGJ
Subject: Re: [Buildroot] [PATCH v2] package/systemd: bump to 258.3
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Removed patch that fixed building with libseccomp and old kernel headers
 > as systemd has fixed that upstream now.

 > Noteable changes:
 >   - Add -Dlibmount=enabled to host and target build. Disabling this
 >     option disables building most of systemd's tools apart from
 >     libsystemd.

 >   - remove gcrypt and gnutls from dependencies and build options.
 >     openssl is the only supported crypto library now.

 >   - Disable nspawn build for host variant and add a Config.in option
 >     for the target variant.

 >   - systemd now requires kernel >= 5.4 while the recommended kernel
 >     version moved to >=5.7. This make systemd depend on
 >     BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4, removing various dependencies
 >     on older kernel header versions from sub options.

 >   - The sha256sum of LICENSES/README.md changed due to various
 >     license clarification, removal of some vendored files as well as
 >     changing some file paths. Licensing did not actually change.

 > For changelog, see:
 > https://github.com/systemd/systemd/blob/v258.3/NEWS

 > Tested with `./support/testing/run-tests tests.init.test_systemd`
 > All tests passed

 > One of the tests now needs a bigger rootfs size.

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 > v1 -> v2: rebase on master, remove no longer required patch

..

 > -	  - xz and/or l4 packages will add compression support in
 > +	  - bzip, lz4, xz,and/or zstd packages will add compression support in

NIT: check-package complained about too long help text lines. Fixed that
and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
