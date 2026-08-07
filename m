Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E89DC2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A954681337;
	Fri,  7 Aug 2026 12:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqJgAk-JwslB; Fri,  7 Aug 2026 12:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA3008132F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107326;
	bh=AO+vGHnAeZtkInQ7grfWLZl3Zhi39rcDgXNWMIvsda0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3KMiGZ3CzD7JIVIMby/eA35L1H5cOBSHtA8WjSYtX781bwbEZjOsP5Ca0pgU51O6
	 LroHUusyfQZ+IDFFWqTzsdmDO1VKC0pYeDuaPTDdyG4XzK3nD+KJGfrLu0fE2K1jpZ
	 Lg0BbrKTNXOtF01QBpypCfkpRj142BM78M2djq6ypqX+aSGsmDzd5xu88+A8I8bt/4
	 z3sgrxBkp8lKs3A7Rx/6QpnlWiPyAB/0kqYOj2X0eknn93dJPP+8edGZ3B1VLsyfbD
	 5HW66j5803zYIwMpbqxIyOtHBUbFDrHRf5FoRIuqtF/zjPAs1DrE36TcqbjbDcZuwm
	 HcO+qx8h4JKCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3008132F;
	Fri,  7 Aug 2026 12:55:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1039D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A048D81314
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Op4vkYMMdO9R for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B53FB8130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53FB8130E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B53FB8130E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c15fc4707f5so33808466b.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107319; x=1786712119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KSUrrE/7gTi/Xn1VGP4NOQxjj3b7P4dpiJgTdv7tXas=;
 b=NO8fhfeM0LI8VMe1NFxYz2qb2P+7N7BPR66NRlOptIADGsixAgsjURC92MVdoFON+4
 PhmX/G+k80NaqXUH368OW5lul4lbzf6yqXj4vMO8m3+gXEnQxOStcRIWsFLkQbZiBFiA
 NXiIhxfLTKb1Gu6BYi8k+bNaMcbnVcHd1ZGg2lnh0IsvbSjER7c+mDjSz129klxQAC4B
 lySshGslTeSQbuX2Y84oeOj4ogDd3hiAPNYfqKUDJcZocY0N1HO2TDwBlyFE11q/ceCA
 +D+jILELjwfV3q/3WIm/EVjNfljcCg5h+Qjffr3V/gQQuTVkxtwbShcIQZzxFKnbNTL/
 kciw==
X-Gm-Message-State: AOJu0YzfVkpIY7RkVjSGqsM+CqFmrDBfaqbFd1Tv8kemeHpOSiFEAzCo
 42XXYQXv0aQqTqNnPFA7yDXXzDRM9YO3HTpcUrLdZU9E762bNcEJmrC8toKD0X9hTlCtpbYkUke
 T4sqCZzc=
X-Gm-Gg: AR+sD13p682kQ+sHHu+aZ+0mHJS7Ss84B/0/U8F6THpGFa5+xi0k1jhs0rjNKa0Zj9C
 S8HjK37xr8TKuNbWWJqCaJky6fXpNUXFgaAWep0z/YslEC+fLZ/NdvoyaUwsYDa0iVG7AByIkXn
 KFtyW6ZB06Jl09ldwNkP/IceK5RAf5peF/8hauFqaqRTNtqYTKJEAtyGC2Ahco6lK8Sg6zokTzV
 g4Io/ErDNA32U9VnT7yd4qkBJSILf3meNKPhD6PgW91tcCIVVLQ/2Sa3I3VXd4u5SrhDkkteyl1
 XhI6+9Y9S/nVnpD2q9sGyXq3H9OEPFjR67pmrKSSvEkbyylzDldRO8rM7AaoMJ6AUd1+8cq4ceP
 ClH3Lvu2Mit3A3LbsJOWniLtVtnZZa0+XOIL6muLfLZu1fNHzZxm602RpkhXBfME0oG4x0HlklL
 u3bL9WFLfva+6QvJCiiXfLyVrkHlQqyydO5O273igwT/h1Jw8HvRtW5K3Z735szQhFFpkfLj5N2
 LXA/fvbtLcS+WkIBVWdorB5wX2/jXPzUDuSVcSZo16bXx5hr2WnhWuwdBB/nXfkRYIvn72ZLCYh
 UZPO8QvXWGxF70pMlK28O8JzxNJuepBdUpiGCv8tiYw/U/KZkNauJkal/Hu42Ab0
X-Received: by 2002:a17:906:9f8e:b0:c15:c651:f28f with SMTP id
 a640c23a62f3a-c2039d28ab0mr637216566b.3.1786107318556; 
 Fri, 07 Aug 2026 05:55:18 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:07 +0200
Message-ID: <20260807125510.1285300-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107319; x=1786712119;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KSUrrE/7gTi/Xn1VGP4NOQxjj3b7P4dpiJgTdv7tXas=;
 b=CtpS2QGC0XGAN6OdPb19XDBsIx5caF2jOJXhdsFe05dcTRTdWuTv2Lf9tCXdw75KKF
 LnbeT8zWH3WsEGOiWGGdPgLWzWlZ9ZE8WATqzsHttDA6plk7IUyKuaEjTfOx5tVLGCwO
 N2wi+etV1XWNbcyPnlOsKuN8BZsjIlVb+8Wz0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CtpS2QGC
Subject: [Buildroot] [PATCH 08/11] board/mender/x86_64/post-image-efi.sh: do
 not prepend artifact name to mender image
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

Do not prepend ${COMPATIBLE_TYPES} to the user-specified artifact
name. Especially since compatible types can be added multiple times
to mender-artifact.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-image-efi.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a1dccb25b3..5f0b5a83ec 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
         -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
