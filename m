Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753FDC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3491A60631;
	Sat, 16 Mar 2024 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3W5fkfrn884J; Sat, 16 Mar 2024 21:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FABF60640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FABF60640;
	Sat, 16 Mar 2024 21:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1662F1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100E040151
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-vpejT2dVpp for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 21:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1DEA400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1DEA400B9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1DEA400B9
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 21:09:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95F031C0002;
 Sat, 16 Mar 2024 21:09:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlbHE-001VoV-2z;
 Sat, 16 Mar 2024 22:09:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231229214418.9331-1-fontaine.fabrice@gmail.com>
 <20240212230422.5e1aff0b@windsurf>
Date: Sat, 16 Mar 2024 22:09:12 +0100
In-Reply-To: <20240212230422.5e1aff0b@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 12 Feb 2024 23:04:22 +0100")
Message-ID: <8734spnatj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: fix openssl static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 29 Dec 2023 22:44:18 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fix the following openssl static build raised since commit
 >> 80fa5672da85a110e60be0d2143e85f9e08a0f4a:
 >> 
 >> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/12.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
 >> c_zlib.c:(.text+0xaec): undefined reference to `uncompress'
 >> 
 >> Commit b9a062b354953f3fbfee702bb5b5007598299925 can also be reverted as
 >> pkg-config will also retrieve -latomic to avoid the following build
 >> failure:
 >> 
 >> /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
 >> threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'
 >> 
 >> RSYNC_POST_CONFIGURE_HOOKS must be added to call reconfigure and avoid
 >> the following build failure after autoreconf:
 >> 
 >> autoconf -o configure.sh
 >> autoheader && touch config.h.in
 >> configure.sh has CHANGED.
 >> config.h.in is unchanged.
 >> You may need to run:
 >> make reconfigure
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/6c1636f7556e7370a4c9f6d02c63cf3e20dc985c
 >> - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...py-in-crypto-lib-instead-of-MD5_Init.patch | 28 +++++++++++
 >> ...-pkg-config-to-retrieve-openssl-depe.patch | 48 +++++++++++++++++++
 >> package/rsync/rsync.mk                        | 12 +++--
 >> 3 files changed, 84 insertions(+), 4 deletions(-)
 >> create mode 100644 package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
 >> create mode 100644 package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
