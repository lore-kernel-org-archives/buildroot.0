Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC0FC0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BDC66063C;
	Sat, 14 Sep 2024 10:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrnQc0D3OzsH; Sat, 14 Sep 2024 10:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92EE26069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92EE26069C;
	Sat, 14 Sep 2024 10:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE00D1BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6494066F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdbKFXgQemBT for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9994840679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9994840679
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9994840679
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:44:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C664E1C0003;
 Sat, 14 Sep 2024 10:44:33 +0000 (UTC)
Date: Sat, 14 Sep 2024 12:44:32 +0200
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240914124432.669c5785@windsurf>
In-Reply-To: <20240911132021.2318073-1-christian@klarinett.li>
References: <20240911132021.2318073-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726310674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3TK20h/hNQYPJrydDEfadRe2qMkzO0T+wjoJNEGqzg=;
 b=TIpOLRf9oPF3bRA9yYLgywC3HrHnuSkJ2rzcEytmRNKdulfbXtcPCcdkYy+fqk2hJskxL7
 JpZbhvaniA6IvoguIkcK6sISYVjeCxyKUXG/hSAEInIWct1CB7PFVGGppUFmxWF/KFYPjB
 f9M/D+GcIY37CzjjnYjbUB+KaQ1WsAgcnBnfEL0ttytuIScti7vzfwKyo//zKsUpqtweNo
 I4+grVaCplx5OJwga9dNIWvgjWk12VqzS3zbC7lEMsRXQ4U3t5d5JjefFutZQIWX40vzEC
 SJWN2DirxGeqp+GvgQvbUepTfo/b45UowUrkyduTo48ilQIUNQPjufENJAs45w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TIpOLRf9
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6tools: build linuguist
 tools without printsupport
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 15:20:19 +0200
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> This fixes a regression in qttools that would not build the qt linuguist
> tools (lupdate, lrelease, etc.) when CUPS is not available.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  ...e-lconvert-lrelease-in-no-gui-builds.patch | 56 +++++++++++++++++++
>  package/qt6/qt6tools/qt6tools.mk              |  5 ++
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch

Applied to master after splitting out into a separate commit the
following:

+HOST_QT6TOOLS_CONF_OPTS = \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \

which wasn't related, and adjusting:

+	-DFEATURE_linguist=ON

to use the newly introduced option instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
