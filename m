Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB40FED2F9
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E3A82202;
	Thu, 12 Mar 2026 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfAJP1cJC_uK; Thu, 12 Mar 2026 10:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB0C8220A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773310041;
	bh=IGrDesu4REv4fdCs/6xyXC/hAlqt28f4tN1qkAMyMfc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTvI3HhGaPQa/YmQAg68zXeWTv3V986/uvo7zHP2PW+xwNni0/86sf3DKP8OFkssw
	 CH4xrXrxn8f/MENBedkmP7IssCQOTn6C35BV3+wRw9gdH8ny/TPb2zdAawFLQHzzkU
	 hoDPnz2wJU32nTMHIrmQojy1uxZGrKX3SEGsOqI4akv+YsKPPH1moONyPgHf7LBzMk
	 rdw9aE9Cl8S02q48YG+OaWQuAy/b0qYWIVRClStRf+uJ8Gfy8ga3Rk4j24zaJs3KY+
	 QWAjfVvd5mYA8tESsB1YrN2i/rC4BrnV0Jd0I2EiHa9ThpFrVJOc1cFqgh1EVKPIGJ
	 aBD+HY+D0TmbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB0C8220A;
	Thu, 12 Mar 2026 10:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7CA5201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D977E40F98
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gBxHba98yNO for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 10:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.179;
 helo=smtpout8.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53F2540F95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F2540F95
Received: from smtpout8.mo534.mail-out.ovh.net
 (smtpout8.mo534.mail-out.ovh.net [54.36.140.179])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53F2540F95
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:07:17 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fWjSc6G3Yz5vwt;
 Thu, 12 Mar 2026 09:46:56 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Thu, 12 Mar 2026 09:46:56 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.168.94])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fWjSc4Ht2z1xx1; Thu, 12 Mar 2026 09:46:56 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.7])
 (Authenticated sender: mooz@blockos.org)
 by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 255FF781467;
 Thu, 12 Mar 2026 09:46:56 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>,
 Vincent Cruz <mooz@blockos.org>
Date: Thu, 12 Mar 2026 10:22:57 +0100
Message-ID: <20260312094558.120765-2-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 10056537968752118631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFJ3EKk5qJ/te3I0NtxKlUxvQ1wo6U2K2CO2997CRLGZ/M1PypMHhlMQWRns6KUnJarT2Qh8r/w6d7OiITXmX6LRDv5P25RKtzLBu4/0qHeZfokczTOJlNxPmz6Y1pMgDO/WqgM1IF3FvVJm4JEd9gnhLgLAClBMVlEbLtB7Lupch58XmlJwMUHmpb1URv79WuhX9oZpoAUAesCfNXH7Laz/RiE1+tDH4QchJM5JHdieuE5+ET90T6LlRi2CMDsEO2ab5O3KbDue9YeNGvSUO9NKmI3R9ST80q9UmP1NXC9zdi8nnDRcT5/QAPDBPZbf/VRszfyOAqoCiQN92SvSV2ZUKu8nekLwnZ7HDkg7Rw0qt8h2jkDSvZ6S1xGEWL40wJ4/w6HbmsbiVgWDrY7ps5SYqTtoQTa7tAq72NXudAVZYCTVM+Hnu7OQFVeX5kD3YkPfrCHdL60pLCgsLZ7qLcGkJh8omf4EwP+bL71C7cedmQB7FFROqZBfa+7AlFvbltR+AZwkjuYqtAtm1Yi6A6mlalRdp32z8rYETnXapVRJy5i+ghavgDaBmLpkzOSzLLRNo77ndGhtyyhbQTHH1IXLXNnb7AZSBtOO+/GR6v/SHhRPVMCxafhXf38rmtuf/JXFALslyDcYu4n5EMUPXQ/UvMgagxFT/1g/uylPN0Ldw
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007ff675fda-91eb-41e0-a3e8-c787aab71ce5,
 21A79BD5C1F98CC39F4A8EFBF840D726E372D02E) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to 4.5.4
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

Changelog:
https://github.com/warmcat/libwebsockets/blob/v4.5.4/changelog

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1466c8d9a2..cd0f3e8b59 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  libwebsockets-4.4.1.tar.gz
+sha256  f2aa31a0be16d45470360b868f3b5b114990da038ba5e49569f0732c58b2d9fc  libwebsockets-4.5.4.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 2d3395c5dd..d560003ae7 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.4.1
+LIBWEBSOCKETS_VERSION = 4.5.4
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
