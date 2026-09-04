Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8106DC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 15:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354A84068A;
	Fri,  4 Sep 2026 15:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6dM3aLj6cl4; Fri,  4 Sep 2026 15:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7D8A1406CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788536989;
	b=jgowgWXnDWEDj/GOcgelkiwn77iERP4XqSWPex+HTwUbfvqiCO3x8JiDzK+ZKJdMrCiL
	 95aHqhfT4rTaP00nBW6vpS648jVwlnh5bwoPLDKj0CIcPMtLyCT/VhXuSMyxgYWymxmcz
	 UE5GlyqLSD0JfT1C/2iyTQrDuYIQWnW7p/osVreTPjRo2hCMRruCdiivIisz3j5Pkto3L
	 OkKdJXpuVdS2jOZA0KsrIe6uQBenTwhDpvpI1vIHQRrEBhw2DgY/CT3Ejmpt6fbW9LlwR
	 jjTCtqsnaqzKfAIZ2IDg+CPPDvTlBPDZkXnR13lrJZXCBmhLosSMphli188yF/qRREQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788536989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PNVf7WhurUSMyieTgTmFxyOwJ8ZfdCZ/u8pEpKqs2nA=;
	b=otl6iTs+PxHa3xkiWZ0pxYcsizqpsNGXLJqHMhl44mwXv6SW0y4TW7oAuLa0pM+OMbu7
	 LrZYbjcV9gWtzOlokNPV+tkuEK9xwfZ6QXHPPCIwbWVa3+D88nFFzAosmB3IDFzq2v0LT
	 6BpxoDLoIt+yU5YiMYuTIb0U055Vl8CFGYq0Thfg+qTu20kG7y8RLGTSqJ7Q4dodxXAfN
	 QBnbIPiIJhuYNXChYcilFw1zxkqDYIwyRKuijpqHFoLq+YEuGPY580I8niZ61JG8wOrVb
	 nJtfTR/ZIA8fkGJ30U9cWrkyVE4/HzfQatc+/jIwT5441uadKme7Te+tlM4U1yeBjQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788536989;
	bh=PNVf7WhurUSMyieTgTmFxyOwJ8ZfdCZ/u8pEpKqs2nA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PkVUtoW4rRjTmhfykwVYD8s3ebUWRQfoBncLyq7N6QVKJEMqyVVYH9+Awqu+htUIp
	 UYb4ehvopgcBkFIO2FGkcrvcbjG+JU/m9j3/XKL0gFBgXnkoJTp4sxJugE3VjX1kW+
	 ZPBt+b5hhtmwmgl7gUxgy3n3SuaGghAzyvePSkcy9Gnl1ia1FacUvCqMS3HWzkRYnK
	 kGFDilGQhIOUQcPHTXh2cI6LuTYne+UR1rEfIGLAbwig0yPMfOF1FxlJaf8P3n8Pnv
	 WJWPwrzMDn05KplMIt01FjwzzE/lpNcXW5O1YC6AZ4eXO/g31sMZv1VFldU/gsyA+k
	 A3aDuMp0y+Mcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8A1406CC;
	Fri,  4 Sep 2026 15:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3983DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C971360B68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXAmExb4q4nM for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 15:49:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5AD0460738
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788536986;
 b=YGtI5Is1hyQiRdE8IuqyGkIRRxqW25+cUl+q3AAZ9XcT9LmK2+H37vEQK/D158YnlJuD
 wf4daNPBPFcl1I8qMLKz4yY4nyyOC1rAMPux5OJNVfG5EA4wv/SmF87ydZmVqr/aQYgBK
 v03RKMGWI8z0SpHtpuNCx7E/DOTZBssbXTTgMTn1/Z0j982cUe7qhVop+RUyGVYbAI5Vr
 ICq6YXVSu/1fmcZLQpF2QT8L0/Jv548VtPyqIfQn9M3QpH5528oVZkRNK4mtKoqZmmOPf
 BzlgeuqOylBD4SbWyo56wnKl37wfW//pxo9vc8JAYNcQuKWZmIzSwMGXMJRC17dLnXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788536986;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=FKnVQ+W2FUo1uh9aMgDiLaRaLtYkA8ljQj61iFcqzlE=;
 b=k7jNQLoRMn8TjHWVChhOExp1VzgAeF6J0x/ZHSKu33Ffe6hIDg8DDWXciEIngeHE96hv
 NaNYMN5Q2EkWVxftNcwZDBUfiKuypGeedJFZCreAK8fds6MihMgycl0PSD+fMFoLEwRCC
 yHrRD9CYmLQStFWCB23fA7KQZJJVkeebn85TfAOqUnHY0oqYn6ZQ+hsc7+JnGwKGx8x+1
 cc96JLNO+EkSas9L8E6S9sVEMnUEOdrKjjMvzI++iCUegJs8wWUNv0Do6OgspAqmROeyO
 pP1A9Lgalim98B69SeJ4nrJ7uI3+Qb4JpUXOGZAhuuQXTPCIy1sE04JpnvaZDOQ90Og==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Cmh7pljn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Cmh7pljn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AD0460738
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788536981;
 bh=FKnVQ+W2FUo1uh9aMgDiLaRaLtYkA8ljQj61iFcqzlE=;
 h=From:To:Subject:Date:From;
 b=Cmh7pljn8si3OW8EOaJoV50zAJMafmebX638Lq1xNK6CpU9zx2Zd9dx9NvS000NdY
 7tJy2d8zY7AsE+bmg7Y+Rz3Fs8ABYQMqaryXLUKtfU6O9N3oybjL9S7Qq6uvkqmxnu
 uFjEQJCK5l5nO4FecYPvJZ7ek1HUmJXANocZlKZ1gjps8S9MKgTaM7/I1/17RBK4nA
 11CEv/NpH/M3+K2ud2k9ZA/yfEqX89Jsc4GzU9bzCx7WewoFdbGQ+63OQOYqCeeRsx
 F0/omz4uE1ntAVEofj1u47GrsTYH8FNw0dytkyWXEekTb1UoLmztpvetUpuJWHR15r
 P0eSLTlvvQNEg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEA20A4C0AB2
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:49:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40946)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WAe-0000000074D-2xwK
 for buildroot@buildroot.org; Fri, 04 Sep 2026 15:49:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 17:49:40 +0200
Message-ID: <20260904154940.107588-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.7.7
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

https://github.com/OpenVPN/openvpn/blob/v2.7.7/Changes.rst

Fixes CVE-2026-84732, the other CVEs are Windows-only.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/15dd294a64070a12caabe92cba82dfa5382acd48

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 3822b8c5e9..947922f0c8 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74  openvpn-2.7.6.tar.gz
+sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e543610563..d910802da7 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.6
+OPENVPN_VERSION = 2.7.7
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
