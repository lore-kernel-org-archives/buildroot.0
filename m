Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954A9C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48957610D1
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48957610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175F580C4C;
	Tue, 31 Aug 2021 17:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C4UIhIQhN6Q; Tue, 31 Aug 2021 17:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A885E80EB1;
	Tue, 31 Aug 2021 17:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 006C61BF866
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3ECB4061B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57aydOq1dRt6 for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 17:45:07 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA91140371
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 17:45:06 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7hwmvjpIIyy0L7hxmHsTw; Tue, 31 Aug 2021 19:38:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630431483; bh=itCRDQTK/lRRBAfQdji/1ad/sWovyUkpjJXqdn0rwns=;
 h=From:To:Subject:Date:MIME-Version;
 b=HyD+pih05mO0+Op9RCh5N7HTFdv93lrPgC1aivosxog/vU3rABP6gu87RXy6P8ic8
 BtQy5wfHb/TJb3vKMS6jtDsAbNSEACayUri2146pGCj5SCmzL4rz5iqHMKxPSGnWS1
 hVFuhGOrYGt0vz6/HQzedMQMyvCOnw4aihEHQTu+t+IOTzRM/320iQegV2ExtHzX1F
 VjuMXos79e0bj9JuUR8SmWioOGoCesN4/LAcWvaQ0EZ8grOaAOTHioWiC0TVV1lu/z
 CGavbIiwk9QwQ454NALBRNI/TxtCStmEEoWDI5kV4QzFiK7/FjNrl+KosWFoVRpExj
 o/9tM3a4Hl1Lw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 19:37:58 +0200
Message-Id: <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830235951.24b82f6d@windsurf>
References: <20210830235951.24b82f6d@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDbZk/gYQWbI/sfnOcw+6u6q4w4r6zKRuW415QmmwpjCcUzD/SvrUhZFbBW+kzR6ieYBbs82biHRb1OsLMEFS7F3XJByB5P6o49U8cYBHwH+u4TLYEa+
 8yms8DMGqF0ux8ihENhkVU5PkmS1Y098gQdeVe3CwczK5QrBuOBqdVwgnTbUeNT1LW91fr/raWTKtPlsKGiKR/PE3sMfgZOpYILyUCqYrLpTmHKY2R+8yE7g
 mxo4JuRu4F8SPkIMWFM82NEOw1iRjQNyHCjaxtqh2/pMhvdOWpUgICKzoVi3gsIcWD10y954D2CcNG3OO4gtCkiqauZnWwnT3rLGj9sIMtEnZtHlNjItMEPp
 fMuYUXf4bj1JzGeUEGcyxbGMfglTwyoxB2IXO+jWYSe4Vjjm0HZjxHX3B7dStDHJ9ZLCSimyfpNGMYqR3RF2aps72f87GA==
Subject: [Buildroot] [PATCH v2 0/2] Add and workaround gcc bug 83143
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset add gcc bug 83143 and work it around for package ruby with
a more specific CFLAG instead of the classic -O0. The work around has been
suggested here[1] and saves lot of memory since here ruby is the package
affected by this bug and it's pretty big.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143#c15

V1->V2:
* fixed bug gcc version condition
* introduce this bug for BR2_sh and not only for BR2_sh4

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_83143
  package/ruby: fix build failure due to gcc bug 83143

 package/ruby/ruby.mk | 8 ++++++++
 toolchain/Config.in  | 9 +++++++++
 2 files changed, 17 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
