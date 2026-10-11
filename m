Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B58CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAE0405CC;
	Sun, 11 Oct 2026 13:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dECpP0WyFikS; Sun, 11 Oct 2026 13:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80F6A404C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723894;
	b=R7vf/3Ql+Z754XaMS4zVF3f/rKJ2f0LlYoWPtJq+Lwv7LHes946dRnydw7PfqAMemd3S
	 Y73qMBZqsyOxVAMhzU5kN5cJiaUqL7dDPNfWgbTOCyQrGounEn7v+Ynp10+vKSsrnWqom
	 YXqtLpZ6ycFGmRiqAUiLTsJnzktL0K0ahyUV7Mw1+6GJpisDhhLf61C/5jTUUc5tmfwGg
	 9mtnHKJdIP/22hMSfWEbkC1cERJa6KTmbml8rK6ZAls0o+SxBtMfwCaKMxVHtko8/EirS
	 65GhRCqt/DbSu3t17MNAtc2x0eqg6johWqxqQpCEPpbMCs730QdWLIOcaNWfzy04cwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ebIa/97GeSbindws3/FDw8izLV/33n7kcuZcsINwWs=;
	b=eGp4uAr8jA6HLk0doR5nU/Xn4F50ua0WTs8xctL+TevcFeGTfQHHoFWbFOszKTqS3vVL
	 h/kOKwUZWm0xE2CzrjAP+NCtBuAcejyE6lP6EUFezle8fw3B0kYsnMTvwSFz6PyZnAAos
	 c0DiUpUM/7KwAfzj0tE7yaNLQlgvPY6EAQBrU60spiTh7GoFN6ziq1FM2yklINQ2nXQtk
	 DosvoxOdTUjWlGdLjFp8HT51g9aOT0Ar//JVZrPY1Acn9ipvzALoOLpMfhg99enUkOegt
	 mQzyWQChPQTnb6iE/HYkRd4SbZy93Pu9YIKlDOepySm1wcExfiMxRHEsF6bIb713ZkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723894;
	bh=+ebIa/97GeSbindws3/FDw8izLV/33n7kcuZcsINwWs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kpAeXL2M9Ft0Fi88S2/BBEQ60bz2xvr6VcDVEhz+qCLf6SRsEsgLM/e/r5kyr1zD7
	 gRMuYkwG5MTGPPH1ChgHveM14BKLKvnK8cCiuGNphU6R5U+pjYbXU4j0EAzUOC7v3I
	 iydQ0vrqIYH/8HHKa08yzrl162USpCb/9uSXNl9m1xmEk3LO3L8/uYq8JzK0dE6aUk
	 mj0VOAWHAfITM2eSvwhjQEiP9vc21mFOCGxEClStjwgs2h0yMdLqFOc+TYni6ORQ1e
	 rvhRIZ7Up9H+FcVAh/LUZ6RJbOvX1Rg+nxZNc3LGsIPhWtxHQu7rgKdQwbUyucoZPn
	 MSphcb0ojH3QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F6A404C1;
	Sun, 11 Oct 2026 13:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A67FE111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 987AD80D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g--030aKvi6 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D358C80D93
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723893;
 b=k7PD6eV7TGNKV1A1K4GRVJpRl8zruI5HyR7hrKoxOIAgJ1Ws9twviuRYvZh7/FFqWIMi
 c7j10FrMC/fhcRErktjuz4bQnlQq3lYl4+uUvdZSpFB6ClMVrYjFSF3Xny7JO4PsGFkMd
 8p6Bn+bujRIgbKirGwC3VMxX9tDgd73cngGJbf4MWtmnGDXFqXof0FHRNDXxPvVFPXPtH
 coi35VBbVh3e6t8DToBtvHUFEZA1Yz/FIv6TCxmjOnXnSY4q4+/S7Ml3d+UrrZnDEa5XG
 bbBQysDcL/E1jnjuKitJRybtmCP5v6pW0dvH3XLTs/UChG4B0jDf1GTJhv3EVymhKCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723893;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kZoAzm1mhdLy8n5g+86+N4/aP5V6VmqflBgL+lNQycw=;
 b=s3p6VOv6Fbkqb7X6giEo3t7+sGetTh7UD5o8/6v5Nvz2EiERdZiCKiHWCyPABRY6fqJm
 Sn2KTw0nJghZC9Z6m1aI2sFH+M0fF50sWVnTeSa4ipxGDHqNPK5y7+tZgL8YWpKvrtLXv
 iNS1YVECoTPbF+H2rlrT24wWeN1HJ/JtvejmSZ3X/qc3rY0WJqIePUn3oUdYIcT/GL+vY
 5/Q9BJC4hi0lZtNb6qln5KaHb94snqStD7hVj1YwFLI1J1GR4d0sztZkAFx2ApM0fALu1
 F/Es3cOYDMRZmyTJ+RtcpjITX9O2HvIUgr9vUy4cEeV9ncWByA4G1PK6hAzeSb7jAiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RiNJuq0z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RiNJuq0z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D358C80D93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=kZoAzm1mhdLy8n5g+86+N4/aP5V6VmqflBgL+lNQycw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RiNJuq0zdnrWe7oAtqQRfuLZnozEYmKIpZ7yOwhv2Tu2FoboILM8RCQ3mCNL2Ujs/
 mcLXiUaaWto1LtuZj4v76xynpZUW7yy3xI2VStKHnmxbKSRjFoNQK7hHWkCTHtppYn
 9SGI9gpdhkIQTvhualX3oNyhYetS+wmqtKNMxCgeSbUoFdTFAdS84ngO6na5GqLwGK
 eVrBWb6Hf/f599UOOPfzFWZLQF0kU0bK8sMZ18t/sanAcK37NeAgTwlEqC/ENp83qa
 4bVyuhKj3j0iVHogyvInTgdwVbr75DNt74TKLrRf6qQdCzfS4GHKLMirFwg2QB1Y/U
 ybbt0Fanl8uiQ==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 1HFVz9WQlFTOHDmpu92OJiOOUvxU8hKGdbVKnPdz5Q2Pgh3pqv0h4A7KD3s+hMQV9mU7y4oronv
 vgEvXaMEWPsNtXoSn8kNAmCTQCBWTvsAgeaFYmHpgruwOBkZzkVALTSpHIbBpramsnLMQdII1S9
 XcXfipUWEbQ2WbL6UcvnsVTPEwB9WCEHGkFGMAHXejOggYkSC6wqGVltosa6OKt2BGtZ0yJZqa1
 x9fy5jRk/Mpjn1xdqtRtLw+Hmyd8AzZMzcicz6imufQmvw+gbIPmyYpjCcjwqb2ETGPC8f/KaMh
 PTSN/BL44VhHm4yr4Ff0YAVUIIJ/3wkuzqPQznGhy+JkQqvxrqYBh0D5cIhaD//gnCtMH22Jkns
 ktopYbCTKlt0AW1uu1ocUn6K19Utm84ozZGAJ4F9BB2D+VNAVgUQSH0JgIhReuDQTKaf/zjahWn
 yJ0qQkSaXR1JKCxSrWPhB3KYndqwbdg5m8G9wM2Ufx4MlHAS3thuxkW3C73TDGPYjR4NkbYdpjs
 NnKLTfo+HaECslaqhQorn1rpJBkTXGTlyByyWsQArFjhLoFYTLQxoule/jwc1HLFx56kb0v/Ezr
 3hvUk6gd99ZWZ+EMVeEUiQFCa+gxOsBBxYvapD01GfKyfMI=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EDF32A4C585C;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-2ogk;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:22 +0200
Message-ID: <20261011130058.3443432-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 17/52] package/boost: wave needs thread
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0f52bbd475..d4626bf79a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -432,6 +432,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
 	  configurable implementation of the mandated C99/C++
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
