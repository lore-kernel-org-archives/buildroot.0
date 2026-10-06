Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A75CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 317C180D98;
	Tue,  6 Oct 2026 16:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jk2UMDzg-gsA; Tue,  6 Oct 2026 16:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4345280D8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791303963;
	b=XyFSCnBbeuSg+WlSAeCXBb2ZKfSQixIHTC0hKPW3KONiWg0avLQm5/BuN/WJau8TBrqs
	 l8VJEYI7hEQdzYaoza9GN3+99BUbg7T5xtGr8A6XK/oGUKIGZ3ZnVKCEqlaUeQOf3ocQt
	 FIH/+9ISU9com3mOy2HYhEMdc0vXp1YKG+M+ZnDbkuu+36lBlstNhH8J0OZ/38zOe4Ohk
	 DJ1RNdKsUVE6o66sMLHu7URnocxznI73Rzu/qibU9Cp9gI6Hg3rIKdFT0ICU9926u8GmP
	 wUfmsPH+77H+u2Svq2A0jy3tdCxpUAeQjgYR4CcVn4DHh9XsQYkh4aWu7P7AxRpucEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791303963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	b=gPBgyGBZo9n/NEN5YaWL91mqrOfnr6rG+LIca53buoRQSWR1J3o/EUinq9Za1mKuP7GH
	 xoA8e6GIq+ZQXCeCaSY3uAodHB2sLOkoqFxcugrx7ZtwmSSyIhSYbbMLCnmmzid+dben0
	 zVqrbU8kl3VS9d7QCPK0KLo0+U7v+vp7pu2RqYR80VXO/oQ/nbm2G2U7hXZ+1lAZNG6un
	 hyufXVMyassv49V+jRzUWBmni6DkXKSFMKIHOjvEb9n6xofjnJig4TUzzrvug9kNXO9dq
	 PB6BaOnxiFjKRVSjLRymJb5wrM4UBpPX96gNVANFc8k7hb2uNm6vWek4UNCm2qP1eeg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791303963;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9Kyo0prA1w1Qjzae/qIL4by38q8cRBk4d5LBzgemu4fb3EZz7RmLkVh09QZvxdAj
	 xADGwiRXCalclLCPHZlmIcEy0AmY0IIOvtp3LDg6G7WxefdwfIosz/uq4JLBNEV/xn
	 wh4cmNHHXjHIIu/jMoVoi9ueel9ReWHLDQNwvJe/WPuF2YxKeU1vApl+jgiPZur6zE
	 X3Xs4r49JLwxYJ4fo+9hPiLkD/jXdAHXEL4CH5lPgii/p+lsCG8Hy4ZfFiI0+GK2n0
	 unOsLj6msZQ7qiQf2VFmpQHt5M8sGYY6omCjHBrulTmu7o6esr6G8YtouJDPcBXL9l
	 I29z3U3fSRV3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4345280D8C;
	Tue,  6 Oct 2026 16:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE5DB34E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A05C0405B2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogadKFO7TkHk for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:22:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 646CA405A7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303724;
 b=lbG6JDFX30eavEDzlNm32I1GMA8OWRbZJstYB5cMvzBoRPf2f6uVAjJgr9SxB6vjA2y/
 0KMjoc0R+07aOxZCXd3KRWfRhdjOjqL4PTGEQKINEQE5KqPE6sS4l/rX5/tMUhplXcgph
 +0/EWloAS0A9GuhPLBYqN+Hf074KMOIHlksKIJqPjf8JP2cHR3vK0ymxk+JunnrxkEutj
 1RgV9ApwICdTe487jYx+1qL4i8JPRGN1b8XAsS5FQTYB53A1fuCFyXGV7zKJnkPnfQwjm
 fWH/rFflf8DWmDQ2ALj/bYO6q9q1vQSeurNIdrmslYhUr3DpBqRVJk8GBPzlY3hK4Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303724;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 b=pZI5JVpLbpD8qnaLBlhojorKsGzEQQbFl5YcUqPb+chA6x2Xo70zL9GkQuQS1Z/yQeR2
 JygoDPLuHCKLesuhUTE09/veO60jDYfd9rwoVPy3N2ttYNqxB6B4a6JX02iVI1uGV9JKX
 Pjp3hEDzQrqco+ZAhHahOJuEw/larC16HQoGVBOnZnUxGvC9Ul8f4bgYc2HIXkirOwoor
 1eOQ7Awkr+MeX+59Jzw0oFyY0RBuZB1wv1vGuU5pfIrr3meRpPLlJgep3eClxLssU4xpE
 L3DqfEsMZE/XcH4L4gZLDYK1nOcrFhknOV3TmX7abqABu3BCOmciLPkOZ5Gp333/DTg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pcUOFM4+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pcUOFM4+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 646CA405A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303670;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pcUOFM4+Cmigis0E9vj8brjcojnk6MUHx/tqwWD0j0VMtYN6IOCjhCc6498YaStLd
 Z4M1fJsykP02+1FigLrV4Z/j1wECtuCcCKy0Es/OvRyhrnyBjBUtemtYteM6I3wWt7
 7BHJzT5ytAQ2RxuHXlUQyP11RgPNOM0o0W7RsBH3uMVvymBHW0jEelA/N3vt4mf00h
 5FN+YUbNDDNF7ZZ2M+xtDQZwD+W/nkHzE/szDiG5eGOX31RPAP6QqqZDHW4miVNULH
 5TcA+YeAu0UC3VfFbCC00qRaRVV6DikD2pzIXSdZvMiWM78vNmFLGDknn+a/jONPzd
 IFfMQJiUJVauA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 K4wMAcbKprjg/yPiV3pv7vKdaVvJBfhCafqDrCBvWdyDqDJ63yyrGy7KPxn6TW9w/DmEv07+9+n
 BJYOsGXN674JmdqXc/VdqlsXjViiw/Y/BXmr1hpBLS+nXJ2nLqdsoakLLHttbyGCspc4U2u82dV
 U0KqRVQcLNTF1Gio2FzsWC3vab7U0S1DgLroq9oIefEhsvatqerDLOyyWcuYXa3xQRrGUKZ7JAN
 aorbpWC6+TgjQaB17wFL60SVLFyIf8qe4ZaYqsiIFwJtCXuZbvon4Izh6PDcV5fNW5YfuCjncA2
 +j2Rj6dOM7ILH933sIGJ64wItTP/r9HQXsnn2y2A3MRQu2+CopbJ8l1Tg58R3YwZInbF9MW7XJL
 oz1X9OOk6wzYwfPCMV6N0zFAHxDq4BCrO1XMiJZsuf0R1SkE9oioFUyGqodMbGSQ72W/C5wzpmS
 Ulp7SWDg0RB2HMiHVunq0yWPNuUYRHpf4TuCdJt4x7CUObiIcheoOdKfDc2IVhHTAEK5hw7TRZ6
 orC2pnV0xFmy493rvBIpZXD/fqCNa559AKFRiAteb+arc4i6OxHPOrxn+SspGAqPombpoDpr+Qh
 x/Fti429kXONnC7UnCCzpdCM+SyxkZ8snbrfEdcXsBKxxyA=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71B3CA4C47A2;
 Tue,  6 Oct 2026 18:21:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ug-000000000ir-1PC5;
 Tue, 06 Oct 2026 16:21:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
Date: Tue,  6 Oct 2026 18:19:45 +0200
Message-ID: <20261006162106.3439373-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 04/84] package/domoticz: bump version to
 2026.3
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

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Added _EXTRA_DOWNLOAD for libwebem after its split from domoticz:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618
to avoid fetching git submodules. Use version number from upstream repo:
https://github.com/domoticz/domoticz/tree/2026.3/extern

Raised minimum gcc version because libwebem depends on c++17:
https://github.com/domoticz/libwebem/blob/master/README.md

Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

Link to libatomic to fix a build error

output/per-package/domoticz/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/15.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 CMakeFiles/domoticz.dir/hardware/Matter.cpp.o:
 undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

detected by the Gitlab pipelines which is introduced by upstream
commit
https://github.com/domoticz/domoticz/commit/ec5488a7df963af4b260a92bfecea53edc20b136
that added hardware/Matter.cpp in version 2026.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 27 +++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index a0e69a7601..2af63baecf 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,6 +17,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_JWT_CPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
@@ -32,11 +33,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index ae86a67b79..fc3904ade7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
+sha256  10053191b4f6becdf244d2a416b9e655c91d357b51dd8280832c6e36f7d5d5c7  domoticz-2026.3.tar.gz
+sha256  937e31bfb4b414bb33e70cad1403afd023dfff6cebba3213ec62a9c91525dcab  libwebem-9126af0ce3456c24b936dfb20d1b5a8bdb797104.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..5387076b97 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,30 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
+DOMOTICZ_VERSION = 2026.3
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
+DOMOTICZ_LIBWEBEM_VERSION = 9126af0ce3456c24b936dfb20d1b5a8bdb797104
+DOMOTICZ_EXTRA_DOWNLOADS = \
+	$(call github,domoticz,libwebem,$(DOMOTICZ_LIBWEBEM_VERSION))/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+
+define DOMOTICZ_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/extern/libwebem
+	mkdir -p $(@D)/extern/libwebem
+	$(TAR) --strip-components=1 -C $(@D)/extern/libwebem \
+		-xf $(DOMOTICZ_DL_DIR)/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+endef
+DOMOTICZ_POST_EXTRACT_HOOKS += DOMOTICZ_INSTALL_SUBPROJECTS
+
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
 	host-pkgconf \
 	jsoncpp \
+	jwt-cpp \
 	libcurl \
 	lua \
 	minizip-zlib \
@@ -25,6 +39,11 @@ DOMOTICZ_DEPENDENCIES = \
 # Disable precompiled header as it needs cmake >= 3.16
 DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -32,12 +51,12 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, minizip, sqlite and mqtt
+# jsoncpp, jwt-cpp, minizip and sqlite
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
+	-DUSE_BUILTIN_JWTCPP=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
-	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_SQLITE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 DOMOTICZ_DEPENDENCIES += libexecinfo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
