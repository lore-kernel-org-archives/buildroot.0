Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A17AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1D64053C;
	Sun,  7 Dec 2025 20:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz0yfwAxVRqq; Sun,  7 Dec 2025 20:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08FC640544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765139348;
	bh=qGMk7ASTmC+9sqAlykuRGfuixv7/2+kRnYecmH3gQBQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fzq4321IDVxxzP2OfAicBZkEXLG4QUIjetSNSQ/r0Rk1Osqh5SQpXkeM+stl5rjEx
	 Mq+PxraITeDwwMkANHfIrtTyWWEoZRZm0zvQMJGDHxOC3pXpbUv9nCcKID+VU3r2cJ
	 +NEr2qE1omUHmMtbrjOdNGRLrhakTK5EacQ3VLKqz5qFIT0NK+50BKKUNMAKT1P0bl
	 IFM918erCKdUXdP/q3S2tIEzfAkNgVnygw7QsvNzOX8kwyQHzEn/H0rOoMK76dd+z8
	 LsgWZfuPSGdJV+olATW88Ev+PywBoDKNLFS/VxP+aY40afZB9zHo5jPjPdpUCgJv6X
	 XSiP8iB7iTd8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08FC640544;
	Sun,  7 Dec 2025 20:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DBA3E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FD94053D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufBkr60dXo57 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 20:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA990400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA990400F3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA990400F3
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:29:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -862940091; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 20:29:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSLNM-00000004lTH-2G1Z;
 Sun, 07 Dec 2025 21:29:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251207150611.2882304-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 7 Dec 2025 16:06:10 +0100")
References: <20251207150611.2882304-1-thomas.petazzoni@bootlin.com>
Date: Sun, 07 Dec 2025 21:29:00 +0100
Message-ID: <87v7ii829f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Qwpvj5bs5TdTInkCDA1e9PgDIXcPNmmA3w/1E/DEI7tUD2D3JwFJF9efybgoeEgnSpj5wvlU5WvGHjOaMxT1U9+xxP1uLuVCqfkb1c/SfQl60sPncepX0z1/yUy4t3/7+ENSpTgupb9MRm3DlZQVTEgq/NAvRpYali7xhT5EyKoX//sbe6MCkIG5SyJ4+iWAr3k3rzHiRwU8MA5puLR2OS5yKl9EAQuuQT3d80pM0+TbJjYWlXrYIhp8K1mKm7Ropb6C4wxC2qwhJH+K2sjswzZi2HU+srGdbuzMNbRR3fmGHSufMHErtYWZYZ+TmSo8/nDWXQE+qaNewCwZp9BitQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=XDkfdyal/rpD1qKk+IxtbWjhK5Q8Cf4Mw4sc4B5b/Pc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Qwpvj5bs
Subject: Re: [Buildroot] [PATCH] package/glibc: use DESTDIR instead of
 install_root to fix build issue
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Building a simple configuration such as:
 > BR2_aarch64=y
 > BR2_FORCE_HOST_BUILD=y

 > Under our reference Docker container, as an out-of-tree build:

 > ./utils/docker-run make O=output-test

 > will fail during the glibc staging installation step with:

 > /usr/bin/install -c -m 644 /home/thomas/buildroot/br/output-glibc/build/glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e/build/libc.a /usr/lib64/libc.a
 > /usr/bin/install: cannot create regular file '/usr/lib64/libc.a': Permission denied

 > The problem being that the install_root variable is for some reason
 > lost along the way. We definitely pass it during the staging
 > installation step, but then glibc calls a sub-make and in that
 > submake, install_root is empty.

 > Observations:

 > - Building the same configuration inside the Docker container, but
 >   in-tree, doesn't exhibit the problem.

 > - Building outside of the Docker container, but with the same make
 >   version as the one we build due to BR2_FORCE_HOST_BUILD=y doesn't
 >   exhibit the problem.

 > However, it turns out that glibc sets install_root to $(DESTDIR). And
 > passing DESTDIR just works. So we drop our custom
 > GLIBC_INSTALL_STAGING_OPTS to rely on the default one, and this fixes
 > the problem. It's not extremely satisfying to not fully understand
 > what's going on, but after spending quite some time on this, and
 > having a trivial and actually pretty nice workaround, we simply
 > propose to use this solution.

Yes, I agree. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
