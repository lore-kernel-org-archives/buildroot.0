Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29250CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98DF60EC9;
	Fri, 16 Oct 2026 13:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCeNX11Hb8z8; Fri, 16 Oct 2026 13:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C826760B48
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156176;
	b=lMAC5me4xUnsMtaSvSHwiSrFCUWhoRANEtJ5LVLOZxDbcPYcSBpIr6zPkDWaBJaN9QNX
	 S3Pee991lzr5co5sPuNDsnQcMCx+k5F53TcFVUs473DD0HIt1oQ7mYUKn2yGXcNeYtaCp
	 DUL4U/SFVsyKiYiKE4JO8O3NrLocKQFOa68Rs9YpQFIzQFZqUJKTPVzctKloij62/udko
	 OcZ2IaRn0flzMJNRS3lq7qsGcCjoawjY2XuFYMWgyeosTT3SXXMEUxXYbSCTcfDIMGcdR
	 WjQmH6qEazEaVkrYAK6pXCj4iZSAYlAtS/wUeal0OjK3pOQ87L5WAD0rt0xih6slxJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cD/7RxemE3KoEmfXuUO1EuDBhqy208utHlQ3u2+VJoo=;
	b=sS9nN29P70H7qmxi/nvBAXhAPOMN7jy8rW+PWwcf8bZtr4kq6tDCP+vmbQC/+FpOrdfs
	 3+xRPsrB475z/+VSUPs5W/vVKEVBc/liv6vAtrS7bbCXE8CpYaQrr7J/y06pYP5F5hozF
	 cxcape4+gLPKmr0XU+wWSPhwLfGra77bzPVzEq37p82XrJSOv9txg8EIKteiWdeysglrD
	 +2BHDw38cvjA+jpdGCM1eaMv58obLrY46eDDQFGnFU7oHSGsKMraWRWpnd3IwzQm3Z7pb
	 k/qvUDB/ICoQDqmd5ZRnT5im7q4w18NERbRsZ+qP9STKhf1cKEy3Fb4iqBu/tmmMFEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156175;
	bh=cD/7RxemE3KoEmfXuUO1EuDBhqy208utHlQ3u2+VJoo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W0+Us8wUNUxrXDD2cLNchX2qMsSmXWcuUoTAG3AIYwF2AvM7X1yyWOCE4YMB0YyND
	 SrmORmc7keGQZdxvEGclyOa5ALU1zY/PNPhJiqb30++Vfrqpi8Ss8oVaU7i7RKcPlu
	 G2jABRLWuxk3bnBUHdqzMPOJV8e/147tXFRmyYxXSYmxrvfx8AS7TeNdN+WqxTlUcu
	 S9hTNSUu0cdq3eGFnL7LRlq8NotnrVR/Ht/+x9YLfjp03KBO9ALvCPgFp+WNKkh9kv
	 WK3L2XOtHlyA9UGAE2CfR/0VDNqFwM3iiDpLwInfY1pEm9wN4SD1VLjaqMkKZVsDNA
	 y+CkA9KYgN6yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C826760B48;
	Fri, 16 Oct 2026 13:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AFBF255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F0BF40A06
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0Bff8B0dRI5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F132409F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=pM8RRYI7JxyoTWQG7e4J+bjz6AaIRbjVwuL8EAXTh79hgJ59ZstwK3y4jeG4fSs7jJUc
 ATrDwGR/Srv/BRI+c2V43/Yye8vY3LTJ2O2LgPZqAQp/9OCHA8KNWzdsD9d2keO6rQRrn
 9W4x5hsQvrRYb53bsl/IUXqRMBZApP9woNTi+lY09TnpLJmF+L0XGMR2tw7a/5EmfqQAq
 U2qIChQrmPrErogu58AQhZHal3BvSqhyFXbkoOg6P2nOIXOPsph4gdTp2rXVt/HfvsA9o
 Qk3j0WSyE50KY13/UJsDqnrvRamlk8bNkmnFTfUCdFvBb6MYybfBGKsJE4buHCm+3+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pVMvF9o7/1/Ut/X+ztNP07FMnLIckbqz4aCQ/rOQePE=;
 b=UR2GaFF/i6OiXdQjknRC5F8jZrTUS+dsP9e03qBfWkIoh8NALm4Bg5ZkE+NHTnQVxQko
 hO4cg5USm2hN+6HHpwggY55lNY2Z4/yF5wiz/n/JN2mxPkmip4RPwksh7VnsrpRKHPPRj
 30bqZ+1+9IrhvMbZHSvfEhynfx3S2b7axa2P2EVIyNuGpgWgqNJv9VzfQRF/FzdaoM3JY
 FL8XEUf8osihvSypcCYu1N4ja9eRfaFr7fWgyWyRlx0HnqdV0NgAN1nuKzin5K3xJBA8Y
 aAPt06uxwWhVgeAqmzk9y7bvWOpwsjYF3z0xlZV7DSXm259fIur0NBPiX+rOvMLBwiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F132409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50608960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 06e90ca7c2286f6bf28f21598630def6632ae6b1
X-Git-Newrev: 242795fcc59c3c2bbce0e201572db48dcb446380
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.50608960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib: link
 with libatomic if needed
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0115560508718557148=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0115560508718557148==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/242795fcc59c3c2bbce0e201572db48dcb446380
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5 bumped the
package from 0.27.0 to 0.37.2. This bump includes upstream commit
https://github.com/yhirose/cpp-httplib/commit/464867a9cedef2b6185e25e3e912d3f796fe58fd
which added WebSocket support to version 0.33.0 and causes a build error
detected by the Gitlab pipelines for bootlin-sparc-uclibc:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 /tmp/cciyXsAR.ltrans6.ltrans.o: in function
 `httplib::ws::WebSocket::close(httplib::ws::CloseStatus,
 std::__cxx11::basic_string<char, std::char_traits<char>,
 std::allocator<char> > const&)':
<artificial>:(.text+0x6408): undefined reference to `__atomic_exchange_1'

To fix the problem we add -latomic to LDFLAGS when needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eedb2067d8660b31a376ccdc05dc0ae2ba3ba4c5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cpp-httplib/Config.in      | 2 ++
 package/cpp-httplib/cpp-httplib.mk | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
index 9bd93ee0af..83251e8eeb 100644
--- a/package/cpp-httplib/Config.in
+++ b/package/cpp-httplib/Config.in
@@ -1,9 +1,11 @@
 comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CPP_HTTPLIB
 	bool "cpp-httplib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index e723e30b44..56eb4893e4 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,6 +13,12 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dcpp-httplib_test=false
 
+CPP_HTTPLIB_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CPP_HTTPLIB_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3

--===============0115560508718557148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0115560508718557148==--
