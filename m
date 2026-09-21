Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72374C982DE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 06:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC24406EE;
	Mon, 21 Sep 2026 06:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGIWpu5geOfV; Mon, 21 Sep 2026 06:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC4064071F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789971491;
	b=qdQJ2yMxWnYF6JukZBQv0yQNM207uyeAXOVViNeYUXbKcDzB/dkMahmqe6OrHO5JqQ62
	 NrRUi3+Yu1ekOO0+G//JUR5znTsz9XvCWjId/Mey3lzyPhH13Cnps3Ag5FjIgcXINUaSc
	 3TBjkhHFH2oc5gA+X1CA5bP2D9aDC9NuV5i9uXS3nOSm79FerGUg/k7p4kl60U/Xgb01p
	 VOKlf988q4s1JtAmzqXwCDmKMITW1/vZc1RQIZzQQmR/DHij1J5WMFaL85d3MWCmwWPwi
	 ti5LCug3axjhuAi+dMMR7g/Ki3f9vgb+ZUgn8Zaw6nAHMNL5TKznN9Xj3Ef0Kug0wPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789971491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Patchwork-Hint:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M0wLaveTakGCMRFjucL2X27XF7Dd5SH6O/QQUs51pEg=;
	b=WxFLvy/O1zEdYkJpYY0OJ9Tg7a3ON2nd6R7jAQs8ZeLAmT1luLKXpxVDHxMRV54/EMpy
	 g0kEzbr5J9fUfc8mg5ByJi0sam+gTxzw1428uEq/RZRpK4PDIhuZ/0jLG10UBeMSElH72
	 3SWGgUh6y/y9E6gWBcTyzhG8Mkqlf0kzs5m5S5JCBql6I9phPIObXdTqo529zIugjcLi1
	 kjW++l6m+DJTWICldN5qbx3gbV6hQGbUKQMbRUKokQ3gwt6JZF1gBlHEFIlA7bP2v8o+l
	 sVWZIeXkzi8Oy9nQD/O3E3CnKe+g8Bf7L/X8883PVpbwGjmqKPoz2Dpp1qJNDiUIFgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789971491;
	bh=M0wLaveTakGCMRFjucL2X27XF7Dd5SH6O/QQUs51pEg=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VWp962qyiXXDLY24yrqwkQhdtPmxD8lb2wOYbPpryGpx1ElTuouTbuCsV/Fsb7aaP
	 6W69RW0/2blp9ugGe1pC8/rGPnezyCH71kwFWnP9h5K1KA9ZJJ1cHZOehH28AtZ5BJ
	 tSRtC6d62QZmx64MkrNBq8/aao6qTxlrlSbLL5rcPndvs8+rMO5K1ItXlu7LU2RMei
	 HTGVfjcLUN90vJEurh328O8mJ3UAjJsBL+/szvC0lPp0M2Zd/bC3/3KlBquEb2JMfZ
	 XOO+bic/JkcitFeJdPp1EHGl+i3mM2XnKR2JNoqV/W8TLEIYUSH49Qa56ItU0HOCft
	 981AZVhP5Zbrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4064071F;
	Mon, 21 Sep 2026 06:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E001392
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5372380D09
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyYEn7rhGuf2 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 06:18:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 02D0380D05
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.239
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789971488;
 b=rM5Srvzdpyb40TXb9Y7b/5tJhSKD/xL20RcOX66kiOwSA9P+4KlzauyLoHfOtF8xlKDe
 8YRBggOYMp/F30mOmKHv/oxL5W0mBe9vhifPJS8XIsRMUEaR5QRmVCm9wDpqUkXilALIT
 NDf6g+BEZpxpBz1plo9QwbC9piIe238L/L5bN9pLqf0Zm6rewEUn5nb+avqwd2CIkf9ew
 DgfePa3+7ROkzDTR78rbrmtlheHeC5iEfCbWI7Xo4cGeiPQ6JPEyvuRGehiaZAM3YI9AT
 eVKTDDiQrGBXwCyGhf5EiUIEjWhw/AK0U9FJP05nchRmds37ukw4BCwauW/VV3I2OaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789971488;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Patchwork-Hint:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
 bh=xbrjSSuHtu4bayZ1if8DuKWEfgGuA/gJKkJCXEK7HPY=;
 b=XgOpiup/hyjmVgrbc+H/j8RU8YrFhSHZITL0szC2ekpL0ILknoJaCnKH3iXsKZZyzIvk
 PksuPjUQRtSj+/MjAyx4/Vz5mczfFvbxAW2NNaCp3DPkZuBoMoysIl/gjvQzS3u3PmMKo
 mjZgGr1wQhorgext60r6JYbKIvbYWXjMp/VuhbBsACgNfsc1VDa1Qb8awQL3TjNeMfTue
 bqxlPZ9CwYYsoQIiAJDqaXlmi8TJNB70CunGb0vlCdYslPb0E3xHmImE3bd2rHze7F2tr
 6FcFk1Pvm4RvHdlwZG9wgqcruOwH61xlKq4xSjgvlv4z4akMmjeAEvNI+qedBxUHYrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=G8cbvNd9; 
 arc=none smtp.remote-ip=80.12.126.239
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=G8cbvNd9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02D0380D05
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789971488; x=1821507488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xbrjSSuHtu4bayZ1if8DuKWEfgGuA/gJKkJCXEK7HPY=;
 b=G8cbvNd9uIuwhOay2e/L0zzSZH3qNjJlnP5e4XGNxMqdaFIqWOQgfcqb
 eS2rCGHf38wUmPNacDUU4PhatNsLL0kfGMmLEc4t3BI0J/NYFLGHYpa1c
 pZjDL0b3cq/KRlQseUKSVVlXbHbgWx2UePb7wX2y8JeiIUqFCZg0NL4/G
 6PvQ8ID/md4aDRq9A4GTmMX99qypoBseRXKpt5Z/rKGMvT8kTkz0P/ptB
 qjJmcKnASmgNSNv5RF4ym9/SMmD0UvCxg+dcb4Izgc4LKqKSLqlEfabzs
 mS07AAqVh3a/3elKjH4UZaYBlrsCh/vPszANzmtyiNDlbzY3rr/MEdFAQ Q==;
X-CSE-ConnectionGUID: VixlA020QyWygEA85W21EQ==
X-CSE-MsgGUID: sl5EO7sMSUiTB/enNju3Zg==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Sep 2026 08:18:04 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:18:04 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Mon, 21 Sep 2026 08:18:03 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 21 Sep 2026 08:18:02 +0200
X-CSE-ConnectionGUID: MozR04UWTve7rAET89KEuQ==
X-CSE-MsgGUID: oBulno4lQ3iPF7IpLk7Kog==
X-IronPort-AV: E=Sophos;i="6.27,114,1787004000"; d="scan'208";a="470331148"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 21 Sep 2026 08:18:02 +0200
Message-ID: <cover.1789971481.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX605.corporate.adroot.infra.ftgroup
 (10.115.27.29) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 0/3] Update a few packages, some for for security
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This small series bumps three packages, two of which with security
fixes.


Regards,
Yann E. MORIN.


The following changes since commit 43de288bd1e11149068fe52595f56f33523e0159

  package/qt6: security bump version to 6.11.2 (2026-09-20 16:56:55 +0200)


are available as patches in this mail series,

for you to apply patches up to e08ef449d915444978f2bc784c9fdb7438d11c98

  package/skopeo: security bump (2026-09-21 08:14:50 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/distribution-registry: security bump
      package/docker-credential-gcr: bump version
      package/skopeo: security bump

 .../0001-s3-aws-fix-build-for-386.patch            | 45 ----------------------
 .../distribution-registry.hash                     |  2 +-
 .../distribution-registry/distribution-registry.mk |  2 +-
 .../docker-credential-gcr.hash                     |  2 +-
 .../docker-credential-gcr/docker-credential-gcr.mk |  2 +-
 package/skopeo/skopeo.hash                         |  2 +-
 package/skopeo/skopeo.mk                           |  2 +-
 7 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 package/distribution-registry/0001-s3-aws-fix-build-for-386.patch

--
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
