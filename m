Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1273AC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B131E40FEE;
	Thu, 24 Sep 2026 18:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lppmTuxNaqQi; Thu, 24 Sep 2026 18:58:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0CD140FC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276320;
	b=DYNrGpuSgs6Y8sz9g9atuJ+He7sA2P20cKG0mePPGPFIx3dQ8CWekobpOqiJ8cTJFk7U
	 cwnWM7jkrnsLx87KxFu2gle1LCA3lPaRrEZVGYq9V6luqzYj5HtPGMYFZZ3wk2zfppZuB
	 GjKfuV1uG1ZqUniV1FhFy3ucp0ZJRO5lWi6W0AAZCzS3RDYk2k90YE8pbt0rGJARf0tG5
	 qlxBfTRso1jamon2Ic5qEyRqZ12F8XH6MAsVhdiZo2a1vY9p467ulCqhllyZqCKpNZPLF
	 BBCHZ/k4hRTf/ty8iek87VuRTD2Vz1w20HLh/5I0idBCeqbQeqZ9hiao3Ll22WdJPgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fqQIVbXbvg/3suaagCASevl5j8hAgNy6LCAuHkVYJT8=;
	b=eVFiwUD4Q794nD3NsgqK0duNaNjXRSuZUt4iQ4YBWm1npiCds7bgB1fw2P6a3LRsL8kf
	 Jv8UiE8cCFmex2TjkHJJ/DkOi9faIOPAfPHtLE3jE17cpYCqG9vYGeWJyNSqwTZxK2thh
	 HAUoWmhG8b0rF755LTc2vCWajEBJ0wzRtgR3Hqf9c5s4DvyvIVnrTWg3YYnzaVprca7W5
	 Zkcixzp/9AfIV24V8FNXx+vCjms04BTLaT6s9vQHmvgzule7p/IW0OuNts3LqWIO8A/Mf
	 dZ0wyICg+73Chso3ulQj1sH2XG6hiCUHgf1KiTQX+lX5SkGmJCW0hLhhVRjbxRFZCuw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276320;
	bh=fqQIVbXbvg/3suaagCASevl5j8hAgNy6LCAuHkVYJT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HJuiPxy5z+DM6+ACbhuUgOySA8HzdNaTIqL+gpWmBzWMQqD+DUoA0o8qslA2bAOUz
	 hM3LLQy7KhbEIXOW1wTTZAUnMmXpox/g8rGoqS11GZkvsBSSeQTQ3r4wT3spYm+ukJ
	 KHrOzcbmXFJtMSnSGe9riwe1CtNTwYvqZQSFlmIYB5rs30Gb4BIj87/qGGxLs4ZWML
	 B3nW0gbnoGBoqCDU8V0qMwVvnMHuAvm8sE7USA28N2qqTgSljDQ7T5FtbRMZC4w02p
	 2hrvSsU3kLWfcBgwOCiX4HJXsVkWXxaHXLI5jebWKcfpoHHWLyFVzRDjvySnXjQYYN
	 rtIimuVdCazPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0CD140FC3;
	Thu, 24 Sep 2026 18:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDD4D332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB33C404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD7kKAElzWR9 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 062A6404D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=QBiTNU99NBLrDcxNlLzMbNcY4vZRetDoiSaXjcjFbWOYeJZzQnyqeqFwQuTldkdGvVNY
 9Xny7B7mmHLjpnnXNsLVINj8sDFUetFM1hNGYyF4zoIFoLFQ1gV5zPEJedWPrWZzJe0xc
 JP3ttQIrRTpUF39Id+Q0c1Qm6P1cEnAWHjz3ma7GYzseKFz6PRgZnMsH22F84a5EB0I7b
 3oRwYFM+WCWGzJaHooXJ2r77niNJmE3sDTezW5DZiMFzTKGve09hLu5geTVJomTOdC3ZU
 BjKAcY0PqGzHvcSv0SXf0nShF1zSbsgLVATSeUHw4x0tWcLzemV2e+IgqnkZWJFK8sQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kg266W9mbmdgO4YDSZEJTWVTfYSgIyqR45bhLaZTnLA=;
 b=KJztQbY9pZmVDMZkNBsUBZz4qQqyvwCC5QzoYT01F2xUnvYAJQ1dsx7QJMJiC/J83Bxr
 dM7xcyrrLnJnQ9A+4SdlI2Mv9m6UpXagsXUyA4ilvqwlIs6G1ZMWNDg0lKRuZqcg1Uakc
 t8LIW83v2cfS0+mcSQKI00hXihZ4LXzk/y9+pECEtnzKuFTcs4c6+NYR+aB2oazJIHeKA
 ya3JWYbwnaqYfcM5+YNnBS2lwVo525f7oZ0k07Kc44/JKl715EU2VAXKdfGJyYwDqOmhL
 bvuyAp00DVHBOnn/qVhd618iqzK08FEy0Z4lJAOM9uI+GUjaxjVmw8oih8xlUlGma/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062A6404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E08998323; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2378e81e770a2ad07f0654c6e16a6b63e66d96a3
X-Git-Newrev: 5b6bcde02f6977914bcaa935a9b23f2fc8d4dae7
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.9E08998323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ndctl: fix
 Config.in comment
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3157261639447402662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3157261639447402662==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b6bcde02f6977914bcaa935a9b23f2fc8d4dae7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The Config.in comment has the correct dependency on
!BR2_TOOLCHAIN_HAS_THREADS, but that was not reflected in the comment
text itself.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3472fd59af13245a68f9ea2cdbbeb52fdd6abad4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ndctl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 9d3972bd2f..708871d693 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \

--===============3157261639447402662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3157261639447402662==--
