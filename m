Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F4FD6EC00
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF7F60B67;
	Fri, 29 Nov 2024 11:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMdKz4aKCkWR; Fri, 29 Nov 2024 11:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26C560B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26C560B5B;
	Fri, 29 Nov 2024 11:12:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B020DA6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC7541187
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSPlNXz6m0cK for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 11:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.79;
 helo=send240.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C76494124C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76494124C
Received: from send240.i.mail.ru (send240.i.mail.ru [95.163.59.79])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C76494124C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 11:12:05 +0000 (UTC)
Received: by exim-smtp-66468c9cd6-cjfkm with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tGyuo-00000000Got-13K8; Fri, 29 Nov 2024 14:12:03 +0300
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 29 Nov 2024 14:11:56 +0300
Message-ID: <20241129111156.629528-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD934EED3D1897221AD7963B5772F8CAA085A37D6F5BC3E7429182A05F538085040EDDF15EF9609E8653DE06ABAFEAF6705D2CF97A547ECA91B73EB17F61F89B0C69799EF890AE2F8A9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74323F140F3EE5B6AC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7DD4CC05688AD5D0CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C909E38A20A3E67AAE2AD4D772B8B019052FF081EF552CEA1261DF9E95F17B0083B26EA987F6312C9EC4B6963042765DA4BC26CFBAC0749D213D2E47CDBA5A96583C09775C1D3CA48CF90D92131081DE748117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE73CD73D99384BA5CA9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637AD0424077D726551EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5C314420F5929380A5002B1117B3ED69653DF81CC311BA1EA957033528158102E823CB91A9FED034534781492E4B8EEAD81B3E0F64AD3EF57C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF80379E750005F57121E0D7B2E9283AAC913C762668BDC3163A7C384184BCCF7A9EC5AF04A575AA6CBDCC763D930D6EFAEB0D92F417C22EF344DDAB89A6D4FB432F9FF9D0AADBAD605F4332CA8FE04980913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojCM9bcLeta7rYgiqw6J19mQ==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2193B1BF23F31CAC24290375F77CE29670F9A275FED18919DF290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=C3NR1Yzd3PPYxyFvL3XbUaC289gl+m4QgqoAOpAIGIE=; t=1732878726; x=1732968726; 
 b=D9JrR9jcD0K1jptlm0w6HJuN9aRnLHpc9FV7IaI8I5E+ljg8Jayo9Fc6h+ok0/CGvC80dZ1LOQ8
 GBD8QMxe5V7UmRUpZfln5ikUJfRjqnkhi3X0+6TYFhHiiK7T93+5jzutuDhcqVgAIYhxqsH9ETqzv
 75NAwLzthvdFHSIrJmzPPgYkh/Mrs5gzr0Q0ck8uoZjRFYcdwlD7wqB6saXOQmJt4aq0yv9Cq04tR
 /2w0ft2gIVgERY1S6J5vNDt3hU2DtPBcl0iowWREa5QPHhZ7ElVoIN/u9FkrZQr1GbSl+nRqIZA1V
 W3iD5IYMQg7z4RAFfXnBfKxWX3ltt0ch9dwA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=D9JrR9jc
X-Mailman-Original-Authentication-Results: exim-smtp-66468c9cd6-cjfkm;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: add BR2_USE_MMU dependency
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build fails with:
ucm_exec.c: In function 'uc_mgr_exec':
ucm_exec.c:229:13: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
  229 |         p = fork();
      |             ^~~~

ucm uses fork() so add BR2_USE_MMU dependency for it.

Fixes: https://autobuild.buildroot.org/results/a287d3eef7ea5ea9a85b5b35d14e3698df4ecd01/build-end.log
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/alsa-lib/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 447916a29f..98b61896d4 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -69,8 +69,12 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 config BR2_PACKAGE_ALSA_LIB_UCM
 	bool "ucm"
 	default y
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 
+comment "ucm needs a toolchain w/ fork support"
+	depends on !BR2_USE_MMU
+
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alisp"
 	default y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
