Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43956C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C914260551
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C914260551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D6E404DC;
	Wed,  3 Nov 2021 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nl1hHh17Opi3; Wed,  3 Nov 2021 20:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D637040463;
	Wed,  3 Nov 2021 20:19:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169971BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E1180F0B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVAJb8_VdatR for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:19:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0B2D80F02
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:19:37 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id s14so3841937ilv.10
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVfQmLsLhATy/PWoYT0e39kYnVlsBGkqinUQ/dFR0ec=;
 b=n00Ix+KdzD8moAB9hmO5rfDxgDz3wBtStdj8AkYsD68vbbNtbKIX7g9uzhFHLH8sp8
 KI6ZoFOFUby3u7k8d2XIJFxpy+sl5AYcIkgN/1EVHpcugQrUhMkqfAMqmtPC9NHqF7Aj
 fWTMh3VMvCnm0dk6o1nNcmqsDmrMdcY86O0erSfjrgZ6+oCmuw4V1ZATUzaEmLOIOvN9
 ibWohJkeXjoPxwMrsq0veHd4cE9xojnOEekwkLrD/dCR/0TRMtRi0QLpgUs3f74O8mFC
 PHVKKVOPJwJHsh5N/jYmW+/whOrOq71+m+SqAXOZFZK1dV1Gjx3fS+RlL4JysonawlUt
 uFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVfQmLsLhATy/PWoYT0e39kYnVlsBGkqinUQ/dFR0ec=;
 b=whjEYry2u5PqxUPvB3Ool0fWV4D5C8N4Di1l9qkLYEe+0c7blonG475ku2gkXWjL6n
 b9jaQ8GOwazs0KSfXB8iUnpch1BmjzsKIXx6yHwlVB+2oejxw1RbjSoAEZe4c6E4V2R9
 uRIiBMdY/XwH3QR0NRAMVasuYJoWLyAZF0YpDOahP/9goEoB0uTIDlSm/ZUSrpbK15xl
 FNcOEmwDG4yA3na1h83IwhzJJWIAHYRaE/Y5Z04C1jAuFDS6DAOQSayHPWGbGkCPPyne
 IfqpuGg1gb4Ua2Z1kRnAwnq8wI+9X4I0ElTKCXq6I1VWHrkl5P76NS5AveGnPqxCO6Q1
 XXkw==
X-Gm-Message-State: AOAM533I+WjKthaPwQ0ang8hBMkN0YXKKaGPeoFsfGMQWhziIeboxX5u
 uDQXaWIlol6wRnqpmMb4OZwimgrbOfk=
X-Google-Smtp-Source: ABdhPJzDWZx/i7OSQcnHkZY8SS5dwjavFU/eMPoCcGc+3sSThyYlz+5jM/oFMF9T3JFReX88UOBkyQ==
X-Received: by 2002:a92:c263:: with SMTP id h3mr19101087ild.322.1635970776684; 
 Wed, 03 Nov 2021 13:19:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id h14sm1668769ils.75.2021.11.03.13.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:19:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 14:19:32 -0600
Message-Id: <20211103201932.296897-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This dependency wasn't added during the removal of
python3-cryptography.

The conversion/dropping of python3-cryptography was done with commits
[1] and [2], and the commit log of [1] states the dropping of the
host-python3-six dependency was intentionally:

        [...]
        While at it, drop host-python3-pip and host-python3-six as these
        dependencies are not needed. Indeed, pip was never a dependency of
        cryptography and six is not a dependency with python3 and will be
        dropped in version 3.4 and
        https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
        [...]

But the package python-cryptography is still at version 3.3.2 (and
clearly depends on six)

[1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
[2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a

Fixes:
 - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add explanation for six being required still
---
 package/python-cryptography/python-cryptography.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..081dfc06a0 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python3-cffi \
+	host-python3-six \
+	host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
