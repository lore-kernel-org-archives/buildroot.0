Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D91C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B7860FD8
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13B7860FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5612408DF;
	Fri, 27 Aug 2021 22:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdY9VdZpinsj; Fri, 27 Aug 2021 22:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E14F340898;
	Fri, 27 Aug 2021 22:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBB981BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E6242824
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CReTyl-jmVg9 for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:34:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F478403CA
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:34:37 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.145.219])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JkQimYAQuqG1wJkQjmHeHZ; Sat, 28 Aug 2021 00:34:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630103675; bh=A47I2IdGrO5ZG0glsbau7XJlcVy+jZJd56WPZS9S47w=;
 h=From:To:Subject:Date:MIME-Version;
 b=kQl0fYzW5B3GMg1JzRlS2LhP0XUfEdoXDEuw11vfZ8pb5mgd5G5owzU/T5pfb8rkT
 rrbcqZh6wxi0qX9BlXwnEohFo/LnCsrRhVWx0LkX/a+O5VeKHCCXZOd5VWi/3mAC4N
 8h9pD3/ICRD1pK1NYL0y7yAjf+ONUz60TXDvpKoCxOF+tVG4onIoHsTFctl3/316Pi
 ENx0A8J6N0eNrj3bqtuADGQJfoHwoAmfkzZbUA2HGoGmRzJqVvjQ/BLTQRtqHJM3Ay
 ekOlD45SyDrZotmqlgAU/w+pFLR4DBC2IVXT0K2gfYl0bzkJFba+I88IiCVP3d2Mpo
 iN76/v7FYHdpQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:34:30 +0200
Message-Id: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAdORCbSwH1WuyLrxMEl1AW61pQeAY4OTkoBSw8pIhLZmT0frHxrY8nk18wUnykPydKR2kIaRHenWG804ZkYenlIyZ0IlbcKEGH+PFixuoOwyauOw97m
 OzON4pFmh3WhwH59KRs9REDDsr0hq8KQXmFpWHFT1yzbNrECJkosmmNXTm0YFQlgMNZomYdwpkz3IfV7gJDzcIZBud6Ad4vfOay8MF0ZoHwD2XGzFyHYBRnE
 h1CvJl6uqi31Ya4xbaeYI8SzK5I5P6swaUghM9YH88Jh4ULXDSQDglKKOMkgm3yPnkzOJAwre1SNjcwhhJHyeI7so7GCupCmNYjI9u/5QUYM/SIdxS45O5tV
 dVV/qaEAb+L9tYk8DEe/Hx2iXryLKqoej2byCLgDHD6fBuvH66xEPP/c/7fp9IX6iJ5hh31z
Subject: [Buildroot] [PATCH 0/2] Add and workaround gcc bug 83143
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
