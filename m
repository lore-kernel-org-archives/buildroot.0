Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976CECA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AAF80FFB;
	Tue, 29 Sep 2026 18:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0YBAkJ42LrR; Tue, 29 Sep 2026 18:40:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 828C380FE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707205;
	b=ClyOPqevKzL0o2kP/dtHeNno35OjoV8EUiv0WRRr/KzJKqL0GggjHmyGYYfE9DuAoYMs
	 6KeYLYEPh07/z0fJ105zG98OCTlCWtbM661sZUcStXzpvzHjG1FPCR0kZa/yVW9NGsRRy
	 Gq5nNqjKxk+YoZIJgjB5rYDr7epQ/w4qcfe10a9th4zZEwYi9xEI499Dsb6YTu4y1VHwP
	 Vrd8FeVxUBubUU9llS9KN1h7H4cSim11VZ0y1y6pcwyXvmPbLPcILGPvPMCOHiDmi3vHR
	 Q+xQ4ZlUgG7MeRCN4cdiRJKtfOrtSEcIFGsfa5T1ILut2O1+rc+47SLZaNxZRveN/wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9F0bSv016ul46NC7Ao6wmsNgdpGQub6g+sNMAh4cqa4=;
	b=YNlWKiLx4Dv6R2uCLrXUpuK6CSF/bSYNaQDl9FSXadplKP2dcmbPufevsdnftj0g89Ss
	 kEv7mvwz0JlTAtuE+Yg8VJ4gr1kESH5eM/PftFVgeltQd3z4nwcpcjDAICjsppTmMsWTP
	 UdAX9Iamd0LxvBLBCiCP8MzifWpck7bTq6zSet3dcSojtV4Hj+Nw22JMPrjjVcAc9PxOb
	 McrnXQVEaO09Tuium1IbqG3wmkFReT3XtJ0dTD1Wu+vPFDqFh+eyhVgobO4lxYaeZxoKJ
	 kXfZCABmVtndknez9v74OXFsn4JhpjqSAukQRm2sFdX818NTTf+JvTsQBAm29k/tpRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707205;
	bh=9F0bSv016ul46NC7Ao6wmsNgdpGQub6g+sNMAh4cqa4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qSazBih4ccKpO9qt2ILMM/5Ekdt3mWYdyFuLIKFJtV0JR1MaN2yTFAV6CkhIHhGii
	 kQNoVZapuktid3rIPvYJbHQUuPDbJ+UfxJlxdWCYcmphnGc5Oa7Ac6XAkEKw3EOziN
	 xuvotffl9Sv8dAUtWVMBWyNGZwEur8bjU90BGnvJ2ItUaRT9nFZ3OvmPBGV0oYv2gv
	 nYdO2xTWqaWsIYGJT0iMpOGmRpOCR31kuv5JBEThLS/eAokYtHJd2npjYgSZmxBZWO
	 ym5B7mJTwgSZMj2dUpxsD+BDyPJTl97Ezb26QkJUq8qeMpvXHZB+gYHgBfflGFCJM+
	 7pgsB6Onlw04w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828C380FE8;
	Tue, 29 Sep 2026 18:40:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC49F14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98D4B6080C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4oAcBuqQwNF for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B64FA607E9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707204;
 b=IZ7jCjwcwDNgr6eYo19mDNNGRdYXDb9HZtgNWvzJdp+9fP3vHtD8FIilqz4WVHHWvgCx
 3P/QbAghFxCJaQxXq00LtG47S+Yd/Nrf7bKoV5ralslshiWe72v68l7RjpEnHcDo01tEG
 sTUvRuGfxyhAKdERuShmhzZAcX5COUFwKjI0/4R1xFJdH8A5J/brtYNMU3Eq3XJ+HRkMK
 SgO0ngBjIAg1J6lVcM9vQmPnP45X3lKICz/DFyPT/6Of37nQ1sUXX5bWDQWprz9HP+gMw
 JVrgqY5C6NWgFX9OJk5Ytrr1mXPXYqZCTOBhGKkr2Hgebru2g0I0I0pSOHOw6sEt3iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707204;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TvubjvYjoIFZnydUdmdXArZKN2X+f3p+xuU30qDE8PQ=;
 b=rZ++on75e3XUglsZtbci5QsydbDbp5Z6iopHOu+ldjXIObiRg/plmEuZURyNBJWjKMS3
 8EAB7NrRaS3dRiNj7yDXiu9rtJuTOroeSJDZj2P3GMAqpld0zPk5XhP60AH3I59qBQ+xb
 mtSTby/fW4Kk2b+wMg0ykEZ1div/BOFWsQyWoqhmW0h+Ic8fV9QdEKcJcKWadly86McMV
 +2/gj4dV+NpCHqDrcZ2ET28drOGZg9p+Du1eVn8CE8OoRyVmZ7vVDUQw1mho9syrlvd7H
 p64ZPpWPGhFpB3uk9IfLn35BjCValHVoClvlmQFn3sAR4XcKjxi8z4mJCrRbe0FiC/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=khywfihK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=khywfihK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B64FA607E9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707023;
 bh=TvubjvYjoIFZnydUdmdXArZKN2X+f3p+xuU30qDE8PQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=khywfihKzkPoRQGLmOst6DQIKD18oIp5H83tgJPrqhzxXT3/+X8SJ4tHUkVnC45ab
 2QWLZVhWxIAsKj1rKIupGuJTpq/uH1SxrJlNtOvGd84ZHRAHJzeX8g0xuLNiYoVESR
 27C+GRdvge1IN1vDFOJhrfbDSFNFrjtvZghPDYsXZivSZo42wXU2FXtKe5p77Imtl6
 D0YQCq1+BMNRz5iVaoYThpmZPyBLq8pF3hgqRKiKr64NiL30ogoc3NIWTCqJ9gSFAz
 AoQUic9aoJkIb27Ba3P2Y6vrnoWZdriBbCp2Vky1ED6+bf/SNeu5nbzx5cIMlSWlwG
 N2Kv8ZVf3bjfg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 WKrnLtXoLlh7KSiQhq2HbqfvSXRdDHEFwLxwuRcyT6+wZ5inlJH0k4u0npKVApEA/nJEhOmkbTw
 Ds6WRz884LT5xA88ie+PG/O8BM6q3qL8O/TMaJbBOQvEAtln8JFGpJt7rVJN36sU3T52z+KgjAn
 KYTBUncTvXpTk0ORjoestovCrEB28FT9AUvas3LqUEP1vvcHGH+SNvcJM/Fe+oRtD6vN8sIJMqU
 2BstjG2a6yNslloKfvccTCXSryv60AZHrAB50k3C/3cU6bgelz4/62lFrLfxlb77MywZfiLnVGC
 H4ewXJ10wJiBi8uDX5L37ONWdUc9B788iYHb+N18p7Hv8JPkR/l0LJ9Ch6Zqdx/Ap3ox9v2Bp9w
 b2kYdnFYID4O/OJ8fIX+l7CI+UlM3RKizz7Lm+aEoPJbDJ9aIkjLK7RyLR5tAjqAbVfNF/n5u+Q
 0hchYyeNuMfgh4f49sK5TOGWZsjNbW9XSo+FtRmfeZditPAXJbef3B1LAi6KVBzEPcdg86vQpVH
 H5QFWId1Mk87Tx9ustznWXOQ8cH3YdO6BftX9hTJFp6H3U4obb9ukLbXLhlmHRWZdVAZfa7Pklm
 4hD8p2AjpyMh+APlr5xSCnUG6QL6dzMGJfMUnCBclKJUucoctxleESs4Yf4fLie21bvIlFm3i7a
 yNfx04wOv0f3NP9FpJw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC5E5A4C5195;
 Tue, 29 Sep 2026 20:37:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-3RYT;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:10 +0200
Message-ID: <20260929183607.1849293-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v7 11/66] package/boost: contract needs thread
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
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 70e99aef11..929a9c3869 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -90,8 +90,9 @@ comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
