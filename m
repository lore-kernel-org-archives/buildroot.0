Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB99C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F282418F2;
	Wed,  9 Aug 2023 21:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F282418F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XeUF--7KXMg; Wed,  9 Aug 2023 21:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F31F54180B;
	Wed,  9 Aug 2023 21:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F31F54180B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 845C71BF982
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E27B60BC3
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E27B60BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8UHXL9kTcPS for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B0E360B74
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0E360B74
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so1882215e9.1
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 14:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616292; x=1692221092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iBlMSGeGx1ldjDvrlZydNMoAGX8oPMlCFEbrVP1sxW4=;
 b=GE0sJYsS/26XNrv/XexsqwKCWkPoMfyqmfCWCDHOUsMSV0M2z3yqJfhMXXFxNRCybJ
 CXikqOQCUFd+wb3wFfiD+AtFz4Mprg4YkXG0w3DAtPXUoLfduMcmf5TlVVjCUA/rmjeS
 jXEw3D/RrmgxR/I9OlQCDsIRb6ckVvN3UGzTLxPBTxymGmmnn9C5dbz7SHSRMwFBWhz1
 fkeb/tvDshA1wms/w0dJWiJip6NH7EnMKd1nZBzZtYqrx5ebP0j/uhvX+U22lq2eH3br
 wI1v1eK3AMizEaSdx+2b+jUq2V14mWUBsABnheACdwO9mbN2UmntmB2e+DNpGUskC5Dm
 TJOg==
X-Gm-Message-State: AOJu0YwLxah95cJ0QV/mM8HM/jrRzOefZ4xrexWpV85qn1m/asrnUGHh
 2INSGUTAs2790GNlE5o8Af2H/pLivSw=
X-Google-Smtp-Source: AGHT+IFQZC7XRK6j5t4QdV+v7znV8JnPnnd4vg60tjgUfp/lb94RaI+7lJzkaiQKqeVX2BpuZR2t8A==
X-Received: by 2002:a05:600c:2055:b0:3fe:2b60:b24e with SMTP id
 p21-20020a05600c205500b003fe2b60b24emr309166wmg.29.1691616292586; 
 Wed, 09 Aug 2023 14:24:52 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm138959wml.6.2023.08.09.14.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:52 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:24:50 +0200
Message-Id: <57cc20a5c5f87b6bd507ea1726574bd42a415e03.1691616286.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1691616286.git.yann.morin.1998@free.fr>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691616292; x=1692221092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBlMSGeGx1ldjDvrlZydNMoAGX8oPMlCFEbrVP1sxW4=;
 b=Sxi9CWfVn+vWflYBS3AqQ2cOXMhxT92v8f/pD4tXua4CYusI5ruArlzOYC3TvNOq8b
 OWXybtKKoiP5eCL+JGUdOKLYuG68IQTZOlOXC3/85oMJc4VAYQLP/iiJpnVDWKz88onY
 13GNSyAU0gzUmodxVOdSYY4h0NROLJEXATgEDV7Mm0tGIlycrCfd6rIc9wR8whVnedVu
 ZjzNaJlu0PB/YedDDk9VgZ2SiTWtm/yME4VEGL+YfT0KiX7gzRN6kNxqs8ptM1Jp1bvJ
 YkPPIiMR+GI0u/91uJz3/CS6VZRwyqf0LAD9o+oRugdnMmZVEeXcihpg/t1hxMXx+hYq
 xuyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Sxi9CWfV
Subject: [Buildroot] [PATCH 5/5] utils/docker-run: make it compatible with
 SELinux
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
Cc: Antoine Tenart <atenart@kernel.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After switching to a fresh Fedora 38 installation with SELinux disabled,
we noticed that utils/docker-run doesn't work as the applications
running inside the container are not allowed to accept the data mounted
through the bind mount.

Since we do not really need to isolate and confine the build, but rather
to provide a known environment, we don;t really need to enforce any
SELinux confinment in the container.

So, we tell docker to turn off label confinement for the container:

    https://manpages.org/docker-run

    --security-opt=[]
      Security Options
        [...]
        "label=disable"     : Turn off label confinement for the container

Suggested-by: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: use Antoine's proposal]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/docker-run b/utils/docker-run
index 83938f8a7a..02cf68c946 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -18,6 +18,7 @@ declare -a docker_opts=(
     --rm
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
+    --security-opt label=disable
 )
 
 declare -a mountpoints=(
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
