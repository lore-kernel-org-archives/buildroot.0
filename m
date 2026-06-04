Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E560ACD6E68
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 07:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846F661B24;
	Thu,  4 Jun 2026 07:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROUBvcs4PJHm; Thu,  4 Jun 2026 07:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A5EA615EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780558399;
	bh=bqN+zPLvkUuxso0n78pRmZt4M0bY9wncXvl9sbGj/4w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0sb+RCC985Z5lwp2xumJt/XT8OBO9uNJpZfbI/4nsmuGx+W9AZky8s5VH0FBFnzy
	 a86beeAAAtyM2DMgMS3/qG3djt0pAZytQWIqbzjfU1wBdNweovgQY7T5T065oaLhk9
	 wkKXIF1MYcQYVZesn/704UXtGgtVQm0ijwdcEUUQh+Enbfb2KihdbUNdAPtJp1MAmJ
	 SdFPxiHwTlEHZJQgdcIMAh8wYJJ1JhKxHQeqL3wMRNHFmRXHIgyr5CE4eSesHvvXB0
	 sL45XVzVO7jwMw+4F3DjFsunSE64DjuJ0Db41GUCpdy3I0u6oMylorzapJEMSR9ERq
	 h11MQwu2axSNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A5EA615EC;
	Thu,  4 Jun 2026 07:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C638DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4193F84DC3
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OQ8JmQwiumq for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 07:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BE9784DBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE9784DBD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BE9784DBD
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:33:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1874310664; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Jun 2026 07:33:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wV2Zi-0000000FTPW-3qAV;
 Thu, 04 Jun 2026 09:33:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: buildroot@buildroot.org
In-Reply-To: <aiCZpdX4M_muNuQG@dell-xps-15-9500> (Ben Wolsieffer's message of
 "Wed, 3 Jun 2026 17:16:21 -0400")
References: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
 <87qzmnjr2g.fsf@dell.be.48ers.dk> <aiCZpdX4M_muNuQG@dell-xps-15-9500>
Date: Thu, 04 Jun 2026 09:33:10 +0200
Message-ID: <87ik7ykbex.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WU4DbCwM+ddNaCwumkzDOn+X0AnZyk9PgT+d+m6Wo8T87Fl5AMcmU5hwGY2ZRFBIOHEqAE3TBInXVj14Z9zacCs5RKdh5llqhynhrAHrnUKf6ZQqNjSRTllzu/cm3z+BctNveggH6duKJnX9zJDycA4WrmNLkIYG531DuVJkg6UEC4kQT3TNc7jY8NRV2JBE4DBWZTiAcRxLHZSXvCIMJYSfTUXpsQlmdO+ve+i47QkaYG/id9vwoZK/CKCXOcYdrOPoOHZhFFGIT1jX3lKofs0OletNJDWHOuSWxRpjizfzi24QS+OvXuU1K2VN4k1Q2SzUFowszJQn2ySnUmHNCA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=qHmlWCsKAboIdSgN6oLclO/q+oLb1K0XeeinAznWTCw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=WU4DbCwM
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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

>>>>> "Ben" == Ben Wolsieffer <ben.wolsieffer@hefring.com> writes:

Hi,

 >> Out of interest, what advantage does this have over gesftpserver?

 > I have come across gesftpserver, but I admit I have not used it. I was
 > dissuaded by the "experimental" label and the lack of recent development
 > activity, although the latter could just be that is not much work left
 > to do.

 > In general, using OpenSSH sftpserver provides full compatibilty with
 > common clients, because it is what most people test against. I see that
 > there are a few OpenSSH extensions not supported by gesftpserver.

I have so far never run into any compatibility issues with gesftpserver.
If you are concerned about openssh compatibility, why not use the full
openssh in the first place to get rid of all compatibility issues on the
ssh level?

The two sftp-server implementations are more-or-less same size
statically linked, but with your patch openssh-sftpserver pulls in
openssl and zlib even though it (AFAIK) does not use it, so depending if
you already need those for other things it may end up being quite a bit
bigger.

I did a quick test with a static musl config on armv7 and normal
openssh, dropbear+gesftpserver and (with your patch applied)
dropbear+openssh-sftpserver:

du -hs output-{openssh,dropbear,sftp}/target
36M     output-openssh/target
944K    output-dropbear/target
1.7M    output-sftp/target

du -D -hs output-{openssh,dropbear,sftp}/target/usr/libexec/sftp-server
244K    output-openssh/target/usr/libexec/sftp-server
284K    output-dropbear/target/usr/libexec/sftp-server
244K    output-sftp/target/usr/libexec/sftp-server

Looking at a shared build, I do see that openssh-sftpserver ends up
linking against openssh, but that is possibly a bug as that is not the
case on my host (Debian 13):

./host/bin/arm-linux-readelf -d target/usr/libexec/sftp-server | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libssl.so.3]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.3]
 0x00000001 (NEEDED)                     Shared library: [libc.so]

With that said, if we can find a clean way to build openssh-sftpserver
without pulling in openssl then that would be nice.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
