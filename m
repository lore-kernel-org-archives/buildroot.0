Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FCC61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85D980962;
	Mon, 31 Aug 2026 19:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_-yy7vTi36L; Mon, 31 Aug 2026 19:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788203458;
	bh=f9Wzq5NfeInjRwK5uQj4cRftuUk5F+S64k0oDmD2BpQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpOMfQVhd4sVrXAeDU1Es+/q7tmIw/PmC2+YliIKvIY2wmSslQRTgcfj8gZyKOSto
	 8rCcaEyhW3qtK9Yg8JsQZNkPBp/rVmL4Y8BehAkwkebbHiV44+n5MKzsrxn5qxlsT+
	 WHyk27B2Uktn17pfCT0t5XtSYfDQT4GMmpqkvkxwS2bJnxPuaoN82RAjmu0xTCUgV1
	 HTUH4sdeQFQg1ULBjWBdv+z3R84Hx2fx0rkdc8qhJA5jBUxrF9M2IxOzSTXlOpVLoc
	 v3QlJ+bpHYgqocAlQPOLQaNjC5R9AMHv3jYJX8lKJZTuJx9gUd0tvtZjB5FRdmugil
	 +XO69RRYVzFPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FA18061A;
	Mon, 31 Aug 2026 19:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9541E2FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC974051F
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43nZXppeq0tR for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VySfeeQc
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E3284051D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VySfeeQc6fi15Pzhxq0XeewiOf/jb1ro20603aKZlL7OxhxzAzpIa02TvJYUdCcNIWedKcdTHOjWGQxFpjG6EQdgFDqClfq0qbXyyrGGQOOtJDSN1s50Yh/7UTKEUpwXlSj03d8h10+m93yjRtOZ2sPIaOmzQKLw8hboVHJ+a4PLX+g4eJctRY2pMP1IIDdtgVCoBvS+5RNFD7QZaYpOFS6AGhDxW/AcPsWFDuwYESTayKLIooTaVSsX+SJ0vGKepHdVE56Y4jrOmsD6n3kDd9I/i5TGGH9k1F0R9YVnNc8DYRrTsVSCty5Nwo10yJjLwLmZwubWBoLEv14LBGEZew==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=JZMfzQ6AL4+CiJ/NrTdxfRZi1hnwwTo8OivtL5xveF0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1766301592; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 19:10:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x17P8-00000002NcO-369b;
 Mon, 31 Aug 2026 21:10:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Cc: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <20260831160943.3999351-1-jimmy.wesolowski@mobileye.com> (Jimmy
 Durand Wesolowski via buildroot's message of "Mon, 31 Aug 2026
 19:09:41 +0300")
References: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
 <20260831160943.3999351-1-jimmy.wesolowski@mobileye.com>
Date: Mon, 31 Aug 2026 21:10:50 +0200
Message-ID: <87qzjejebp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] openssh: ensure libxcrypt is enabled to
 provide a crypt() implementation
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

>>>>> "Jimmy" == Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org> writes:

 > When OpenSSL is enabled, if DES support is enabled, OpenSSH uses
 > DES_crypt. However, without OpenSSL or its DES support, there is no
 > available crypt() implementation for OpenSSH libopenbsd-compat xcrypt()
 > function, resulting in the following error:

 > .../host/bin/i686-buildroot-linux-gnu-gcc -o sshd-auth sshd-auth.o
 >   auth2-methods.o auth-rhosts.o auth-passwd.o sshpty.o sshlogin.o
 >   servconf.o serverloop.o auth.o auth2.o auth-options.o session.o
 >   auth2-chall.o groupaccess.o auth-bsdauth.o auth2-hostbased.o
 >   auth2-kbdint.o auth2-none.o auth2-passwd.o auth2-pubkey.o
 >   auth2-pubkeyfile.o auth2-gss.o gss-serv.o gss-serv-krb5.o
 >   monitor_wrap.o auth-krb5.o audit.o audit-bsm.o audit-linux.o
 >   platform.o loginrec.o auth-pam.o auth-shadow.o auth-sia.o
 >   sandbox-null.o sandbox-rlimit.o sandbox-darwin.o
 >   sandbox-seccomp-filter.o sandbox-capsicum.o sandbox-solaris.o
 >   sftp-server.o sftp-common.o uidswap.o ssh-pkcs11-client.o
 >   ssh-sk-client.o -L. -Lopenbsd-compat/ -D_LARGEFILE_SOURCE
 >   -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0
 >   -D_FORTIFY_SOURCE=1 -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack
 >   -fstack-protector-strong -pie -lssh -lopenbsd-compat
 >   -L.../host/bin/../i686-buildroot-linux-gnu/sysroot/usr/lib
 >   -lssl -lcrypto -lcrypto -lz
 > .../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
 >   i686-buildroot-linux-gnu/bin/ld:
 >   openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
 > xcrypt.c:(.text+0x51): undefined reference to `crypt'
 > .../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
 >   i686-buildroot-linux-gnu/bin/ld:
 > openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
 > xcrypt.c:(.text+0x51): undefined reference to `crypt' collect2: error:
 > ld returned 1 exit status make[2]: *** [Makefile:233: sshd-auth] Error
 > 1 make[2]: *** Waiting for unfinished jobs....  collect2: error: ld
 > returned 1 exit status make[2]: *** [Makefile:230: sshd-session] Error
 > 1 make[1]: *** [package/pkg-generic.mk:273:
 > .../build/openssh-10.4p1/.stamp_built]
 > Error 2 make: *** [Makefile:83: _all] Error 2

 > This commit enables BR2_PACKAGE_LIBXCRYPT with OpenSSH as long as the
 > glibc is used. Since "sshd-auth" is compiled regardless of
 > BR2_PACKAGE_OPENSSH_SERVER, we need to enable it with BR2_PACKAGE_OPENSSH.

 > Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
