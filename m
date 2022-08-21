Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 08:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896A8409EC;
	Sun, 21 Aug 2022 08:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896A8409EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdD8Nr62blbN; Sun, 21 Aug 2022 08:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C06409E6;
	Sun, 21 Aug 2022 08:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C06409E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5BE41BF28D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD69D4047B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD69D4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvnEboY_1TcR for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 08:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87179400E5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87179400E5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:41:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bs25so9777228wrb.2
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 01:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=bp8DIzPlnUMmTYwZj38pb/It7Ma+4EMpZwzzekOsdvM=;
 b=GQ2xTxexSsehvZVxn8J6Cu3Kh6fES4RlWxqpmMq4KG1BN4CyXtz528UyqV0+A3PlX1
 ugM/rfTdAoXoSzXTX/bJNeLEjnmuEdd+SRml+rA/kQMOR/hT9ihH3/t5mWekd12VbKLR
 EmkX06+BzyILOCBRmTwHgC4chTSJfzFPeyHfWGg3e7iM25em/QWuswIL7QqYgX5V5Y9L
 BhTZvkTaUKFsKShs42Xy57CT7ALlQy8077YcGk6gkPM6yL6hoWoR8VrVRNc7mUwm7yWe
 MZSPRYtA3K7yWwFwY8ixiHX++SBIDQn1IhJgfehqC4pehFOhx+ejwn7Wmi0kVcFQDUWd
 s0vg==
X-Gm-Message-State: ACgBeo1PiL+w1R50fA9m6sI5l7MZ/QZFrrEOPpDbU/U6xkGtwOtIbYuD
 orr2hYORShiFdxjsQj8+VLce1inybog=
X-Google-Smtp-Source: AA6agR4dCRlYNLlV//8U2UBli/JVScQGKMdD6Sr6EytMVXe19rdyxWJEuCmHtfTjZm9lZ3cN9lHosA==
X-Received: by 2002:a5d:5a17:0:b0:225:33a0:652 with SMTP id
 bq23-20020a5d5a17000000b0022533a00652mr6787881wrb.697.1661071289618; 
 Sun, 21 Aug 2022 01:41:29 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 by smtp.gmail.com with ESMTPSA id
 z11-20020adff1cb000000b0021e51c039c5sm8388393wro.80.2022.08.21.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 01:41:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 10:41:27 +0200
Message-Id: <97a9cde33a41915b3b4a9cb4f66ca891873ca767.1661071280.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661071280.git.yann.morin.1998@free.fr>
References: <cover.1661071280.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=bp8DIzPlnUMmTYwZj38pb/It7Ma+4EMpZwzzekOsdvM=;
 b=DgeJwjJ+qxF7j9vqHmTAxEpuNphrQrBmUS1dlzuWHrCvaB2CVgK1gSTF5eQEgAKE+u
 G9on8i8d+3wGPqS89ckJvQXifyZbgxlqw2ASpyROgwlZA5kMltEcpUibPatXGWhX/YQA
 /qC2uO/7HvHu875ubynfWf65aeg4sRrNYmBEvE3aTKp7gsC1A0/YBQ/RJjatgPfDuvmY
 hdtEGnDZR5aLfSyWEoQpFy52dWCDVQUywMfjIgIuS24VAugwX5Ba7QestjgarIE2VIhd
 fvrrtfItHNcs2Agg4js40p68Cf03IyYDSyZ+KwG4CM4MQYucLrzRIt2N/4SufJ4b/gyR
 9+3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DgeJwjJ+
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: fix checking host
 glibc version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unless explicitly told otherwise, subprocess.check_output() returns
bytes objects [0].

When we try to check the C library version (to check the Linaro
toolchain is usable), genrandconfig currently fails with:
    TypeError: cannot use a string pattern on a bytes-like object

So, as suggested in the python documentation, decocde() the output of
subprocess.check_output() before we can use it.

[0] https://docs.python.org/3/library/subprocess.html#subprocess.check_output

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c6b3123feb..21d4592049 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -181,7 +181,7 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
             ldd_version_output = subprocess.check_output(['ldd', '--version'])
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
+            glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
                 return False
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
