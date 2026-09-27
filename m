Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A77DC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01902605F5;
	Sun, 27 Sep 2026 10:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oGqoPfp6zWR; Sun, 27 Sep 2026 10:52:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 43CF86062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506320;
	b=ebOGpjOpxjEfobbKDJbo1div4ot+UpF2eLzyLoz2e5vyLFmolAzcO2z6QR0fhron294X
	 onWo3/JMFDw8acaq18sOcNz2/fzEuhz8CMTK8xLdZrSVvpP9l2N9cW1ds/I7VjfNAYvwF
	 lUC+cPHrhA49FH8ZOD/SraqbnV+8i67ubpUZSIzxO5I2BVwffB9VPU+Yctl5hrduw3nnM
	 1u6bdmpdCG3QA9ZNIXuMRaKO0fE8Dmm3k+85zghxDFcHRQOAdJvwxyQpwGQQmDWTXIXvj
	 KkWAsliCvl2uVBMPS1nmWLcUUrPNUmii4u+Opm3fp7xExtg6z2MRUUsor9ROBVtOWcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FO2NdATENwuq6l2JZ3qqdx7nCqwHEKr341G/TX81fgY=;
	b=rGVWJV1SuM8tdw0omK+6k4KJwULpRNt2AlKWpSUrrVsNmJ3nLU1zcN/3skJ4wbXcMs8U
	 VhviEm9AHr8frgeCVkRa95OkZ9Mr18imu6yjji3HI87FZUWaKNi/4kcHa7/51U04C5OkJ
	 vHK2tw9jcVg6mdXS4Zd8I3UOtKn77vGqeoLQbl99m+62TkrWjPjCRvwKwxd8NRbTaDAl3
	 yvtMmXvD/mTaNt4IJGAPoo7yIvvOKXBSNsY9e7AhRYHxbYqDK05czI5ApPcvL4prmigFY
	 R5LAD/KxwuRNqlYQ7aR/3F1uxCmpjdlpOJACfk5DEBvdSPFyj5flIaJWXwxABMVEYRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506320;
	bh=FO2NdATENwuq6l2JZ3qqdx7nCqwHEKr341G/TX81fgY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UDGNZHMmGU2FBfJj+oFJjPzzZVvfxnYkhRGukyudLJ5+7dN17fB+5uPlbaM4Bb4kk
	 Vjm6uOgXfO7UrNzSzu8ZqUY7mVYkZpvTK5pvnO/+yJJHrl09w14biyvD7n3dp32djj
	 qk28jVEZw63EBZWVZMOJTfaq7yA3T7AyqQvxs0clXHOYjC30gwA+BrrZ2VFOyOXBnA
	 J43gewwreSrTs0kzsXdTZNzOpMX6juvVHLR1y3WCUva+HONBPjGquJW/rUttPkO4JL
	 9uaFjGXrXJdYC9ibXOCVKmHGFM1zUkplj8UX6Bnp0A2SssrtPIFsoO7K0s9bIcpP8H
	 /pmElV9FAF1bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CF86062C;
	Sun, 27 Sep 2026 10:52:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D30A335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EC8640A56
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVYV0S-HzwB7 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:51:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A0CB40A3E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506317;
 b=Li0Zv/XteXB08+fRqjQFLTNVgbF+fR2/f1WcHNNT/2N+IHmPh3BbpxCBme2NPXCjDvVp
 sbauTdM3NJZ00lS6CjRcASw7vlqxuh6N/2wxMIGIvqCak8qnV2araCYfJxyTlEvnNFrQK
 TBQwusFXrQRvLauAewxumeMyzi5ekGTf2AiOYDr590zWPVJkqbS/kpVO/iT71Wpai35xj
 0NtTS6QWkLE9MGJdcQLc/jNpzvwYrIOwcBUyo2wpQgEMCPBdqUEiHlQCSGtbDfmwIR1l8
 0VJVJsd0uaJIHzP5m/8+82GhNMpdy0yLS2cvczXO2HtNcH58F65KanCWIfanDPCVitA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506317;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=d0OQ2aArOoADDn0HlZOMekX5fhVOOFDWu+iTM/6AM2M=;
 b=eMHxuBTPrdXuZ2w1HeW9GFLsa6CC08akF+duw9gJcrtBEgDK6fx5VUa4osEr7BTnmprs
 kgfeak4hZTbGEP5NZI4lzwQxN+JIF81AWDEcifob6ab7gvEiuDbQkp6sjAm0QUWzMJ5Tp
 vehy4mG4NjYZy6aad9YpxnZROenZjwyV6WFZ+Ah/DrgUUhER6iF4Uu0FvcOpX3v1EQW5i
 /xDmD2adjbsiy77hhLBXpHgVDQWLlkA3nETTlqUhvgXvVytsZLELarv5yscGW1ikD1zbo
 1sx3ozPyCmCq9DwCeDH9T00JjK6SlExm45FW2IZ3wDow5uxL6jSS5ohXrcDG2u5kBFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=db1NFWRs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=db1NFWRs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A0CB40A3E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505849;
 bh=d0OQ2aArOoADDn0HlZOMekX5fhVOOFDWu+iTM/6AM2M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=db1NFWRsex09XixYI8gQaUaaZy1kCq6W+pXpuppzPLiNo9tO8sPekQjmOCAIcbIIi
 Os2nJrSQr4Vf8skYx2ay8YoB01uogQtuLjVx3xVe9cbZAE0LEZNg7vIdjSvDDcOAnx
 Cd5B6r6Zo/+J7EfGCe2aJU1r9KPlUEmGQctsguE0Xsvj/XeuzJBNS7CSeknbqzsojU
 8nWbhWQFCb8t9SkAdLrRnGFxzhsXPXOMVeLYrczoXnB/qGDQdeFjLc7yNOCRKPlIiE
 rCOvuztxVb0B+kvhlHmP6coVoy7hBRyuDk7Mw/Hjq3rGr4d0oOcUQnmMUXHzDfFFn0
 O6jNvNhUUsFMQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 PuTmlD5Ajq9PvSbVKNCiPMIHYumsayssnr6ruLrxnJkX7NDbnQ5DYJhjyGi9ecvUhZeKqmo7+2Q
 /82aUR6eRpisd6oQ8oKN3UKRU5pxZ0j5JFoqNVqvJJmb7cYhbwJ9DS4ZQDt4iskwjtOFXKwinI7
 vAlxCnuiqlM3q3KSmMBllPekoJVWHDh0w7UVb+EvsdsIH6RhXsP2G//CV9k+geDU5QrzwrDa1ua
 Ey4WoH8goAMviJmj4IKnBYyUOrpsFLtjUHEQdpyQd48QAcNG1lUJEJNzAJyjtAtAR+AT23T7HU4
 O0tykmr+XOWxkVfo07LeDQaXfsHD5ysZVeV1jbqhsfNvCoMzdq5HkM9rB6CXEn1leQJP2QubJGM
 yjp0YyETkS43LT9ufaaLOpU6oUxR23Bzf4ee2/u2UHu7tcSsBMIO7dj7m8TOaG8WOJVxr8xhB9u
 Uenx3yvpItLPW01NMPQ5xQrZKFNozZKD+/kfr+SZxLewMmVhWPi4OwbVVL9fBZ+r0K30mczEBRm
 vdFuLX/8clm67cfC4rCibfLLTDstl00T+pNHgNnaEkGK8QuRvHbiiNgwd8jJvElLFgRMfnntdd0
 OPAGRFgPwkS3WPU+AtxSKXfzWQRk2xU16/MkIISOKswLOiPRInSKR0nUj6AA+aA1J+y5Z6PyMIT
 aj2huZnby+A0zVX5IWlk=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 561BFA4C4FA3;
 Sun, 27 Sep 2026 12:44:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-1v4E;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:53 +0200
Message-ID: <20260927104301.1801638-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 15/82] package/boost: log needs serialization
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e88f497f6a..5ab351d8e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -243,6 +243,7 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
