Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B9AE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 05:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8596F60698;
	Fri, 13 Dec 2024 05:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuMXVUUQTTp5; Fri, 13 Dec 2024 05:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE306069A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE306069A;
	Fri, 13 Dec 2024 05:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D3C51146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 05:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311A16069A
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 05:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuTpuJ9ZcFnM for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 05:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:1c1c:816::1;
 helo=server1.martb.eu; envelope-from=contact@martb.dev; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 550F160698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 550F160698
Received: from server1.martb.eu (server1.martb.eu [IPv6:2a01:4f8:1c1c:816::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 550F160698
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 05:39:12 +0000 (UTC)
Date: Fri, 13 Dec 2024 06:39:10 +0100
To: buildroot@buildroot.org
CC: Marek Belisko <marek.belisko@open-nandra.com>,
 =?ISO-8859-1?Q?Martin_B=F6h?= <contact@martb.dev>
Message-ID: <FB194E54-666A-488A-8C79-6A3CB933D55B@martb.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1734068349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mW1cbZaS7plYW+rngmSiDOHN3xQTWd1EjZ6peOBabvU=;
 b=O/X7at1kDLTmbhywUmAiPJe+pGRSNK0PBycUyKVQJpePtxg2e8Ni8WwuiXDeCX8JxtIYm+
 f1Y9k3rHfBUUJDSXT7cF6h5SXrlSpbvnqckGirS/St3sa9dwOf8evYwP7AoorX4RL89w0H
 1LsdHu6LGC7IjC99Qq7z9H6Ck52sgBM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=martb.dev
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=martb.dev header.i=@martb.dev header.a=rsa-sha256
 header.s=mail header.b=O/X7at1k
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
Subject: [Buildroot] [PATCH 1/1] package/polkit: fix permissions after
 version bump to 125
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?ISO-8859-1?Q?Martin_B=F6h?= <contact@martb.dev>
Content-Type: multipart/mixed; boundary="===============0185111239791484321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0185111239791484321==
Content-Type: multipart/alternative;
 boundary=----60A1L9QJ50WV7W29G622BQB9FJ3YVU
Content-Transfer-Encoding: 7bit

------60A1L9QJ50WV7W29G622BQB9FJ3YVU
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Martin B=C3=B6h <contact@martb=2Edev>

The service failed to start correctly if any custom rules were installed=
=2E
This commit aligns the permissions with the upstream meson build step=2E

Signed-off-by: Martin B=C3=B6h <contact@martb=2Edev>
---
 package/polkit/polkit=2Emk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/polkit/polkit=2Emk b/package/polkit/polkit=2Emk
index fb49f6ce2a=2E=2E6cd2aa6042 100644
--- a/package/polkit/polkit=2Emk
+++ b/package/polkit/polkit=2Emk
@@ -56,10 +56,10 @@ define POLKIT_USERS
 endef
=20
 define POLKIT_PERMISSIONS
-	/etc/polkit-1/rules=2Ed d 700 polkitd root - - - - -
-	/usr/share/polkit-1/rules=2Ed d 700 polkitd root - - - - -
-	/usr/bin/pkexec f 4755 root root - - - - -
-	/usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -
+	/etc/polkit-1/rules=2Ed d 750 root polkitd - - - - -
+	/usr/share/polkit-1/rules=2Ed d 750 root polkitd - - - - -
+	/usr/bin/pkexec f 04755 root root - - - - -
+	/usr/lib/polkit-1/polkit-agent-helper-1 f 04755 root root - - - - -
 endef
=20
 define POLKIT_INSTALL_INIT_SYSTEMD
--=20
2=2E47=2E1


------60A1L9QJ50WV7W29G622BQB9FJ3YVU
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><body><div dir=3D"auto">From: Martin B=C3=B6h &lt;cont=
act@martb=2Edev&gt;<br><br>The service failed to start correctly if any cus=
tom rules were installed=2E<br>This commit aligns the permissions with the =
upstream meson build step=2E<br><br>Signed-off-by: Martin B=C3=B6h &lt;cont=
act@martb=2Edev&gt;<hr>=C2=A0package/polkit/polkit=2Emk | 8 ++++----<br> 1 =
file changed, 4 insertions(+), 4 deletions(-)<br><br>diff --git a/package/p=
olkit/polkit=2Emk b/package/polkit/polkit=2Emk<br>index fb49f6ce2a=2E=2E6cd=
2aa6042 100644<br>--- a/package/polkit/polkit=2Emk<br>+++ b/package/polkit/=
polkit=2Emk<br>@@ -56,10 +56,10 @@ define POLKIT_USERS<br> endef<br> <br> d=
efine POLKIT_PERMISSIONS<br>-	/etc/polkit-1/rules=2Ed d 700 polkitd root - =
- - - -<br>-	/usr/share/polkit-1/rules=2Ed d 700 polkitd root - - - - -<br>=
-	/usr/bin/pkexec f 4755 root root - - - - -<br>-	/usr/lib/polkit-1/polkit-=
agent-helper-1 f 4755 root root - - - - -<br>+	/etc/polkit-1/rules=2Ed d 75=
0 root polkitd - - - - -<br>+	/usr/share/polkit-1/rules=2Ed d 750 root polk=
itd - - - - -<br>+	/usr/bin/pkexec f 04755 root root - - - - -<br>+	/usr/li=
b/polkit-1/polkit-agent-helper-1 f 04755 root root - - - - -<br> endef<br> =
<br> define POLKIT_INSTALL_INIT_SYSTEMD<br><div class=3D'k9mail-signature'>=
-- <br>2=2E47=2E1<br><br></div></div></body></html>
------60A1L9QJ50WV7W29G622BQB9FJ3YVU--

--===============0185111239791484321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0185111239791484321==--
