Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D91C88E7D
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CC780E6B;
	Tue, 15 Sep 2026 17:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyW8Xh87_AaN; Tue, 15 Sep 2026 17:31:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3009780E82
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493508;
	b=Hs8F9QR+qBVIhUgW14YYk4uNAiY82ZkhQAYow1GltEcYMNZa6Oo9FonbSWsk2MHQgb8U
	 unSEE7x4OBSyNKx+UB7MH0WnvZ/DNi85o0XiKwvt7ygos5tB0+ObHSYx0WQ0M2ChbRx5e
	 fGgWWnYQThohMKx8Akmj8Hd0Lta+rgaXttVy/6oKctvS27V9IeT7zs7f/g5MVYQJY9Nd7
	 XK/0DUl9AFHwB5tO/g537+O03r30pmB2BCOqokz/LPutS3tHOpJPxV8iuCx3dJQm5iKO+
	 iDvOueXjCc/J5ijJkUh9piUeQWsfbmcqMgFK/P768Z/mITFiHvttHh7qykydPDJxlpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=27N8R5i5q9aF1+X3YgulQzUrI6b2onunVQOvYiPnSM4=;
	b=V5NQ3GL7Uh1wcxV2rb/+4YSdgnsRuRddJc3JzPsE6Vwdg9ue/AxkzaEVTEB8gg8rvh+X
	 +2GNeVMDaYESs9yi9cvFFiUR0ZjppnKHSNcHR//yYj05fdETJE5qtYigl4+OM49oPIz0X
	 3nPO/u7hBIvxBu4VlcJ0x4O4W5yrr8GtqFFk+LgKXms5moJMgtT+G4ozMe65nGqiGFNpH
	 8lSelBs+rujbH6TiX+bci3Bm+3HBngLxBqs/5gOLH0TBpWWMtGhJpynwJLjtc23+0wxZs
	 kF30YpcL3tZVmwHM30TgodWBdtJ4lVaJx0cxZ5P96kofs4hQULtligEI0TxsfnIzz/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493508;
	bh=27N8R5i5q9aF1+X3YgulQzUrI6b2onunVQOvYiPnSM4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S6fEFWnI3ZLuJpWELg6wr5yVJo7qXKoqM4Upiw+cQgFpd/OSQuDiYXtSnVvOjLU1m
	 lUEQkG9ym16ATEdjWr/7naXmtyd5jq3AQA0su4S21vfdnwpdV6rbNDOPitUGfJCyB+
	 32wBOFYemUuo6Ox7M6U4JLCv9cJKfkIb+5aETjFycL1ea593XHavePai8xHieO4n0Y
	 45uz8ocSf+rpYXPqQMw5SQFC6CEinsP3Tjy1ULwpmRd7yNfJfYthoYXKF1Lus6/yu4
	 jskQIGGXtvaVvWxrPVR6DhqiRsRNPinRwPtee0FLKVqbeT9FfiqkyMVRuETTxMKMBn
	 L2FkcBNnCHsfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3009780E82;
	Tue, 15 Sep 2026 17:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FAE23F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5F3400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHJPVUoqihP4 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2D263400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493501;
 b=LXYNTu8GMquDZe6e8Bj/vtT9FNt7wJw7dlp1xSJxTUVuopdSr73neglRJFBzm0DI1pdD
 IZf/iFTcmKrsRBpIe9LKTd8k5galQ/98G2Z1ne9gCzlU6U7YJfWcqvjBKP30UETB0IhXH
 5j4o1NiVY9Qfk9pVBfSVPDSFsvEUxZ6QR1PgKtUJgGij1PTYvSOP3v5eRSxm6zqXYH/WQ
 DsvokzLdgD0mf83NkF8l6VbeuSeORDvsuyJmK60qv15Z3Edw0/qQeu0N25z5UfLorUY+V
 I6N2DjrLSD2cD15MY/FgxCfBCws2cET92X7k6plvO2hKpiVCSk6sfr3h8kP9HaobOMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493501;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DynvoqJKvs7YxTb9hWweCElRN1J4mDlrFzdo9w4MhUc=;
 b=npqL0pg5GgiWTSlaMXnKI5q9lG7z+bhxUhEp/t5tUwuWvHL0jTc/aAzs3dy5O7/0u1Tz
 XtQQVqdYRk5+6N8FOMPC1Ww5DGPFFRzq8afUguyshhtky0a67tneKixBi7qniICIYVKr+
 qdNUwie3wLHSMl/d0IlJbClu9f8XRxyCVTn1xAFRRqcJ+N5rwLUkW/IZ3U/prKeD1MfqI
 A87qhLIEszvrnbcyNIo0ssSiCySBChHdnewdfJfEjq+kUMre5E1jT/sLI8ob0R+0lCS2p
 ochpJ0VtQfXbfpcw9rjXvIRg2bKrTKnwnDWZJ+gkelotmB/NCdbE2WO7S297qJzngxg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D263400F3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29BF693590; Tue, 15 Sep 2026 17:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:29:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e62e06b19d635e06687650de0558ae257b05ccbb
X-Git-Newrev: 22540e0d41382a8085af110462e2aea6508da4d5
X-Patchwork-Hint: ignore
Message-Id: <20260915173035.29BF693590@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22540e0d41382a8085af110462e2aea6508da4d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS needs the full blown version of
bash and coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but
it does so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense,
but is not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index d2e146d827..04ca85f381 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (timeout)
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
