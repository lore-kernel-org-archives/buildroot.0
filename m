Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D12ECA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1ABA8105C;
	Tue, 29 Sep 2026 18:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ohXCHqwcrul; Tue, 29 Sep 2026 18:40:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F145D81045
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707258;
	b=laK0gnYjmR1w97CffJib8/4UOuxpBtc79Z5Xd1uzDVeL7QCKsEEyDzEh83ve8VhkyaTN
	 aEC+CK8YWLeMwrEM71kMSg/smjbpBiYBES7HSc8dUyKQ+7BDx7/XfxrsNLcHVh+VeYE76
	 l+tTkZVwRlwz/D7BZgocAQ5I4TLScXSm0RBqNd+ORbznOt3OvuXAWqqQJw0xkyntH9+Re
	 W6skmev9xXrt+Zare/oi8VwcBuj9pJOrL3pH4hgWnUdOY03LSMb+rTGux8QI6+yQo7hSS
	 +cPPviBI+67R9MMYwwhETkU+34m4OmJn/qxatH8Uo0uhQreCOoMAGq/UfMdGuMgSx6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P9IEKKH9U7oaE76E0K8Z3nLHmPgerisEZOCKhvnbDjA=;
	b=jbYw5TeBAT3Nl8dpsaLrksa7OWW8k+bNe2s7CHR/9sZ1ft0qNx1XF1g7Ygzhc28NJoyq
	 RUGG9dachwZ6870UM85xm1VHsjw1wnTSKTKhjifaTWb9P6BwI2f6doivdnAJU+rDp9joc
	 f/GoJzLb6GiZyPZ0Rkl2AXSl4dBk48VEZuSukY+a4HD/nFhp4Wq9NDgY+Dr4hBSL6nCJc
	 ZWFbs1SZ7g1eBppO13p6GMZWKvfzWZU+tV5Gif4FYLV/FqZeSzSr7ckh7xvXVd1jjXVvU
	 +9C1EtpCy49Vm1kUQWmcjWY3H2UiNCZMucpcA+Uo5l5SemqtD8xRTJ50mH4FUAZekLA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707258;
	bh=P9IEKKH9U7oaE76E0K8Z3nLHmPgerisEZOCKhvnbDjA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IAnb4fMhG0LemATk1Zp9NUkYlnQUQDQXPmn8mw9j4OcPXQqoUMiroPVAEbfiCCMZq
	 9fWSQGPoaXFdqm/dWKfN835DKX9R8hME+Bz4FxmTRN0vMbWqV4YX+DXUCuuSwuulZl
	 XPsodNZ0pWz7xfHbwewuNRXk1jF+RRv4Gcr7fRxFe36tiNjqrBwykUyU7t9V6Ja7tI
	 tU5SPiQImRzrLubkk6rYKenAgjSjGcf2OywhEyUXzA1YgmKQE/nZkzqcO+8opr3nNg
	 /KYyJ/1agTUElqKks/fmSmJ0pN7/UPpzkJ4sJiEd0cRKf1TLc9Gz3qDzmmx/Opr/Cw
	 ky56w8bcxygMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F145D81045;
	Tue, 29 Sep 2026 18:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F42E14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21582406CC
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfSsXKpUMEt7 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:40:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6660B406A7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707255;
 b=JM3tvhglciTt5ditl/vCZptdqBcuaHrbbpaCoFgo9pmqJEtDm9QEMfLu0oBM7NxxZ5Ol
 VDk34SgjkT7W2CW9uI4g3p3+uDzbqQWMjLI8UiCOPPkxLEJ6Krr2J3qQU4W8uWqJDRQnp
 sRykzj5dgA7UeQjz+WrmrrfW4ZtFN0pV44Uvw3E3C4l2763RxISwTZ0i6zbchtjN7Xc6a
 GLPJkvQI08wAenV1Afs7SclE6Y72DBH/0BOWI/AnWt1Rl1XWJ6F90c8JlMaKjr4MByv8M
 fpNPn36MVif3k7752VbHzlcaZnivCZFBV4WSS5ewnN7leG3irOLD0Uc28M6g6t+gOqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707255;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=42V07u12uvRMeLRRIS/v4g3s7bxCTpBdBi9z4uhIDiM=;
 b=etFIMLe1DPMY9p+GktRTmP/6UaIx5S4riBtabUx5LuWN1aOI9FohRbT+j9sdGnP80C58
 0uORpKJdiUyJmvPZgpf9ng6rrtgS1KTBM+h3bI/ft8nrTHX6+4+eR2ZadbgbttWdYxMsH
 6tOLHCJ0gr3xVb2yQ4S9LrkcEQhs3+ALIK0kzMM7OjhX8vQpOXDskDC6Waryc19ayCRkn
 6ChcIM92dy3bqbWmiFrv86r+9zY2nJzLf8sf0N++a8ODYD2LKQEszM/XdeMhmu7HDm/OW
 pvwUoR+H0cSiFAV8JqqOOKK1RLd5Xu0NjhgANM3/vUueQ0WYt+oB8RbtjxoWRDb8+vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jjYfAuX7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jjYfAuX7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6660B406A7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707024;
 bh=42V07u12uvRMeLRRIS/v4g3s7bxCTpBdBi9z4uhIDiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jjYfAuX7zhRP5vdwORDmdCvcDTWqAWYL+O1bphlwss/eeLpKIil/T2OlvdUIrhroZ
 ysHsDWX64t4kD1SFPKoxc+5tx2T9QUve4MRB+R/zJr6U3cv0HR5NAcD9VMZTwUadQx
 +CI6Vf8hpzMl0h8ya8BB8ttA5lNZqlANZHV16SL4uSadQq3TTs+dwfCUcOtyYLlqsz
 LYSJMt8hLOB7+IsDbOUYvIw2q4eCBT8cBrPpbpJPUh6IAuC3VEljt5utXzN32LMSzA
 sOoZ+7lsv00IYwb13ug5MTrGFccslStRC5uKw71UPhWWv863UULU/TLzqsBBDL1OGK
 NMAh5VYYY8K2A==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 ODBE5Uz/dVGm8zRyr+SEmZ92M41YdVdWk8V68yoeTsYBuOo6rNLtiO5Etsfr0Axr2gj+kq6pMJj
 G09Zow6KTZa06ZFwD9DMCJwbI/a0FcJcQlb/fZZea/fpP6gd0dyWgJ77BsL9GcpRl2u3DBPaQfK
 OsPHXEqf1ep1ALsixWF3Z1AFwhMzL4mr0sxac4s3GE097VuLax5e24WsXxuu8r1Bv0v6AEMPBLD
 HszUQbSw0JbUNRPW9ny/nSYvjS5AWWkP2qRepWlEYzLva31+USWXCwqQOtexlqq4Hp/W1ZltaPb
 RNQ52ZbRhMuGH7tflpE23FgIHzSTJ4gXEpa+h3AqBrNOvosY63FsD2AP0m4ApkIDogS7cKRfJkO
 /uVz3AhFRRYX3g/HI8iI0N3N6Gri5gvEC6YGLIRDi+8RRV2B0Yb5iHFFMvscCHYOtjQ/KfWn6+S
 QrmJWXtBsB+CchsdCMSmEv1poXejJqvJCtnT4wSVzyGijt+MaiBw96yljAKSB61jS5plmJftoqn
 QMGyuFplzHg+e8FjwkxubsV+K7e9FiB6QEOwSaBA2kVdHTTVMMnOg6muVv5HRv2XHtaQnjiAus9
 SwUI/FuwhNhFColCa1MObZ4ewvCuY7MtAb0ewFMG640Ax0U1NkJRZIH/DGmprx+imF7hISmtxX6
 tPIyNfL8Cs/ctErK6rA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF144A4C5199;
 Tue, 29 Sep 2026 20:37:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-2vav;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:08 +0200
Message-ID: <20260929183607.1849293-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 09/66] package/boost: program_options needs
 container
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
index 736255a33c..406a5b4d6c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -311,6 +311,7 @@ comment "boost-process needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
+	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  The program_options library allows program developers to
 	  obtain program options, that is (name, value) pairs from the
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
