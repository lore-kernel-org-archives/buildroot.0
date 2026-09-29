Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F43CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F2CE6080C;
	Tue, 29 Sep 2026 18:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATeux9sYumN3; Tue, 29 Sep 2026 18:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4DD81607F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707233;
	b=fs6s4cGbc0f9s/j8pzFsm1ve78W0er6cn30MlWuYNQpsAAGxZhV4RSh7eySc+IHsUZga
	 tcu431DFq6m0Orm3Afhxaclyoq30VtK9RUs87iXqATwNuSml+oFKncqCifM6immi8SWU5
	 OD89hHC0QoymSCXjKN7QtShXHL1qUA5d9arDRrLFCeapXMWhEMf2RjIFtiLV2yfvp0Bua
	 1VmYgO/UQTLpcl//RmVru5a2rjt/HmlfdezqJOvM/HbsfJMUERWCoZB8eAwktlOlt9XKg
	 1fnsormf329yrIv/mlDXe9way3F51drgwCenzKstlYMthl+k/bXyS6aC/66HGTyCNqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f97MHt+GXxk30CSPwCzsEjG7igEd7sFD7SSsCokQWEA=;
	b=iA3hOAYkDkyzOr2jr/wVIPygW0IGZJvyEqss0s8ft/naYfSEYB+pg6nDglMXYJFqvpS4
	 ODymKABtoOYY32vCWcHi2ncgwBBpm858ZAnsMajNtb9Ob8YDhEvqWu8H+TMPcU4f5XEjL
	 OXLrzCYqJ16PZPLJQzeBSmokgwQx+RiUe+ls5juHygiJ93+/hNpmy6yV47cq16MHLvmi5
	 nQceZAiqKygo+QHD+yZRBAkmjDvvSz3NIGP7dKjtETYoCWmFbY8NRhHzTu+rOazhxrUHD
	 J8ntZFARPXnBFNmi8ulxSv85LoHLs1tiweGjPn9ZMFNQ0VJ0T8izOJcRjc9rjn/7OWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707233;
	bh=f97MHt+GXxk30CSPwCzsEjG7igEd7sFD7SSsCokQWEA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TaNzh4KfjyFmrfrEse4P78VYhIAcle6OJjG99bXU1F7k2g85iwq47t3bKw0RsCDm7
	 o37R4GQRnMDvk9DwpUx0MY1/R/mnVkQBuvKEUL+QTHqBniUy+a5ghemrTxGZyZ2rA0
	 If/tjoXZgG0zlXDAwNPYGHwaRU++62VSncF4cWnWn367bZ+Ag1cyF+z2lVGiKQU0Cp
	 PxBWuxL0G3hwk9hlSZ0ICAAXBB6haEPj2q9mWZc6Dm1jgtnVHgNpcGkvOYQaZAmimi
	 p65ddY9svUxMXj5mvarqFmtv6BNK7htNlnE96I4f4f9hjWgITOajHE2PUIaQqPRNmB
	 A3U+9GMjxWVgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD81607F2;
	Tue, 29 Sep 2026 18:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2EB3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7837481010
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QENW2XdGuHDo for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:40:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B96968100F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707231;
 b=se88LHI3wYaKyIdnxlbHR61mbWi7bHGTu5is808oUl3NWkUuNvU5jmSqW80IUNV1DgYa
 Pd8b0W97pGY6LCf6UiivX0TDjwGRerBPHc1BT8Uqa5WSBHLtPX9ffU29SmrYNXE4ptp43
 zd0I5LRpJFtaA1+EVGxtNXUYvNmwQfJVflFRTQ9huSjQeqpvZb43+c9SPVuGZeDyY7uFN
 NWdXmkvpJK8RFhqS3uMf+Oi7o2rEZM9YO8eJEtn7OCZF62Ms+NfnKliVW4HG5EHmPW4DP
 dFQ3Bd7VApO7dkIed6lhESfOmSUQyB260VsiXAWvxX7aFUwj9B0ziynuncpeg6Nw1sA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707231;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3j034y6EVVUWQ1dGmyRgqLGp//a99z7GDRUZWW5E7Fs=;
 b=EAWMmr424CDciG/Rf7hmQb/HQs20WPluuBj5B3zmiKBup8Y4k8Z4fqzDsxCLYDw2g5pS
 M3E++iVQYW79XKyM1sk3t6LLbaLhjT42NCFkwsDjilMQdsWB+OvpRkBHkDIqr7akoj3G2
 mtcGRhL+uqrD18t8ewQapDoT3yJz1Z2dMeKiBR3wbQ2/ftEwqRBZ4jI2sd0PJtaYpHnlA
 4SrlPSJwfxDTpUnCrBZ+NpAFxJ63KaHC5PW53NSD+FkpMSRllbCXtKedK8nIQGyoPJii/
 Mji5M21ife9MD5BnDwGMfNr0z/GahvuGIf3+WS3YrZ2lBrJmjkJ+StYDLBggl0g7Bng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GqZTr9kw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GqZTr9kw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B96968100F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707024;
 bh=3j034y6EVVUWQ1dGmyRgqLGp//a99z7GDRUZWW5E7Fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GqZTr9kwwWbQYOjf3Sqg98nm2QRg3RSg+A/3OmTxlUg4LuvjJ72EI+U90F4rbIt1Q
 37vilX5Y+a+YK35Y7kFIyGS7PusUBs7ZNKdR1wBUSqtuQBOsqaQKqgRLI9yYRUz/0c
 fEaZUkLsvlZc5D4w8XImvJTH6dRAWmMERXN4fRzOK6arKBoSMDjiwcJuAPq1lItzXt
 CXoVec0AGtfSIv4+BdFEc35IGjXj8iv0nR4foeAzA0wcpj33w2Q/Pboto54fUYzK6Z
 ZoSrOUGScAPHUnTOYRGqU2ndHooidNy6JAZqKIJZZy0GtaTMplQ/FU1tZporJRQwjn
 5JMMoBiXH1Vpg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 4gjAav1nHpv/8cKpHbiShhNhpKiz8vw9ziPfyyWlr5hlnLsgW5Lz+x52H1BdfHJKA26ud0LMVnh
 zqi4X1sdalegzuzX5FvL4rilrkV79+k0QY2pZPbNLXZiPf039GcXJMo9NkM2++v2B5fPh/Mps27
 EZIqIzVaoh4wlAml7y1iEoHsas4o80S+lEd1xv92fzbz833U6/Z+cSod9TC4f+Mw+aVclNPe+IC
 QDUrdUZUzZwofw5FLxwHy3INUdPum6JFvCWGEXdfef8uB7CZt/qFTnX+4DVKfkp38JGCqz1Q5Te
 hJ0MrZQe/tBsJtnp1zY9CmgKye8DL9irFzARfDro7lmRzfQy1TY9uCQMqnEBUwU3fqlCdKjl3Pp
 5RdV/HTox1KezHEZ/gImb6Z4iCqGW7FCZrzXaoAJkNvDMfI9iI6LSNBLCOnP8inoOAmOY9oMKQW
 pr0EW8pjNTtw8sb/C1mn+W2oI8gkDWWqaczmhaA31HVicQ+GQFfWjsTJnEzHmtHk48JvfzxpknT
 kyAQz6QDBEKpG/qxXEA/Axkwn62Oj8aEAXh3gGYDbE0hb3ph9ZTL7Ruc6pxZZuJZ5smRjssDopM
 rxzWfvK7hwSnpFlPed/yi+tbXbLoFQ3TUYb5daN8yqh74ilE/yJfgzeiVu6HDLnxB8QZd1imR0U
 C0oNSPd3tlHwxG39HzA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E7A3A4C5197;
 Tue, 29 Sep 2026 20:37:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-3zJq;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:12 +0200
Message-ID: <20260929183607.1849293-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 13/66] package/boost: fiber needs exception
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f22f263538..362cd6c95c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  C++11 userland threads library.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
