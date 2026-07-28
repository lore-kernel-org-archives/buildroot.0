Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5FFC53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB4781115;
	Tue, 28 Jul 2026 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wiTgrAP44sB; Tue, 28 Jul 2026 20:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635B481116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785271347;
	bh=QAhvWzUPFuAUTds42TnB7kLsjxZgiA1kvXyRVovfvBk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqicR/jqqN6B1QBnkXifLvyN+cuCkVVbG38l+B0N+20Y/mWeH9KKXswozvdoaw62n
	 KqLw6Acu4i9LIEEGJXvY5U0HyNyPQxGDDdXue5YBswqN19hwT5jamFBg2N3obc9yaC
	 C0QgHIWtKIhOt/BXn9glPbl1niQxwGpawPHTii6OBahBZJG95oMRszsv5fikpUDqGk
	 3wLGFEQJnWQbehVRofDTBlA0Vu1xGafo97FgBc97j92DRzTNsHtzIn30v2IvplKWI8
	 Z0zTNOU0+kq/wAKYYEwLJDoRKAn8g9Q0+pUWj6EGQ2LIgivCBEb6rRwScMbBNkW/+P
	 mtxoKW3ECWwsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635B481116;
	Tue, 28 Jul 2026 20:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 997A6788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 20:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F3FB81116
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 20:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoNRXnQajkyh for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 20:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB5B81115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB5B81115
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB5B81115
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 20:42:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -106232545; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 20:42:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wood2-00000003kJS-2e0U;
 Tue, 28 Jul 2026 22:42:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>,
 romain.naour@smile.fr
Cc: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com> (Jimmy
 Durand Wesolowski via buildroot's message of "Mon, 27 Jul 2026
 13:07:38 +0300")
References: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
Date: Tue, 28 Jul 2026 22:42:20 +0200
Message-ID: <87qzkmq21f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lP6sUj7+wXxmVOaRDo+vhi5GH3A9Pa0cQDSu7nf169tiv/raW9H26gg1p6ifMxJ/kf9T7p8b9nd5DXE5GixVnQkQRYVvRWOMbAb8bLhQtQscj7SV+my8PrcZR2b5BiudM+dHs5AgVLZuNQizQp6EG8njHg2qzwwumZCqcC9J85deiQ4VjWXud6QOJz800ufZ9/fjh8zIDnAsbNxeqKwMk8z4nrkLiBMXn4hycNiu7SBPs5DC0JXu5jTTAWWll4LdEqg2RyfFDyq5u33zsO26GH7iYJAG8/j56O80TvJH09KuRHTe8x8TSK0Q/spqdQ3Czph8Gv7HexsBeJ6kgKHjfg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=bh+Vhdg1/2B1ovLs3LMDyLJWX5oA+Tu9BsZ4nJU8+3U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=lP6sUj7+
Subject: Re: [Buildroot] [PATCH] package/openssh: enable DES when using
 libopenssl
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

 > When the OpenSSL library is selected (instead of LibreSSL), OpenSSH needs
 > DES to be enabled, even if all the other encryption algorithms are enabled
 > (except MDC2 that depends on DES).

 > If disabled, libopenbsd-compat "xcrypt" function will require crypt (in
 > place of DES_crypt), and any linking against it will fail:

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

 > Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

Hmm, with what configuration is this? Presumably not one where
BR2_PACKAGE_OPENSSH_SERVER is enabled, as that pulls in libxcrypt on
glibc?

Given the description in the commit adding the libxcrypt select, perhaps
that select should instead be moved to the the toplevel openssh symbol?

commit dd244feb37fff29620a09ee96b4006cf7d558380
Author: Romain Naour <romain.naour@smile.fr>
Date:   Thu Apr 18 12:15:29 2024 +0200

    package/openssh: add libxcrypt optional dependency for sshd

    When glibc was bumped to version 2.39 in commit
    b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
    libcrypt support.

    As glibc's libcrypt was providing sshd's libcrypt dependency this broke
    the sshd password authentification at runtime using glibc version 2.39.

      # sshpass -p testpwd ssh -oStrictHostKeyChecking=no localhost /bin/true
      Permission denied, please try again.

    Without libcrypt, OpenSSH >= 6.2 fall back to using openssl's DES_crypt
    function on platorms that don't have a native crypt() function [1].

    Note that DES_crypt is deprecated since openssl 3.0 [2] [3].

    "Use of the low level DES functions has been informally discouraged for a
     long time. We now formally deprecate them.

     Applications should instead use the EVP APIs, e.g. EVP_EncryptInit_ex,
     EVP_EncryptUpdate, EVP_EncryptFinal_ex, and the equivalently named decrypt
     functions."

    Also DES_crypt is provided by openssl only if
    BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is enabled. Otherwise crypt() is
    never defined:

      sd-compat.a(xcrypt.o): in function `xcrypt':
      xcrypt.c:(.text+0x48): undefined reference to `crypt'

    It's not clear why the password authentification fail with openssl's
    DES_crypt but since it's deprecated we use libxcrypt to provide
    a working crypt() function for glibc based toolchains.

    [1] https://github.com/openssh/openssh-portable/blob/V_9_7/openbsd-compat/xcrypt.c#L57
    [2] https://github.com/openssl/openssl/commit/c6fec81b88131d08c1022504ccf6effa95497afb
    [3] https://www.openssl.org/docs/man3.2/man3/DES_crypt.html

    Fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402147

    Signed-off-by: Romain Naour <romain.naour@smile.fr>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
