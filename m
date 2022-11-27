Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8F5C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D1156006A;
	Sun, 27 Nov 2022 13:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1156006A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cIdGDh_Fam3; Sun, 27 Nov 2022 13:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03C36061B;
	Sun, 27 Nov 2022 13:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03C36061B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6A81BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 136A281AEA
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 136A281AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5wYWIOghXfE for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CC881AAB
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20CC881AAB
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:16 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a7-20020a056830008700b0066c82848060so5374872oto.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Af+kEOlABrxydTvP9IWQdAEKQCIvsgnvAkaNOyfxIk=;
 b=vjXFduZn0ZH7xLnOI+Ei4U7gZR5/JkmOij4BSWCFN/pN5VmEBibZVTFYHWKi46vX/I
 U2F4QeODes4z9nut2dsbun9iaa2bdjc3Iwsh8JCtRk3VzRTwOtHUvToqAloIZdkIh8gy
 TwzTxyYEgs1Q2qkg70SqjrhIQeItNQLyzJYKJzhGA6QlrMxisl6Uq+aRiyuF1qJ1Js3p
 PgkI+8AfwGXP7c2yewiobT8A089eIGXNbINDNR1wFXGb1ayy8VFnu0XbN/NFp/l6HuGQ
 3mjRI2+5MWR1Nl0xXQLzZ0BstBjqx6F0QQlRw8KHhmJQDpX1Tfue7le3vUBC5MNu8UYN
 YCgw==
X-Gm-Message-State: ANoB5pk/4wbmHhRFdPavp2ki/csA1pffhDOOTo9VQe7lGsY+ouY/+Eox
 0lHp0yaIlNd/xNhTgu8l0jMFbLc+ERk=
X-Google-Smtp-Source: AA0mqf4M8shsvouppHzhS8/+lUcOij/MM1ZzM3m3CSKOJyzj/b8UeKB6QjRGd/YP4owb8/63jOQxWg==
X-Received: by 2002:a05:6830:d85:b0:66d:65a5:b0b3 with SMTP id
 bv5-20020a0568300d8500b0066d65a5b0b3mr14709391otb.170.1669554495259; 
 Sun, 27 Nov 2022 05:08:15 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:14 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:21 -0300
Message-Id: <20221127130739.1862398-8-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Af+kEOlABrxydTvP9IWQdAEKQCIvsgnvAkaNOyfxIk=;
 b=eVxNCO1/6V12pE2KzKSbPBIGW4Lfuk336nD+eNjzOyuMmoUrq7jqUwBgOxLy4ZFKoQ
 pWXj/lqMZ751o/FeGBX0yu0fXkQgZioNPDiY6RlgQYQcqZnbb+zgKJqMFRbHovIXzKeM
 amoiW7qA5o1DNT/HVzOHkQcUteDXLJ3JY+lUMUjoQefKegNdqVzi0nrJJUR+KX6I+uwN
 Y8Pw0atlGcvpIFiJlAtzTd9bGRPHbhFL93jOINoHzdORa/q7Vliunts24c6HQMZee5yw
 i4l8GGxbEEzZFO75+C5YeAxXutELpOXX8WP+K81UVkXwxR0+qEBgkBjeutBjIJTnmpAw
 /AVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eVxNCO1/
Subject: [Buildroot] [next 07/25] package/live555: fix build config with
 locale
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Using current conditional code, added in 2014:

ifndef ($(BR2_ENABLE_LOCALE),y)
LIVE555_CFLAGS += -DLOCALE_NOT_USED
endif

the define LOCALE_NOT_USED is always passed on CFLAGS, because there is
no symbol with following names defined:
 "(y,y)" -> not defined when BR2_ENABLE_LOCALE=y
 "(,y)" -> not defined when BR2_ENABLE_LOCALE is not set

So fix the typo, switching ifndef to ifneq.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test-pkg config 1:
BR2_PACKAGE_LIVE555=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/705379816
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

test-pkg config 2:
BR2_PACKAGE_LIVE555=y
BR2_PACKAGE_OPENSSL=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/705388345
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

test-pkg config 3:
BR2_PACKAGE_LIVE555=y
BR2_PACKAGE_OPENSSL=y
BR2_STATIC_LIBS=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/705391470
44 builds, 22 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

test-pkg config 4:
BR2_PACKAGE_LIVE555=y
BR2_STATIC_LIBS=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/705392278
44 builds, 22 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/live555/live555.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index effd4517cf..56ed705783 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -39,7 +39,7 @@ else
 LIVE555_CFLAGS += -DNO_OPENSSL
 endif
 
-ifndef ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_ENABLE_LOCALE),y)
 LIVE555_CFLAGS += -DLOCALE_NOT_USED
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
