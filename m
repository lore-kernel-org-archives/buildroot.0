Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65E1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF06604AC
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EF06604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F44402A5;
	Mon, 25 Oct 2021 08:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id px2eBNvQ1f_9; Mon, 25 Oct 2021 08:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB19640388;
	Mon, 25 Oct 2021 08:28:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A705F1BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 936E180ECB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESdYxpa0NxMA for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:28:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0648180EC7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:28:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id y67so14313452iof.10
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/2+0r+R4al1r2TKqmvF+ZAEpYXxRN4VOB30HQnSeZc=;
 b=Vnk4QzK7WFKh1xurgYLb30/2BeZqCOTPu0wPCHxreHcbBT4KmidmEP4zS7Juv2kW3l
 4G+/r7qQ9SdyJTvAE+B7MU1i0mYsFUu/jU2j+O8YXm14inEXQMFFlk5Fn8/VD19R7qCn
 +9fI1UKlRen2kIM4MTJFdZOJmtvHrl7r5nVw7xL3X+GBfnxP6Onv4wmHDNKEBu24Dsbq
 gWNJLhRtMeNxGl1jEhiFqFvsDjc7DrIOc0sKZx1gPBmeNF7tSxYi1bnVlcP42xDX4kSA
 sE+7aY6xJsHuujdU72wLbjXHuFkaF8ovDuIUvq824nn3jMcuSccjFPNljtubhl/NpmDL
 2LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/2+0r+R4al1r2TKqmvF+ZAEpYXxRN4VOB30HQnSeZc=;
 b=2F0LB0ZU4a6Z/mXph4wKSozwYWh2Xj7O5SAIC6cwd1udDakv6qHuQNkeDklj+GEmRW
 bcfrxwWP4qlAOiL2QUk8rAJyyBh+CZmlNmJW3eYf6h5Y0MhqfkHtDwjbO/DK7MUqVuLn
 /Pe9NweptZ8OF5ehmW2ut6sfbX74Ti0O86hCXYEFallH6wpCpWnXJG4P6vB1cG6P98G/
 xOGeeAsddUtwWoFLeSmCjbbb5pi2uwDxT0spD2OMJsTwlf5ja0Jmh+2yXNfqKjs/ALxR
 exCY7tZtPG9qlQuq6AGsuS2AuCsq1WnsW7YJH8MUyInh396CfAd79Htl3PE199klYthZ
 m6WA==
X-Gm-Message-State: AOAM531oFbIJvrqeoZzoiDmKElH0Ijd00c4ZT/0UyYrJXuJgQDdSkl2x
 zryBbBH9a/7U7mhD9ssyo3eZ7bb7UFI=
X-Google-Smtp-Source: ABdhPJxbBKREZgIJm08t+fKXQWRzw1TD33HnrJBr95RN8t5fhuJUZqCypw6QKgCbPItN4LCLIQ/Zrw==
X-Received: by 2002:a05:6638:1494:: with SMTP id
 j20mr3371025jak.58.1635150491878; 
 Mon, 25 Oct 2021 01:28:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id m7sm8870550iov.30.2021.10.25.01.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:28:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 02:28:09 -0600
Message-Id: <20211025082809.3967881-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-ugly:
 remove examples option
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
output/build/gst1-plugins-ugly-1.18.5/meson.build:1:0: ERROR: Unknown options: "examples"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index b3dc765d07..a25110264e 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -14,7 +14,6 @@ GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
 GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
-	-Dexamples=disabled \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
