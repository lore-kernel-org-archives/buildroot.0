Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E54CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317F140A54;
	Sun,  4 Oct 2026 08:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOFlpwSWFKQm; Sun,  4 Oct 2026 08:25:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4AC9A4063E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791102346;
	b=gGZiRv6Tmz4Qwt+nzexTHbNkn/HCen0JmYhJphORvYk2cdNAq2XaX/v772OjblDAlPSc
	 bEIlu6pgDo3Nt0R7/svynEkfMJHPJQCwCEb2Cq2l/+FJoQWxyANFt7FlUNxa7iwq8m9cL
	 Md8AFOQhJnrVPh27k3Sy4beV322sjkgf7blrfMclPXbZ0r5L6Ak1iGIym62RJ29iTqbNy
	 sbqqBPRLPAAJ7EImRIP7fk+AjLav6i6wxwzp6V968AgNxuhjF2tJyUAgXZtYR3fEPzvqV
	 J0tF690Z9+ASLPbkDUuLydlEBlLIO8v8T7ZpIqQgkmmmkWMg6I6yMHhLvOVz8USsgDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791102346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JxgtVvl9mbJrXnJamyLODvGSwKZ0W5UaennAhO6SKEk=;
	b=Tlecg8ImbKcRE68+CyyQlDxtQTENBBJCY1u5zVpB1EKTmkTXYUMWW+FpENws3cJeAY2H
	 G5o9R1S6rVyXjR725KePfNwiRYqwP/ivVwzhkIbFGqWJBOnrdCGjx2FLyvdE2E6cjnHca
	 612RaQAW4ZTKj3mqgmhVPw0l/Z+lk1JZNaa++yz5YHUGBKZSt8lw9bnAW6xJqc5NcedAT
	 Qfhi09anwN5PFEI3Bx8vHD59O8Qc9MFMnAvjRQKQT+blaZpNZ5UFWrVDKYELl17twF+8o
	 6pY/A8La1mXV4mXDyF0l97bgYU6KVAH53ra83nKL6GdIDM+3xbrsl+CIFEJ26XqEhyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Npd3SDsM;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791102346;
	bh=JxgtVvl9mbJrXnJamyLODvGSwKZ0W5UaennAhO6SKEk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iwNs8E3ko+iXVRiaAvEviWhEiv/owegiz/sh+LzSngMLFpSOqvc+iaNpDl566EsNE
	 X+bTkiXCXQ5svjLFg63KL0p6TjsILbyd8lcyJ4HrATQs2sDxX0JsCfp5nG97fCmfOX
	 Iy9YNsGcb4MCkdjGjJtMu8fF+nJ/8nid56iQa5Dg02f3NNjI6pkkJfGQMr/AYWcX11
	 k0tAwfW9wN0fV8Ogb4+IzAeUxDW9iv9D/hEWhKgCUJukM3jI1XDBkZWqzw/uT1UJks
	 EkY1nzbme96mtBruoqqd1RY7yJERr+/fRLP+qMnzYopiiR8UCKECgjP9MMcXXk/RTQ
	 +fbe8Hq7b2y9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC9A4063E;
	Sun,  4 Oct 2026 08:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BD6F2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 495184063E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaLP23Kh10VZ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:25:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 690C140637
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791102343;
 b=IB2I9Cc9T3pnJFVxyirXwOKEbFoe7fpYeZPRSo32GB4DKjf5XKRcTEj+lL7Xk/1Bt0TQ
 Ooim2FL1OQdc4B614knmEtd93dqtyeZONWsxVEmDg5dbyb9EFLhDjcF1qav3dZW+1MaCA
 s+uERgKgdWP77U5Enkrs87QnRqVFbszu8OmzRINfPd5mCdU2GY4r9Ry5I7/b1RC4zGglv
 N66ShLQkQWalp6M9REZwR4g4vGGwXjILlRFsD3OHgQgbsBVsDW7WLvn94NC120Mej4y4/
 liFVgsF7IBEXJewCINNpP+QA6G07h8HFfASHEriyOaMu6bw1l+vVnWYBQ3s2Hx7NjpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791102343;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WdAE4XfYDwf0KDvucjtv5hY2Lisw/fl00fbMNX+050M=;
 b=fV+L5QKqkCxtu8DgNi5qT35OCB2H7BI0sTzyXacsiehqppV0vVRcWgzLN92G3QCdDX8J
 Tt+OofmyQcuChq7dTbRUgetjJsWlLcgESctzq1HWSGv7VLIG7ZzGoliILhyUxZQaBMUyh
 QK9FdloTavUUUVDO1Ntsl3vRNHnsBZCwaSW8YMUenu/fL6+w3QOG/J/CZ9q4y1+y9qszF
 kA/EM/7fRNPjLmk/BvFCZtJZvLrcS4Ebu6C8Nyy7LJ2sULY6ucJY2Yh3mb4QVyDo+9Cae
 IQ+y0nb3FpufEIxgGeJjXPl0hn5kzO4J9u/789MPKKjLSUc2MZEgbArv6ht4qpkHi6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Npd3SDsM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Npd3SDsM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 690C140637
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791102341;
 bh=WdAE4XfYDwf0KDvucjtv5hY2Lisw/fl00fbMNX+050M=;
 h=From:To:Cc:Subject:Date:From;
 b=Npd3SDsMXNpARH9NvybyCcfgiQlJHBOpT28/vHXo79q5FqlEuIAWSthFqGhHPiJSt
 cHZJtYYj8zselzfye1dgK125bbWwepMlCM5jXFHOJUk2/hvdy6zIOUtjHhcvq5in8o
 izQtc5Vcs7wm/M2vd9musCKcvHc/ttRvjcfl7cwP12P78tTA4pKCQA2GfKPuBbCKnH
 j9xEadPtb2ukcW4IrbD2rB13sQ/2eBepx/1+SlI32b7+DSdfasz9jqnAjugHsfAZkA
 185Q19JdV1RWDHRJGNYVsLhpB5fQDtKFFnUg4yK+7t6/O78h1V9SZAZYlr2HEmZA2F
 6Raz3cM9sc1Bw==
X-KAS-Sym: v3:f51bdf72230551df:myykiwQpj3FLPW64/Ntu2vKiNNLe7h4q+kSldFuaHzl1U
 Yv1u2/71b0paelbikvmI3ditghOJdUNrumRYjBGZDzqF27Dvbk6KYNirDSp8VtlEzRq+2uzGQC7
 87dHyl7YXitnz+w6gi3ZXDYQzyYnPwMCmENqlZUK+WXqFKEVwWzMils1bj7EvDKEJ/VGNjMfO0H
 TgJd81j6+D74lFKt+v5w2M0JkecqAt2H8TeUefP3/Z1koC2qV9c5lSZYezLw5uJiXRGJFcp3Pll
 71PwNc8PCAAqgL35a29yJyL0i3OE1wBDs4zl6fo+EF8Dw7qS6wN2X5e62cDYj3LLXld8Xhhw==:
 sGiGbrrlnIjKR4AGglN/Rv7YfMUDpo70pW1zx7avRv6/IFQosxc6FU9oD723IGp8t94HWLvMjNF
 LzsMFLF5MTEbP+ewW/SWpH81XkkyCDq5ph5Xl1BBODzlnbACKG7QbomMIvNFb1euURP71L5Z8wj
 VvTSa4ikXGInPaLgVqbLTFqAzrVd2NLHbACNaUNQA+BcNOcNCmHv7QVLq5kaLBiaJnIqefsnw45
 loldqtpwpR16Nc867zxENshp8os4XJt1858nXqSYSIrNdHSiJo5ZARQQo+z8OgzRJfBBqaVcl5F
 hUkxaMLM1M1hLkNo9r/H5sVpIe73+TY4+46MOHi6LBHIgI2jTf43iFZSJ2P+uhi5wP/uF+g916K
 DgI51BLvx+GWE8moyOFE1Nlxfaia8kfuC4l/Ig0EqeJalCIZgGab20JPPjYK6/rMlqZlfOGbtMS
 2uQyO5UXk48bIF6ErgtrU5JjR01yvPtDA6NspRhA2KP0Ze6Fi8jyHNET9xW8hOZlAbbA7VncA/b
 1OD2OkWJVY+4AE3sfLwe8mLC6IEO4oSb6lV4A5ucpEf7cdh/0pdvlgSSlM1u1h+xVJRxA4ZYwRh
 Dp3mNo6XLYHp+RtZHuwhe5Ih1+mYRTGOZBFfLNf6Q3Cmty4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F3744A4C51A2;
 Sun,  4 Oct 2026 10:25:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54932)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHXQ-0000000076e-3tva;
 Sun, 04 Oct 2026 08:25:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Oct 2026 10:25:40 +0200
Message-ID: <20261004082540.3452968-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: bump version to 7.8
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

https://lists.samba.org/archive/samba-technical/2026-September/141109.html

Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a9fed114e528d085ada5bcbe1c1599c670057297

 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index bc90ae98bf..fe2b181327 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2f8aae9aa5ddd73fbaf4d61e2e5e19ef54124cbf2810b626820050e7bd2f6606  cifs-utils-7.7.tar.bz2
+sha256  b5321d3ff848d361c129aeec4ec8431642582b7036cb8a2a403667d5909d4172  cifs-utils-7.8.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 7ff3531117..5c7a134b17 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.7
+CIFS_UTILS_VERSION = 7.8
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
-CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
+CIFS_UTILS_SITE = https://download.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
 CIFS_UTILS_CPE_ID_VENDOR = samba
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
