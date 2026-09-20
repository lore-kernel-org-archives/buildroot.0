Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08ABC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F7C40F74;
	Sun, 20 Sep 2026 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5CXrUeWNVQ9; Sun, 20 Sep 2026 17:50:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AED3040F81
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789926648;
	b=tDMvPQ8qB0T1aF418TDbTNrIMgU6SlBgYqSED/dDygeIC//rU+TzOhxvh52AaM1he/CF
	 fI+rwTVzRAmvzRelO4+5pCTEHLzzWin1nUgm2Qi1k3B+PTvsYGdQVHZ2WglRFgV+yuuse
	 m5uWbwDo4WPHsk1MogAlVYFAXpHOtw5DC5EfKwBbrpA01wtPmrlVkV+Vec52LEsNH6X6G
	 ZqA7xFZBDyNQk76+etjB86NgUXN5f+k9AoG6A7j34kWdy6TPRx9N8aZvib7Z6YOMyxKEt
	 tSehJIeaaP2vO10CJ+3fIlUOD6dXDZOr0kG6zMbiPGrYgQ0P9Y6id0cT1sCqr62hGWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789926648;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bC93QF29uyAxtcbROh9cdlPRjYvQI8/gE+IlnWrbKr4=;
	b=c0qqCjFb/bRaDX+tUeLjpyAI1h/LQR1jq9bfk3TS1q5HbAPatlQo7FT/wnMcMZ5TvxAz
	 jBmsiSu7mP8oAiGt28Xmz2zQDN8jDcVLMJKVQZnVj3J3px8azQqiLQUTo0m0eOm3G1XfW
	 RIfEH2SgqAHVh8uQi3tQSvzhH6f187zeFmd9Z49XNkueZDMUccWqRrPbMWO4dhgbYBnhU
	 ewNTDJfKmy7Y3OU5kvMPZJvd5lANsDk7nzPrPlg/5ZI1/3fGpp7ocio8IgwywZwaKstu7
	 vl0eduUtPfJ5Ywmyu1bH3ImFViwGBtvnOyW+PjCV+Wy+3dAx/FYztZv2nn/b3QtT8Qw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789926648;
	bh=bC93QF29uyAxtcbROh9cdlPRjYvQI8/gE+IlnWrbKr4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CSnu8Z5PSaSFT4oWcXSvgAhnXcBRlwHeP80DeH//zZOd3wd5h2IULfD/d11YThfaE
	 1uvrX1G3yCOmMMkA4pRdN873npwwpwA3evxa6zJA0BhM96KY3rL0RnoozeVf3MgNup
	 NFe7SnR6dRr8r7wvSD/fZOqgVM5s2ZeyYBvIUD/TtsSykkVU6T+SgP54oBGbDsm4+5
	 xXa7iem6eiXI/CONwgCyZtmhj6cHx8VE6oElPrfnCcJ/lNhtimj6fBJvcAx9Y74BbY
	 I5XYiVtAW8sPzZmL1P6rPz+F9o008GadxaprUQR/GM25MMWLSMdTaug9RckkvQzTWy
	 Ub1gYioT2xZGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED3040F81;
	Sun, 20 Sep 2026 17:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAC2E3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC47280E6B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsI5G0ow0Bqn for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0429680C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789926646;
 b=X8l1qmVQb1GnnSN8V0Nb7slmWpNnmLyiL/5+Xu8LUiOp258KcfaafsBi6Of3v95LeinZ
 XwtoT+kau7PRFMksPzEmeBvqGXQXqICfgAQVxMHQCDGZGACarlvOsQzkYSVc3RwJIAavr
 z6t30t1z1aK8jPt0ug5n9ndBBnjhRLAYUdR96k7fp407qSO0Q4zoMIJUuOhITwGBVy51d
 +EOL1SYYyeoaYT9Tg0U7RxZ+SbwLJZrEBeaGViAQbd9IZm/Syxv0aJqVpUMMCh9w3AGvD
 luqOQQ89L6wlP0PHQnAHNOxg0WhtyvlEL4T6F0MGAlGQtBUfRXto6WM2VnYUoY6oC7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789926646;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4UCS7F52GwpzJlldFTqmk+dN3EgiE74yHBY46Au9DWI=;
 b=NHi+bIl40Cf1WGkP5oHOiaQTW6C9+Eta7ziugD+frV+9ocQhA3CaX7bGwTA1JxdbpNUt
 Ekfe55i1hmLs7KPgtdUqNcYpz8RAw+UZ1a25G02kAK2XRXBVyOl56vU75vhzVyvDmrKIl
 0E5nLP4BoKr3jDOyKrdkoyMcD1gkM61v5LyA+TS8apwOe95hlV0LaRM2nAe8lvQOcfugb
 B0Lr+8RoHZjdYFN9nUtI4uAggsmKQTLD9Fu5eHlal4M10r3JPaGn8veQ4DXVdzcNhy2wR
 BxZcx0cdYa1ncjvuAlzgeUpfZXo4GZiPN/ZPtnC/xAwycEIB8CTaastaoC9+4MRbV7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=T1sHZGZ0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=T1sHZGZ0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0429680C7E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789926643;
 bh=4UCS7F52GwpzJlldFTqmk+dN3EgiE74yHBY46Au9DWI=;
 h=From:To:Cc:Subject:Date:From;
 b=T1sHZGZ0SibvwMaDQDJXxczKdA2IT/WD78bEMGJGUOhh8lK+oXkNyyzlsL9rWliY8
 2Gak3P90Y3lR+G5HLSU+ujLKIg8rb6BYyvdbcZ7+41BIx0/IahWWVlMK+dHekTDqr/
 MS2q5fp4MQbyOfqcsh+UiQ2Zdr5DXD4AIsr62kfZhdrClTRK8chSOMYuBu5aHQ6zY1
 IXkHOxQsqfXvBO5U2VHT/WHcuuy07lgy9ASFMIeFdSWXBSVAgkep0zsfUlYY1Iq43s
 wwtT51QGPk1QtocbQjMufHFq41aER8GLoSDnulYWzF+q/f3Bv2dlHDZCDOO6b+2xMV
 ud6s894KE21Fg==
X-KAS-Sym: v3:f51bdf72230551df:Cj19210mj5koN+X5+w4jJQx0wZS0f6/OSa2AnH5kPDtsUpmb8c7zPJ3iwUF9lmp/Cmx6TgI/SLm0Rjebo2XClQhcoJv0y5D0K6w7j8NuvAnTEvOJ2pIO3us2AENdoQUcjl6+megbLzBF7q5KntPAa0VRV6O6dFjmzaRcG8ZyQrMJhsjddH2gg84huXVce4fMw3XTjnDvUgjVvqzcW4UTpeSVaNCWk6elTKHtSAmLNrGBgygpf86DnVkv5fndOCalrLfUERR4uNBKO5d9p9/EmidmMtyKnlKrlPgHGZUXHJ+vbOZb/k/EzbRcpAEvqIQAM198WddBmhpZH8fYmDObrQ==:eG/sjotR9c3KZPcrvAxEdobV1eN/gsQKxYB5l0m5nnMocB+at4ZplI1lxuYMvu8QjL3uq+i4rI+YEG09I2PB4dDIzyGJSFFgPO+qdfPFVaguFsawzD9FKMz7X/M7a9Hn8ndrbeSc4Luok/EBynNX0AksgfRiTjiLRIWF2R2A3ri89d5WRva6cTcCfrYbO12X7omxVuR6ceubhDStOJ4Vc1PYy/gtWBKg3jZuAohF02m2q/+WV6/kwrF8RXihN+m7hYcMSNtEYD3TrLetgxiNelAV6qh08sUO1/NWmi0VLDcSoTpMNPNQgPBIbYuoFRaDDkDKHW414ahKbWBKIDIgWmhcqv2RNVsIElXhG8Egms3AtMi55KYyACZ8K2tAX19bibP9OPoJA6PAKy1bxrlYVJ3H9KeXGIuEmsm8pjEa+g5/I30ivnzhe19/uO4sqlITYfv5xydk06nvVMBKiNrSK+cc3ZsyG6UF7H6F4vL/6Dpkw9fuplzGPTr+KQG54U7blvwSITf5miVCpQWIzVZsNJ+HbUBdmck5sB7HrMD+QYGCLV5kIvt7yaT8atyk6VgoEyf2ATVZ6/X8CLaobfaZs8sCkrpbIEYodjGLktPjxnCdrK
 MpTk7SkKyFSJ4dKcwah0N7ByVThw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFD06A4C45CD;
 Sun, 20 Sep 2026 19:50:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47684)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8LgZ-000000008Ml-2HsN;
 Sun, 20 Sep 2026 17:50:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Sun, 20 Sep 2026 19:50:43 +0200
Message-ID: <20260920175043.369725-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/1] package/cpp-httplib: link with libatomic
 if needed
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
---
v2: Added -latomic to LDFLAGS (Thomas)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2364b86e92f24042ca7f9494b427321527b26adb

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
