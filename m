Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAF5C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CEC607B9;
	Mon,  3 Feb 2025 21:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InAKol6TzyzQ; Mon,  3 Feb 2025 21:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 376F460742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 376F460742;
	Mon,  3 Feb 2025 21:52:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D06B712F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4F98106A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bvuuavq2FoX3 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 21:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7625810D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7625810D1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7625810D1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:52:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1105C4419B;
 Mon,  3 Feb 2025 21:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Feb 2025 22:51:50 +0100
Message-ID: <20250203215155.1175999-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdefiedvhfevieetgfethffgiefhjeevfefftdfhtddvffeuieeludehfeeguefgnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopeifihhnughsuhhrfhdrfihifhhighhuvghsthdrlhhotggrlhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738619517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1YEnvZhWohTVw2NLm7xuhwCbT3tG63s1RjKIOpBJA8s=;
 b=CGyy36ITq42wgkrgM/ctL3tb6jPZ9xaLIh+5of4QbycmSG4peNSxdcolzunzArzhJKdNoR
 4dORufEXUSarWBlATZHkODX2apf95Ywe/frRsTBCaYeDhigDaHSTigYw7gOVpGDMYIZWOY
 i3p6Hpqk20/LAwOdPw9KKwAj5b/HR+wy2i7y7kfSmAfIK2owGqukz1zJxD5S4Red2e3st9
 jUE3K8/dhSvxAyQn9qxgBOHBHEO9iAvLuOMswX09J2NtZ7bCqV/vB8Q9MeH+nXslOFu1+j
 eK5al33IsyeOwsUzkmsBz5HBsqO99Sdws/sQYcruNDnfCgHFH1d7jS6s4j660Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGyy36IT
Subject: [Buildroot] [PATCH 0/2] Bump glibc to 2.41
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

glibc 2.41 was released recently, and we want to give a try to have it
in 2025.02, so now is the good time to do the version bump.

While doing the bump, we noticed that a few IGNORE_CVES entries had
become irrelevant, which is solved by PATCH 1/2.

The bump itself is mostly boring, with just a minor tweak to a patch
against localedef.

A quick read of the glibc 2.41 release notes doesn't really show
anything that would cause major breakage, but of course the devil is
in the details, and only an autobuilder pass on this stuff will tell
us.

Thomas

Thomas Petazzoni (2):
  package/glibc: drop bogus IGNORE_CVES entries
  package/{glibc,localedef}: bump to version 2.41

 package/glibc/glibc.hash                          |  2 +-
 package/glibc/glibc.mk                            | 15 ++-------------
 ...01-HACK-only-build-and-install-localedef.patch | 10 +++++-----
 ...dency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 10 +++++-----
 ...SOC23_SOURCE-undefined-to-build-localede.patch | 14 ++++++++------
 package/localedef/localedef.mk                    |  2 +-
 6 files changed, 22 insertions(+), 31 deletions(-)

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
