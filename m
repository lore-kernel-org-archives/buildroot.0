Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282E7CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 08:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D135A4294E;
	Sun,  7 Jun 2026 08:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc56W2AiquQG; Sun,  7 Jun 2026 08:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915D84292D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780822734;
	bh=pbWGe31XpxcjhA6l099fScCZIPWNgWc9bxH7BKVsdkE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drMLt1WM9pB9ad2Mjiy35MwhZrDXF+VQts5Kj4E88yDMiC8negDpaKE/cyYmclNJs
	 XQp9TKDW/KTxrRDBeNwjdK6C9e8MKlCt6ilj46jH5F5HUqRKSc0vrI06qO8VYndxDW
	 CtQC65MEAH5WOA6MnVMQ9TdJgirc00ANfbXEPu4y6CFQSl/tr5BEvvTZgD/rMDd8f5
	 k62whTPo79Exa/vdCCyx8jn1uN6/Kg+bGzsIQBld3xs8CDd8H5ZB3HOk/5nMyd9fcZ
	 D7LTEp9IO8/0yvooDpuyPajBwYx7LTn/F8Fu73Dk080H5P8KiBoVE0/YNckIJqB2R8
	 A01Lkg0Cl5AxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915D84292D;
	Sun,  7 Jun 2026 08:58:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E24FB345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D232B61AED
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSFX2fDWOZo5 for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 08:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1F5A61011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F5A61011
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F5A61011
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:58:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E47C3EBD7;
 Sun,  7 Jun 2026 08:58:44 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Sun,  7 Jun 2026 10:58:44 +0200
Message-Id: <20260607085844.1334630-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
References: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTFYZN9ud3qaQX4euwlneu2trHRITgyEAAp68eSMr/rctqDPac0dvTfZDIjU98vBZaiIZf8vnxyy1bRSIRxaw3Es0VKtFca4sw1eqDKMgd1b5dJ5ora+AV6fxixS+O/oM2MX/szxsogpoRUCTgvTUlkBQlvRwn+8iWEdVz3roOWYwlvb4MpCj0E6oIPWB+nmrBhEmbBmOHwVipeJeTkzDSNwK9RPl5Du6UCUvTxMQ2W+TRfwMvY41kr6IBJfmO81UL7kbkgA2oiSFB6je6+MAEWAHycDG7w0ljfMU4ftoAvVEUaYzYgm9ZjuWFcuBvWYy+gMu9G79GVlGXl299EWcuAtj5xPu0ghKMQUkFD7I6dhpIIbPTIf5KJD1BrFVfZ5NAB4AWJikef9/M+js/oJ8wlCAowA+fkAyG8JJqon6X4oGS4cLVfqAD5TKfAEO6s8NGBeVWxXAnq39aDdou83hwYUAViJtqCGxSjWlkN6cXWCOinOtxpdKsNEMu2XNGtSO1hocY7IpujDG3A/1SszdQLtsdFmjPkwpAw9cvguhDmgv3ZQcTDfb4FHGgSUE1fiEQ/eg1jDg6lNVFYP72Zc/yI2mbt/HuJouQ07W0CcWSu8i1B8Y5x/myFABbzQN3rX8eL8srDCG3V/s7YobyscEpW0+iirML9Ogd9cNPlWvmRm5Q
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780822724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6DhTTdpYpwqxHuJxuKMCZca7TMVqxO+1w0hY2P0Kt0=;
 b=Y0AcpNNl/8ANaC1x6G/hXvxpc+lsVX6bqrGjjwPXMJsJzAoGGAz8wMkzpBcsy2P9SfqDuk
 vSkT4O5qRdfgRgV5LR1DEk+Er3oXUYs7PYBTL7YvCnCNO80lt5Cp7KzuYcL0QRoAwD3Yui
 06PAHI6CWteZya5CDF4KUy9agb9moGGGnz+SLNmoU9HlYg3WNlFPBKk19BfESoICscvWNi
 85+qyQpthS54TqntYT3oeZc8mZGHbnfbMLZTgXlf632DpCCc1SNMUZ0r6qAKvj1GkQhQNb
 YvDlj6ENOSSJGB08ZjNrKb3+El0jX02k3b9YuFrF/LtqhqEUMMsXbinibrX/+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Y0AcpNNl
Subject: [Buildroot] [PATCH v2] package/libglib2: disable sysprof for the
 host build
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

Whether the host libglib2 picks up sysprof support depends on whether
libsysprof-capture happens to be installed on the build machine, which
makes the host build depend on the host environment. Disable sysprof
explicitly for the host build so the result is deterministic.

Keep sysprof enabled for the target build: it is useful to profile and
measure the performance of applications running on the target.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Disable sysprof only for the host build (HOST_LIBGLIB2_CONF_OPTS)
   instead of disabling it globally, keeping it available on the
   target, as suggested by Adrian Perez de Castro.
 - Reword the commit message accordingly.

 package/libglib2/libglib2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cae8a85a28..ae4b653a15 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -30,7 +30,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
