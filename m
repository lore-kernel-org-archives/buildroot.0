Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C376DC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F94B40CD0;
	Fri, 18 Sep 2026 13:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPoxLHkuWMvo; Fri, 18 Sep 2026 13:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A935240BF7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736860;
	b=gh4Ha5vIQh1/z5e+H5FDUffuo8MrygOPnu3pVPnryTIdz5cdlOj7WDJbjQJ7n3MrOCYq
	 FDRmPjTzhsEGXhPJjfHwC3YWTYJxLqGL198n5U/iy7jo88dssN6SpaCxONPjUu+LRzsE+
	 ljlCI25Odb5FztY9HPITu5ZE4yVQBC6vg24NB5EnEfbWNhz1wGOEm6R4jVZTm3DadLGdZ
	 25b3RW4Vm0iaN0WQrPBzQEFOmgIhhSXMBJna85YwRDrQyzkoRCCP7iQBS0ZnUVfVdlluT
	 OhktfraWAMKc6qIFJJoL9jLcDzt7DEhiy6m9HDmqgo8jc1pU3ls2XTcoy4xN0SPCkAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h5RYyq96VD9YmsosdnJsZpNMWTz6M1egGqr2mv0WMUc=;
	b=FFQuEieiz11W9tuo7xvarKTIEtAtz959BMd+pN6bKtDKusdc7IY6XrEd4EcoHbNRCj5L
	 1xYMeaO/taKz3FQII0E5cJBzfibSVXQKa1/pXt1Dd6fvtz0kE1J33AoqTu2WP30ZFerGH
	 NjUB4x11fnc3ZjwXwpvDyXA0zxY8/KfvQOlpE5hUlb1nGpC2+Cd9vXVrAtyc2mw7934ST
	 kuhm6RNamQs7izhPB+1e3CyMwDGFb5goHDmQDCQ/g05GrQRIPiiZJE8yU9/trnMTeJwY1
	 6x57hSJxOf7bem/5WBAtlHStyDrUsw1lFIGWeyjrvHtfS31AOVqjAFubdxloMp90lMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736860;
	bh=h5RYyq96VD9YmsosdnJsZpNMWTz6M1egGqr2mv0WMUc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=maLrGta/3b8EtHF9lz7ybAp4FAwE22ePw7mKGicmsaLWa1RfUEkC9KRwGVgiOxrtV
	 9VenJrgwa1IHYb9T8pW9WrfHpEnXVene8Cg1mpVWc2ThenZPRNjIlcQ1w8YpI7GMCl
	 TlpZ/+hoiES9osXVDf6lTV05YfruaC0obG9P5V2GF5WD4mLHxbKJLwTzji/C4ETf79
	 B/LiCahfzyCuwALKppe7u3WhqJstPqSRijj0EWPSYpoYysETTLyQ/nAAYivpIDojEg
	 mbAXUMy6/BIevSC4WQToNC59OjR+56ZzvCNUiQbCHFgM1mZAL19b7i4VrR4oezGYYf
	 SYsJnMxieozHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A935240BF7;
	Fri, 18 Sep 2026 13:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E9E43A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79C760DF9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRlfmDTlwGvg for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5180860E22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=VZkY2j/AUoMb0wlHFrS9dek2MNFd/s3pdMKp6t9EbbsIG5DEgxJ7Dn0J5kYMt/O1h/bs
 9r6tTwmLV2OECVr5FnJBd/6g902ev2+mpmIy27kcpBOGFJaYKEV3z5MR2bAsggOyPA/1V
 YcvubwXx+9F9YcBOPyPbVojN1S4y3Io5YpYDaLX09n/ZumHT/+DMMG76M5OeugfjRoVjd
 CdZqSADDI+NY7BoZLkZ6/SYe/BoYtzyd8F0yJuYMixe9040gpMDP77fQQ1RUUT7hjCb7F
 TciKneHX+wQzBVPrxIJS5mnAPnWDxciylKKEC6D8NKGzBYSIDjblKBRe18nKJTuuFPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lFN8ugwdwYG2URIXYf4GV3iLzbzN318X+rK461vz7yk=;
 b=QbGcpZRD0zmDlgOF4NOtQa1fJU6uQNAqK/uuszg5Csu2d7xnQTjbtO5aqUf0/G2dDypg
 Najas/KJiLTztr0EB5iJ0qAZaQraKOztMLLJ/bbgC2raQvOoSIp+zERL0cauPkZ30klmo
 6ttHb4v4alWO2JCae97788cvMhCpB3mUAY+dyjZrVWucB7HoIC9hd1nXsrEHu3Sa7gijv
 4c0t4bva1fWooa+G4birjwBQTOPCCxE6V+mZMRUejettlWVaMGPN2P4KOvHe+tuW7GfiK
 UZnw6NZXd2q6qaecp3zkDSbN3pT5mqrz4bPL5PDAP7z2IxbOVd+8Rp1NApRa0jTLy7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5180860E22
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A67397698; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:12:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 04496503c5dec742a2ef776e34436cb98b6c3781
X-Git-Newrev: 1e25dca1704bbba2e62f17ffe31db6432f09d240
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.0A67397698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kodi: propagate
 mariadb dependencies to BR2_PACKAGE_KODI_MYSQL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e25dca1704bbba2e62f17ffe31db6432f09d240
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Even though kodi itself has architecture dependencies (expressed
through BR2_PACKAGE_KODI_ARCH_SUPPORTS, the option
BR2_PACKAGE_KODI_MYSQL selects BR2_PACKAGE_MARIADB, which has its own
architecture dependencies as well. Make sure to propagate those to
BR2_PACKAGE_KODI_MYSQL, which doesn't require adding a Config.in
comment as these are purely architecture dependencies.

We haven't replicate all dependencies of BR2_PACKAGE_MARIADB because
all the others are covered by the top-level BR2_PACKAGE_KODI, and
propagating them would require adding a Config.in comment for
BR2_PACKAGE_KODI_MYSQL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 16e3d628bdb55623169412f52116f42a28b78df0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 08a7caae2c..0b13136d82 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -202,6 +202,7 @@ comment "nfs support needs a toolchain w/ threads support"
 
 config BR2_PACKAGE_KODI_MYSQL
 	bool "mysql"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
 	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
