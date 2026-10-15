Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B8CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9658610AF;
	Fri, 16 Oct 2026 13:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hNo-51rGFS7; Fri, 16 Oct 2026 13:11:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA505610A7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156296;
	b=rMcpgtmEqr2ppqjIvDArvT3LG4Tusecu2+JNFLlW5mQauhihV/tLbTdpS+bL8amCZW85
	 pQYgEZB1cjrZou1Ltf50YmWzyzmfUn26mX+Bm6Ull7p7UITxpk/kjVs0uwmOuzATx0dr6
	 5t66xV5k3ApnC7H6Jd4QUMKfQTljo1RLvhNWvfFkQYNStLXT2pVOFxglFuPhIpiHYXHVK
	 KgN0ax8faDKvYAU7fPam6sfOI/+wr4ZLy+Z9SiiRvDYcZtV5EJT918pH4lXAcLEPWAjDB
	 p8Zj80xwXlZWnhD7DI1eQEKWzDtE4cYzFDbSzhaP6ta666t957dtPzOFPhXWzOhX4lw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hG9QzRNPWB0YzFCYp9G/Ptcg6l+HHI6J1McHKAfnjBM=;
	b=X47rWx0UODMEo1/wKNafyHnWHnSxO9bDheAMhkfaXQSnkQrDCCzkhB6ImRgr+mX63obm
	 W+FZeRaaq9TO4YEafJISxnb/dXqMGF3jdJ6blgeE98+/tpqNzL+Lwp4bDoM37RfklLdRj
	 xqCWQXgRcciQshrx1kMuk8SXomMZvor83cGE5rbt3xuWZIbr3glf0C6Yi9itN0VAWlDIk
	 vcFSYL11fgWT9Aj/of5llZ3KWRaxD3CZetBy1EJnTphMBnQHXfAZJKjEY6G7jQaJaFI96
	 b2UVU9NnxuZGa115Nt6pUgR/H6pJRHF+JR9CLOqR9MHIvRo4E22MIRiwLLwzPQ6l98Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156296;
	bh=hG9QzRNPWB0YzFCYp9G/Ptcg6l+HHI6J1McHKAfnjBM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jPIQkOnGpfXyu/hj8d+y0T1SBl/m6/2XoGZ/ZR9ARc35EwYFlpZOhFx1dbz7yMXSE
	 0QaojCGW4oDZn9ywEWqzHrVbo+M4LaN0CYwJpsZWXTb+owXgK43DpI2DeTolC3xB+O
	 remXkqiANOBhY39L3bSSFlaUSSW5Zh20+olSaTOIwyOlD6cAUJye4ufl62+eH3VUx5
	 0uTO8ZgN/tsWSVsX7tWkt4JEnpAQL4ZAuPTXKhmWV0lucncRxWI/yHMOQt0P0+WCtN
	 YAEk3wEUFTQSZQx4x/JYuS8qNTlm1qbiNoCPqWreCUvpNrau8yHvw4wl8JZP1DRLiZ
	 VfTAvVRGIS0zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA505610A7;
	Fri, 16 Oct 2026 13:11:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 077E3105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1DDA40474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6giBgp1XGsZ8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2D51D4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=sx0ZM5JvYrH/2EJml8O2QX1pRMq1Rgk04Dai55YVqrIdp5UPohsd1AYLEA7qLmEzzjWX
 H3f/iRbh2DV87s2KwHYc8/a6F+C5mkKBPHMwIxE7KYnK+g5HlhRyCB+M5g6IsiIjjMLVg
 b+b9jFYnFyiaPT18xKGxNdNAwSJWSlX6DyC1ACCDeTTLbOjzp8pTbMQ5Ajo0HED9fxPev
 ycd+sN5uvKOvo6PdOwTN3uRceOEuYnPNP1cbh79YxxnDCAoRBLTq3r14hvBARjOFiSwha
 OJ4LDVewTmlwL3ljyj7XA8BTQIbKJej9BVZMWQu6PDE6OWZfhgGlBEggxwLH+ZKgDNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2GGIWFCbNEeJcnl7EXlahRKnnTDmSFdcoHA3DpWJgyk=;
 b=YlC/Y5kHHbwMQlFmK12sy3OTmuJp4tbNfffFATuD3jxtHIEGuwXGzCDNZEPyZAaKP+ag
 N0NxeDicD6WGPnoWIAuSLsoZuqugib3HCEyCW/rLbbw9aO1iIiZISr4Y9La8mAIxNHT27
 QZ/9QwvX2mWmathIXcnK0bkWgqdTqaxmPiD8PkH/6zdpMWa1wYwYclfnYZe4b/A91zSDR
 UryqlMVHUPcyxiY+aYir8oUvyb+x/TQkQAeiKYV2cENlplV/MYKu3CTJa+uObPSL/XO2g
 RhyB3ciFgNJNi0gAP80hSP7BuX10qRXEfe20r5ZFudBDLOqrIdPmC15kpWpPVuT/pqQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D51D4016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D3EA960D9; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:44 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dce16261bdc05431e3d9be75c97eb6e37cb16ae6
X-Git-Newrev: 3ac0f22f90ed9a132d3568d6926a76df38ddeee0
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.1D3EA960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/cpp-httplib: link
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998096238094241239=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0998096238094241239==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ac0f22f90ed9a132d3568d6926a76df38ddeee0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 94f270df94..c9649936e4 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,6 +13,12 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
 
+CPP_HTTPLIB_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CPP_HTTPLIB_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3

--===============0998096238094241239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0998096238094241239==--
