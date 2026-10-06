Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD73CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B054054D;
	Tue,  6 Oct 2026 16:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHXzHcL_B8td; Tue,  6 Oct 2026 16:29:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DBFE8405AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304184;
	b=pqy2ey1BBUjYBNUZw4Puws9B/NQe4PIls9Gl18dvyeBQdHWIlw8ndbGbtMHy6pWCT3UB
	 HVFhVfIPZrdXkkDFKumGcHdd5dZITPT8oJGjMAww8neffFX1c8nO71bbYWHyRWhkQf7iu
	 efJPAbJoDi9bpSDfV1uKWJd758dbSQvzLyFoPbGFeyoDxiwK2jPzfGXP1+NDKVMptp0ss
	 9ZNuCrGMVhVuhLudJ0Tdv7Nk4Vs7+4oAkRk4LvZsB2+O7DfQeN7F66eAIMOT8apiF/I4p
	 S+U7sE1SoaCW2AyEJqArOtU2WI7twAtHnTOPa8nUZCvxUA2npY8aMg1Y9+fQbNZDArQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304184;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=egRYj0AUALEmu5GAay6IUSbVyvt7FtzPoDQOq+9jyRU=;
	b=bQ3GxqfgYdXdIye+7VxSth84KS3DwVm343eu1llSVK+BlRObwLA8Udkp1uZbIwkIGcGZ
	 uujgAjK/4OTVPubZl5uQnaXyxd/DEHCmleaR9kHsu7wWAJbEECD9dDtaiabtTaOlOSpQM
	 2CZNu0jtAZcBXcE6/jRzGEIxWh0KPMyGEdS5xmDeE+xNFOgy7iclQqFN8dFc/8ITG3FEC
	 rxng4kz7oh6m6fmfJnazzBH04GQiRp0nBbvpiVCWXcnD6Wyhftw+DtzWFZRqMDaM5pcZ1
	 zLrtW7Dvf0RitrQArmScL6gKtT40JvW9Daoas39UDb6Kj6Daw9et0mpIuwFjfM+U0HQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304183;
	bh=egRYj0AUALEmu5GAay6IUSbVyvt7FtzPoDQOq+9jyRU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MIh++yPl3iQ5I06UL3h1CRr+IeujJWJ7QEaUcHCt5Oq/m6+x3wp68cmLsGHlKjm/B
	 0f7S+BQ/MHn2lpfS1Tq+yQYBjriiUsSvNkz9HiLFyI8XKG5L5SOTyHtVSuTOyXt9Zs
	 pTdzLX+x1LEeTPh1t5y5bASsj4ZQUzu+EghIMJxhf0Eh6Z3zuwyJKwRd7ZH3bB4FPf
	 wnUdlIdc3pUJFbHCAK3s2IgZHkTlVBuQ3ZszAhVf4nKJIKyqEi09WYkswS7P4yljgl
	 WqFLAu0IYdPYYO0chYelsHvCiOSRPqDTr8CzbZyUNjHm/UREOqkuWGXFRYAueDmQ1C
	 0DEKLFKWTE9YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBFE8405AB;
	Tue,  6 Oct 2026 16:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46EA334E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 449E240274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjHKoRn6gk4x for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:22:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8C18A4009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303773;
 b=VB5+QymUTRoAnynIqfXCKxD/jrbs8+vZ7RFD/8PLCI8GAuKSL9Nni3MbiwVJSn/K7hcV
 1UzaZSUorF2QI1NREXcjooHnKs2WkPsQFEMIYpgsBXUEXQnqHZlbITXJSAKZnjDe3I570
 qV2g5LDtHVNskmKw/6wmDFra/UL9WNO1e8XXNb0+UVrtueX4kZJ/EmtqIiDoc6a9B/7uW
 jD5/lB5pWhohxpD/jGuMH5AnrrqSQvDN6gR4kRiJsdeqko1p7oD4HZb66XPznmaecQHy+
 PrWSFVjW+JKqJ9TEbFGvlvBWn0IWpB1UP4DfNVnJSCs9VAeIJ++uidBXXoNTFSSUPDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303773;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Iqza05Z6AQM+v/sZnXLgaepNeeIFR6gzEtIQT6+1Eck=;
 b=Blb4uVVK86FRTp+IDKGvwPMddqcRhXbRnRPHkj1zQxNmmAu9NUfllms4DrcaFXLCEAuY
 tludh9Hoqy8X1gTInrGpQLAA6RI+t3UeESz1pb5XSMs83HGjy+wThzQ6XGJeyVBsMvDm8
 0DS4lIL1ogC8iWSLWTV48TS/xwXq8VjfSEz5Bk7GgJ+EIkUM2lBW0UGBBzJryRy6c8KpH
 ruAwlHpyNm6ox5HNhK6XSTc5gzC5rhJWLK8lEHL/VATzbXORzzqCdwIKC5R1KKnAFT9Wo
 CTLCe/t2Eiw8zLU0Gwv3bUY+R1gIGkzypZDBnhjde7clwUhBSh1jBruknS4oHdEzDgQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O089V0ec; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=O089V0ec
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C18A4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303671;
 bh=Iqza05Z6AQM+v/sZnXLgaepNeeIFR6gzEtIQT6+1Eck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O089V0ec6tHNJQrn6PhP5n3++a1AD+a+lzqB63mRoU2vcu/+neFis4TRlJkzMnIrf
 QNCFfaQ3YqaKdzr/ype6pDAwKtsl9Aj86MhVYIR4L8ax7EkT0rHZfqfVVpjAgJd2VQ
 O25qpyuXNmlMF9kQfIcuv2St+Fnq6A6o5mgRXoSvq57FIrK1Etj0+XsJhNU+5TAnHr
 ESAFDc/xYu1o57c1GDsb0s6YIxNAFcPt5a037PaAFfOF/M69XQTtrdHZ46sq1j4/Xr
 bl4Gv6Fy71fLXNAefznHyV+kwzFiIX0DO+zswXwj6NdixKhsSvRw3NsOuYOakSkK1O
 XrHdDL63PZVMg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 tSf4j68EG2i4jiWEhHGWEc5uH6FFKrMtgkIaD4GsPCgnrw/raSbSgziUkz3ow6U75beNXqPYMr4
 7MjPR4ZTV2wzNNE3p5SgNsi6PPqfuosUzS9WwHU51MOnuoKbBnAzi65yQbxif8X5dsoSq2UK4sR
 Ck4USg4QYAKx2coeVF+me1LdReX4LHVwQ1n9zr/MrTWLv/bjGYzWJhIXke0LhjTSCRJe0+JPu8u
 z2kssO2RxNH2kc27LJZ30sqv9AYfTRZqQiC4Un0rtN0xZ1/VyQG07liQvDfl0OLD5df0dQ+pwFP
 7gpn0EkZ/N6zZbhfc6Wl1rwXxm5XGGDYt5Vhr+Z3NMolRXD51ZlD73zAitX8R2nKmeyfVbKrUhr
 7GbnwMavAAxzAUb3otH5fxQO59gNwfXeZvj+6vJMf+yt9N2e+CYzKG3scebvhjmMCrHkxa+KAid
 Or5GvLaMYqgCcmfLIoxjVmbUe6iHwOJkr2UHB2JLhYqsirMuwetM7D+LCGksakgqxhdfmvv7YgY
 PSnv7O9q5/iCH/M5tLYTiEdGaKhMBKCwEY/WI0FDg0vbb3HWK1x4P2/GrYQPCSQa9TjEL9Ah4sB
 ZJ5m3Gt9Yab8zQ5epWUOH4mZRyqSs1zOTYZgMGSWiXLeAg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30FA6A4C491A;
 Tue,  6 Oct 2026 18:21:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-0WBB;
 Tue, 06 Oct 2026 16:21:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:49 +0200
Message-ID: <20261006162106.3439373-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 08/84] package/boost: add switch for
 boost-process
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

since boost 1.86 this is a buildable module.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 22 ++++++++++++++++++++++
 package/boost/boost.mk  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 45b98ec0a2..736255a33c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -287,6 +287,28 @@ config BR2_PACKAGE_BOOST_NOWIDE
 	help
 	  Library for cross-platform, unicode aware programming.
 
+config BR2_PACKAGE_BOOST_PROCESS
+	bool "boost-process"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_CONTEXT
+    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	help
+	  Library to create processes in a portable way.
+
+comment "boost-process needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "boost-process needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 87a576f277..37ec918aef 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -60,6 +60,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	math \
 	mpi \
 	nowide \
+	process \
 	program_options \
 	python \
 	random \
@@ -142,6 +143,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROCESS),,process)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
