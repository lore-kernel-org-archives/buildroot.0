Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF33C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FAEB606C5;
	Sun, 23 Aug 2026 19:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLlbQ6HtGOef; Sun, 23 Aug 2026 19:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787513922;
	bh=sccOf4tvq7ebe2cY2Mvvb9IZj3mw1s5kHYGpJsdbvNY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaR/y5X6AQ90NrjAw8hz27F3GappTaBneB324kMhQdmlqf24Hv0QJxfw9ZSdGoUdH
	 1JVIjV4klTcVh/505IMkJ/ZusMIVwL9kX329P8bWIS0ZDXlb9BSiguHCqTkbJE4FjB
	 r3fSn0cH2iI4hoG056eG3LOQPn3OaWVXlQM36CZYPU4qjoIP1HMEVKyQHk+FlxXKUc
	 c14gJwmgmXHHyTzJf++Wl5b/3Qj5eYCR7JSbYAhScfvdkI3CCbVewnxN7Zfyh9Ybyf
	 68fy1BFa6dgCVrSCh809UG0thw/vDQgp8u+AlcjaTaz/hoRPrIP4+//jjy4mHjGzHh
	 94svDt4ijr0Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22A760622;
	Sun, 23 Aug 2026 19:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD9A8336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5E360622
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORki-MKCIcCR for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XUi1I53W
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 910DF6061B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:38:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=XUi1I53WDGcADwbQmC+/p6JfL2oKPeGKF/BbAfIaDEbQV4lKqDK1BJHjFzf5uFEHm2cnOOwYmNDqBjMtg3QQwaclKT4QSPdE6D9+I63kCqBdjpuribzR97HbAO6j1wLSrc0EEcz/WJachX+KjUd94Hxf2bglOIh/zhto9+G2FWmi4ZgrYtYcB+Uf2P/XfSEma9ByR/qnmGObhSMP3yTdBZk9AVMf9Xk+FXfx38eT1LfOS5QTENYyuw77pO0KXIZqvhrkynIJS/06pwZGabf7sbR5en11S86iiow8Q5b384AE5VObz98l3a5qJqeUroyJRlYdZB+fB8oCj3hVg5e61g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VAxCp3ewPR7ZSt3SCOlY+n67UURIodqCWhvpvs8gViM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1185701212; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 19:38:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyE1Z-0000000AMbt-2Gzq;
 Sun, 23 Aug 2026 21:38:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260819123811.420995-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Wed, 19 Aug 2026 14:38:11 +0200")
References: <20260819123811.420995-1-thomas@devoogdt.com>
Date: Sun, 23 Aug 2026 21:38:33 +0200
Message-ID: <875x10d3uu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: fix wrong config option
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Commit 713d63b "package/webkitgtk: add option to enable MiniBrowser",
 > added support to select BR2_PACKAGE_WEBKITGTK_MINIBROWSER, but forgot
 > to drop the default -DENABLE_MINIBROWSER=ON entry.

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
