Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E664C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E451F605EB;
	Sun, 27 Sep 2026 10:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBNhWQogYYNe; Sun, 27 Sep 2026 10:53:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 163D4605EC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506394;
	b=IMt/eoz4LIFWdm2x962PSt0XPz3jaCQdTr+WeZOtgZYnq1uyWt5lUUJ/1fc2YKhp785Y
	 kJM/t+/5Dw0fVRyuk6aQKhQIWMoFsBDqOhgD1If/7iXyWmG+rMbaYvykUgD+QaAS8peTn
	 0QDhGtbaRslxXt3F6xJo44pOar+9kmm1q4xC628jdI/BG7BhoRWeKMGQWmpi91UX4yNmO
	 kbFmCpaGStcBwHObBUwsc8QUYCAyTLgI+aWpXH0mYdbQKN90YJqwrs4OboRRrjpwftCiH
	 DUUxFtYG2Gzja++S60CPZnXRBk398/BqHvuWrq6e+n8/OlQBQz+PJj7s5KhtnyH23wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jmUJEfpDfheG/Ra7/6ysctP+8OnDHbO7FcOj0VD4+As=;
	b=TmK4WD8NvQF7o2lgknO/+ulA6qjx55v8k4uQdqKj2NmYUj8F8Labj+AcO1/uv6k6V66+
	 vaz/d/jpY1YcYF88PhWlx7ow4k2RvAaShkfwyplS2ueC8cmc4Jcs9GmthjHYd07OxzGZc
	 0w1q5Fr7/uOrAaAYMt0Qyiz+bkWZDibSQdN/TUXqgZfwVoeC6u6d6aNFVYn+TUHfjhfTK
	 nRKh2SrikL1LWC0TBXdwBIvN1DJcZKQmOpNv2cNUShxs6AoF+ka+zmbq8NMu3MHfS5s9e
	 fhJStKgZm6xFfEZQRYUbEW8cXxzIcUMVHxzQ5+0108F9pU10diGo0Jicgzwu99mzcTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506394;
	bh=jmUJEfpDfheG/Ra7/6ysctP+8OnDHbO7FcOj0VD4+As=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WNPzKteVVvpZtDcrfCarOZPAO7BDwNxublYbetQhBmNrOIAxw3BrWwkg6J99zS6VR
	 ER2bLQMEJgOMB3vLh64mPAqiiBSgBamucdhCzz8YtL+sSJ84iVbzXFCIOjbXykGWnE
	 3HQocQlPkrnclJMbseZCGLNuGxCDMlKPCoSuNpZevzXAbYX6JLPObYDJYDI+o5PCm8
	 mV6u7G9ZdF06hzTykVXzg5SObarltkhj/tne4+IP4jEKRWbHyguktTgVJv35DBctlX
	 NRKnL1I5p5wd63nwaBod9MPE01Ezyu01oJ1xjfxSr1I/d5xUYf4sMTFeQkCbMtSO7X
	 +Vsng58dvu56w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163D4605EC;
	Sun, 27 Sep 2026 10:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14CEE335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE9D780D5A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFOlSG0AK6NH for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:53:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1DD2F80D39
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506392;
 b=MAXqOMTiAGaIuNuR0nP6vD2rts8GANGlpnFJt7MQa8mlKdO0dZ+J833qbOojcIPAqiOI
 9osPOiAsD7/ZsBxQ3ztYehfNVyMkAlC1xQsDd2DIcsu+QCEwlSyQTYCszoOVwHE8sP1xZ
 vVuWny1rFIUOI9zvP3mNIOoxmKPEhWkMak7uvPcEQSj2dRhgDcmCUwmeE389wXISknpGh
 IFuw0K9CVp2k3apv6IwIN7j4vXDCaY2yPCZLjlLCa0Ap9SBYVSKlpk80uW/tZz5A6hRZg
 7buFrVsuVZaEglavkoimbUpQk7YJqi0E5YWIi9o1XQDLfnyCKpJ24uTXX5u19BFA+mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506392;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=T1J/fmvfPWFPPvEySJhrN+v2SZXAGMNYveTeHNzzBPk=;
 b=Vpb1Rf29eRrxqnq3xLA3RJgxR8+5A7HlHEc9NQFv2O+bjk7IGVHU2aekDYmqvPYz4Wvc
 V4qzKR0sXK8+ktvEa0S3+tODzrT2MB3NOKwjUdWIA+pTUWA3+rO5YOV15cL58OAirwYHx
 WS1L5YOIAoNvqnZH+t/MP2e8HhqV+h6YAg3k8E+Hxo95B+7Rmja7+C/cNiFEJoSuccThM
 4UWa7Ltf4Mo/AAmzl5juBoBeIYQFEXz++3f3BcWbfzTutfOMJ9CMOsmaSC0cWdCmOcSUz
 z5VBQICIQ3UA8C5VE20iz/RXe64j9qTnxudYKIE6NZwFEaJO/VGO2E1gZb5hFCJGvMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nklb0jHN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nklb0jHN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD2F80D39
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505852;
 bh=T1J/fmvfPWFPPvEySJhrN+v2SZXAGMNYveTeHNzzBPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nklb0jHNmj2nWEWfePZQbZLBBSogYFV8hnUOF+6/xoSSETA18YRdLjDRKO7SsSNYw
 xUNgmvuTaDdnGOr3SFJhIsUrlT7pQ3tphsMWz16xdmunkjkivMJ3q+9gG7dfZJ07fi
 mIKbRDNzt77vlSe6uAzaCTh4fEcyxVuEbExgabZMi99hX2DTAmiXyVWs9kMIlorw0d
 xBLpkTQPPcLeuTKr/6Fu3E10IwZrTEMvRlK0PkC8TRdGqYjbVSJk0WufSxnbrJWCTF
 z21sgOBPr9a493mk8pUFc+v3/D5iCb9D34RpAqMOGWFtxz37peU5dzB838851mALE3
 FMU3cgzuNWTfw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 zz3aC/n0svFwIeGr6Q7V9zSicq1GA9tgwERDg2pfNRfx0Ri+C/OjPcv6td/Jsr8VsriK1GaVbpf
 S4MmaNiwqKf/bKg5nMyzy3vBD1oj8csFNkMJ/GAfkYu5VmSLanAJLa9L8EyWqq9+yueO0PrDdrY
 lBZtbjwNnORdP0cV+H7LQ3LVM16Ae5kPyzihqCWb+AbTiaoavJCYcQkdaC8rnYtvtvclmOjxmB+
 Z6cjSXsL/tvh8fsspnHzUFvIPnNJzV20pzoZCkAh+C7xR3GnFwXjsp0zKzbtOCu4I8gHPgljNbN
 8izbGrIGrnJVTpvwhRUQb0sZqKnb6bgoyRUNRct94eMtobDMxRWLcpS/MNMyC6gJSSj7myeEWly
 FtmrWCf3Y7JICGTDypvQGrHVqq6RJX2dspEggEmfBgltvKvEdJL00mWnGx8a1zDcLRo2gpI6r+v
 p03cCjB2wGZfX6exD6s8QkQqp3fvKpI28ztkRzWBBkah4dV21TXbyAMM23Y38aU+zeytfeWh4PT
 /aDxN9YAMpBLPhrg7A/JFViirnB5XsMu0KwNBi0VdgVitani/IvEGFAXcCdTMnlJaUN1bm7CTHj
 sEuC04MDc4Gh1RQhqRfUJ/VSgnPUlrZpR7ogNtX+3+AH6vJ1LpoRSrG4sX+mJla44hH5V3khie3
 QOlO17ghYBFQrQaDWLQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8DC23A4C4FA8;
 Sun, 27 Sep 2026 12:44:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLX-0000000007a-3iKV;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:46 +0200
Message-ID: <20260927104301.1801638-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 08/82] package/boost: program_options needs
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
