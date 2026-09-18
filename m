Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620FAC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6EC60DE5;
	Fri, 18 Sep 2026 13:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnNsTcCzq5fB; Fri, 18 Sep 2026 13:06:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45FB760DA5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736799;
	b=mnfMSz47KTNNu/wz4UNbCxvtOz0p1w4E0KqMZ7GhZg3Ewx1Z7LujMoaDV5wfys1PWChV
	 SZve7yh657tDWfCYBk37G8zICWpHCpABwZSDRDrgOQvv750OQjfFnp104/XnGz5pdotpI
	 Xkve2o3EAi69vcnRXskGx+k3qdQpwLOlN7jyl9N07azZkp2p6t2IVlBVoFwP1HPKkpY9u
	 8I/IQBNHpoC95v8AuXDWmEUCRk/RIfzgzP4ol6/DkZ8Dp4jL2hIf8hUm1RJ/SaXFX5yo1
	 xPd04Et/Vj5n7fSGqcZPRc9sbHfMR+YQINm2dchxvxfAQvfqWZHji6efwFRGNWQ1xwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T4L4qhYmHNUkPKmIYKLL4+AzRiQRRfHjkjOuPzQxgac=;
	b=Y2fahNqbsuB780uzNg6GJXjvlzYV2IbgaqSmW/gkENPpPePTALOZZOXQIBMWDgQngWjn
	 aOGdYw9joBwYvBIjB5zGG9Swo2UtJ5gYUG9BJY28ukfyrMPfUHeK9LHkCEJYj3qtKzAjg
	 fj6Vqk6ouKkP0JfDRj3NRJagt33qxYEvfi/MJHhiWkYpxFWKrftHUH7EiLD17zO3HzMbu
	 7sakwNI4ltZ0azUzkel0l9GZeot1YeOvXPCq4rKdhLXKo2cX9nBKDZ0ZoWoAtrkzTZcqY
	 llXc1UXTYLp+ogr2FWV18iM8z1rJqae8JA1h0y7zpimmPcublHDUv4xe86V+x4/iA/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736799;
	bh=T4L4qhYmHNUkPKmIYKLL4+AzRiQRRfHjkjOuPzQxgac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OOe/+cCqx+3EnGJe1ORZ8In4W93R6jIWNELXVsZqBTrwzBZl5ypNYFhf0b5ADwOEJ
	 EXZpCC2dxWQB9eAB7qdeKV/fMgPTfZEz4l/lOQzRxd+6IhlW3xKblnpIi6/xxknpa8
	 pCqVPEprfjGGEy+e1bMLs42BiWGKtKHy9K/hZUiiVT/JNsd+gNkADplPmJ96rJF+W1
	 PAfR5GbDMeIcaFbvUGEyFN3Uyh3jEedrpFwTkqRTx5k2dA8WItrasaX/0yamNA7ESF
	 tekhSA0GnLm4tOOtjvXgszn5mPr4SiI00eWBUjuxeBI+ULbNVpG4dpqfA1LcsN2xoW
	 EjX9418Ey2R1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FB760DA5;
	Fri, 18 Sep 2026 13:06:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AD220D8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2832760D67
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzB0TkSsvwqB for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00FFA60D76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736748;
 b=sXnYzTDuO80DqiAUPrFZ7iRZNSWO1Ky+CTR6p+X+aF3M70GFYfX9zh1CCvQbsFsGFcJr
 F7FY7zPYksBo/unwg+Y5MMbmQZZOdfYDcwapeAI6ojVbMltQ+bYro57HYDYSuj/gIlfky
 jSisvswHbtRNX8D7hpLpSqH5Hk9waSSqf058iQzYe8lEBPhAb71q4Lj7GbmJmXUrEIo+q
 lUWx1khMUtgyueIPLpBa5wYJrkQ0JQjbrefdIAH1VECLSvKDm3XexBiTXgcrzlGBjcQsl
 eGd8+HFOfXPMLG4tOHMo73KR16ZSzx8EFvBWT9M6RxN6DUFhjFkUh/mfA1M1pkI8dpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w2Sja987XNlQt7qPhwp17obR48R9AKNh6bGuvmzzbCg=;
 b=EHvP6LxJafjAXAIEcrMpJxlZI17baqohWtQQFIQJ1/nUBmP+LZ3mEOgaJbPARSrPMy1w
 Hc0Oc/jXxrlnGV/uRcAq3b01us5uDFQ/lsoDEZke+PXYtWdXpcTaYeXw6jq7rhKvy+a2N
 jkvGS4+jnXW8CZlTfhh3qzRAYfLet16W+48ABNwRG9gLyin0LGST1IvDlRdq77dsG3GVY
 YlFD4xbZinQwf1Ny113ncpkG/iAX1LwZEWS7GkGRajQc789gdTbdAUgDtAgOXj++lVmN3
 VcaypIgyb5FmnNBm5fOSsCu+47i7yOLGveIHhoGGKDoSKU5G/J9XZKG+JyCXhya+kVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00FFA60D76
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4AA9718A; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 84ef784c425b7f1a63edcf1a874acc528437c8ef
X-Git-Newrev: 215f018aecfbdac512c3f4cd184e162d902931e5
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.AE4AA9718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5cinex: add
 missing select BR2_PACKAGE_QT5BASE_GUI
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/215f018aecfbdac512c3f4cd184e162d902931e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_QT5CINEX selects BR2_PACKAGE_QT5BASE_PNG,
BR2_PACKAGE_QT5BASE_WIDGETS and BR2_PACKAGE_QT5BASE_EGLFS, which are
all sub-options of BR2_PACKAGE_QT5BASE_GUI, but we don't explicitly
selects BR2_PACKAGE_QT5BASE_GUI.

It turns out that things work because the package selects
BR2_PACKAGE_QT5GRAPHICALEFFECTS, which selects
BR2_PACKAGE_QT5DECLARATIVE_QUICK, which selects
BR2_PACKAGE_QT5BASE_GUI, but that is rather non-obvious, and it makes
more sense for BR2_PACKAGE_QT5CINEX to directly select
BR2_PACKAGE_QT5BASE_GUI if it also selects sub-options of it.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f077ba9e67566a6855148ffa732c06d63db0622f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5cinex/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index 8dbf484267..d831af5a79 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_QT5CINEX
 	# dependency.
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_EGLFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
