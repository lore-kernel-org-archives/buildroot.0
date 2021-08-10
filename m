Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43055C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:16:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41CC60F55
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D41CC60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95B7240367;
	Tue, 10 Aug 2021 12:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7fz_3711Yj7; Tue, 10 Aug 2021 12:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9ECC40384;
	Tue, 10 Aug 2021 12:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95CC01BF2B5
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1B4402A8
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO4p94UfE9tB for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 12:16:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fallback17.mail.ru (fallback17.m.smailru.net [94.100.176.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6C2A40367
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=MFzxDCPauOx2DvT1OCKfpoaa9QDXLiNjSoDq4j9j9ck=; 
 t=1628597807;x=1629203207; 
 b=Y8GmPAgIplDz0HGQsoNJ4O9Ph3Iau+Cmyg2+eWneW07cT0ynLLY2g7WPaC+PtZOHd1pzrjpuEHo2UdehKA4NFJJhl8ZySJohI6ljFoGSgROgpPFySIljdyaNefK/60j3eiV9kau/jrwnvTvftZZHiu2pPGecq/f3uGWnyGnBi/Y=;
Received: from [10.161.117.32] (port=59276 helo=smtp3.mail.ru)
 by fallback17.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mDQgX-0000Dx-7C
 for buildroot@buildroot.org; Tue, 10 Aug 2021 15:16:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=MFzxDCPauOx2DvT1OCKfpoaa9QDXLiNjSoDq4j9j9ck=; 
 t=1628597805;x=1629203205; 
 b=HMl+iOh1msTG5rjbQkO6ympA7mkwhzBFqq3+d2RG6wCys1TDnLfj9NQbuI7MQJQpo0TaGrbBl2ADnzjHxowxbX7ytxz4YR4Hqi3TbhiBtCs9kAuq+mlLYIuRluysP2Hia3uI+ufYvwH+sFTlPBfkY2OX+XcEz+YuFwk73kpRuVI=;
Received: by smtp3.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDQgN-0005FT-8c; Tue, 10 Aug 2021 15:16:35 +0300
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 15:18:49 +0300
Message-Id: <20210810121849.1006271-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD910164DC12A5633065676A9727AC27C74182A05F538085040DDE42C4BCA3E0FA296B6D9A7E481191A42DA09621AE831DF3AD3106FA1546855
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C579B1C3ABE6C709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE75037DDE13FB75316EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F2808FE5717359C0781D5C4F66368DCCA720879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CA09ADEE969FA4D8B6136E347CC761E074AD6D5ED66289B52698AB9A7B718F8C46E0066C2D8992A16725E5C173C3A84C36804EF05EF4ADF2A3AA81AA40904B5D9DBF02ECDB25306B2201CA6A4E26CD07C3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505E9E8A53A012B36F5A0B11C6A8D662316
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F86D7DE49778307BA361F42348BE27C06079C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349C39CCCDAABCB54B257AAD079A1F116B2B5612ED2052F8F99E634DEA5F2F28C208D16FC9A29304651D7E09C32AA3244C45A3127BBC42923B56027E567C4386F5A8CE788DE6831205729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB8u+DSR2S1gOg==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB248549D042201A84BD53EF54547AFFA2EBFFC890AC2FD2F583EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4EE34287C01580B60D870A0C46F9590374FE9F612BEB2F6A368F3CF0E9FE49B695288F5D72CEDFED6B062D0B2C565F6E5EA4D7649B0E1446EFDC2DC8BD3FCE4B1
X-7FA49CB5: 0D63561A33F958A52265136CB86BC6B2ACABF24627BC881857A202539BD7BE22CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637F31C3C9966682AF5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC850C865FA6708688FF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB29735652A29929C6C4AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B67A7B0CDC955A1711089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505E9E8A53A012B36F5A224627AB056EC21
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F86F4D0C7D0156AEC2769333EFF4AE1A07B9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB+PHHps1bFfow==
X-Mailru-MI: 1000000000800
X-Mailru-Sender: A5480F10D64C90053DB5E8752E58C64BEB1FD43178E200CA024DE1E6414CF626ADE4EBD2360AF0B9EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/osm2pgsql: bump version 1.5.1
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
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.5.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 13e8de4b51..c488949b62 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fc68283930ccd468ed9b28685150741b16083fec86800a4b011884ae22eb061c  osm2pgsql-1.4.2.tar.gz
+sha256  4df0d332e5d77a9d363f2f06f199da0ac23a0dc7890b3472ea1b5123ac363f6e  osm2pgsql-1.5.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index bb8dba419e..74193c62cf 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.4.2
+OSM2PGSQL_VERSION = 1.5.1
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
