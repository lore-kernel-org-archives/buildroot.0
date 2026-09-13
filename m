Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702D6C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E7180D96;
	Sun, 13 Sep 2026 19:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CVO32t8OZQz; Sun, 13 Sep 2026 19:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D57E80DA4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328074;
	b=tFa3t7CfxRD5OdKxxWgd1xdx+8s67e/8Jfnokl/qrRNrwWtXu2uxKNuvrXpL3ksUAEVC
	 2XNAx4s/MA1TplC/XOuH5xPH0OelDRPROnYXFzmbTmEXkDvxWkAw0xf7fkbJczuT7FSNE
	 881GBBaUjyQNDOZkmvVXBlxLEct5Avh5llwVUCoNxC619U3u8OouT19boUC21b6JV0TVr
	 Umas3wkl6I0/P6tCNu0W98igubMt05QiZmj9XWrptf4iaZDGxKSfCCDKkgf7uLv668mzo
	 9yVRaVfQnRH0h7R24ALzxlyDT4ykc8OLJxFenPLyxl5GJ3FZSijZCHfKwTzPg2k+bYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EK8eJxBGaJrEzLOSAnM8Bh2ttalyAySz9Td/43j05nA=;
	b=gbHz4WKz+HpRJzyPTWiON9Z3GySWv4+Vss6hArw8Kl94+riFOAQL12gfDyRc4Y0KItYG
	 OMIRG/RpEkMvwrDiSo7wNBnkYkGbKeRAbgyfLfXS6gvRltuTJuI7pA4DcfNjLwKluAiUe
	 IKF1vbGQTG+83YNiXOODbei57DuLBspwUhYr2DGoEsuSl1IAK2PsTuBtyESxTOpX1kO0o
	 I7eERXHeo8IGMvLRRgttccM9Apg209x2YGy7i18jm8d4Uj84s8VKiOq1Ek0ocgzd0PGlo
	 lcMN8lBfwu0qNu0IHTuot4MQbdBNyktUd2qBwJu0oF3/T7BmtfT+3bKqQyni3CIO3fA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328074;
	bh=EK8eJxBGaJrEzLOSAnM8Bh2ttalyAySz9Td/43j05nA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2OI6UrYM8l13uhy9Vn7iVmR4V5kak8h2GwqK7NR9Q6XhHpfzu0Vq4SLz6GA5gScr
	 Im97UfuU9Qsyt7RxgL1t85Sf0UdoV93AjPmuJLnZJTqsC70kcfZdPkAfPUdlFXl4mr
	 CQ5UUbpnWGt2h7mZ6/utD6iQPiftc7dcmn7QSpjZqcCCXw05uZU42LQg+R+7BZ4od3
	 r68wUsl9uVryHvb0W8gzx/TxWy1gk+oY5YO62TK0k0T/phcAwNak/VPcVhHY0ncbLf
	 Bt4w2/5TaA1H2qAFsbksIO3G93dDCPOxpsQ8ky4M9h0k6jZnPo1bra1hVI242QfbKD
	 6jeVb/MhAmSSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D57E80DA4;
	Sun, 13 Sep 2026 19:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B30523F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D85780A82
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPODXwv5kEmh for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A29380CEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=mir/oV9WJR/XpsM0dSz8JE+9z1/UMWHrp372U3kfzqK9FTYLUI74IX1taiDN/3pq6pg4
 wtps0c3Ur5P0etHlM0k9zK85AVuk3rpjjbsf4NYGF0LA/kBqT2ZBplz4YslyG/gFOiVc5
 kHelM8v39l77vnwO+LIWAwDEI9cgWFoZclb0Bq+S3jtXtQqCmXNkdDZjBjOs920LKKcp4
 LgkBN4qGDGK6Smm5+/Vg4jrdDCA6XfctH/mdhy/VTQKYw/EFgoqT6sHpVVlGzDPF/odhw
 1huPouszde8onwyIVb9vAnMaPjLaye9GxnsLL2wkzt0gloBx43TTsalM34rU8pMAPQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xKgdUZLN+xzCWCiSAmKcRGGIGfCunN01Ao/SiVIIWR4=;
 b=De9QdKEBjbFC6Te3nmIJoBnJ5lO1P0499qjOXQdV6JpWGRr4hyjOQaSSJesQ455OvaTG
 5Zas8wRi8Fy/pOmiPkniZ7B70W7H2UoabPyzpCatV7brDEEGAoct+89dnH6tfAMchdSt4
 9JxSXEuIcw21Be0CSu+uyw0XRuYU7IOkBNrtC/0tyv0kq7yrxrtdn/5K7RVDigmMmpG9m
 73F4yu3XodNAb6pRxCSB7nHgSdOP3SbcCyY/Oq+7HYqhanhoWajl7mjZ7tzXr4tWd32hq
 b2lJbqXvHwFWfZ/SG3QMtLGpFWjNl07rLFmK9JMPHYACbzvO/R4pGSQKv0BBSVbAl8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A29380CEE
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DA6995C75; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da906556371ca3728b05ea4f33402891288cc027
X-Git-Newrev: 7f5bb493e2e4abfeda1f56381b17f00a3acb0997
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.7DA6995C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/falcosecurity-libs: drop
 meaningless selects
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f5bb493e2e4abfeda1f56381b17f00a3acb0997
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_FALCOSECURITY_LIBS selects BR2_PACKAGE_HOST_GRPC and
BR2_PACKAGE_HOST_PROTOBUF, neither of which exists. These selects are
anyway not needed, so drop them.

Fixes: a15e35c4ebc52f29f65372c8e86cefa874aa4aaf ("falcosecurity-libs: add new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/falcosecurity-libs/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 9e6c2d0227..9d9cbd12aa 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -14,8 +14,6 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GRPC
 	select BR2_PACKAGE_GTEST
-	select BR2_PACKAGE_HOST_GRPC
-	select BR2_PACKAGE_HOST_PROTOBUF
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBB64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
