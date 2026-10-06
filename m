Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EBBCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C736076D;
	Tue,  6 Oct 2026 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uek372hlvP1N; Tue,  6 Oct 2026 16:29:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 25FCF606BF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304181;
	b=oZIR+vvjx5cvEM/R8T7/nQZDsjU6roeG2UksfStdou5Nf1zg66sbXQUF3mJtgZbwX5LX
	 di8eMqE7plBeo1tQ+eEqmM48C39EQEm6foosvDvmD1C6xnlrZMWvwOb4w3y1/XTARvo5N
	 ilD2R6+P3reNLSMPRYzI70ybTU/Dw7vDxMPAo7HC5OStIRJXh4dwYveW88YEHbxgkLH9M
	 GMjeN8Ye8EKABGWMnSn+Rt/E9+L4pWnC/Ao3Dk919s2wyfMDAJKMhFPVQU3xQtVA32vIE
	 R3utOyS9sTHRpoppMwY/F8nUXY2y8gMznBKhK6aKcoN/P9yaW43QAb2XOlbgOnNWYjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D7FFb97c0EcP3JaWcu8VVUUFL4Ij3WQTEnb2DNmfLuA=;
	b=aympaBnzQkXG8qdD7iU+FADTzRXFFvf/ayizyeiF7WwIYWytcW5baf7/loHhfUw3lMze
	 WLLZGRnDrRTmBGq9la5LH1WchN0KyMIIksvsolNXlR9PVDLf5M/w1l+7gPn8SLCh+2X5p
	 4if7D17MlEL5hZkYEt9NhEyjEDR/JU5mdcQky13cK8fIcX2Ynj/vwiRz+KhgSv6zb5nsB
	 jBSBBRzZ0xuojZ3wnc5LiFut0TfNV/YlHWDBdV7wYK5OMvg60x9lOZLDXDqFOh3xrpVGI
	 +XaIMbXZeN4zS2osCmsdOMcum7c+wOlB06Zi/s5es3XHs1KTKh1/QW3ZMU5+4g0rz8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BZ4vIhn9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304181;
	bh=D7FFb97c0EcP3JaWcu8VVUUFL4Ij3WQTEnb2DNmfLuA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fpt4O6FB53PQ/zYACNb6hD9HcNaZbS5Y95VNvRmAfYRqdyZlf/qr7eivWkN5AO49W
	 W/15HhFdZYGzR4E6UeX4ff3qHzxXhYT0q/+2a+A23l9NFmPQ/5j2L3tWZQoyotVvzL
	 36OljJefREEfoC8+Q0P1sFIDC7kA86anapVaICddNgz+uijdIP3edCgdI0T9BSub7i
	 ZZbmj+Xjc1LlgoCXTmNTsxJHLgIXlbs2H0XZsEbBHz8L8Et6S9sRsG4pENfDhNQ0Ul
	 Mn6zmuzhONRfqo7ad5Wu83G+4SuZaCxdOQ6i9A12kLjKI1iSyEL/TJY8zzrf0YHg6A
	 Xv2PyBoLPcwWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FCF606BF;
	Tue,  6 Oct 2026 16:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A590134E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97585606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2pKIQiD2BlU for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:22:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 73875606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303749;
 b=RIDfIyRXR+BpunhUZkLWVv2WP8dutcP3rMnuLvHTCmpZ/VHG353W8SjSQPCD9caoqPGa
 cnLm0xxXj0cD2C/RVj88+DFTpdGUYZ4S2R/GCS1gnlY1nuNh1fpEYUW54BuCSida4Q18f
 qJvnFv5tHpbE+ivJ4AqchAd2QQudKtiBTbvU2icsNH3neNZ8EwlAye6QaYFs8NgzTdErf
 cpZdSl1tP8kmGVFGK5GbwNa8/iv/UC41EXUBdRC7R2Ca4xd7a64xMItEnn4bsDhKOdXcn
 8s9iklGDTNLSP4C9pkwBHWSe4z6lxKPCPiCHeQPJgeVWKLD7ezX9tIHRXHs1j0cC4+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303749;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ut/pk0gcY4RnO2BEwl0uS8lJrnhv6IpoIDTNG+ESVi8=;
 b=Qku9673vsNt/RNGD7/tsnOIhx6OlrG20AB8rkCNoOakwi96qqe+eV7c6zkUTV6A4AJ4j
 wpFpLIERrqyXZLIfzK3zLhtl9AquxtDyDngaX3T1k+xj8lKgCg0AgwTMdwOVOFOV4P6To
 lHT72eSeizATNuYhcv95SkRaCUzUI5HSQh0ybEyShIg/P86Ly+L/QqJe3eih2A+ceueUw
 AWMkHoRczGPgtLAodrGVZCVZTCG4tKx6YjFoh/2INS4sTAt5VwHPj9kKEHl0oviDAjfy0
 fw+U+kGGa1L81NWEJu1XSGS1ZPk0vLxfvtRbgIlNlLVXJuMVSKSw8sJmJWhwSN6uR4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BZ4vIhn9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BZ4vIhn9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73875606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303671;
 bh=Ut/pk0gcY4RnO2BEwl0uS8lJrnhv6IpoIDTNG+ESVi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BZ4vIhn9khDVJpdiQeEKGFXXyDr75UonKHFGLAmcjHX166Qn76zSkvLQxVtuC9nx4
 g7ODDWwPbvZZEaWRxPdXo0Ty25EzRfLHoFH9ua1kWGxeX9RfQGsQTs5Ou4OQoOSICT
 kK7q4AwfO6LuXdnWeuzSqJh1vZzHtNFVQjV0bxaqiWKQj6aMJkasjfaTAl+m8Zghew
 hAmbVZuRBKsgLc7XLcY6jq69Jh5DvRUEN2aTjWem0XYInLfHKML9kaM5Iwk6TuKK57
 PJZgFK2JkBTMJoPD0I2f5a5DV/kw9sIMDhuP3nG54cVN+Yqm3VjHgDEvSYtur0LbzA
 fBY67Zv9DVf2A==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 TxLiwZeomeuqaD81LfZzeFXuZEUSfuzsO2JeBfZsBwAuxWDlZALPSclGmla8/K4NmGOWkCinGKQ
 gceRX4rekOJFGOiOravZfVTFso2rUq7nWZNt97//7w87dMhxJWaf5Lhv7mAJhYZYzQyF2zTyRyE
 7nWHvW+RUN0kIdw3yBb0/LMK3+xTUkQ9CFBVMbEO+wGgZJoyvZtQNmn+/EuyJNrrS0hzBUvke0k
 9uN9kUdn/EkDhFrd1LLnviRZMs2ZqRcoV8xavASfCyBWwJud7rjx6GMw/RdJiGd2jSoK98kweih
 z2l4+GrX5vHPltTEt+tnnwBCAIOaJoD+uM9t+w1xCduC3GZ4EwUNIRdD3QMWugv0XgX5hx3d8Le
 fem1t81sCMK+riAm/HqMLguWMWG828N5W7NOkIAFa1xkXHyviVss8UH6I2rd725e59GTqN+cBeD
 W4VDXQdApAHiccYpFDU3SPcTHS2qRp6rJJFWMzB4vKq8WuSPu9ytzpaAg26Ebc11iA/nDjpP5Ds
 AkQMtG6enVhow0ZAOmK6cDeCmCXimDgntZBTXCpTOR3GXqslSN8L2fiGEr3IxhcotJWIt6lhAKq
 FCtDuJSQ3DlHdXAtek6vBeyZSbTeVLknLVVmCriqNk4p3rA=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 188A4A4C4901;
 Tue,  6 Oct 2026 18:21:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-07Wg;
 Tue, 06 Oct 2026 16:21:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:48 +0200
Message-ID: <20261006162106.3439373-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 07/84] package/boost: add new charconv and
 cobalt library
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 29 +++++++++++++++++++++++++++++
 package/boost/boost.mk  |  6 +++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index da213dd2d3..45b98ec0a2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -22,11 +22,40 @@ config BR2_PACKAGE_BOOST_ATOMIC
 	help
 	  C++11-style atomic<>.
 
+config BR2_PACKAGE_BOOST_CHARCONV
+	bool "boost-charconv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  An Implementation of <charconv> in C++11.
+
+comment "boost-charconv needs a toolchain w/ C++11, gcc>=4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 	help
 	  Useful time utilities. C++11.
 
+config BR2_PACKAGE_BOOST_COBALT
+	bool "boost-cobalt"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
+	help
+	  Basic algorithms and types for C++20 coroutines.
+
+comment "boost-cobalt needs a toolchain w/ C++20, gcc>=10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+comment "boost-cobalt needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index ed63a608ac..87a576f277 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -40,7 +40,9 @@ endif
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),\
 	atomic \
+	charconv \
 	chrono \
+	cobalt \
 	container \
 	context \
 	contract \
@@ -68,7 +70,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	timer \
 	type_erasure \
 	url \
-	wave\
+	wave \
 	)
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
@@ -120,7 +122,9 @@ BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHARCONV),,charconv)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COBALT),,cobalt)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
