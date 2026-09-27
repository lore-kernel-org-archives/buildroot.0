Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF3C98338
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 20:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D256062B;
	Sun, 27 Sep 2026 20:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eI8InnstsFwk; Sun, 27 Sep 2026 20:49:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD48260623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790542140;
	b=rcLB0Vmoa7Oq+8C0ap/x86oJD/rgx5oz4ZHEtm+lJPHrJQSZxQ0QRDWN7gltSc9k06hk
	 GhmGXHj/FtvunaScLfGvsgMwKWX/jXWa47jjJGmbsppn00RS6kA2Wq+Y4uBMto3BBeXkg
	 gvjK6W77xBYFv5cdFpUVb02EmTdjO5Yr8Eh/7R2Jo2VIL77JFpmDC9yFsvieRKeMWGSzU
	 fY2L9dusFANLe7LktbCu4IAlMzUoNRH0Cr/zWl9Exsryul8AdbQwiqbpgmRZ7vR4I76y9
	 /dHMCVIA7CaCLoIpbRD2brnMp4+zyFunRZzqPkNciEBLKWeIdqFjcUnt0tKcrkG6x6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790542140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CFtIzcmzBeXznh4YDL3aBfOwQlhzNDQOF+xoB0CaU0g=;
	b=AnSZ+7oGxs+fnKL0Nbn2UquQpPgk2Gw7qJP2lwc5YRB5+2f+EHVwlysS//9If9Hj42ws
	 e+eit4+L+ZUYHz8/0adWWyilPh+6D+dHZZ2zj4ikvkJ2rEnwPMBps0NE0I+ltoK6LgOOY
	 Znbq7xvJD2oo71y6AOiTR1eXT+g4cCjnGlaX6PZYLFQ9GvoDKLfvDf7kMtltO3/xODPhr
	 kmmnPKKKpRJFUaylXI4BLKbkhMI1XQtytqkBtZascULlxfX6cxPQDlJmDEGMVlsADJ/Tg
	 iuRbPY7WK3+gZkzAtIoTdm7FZ/UGLxfmJn509fxlBGRkDiDKdYkOdeOKra+Z2peQN4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=j-ernberg.se;
	dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dTNuh+r9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790542140;
	bh=CFtIzcmzBeXznh4YDL3aBfOwQlhzNDQOF+xoB0CaU0g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFZ2OQrddg9QS6qQ+k9tqqEfQc3uKespY6pfpOBNBl8PCEiLBYr7oBjoyIVKtzB0B
	 lKgFF5KVITDJtgGhOhyCI6egKN1/nDXj6QmtMOmPVFarXkQIY9IcZpRDKY96WL8cAw
	 VCxQlQy2LuPzPvhZLr23w3+Qn1/Rxak4pLrpUV2wVu4gES8fhsNZdaSMDPZOjgsynz
	 f705+aCA9adB6NI1+kS6XnL4dRyvujB7gpaKqrXlj6n3DCSQkP9S3fe/N+MovU6pO3
	 lJ6jb1k2AnZcWfdtTwA5OoJ4XfB+dmXCSVKSwfeOG/NV2N8UbtP4HjgpTt3NtgVADW
	 yieXdSXFIFyeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD48260623;
	Sun, 27 Sep 2026 20:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0149E194
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72166060E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3IzMAiQdpu0 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 20:48:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C16D8605E4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790542137;
 b=bgo2mZWKzr28TSsDBEapAtBOepjbDblHrXwxL6l48I22Q8QlS6kxu6pfpzik09NzpPl4
 6euWM8j6vCIHVefRSkIg3WeMJ1Mex1moVupFM8xqnsb3adTBm+CtEb3glC3mi013I+ywl
 qzAukFFXud7jJ52Tuqo+8c2yiE4xfPoQhGfMoJ7nUv7I+CMN+vHXJB80xbfq5ba/CFqkF
 d23gMe4wUIoahBqRmS7gsFaCFz6Rm4A5D4bCW89GiDCBqKsZMbCbQSWl5ZogazW3inYIp
 9LMVDTxW+VYNlY39P+j6IsZ9MF7iGM6LEC0JZX7iH7M1QHF/zjI8m4EyxvKzWrF0D5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790542137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sL614YbL2zo/O5tBOuKj3QJ5rxL9drneKrarrJTN5H4=;
 b=AOQFuj+jwfQNETIZ23+Xy/pf0QiqiuTLNBUFop6UUMR0lJi282Q3JgNiPPKxu2z4kizl
 pSfV+2exOSO72ikbkm2iq5bTzuhM7PH88HqhbiLbazi3Lw84AVfUG/WwDwda89CLC7eq2
 7Qy+zQlwN+0AmRb1Y6YMZ8tOijh8LuQCEsUk7SBU1Z5t68DNqPjnXni2b70BmrtfBKAFb
 lDDOT4qZK39OSUo0zbGH3GbphHltNwgDCXYBWUNIYB+ZYWxR3ZSDf4iVAzF6z0SVhaJeh
 p0YI2Y1Evtx5xP0d40rVNwcwYvDBkHqrnLfL2qiTlOO78Bo6YqlSvyRpLe67C3CZnEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=dTNuh+r9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::129"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=dTNuh+r9
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C16D8605E4
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:56 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5b76694fb7aso2329384e87.0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1790542134; x=1791146934;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sL614YbL2zo/O5tBOuKj3QJ5rxL9drneKrarrJTN5H4=;
 b=dTNuh+r9ibBabSbSZ44v6SrRNUtx/JoOcbbhJ6QWV6Ulvaq76jM7x5DjilhibEIwzi
 n1P5T+vYto9D5lxlyaBKXyPub/d53UD1Ahz/VzL9uCaDSqPN/NiqgWfz+JKrFE/CL77h
 QZ6xlDgKjDe2y4pXHQ4j0no+tqHVlZuQe9bPxUWczEVtpwDDF570irzidnSzyzg9UIrf
 oUebIyQ9g7uNqlbG3rQ8dN3kG/bN7KSqOM/KVEvmbWKlvH6qRFSYw2fVXPz+Xs5ZYWs+
 6TLYQr3ujp91QnQia0oT1WObY9nz5owueZM54dJNggxtGqR2I4tbzGEcGefiSSmvcvcu
 vlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790542134; x=1791146934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sL614YbL2zo/O5tBOuKj3QJ5rxL9drneKrarrJTN5H4=;
 b=HvzWforsoRS/h0Pp1d/Fbl/hy9/XKZXnHVZzNZ9ZM8b3ThJxMSbzgDK0GJ37Io6Y0M
 CceRNyh9KFldtmUmTP4cB4ChohaaDSE/vZrGNeRkdhZ/rpeGPi2ovWP2XsnAh3vnhWDf
 QckuldZOm80igv0UUUUyphcu1mP8Ew9kUUfy6JeEA+1Y5cic8wosh9dfVLRQNj9TKzSG
 j8GKbNGMDosPvCo6urofYuokJw21thPhlMLzpLLSiPiyv3tTonS2EwLPOB1TOViyLYYG
 MkRKDkCVlfFWDa6SRvP57PWGCKLWhCsoziQgSn54NvxXtD9OXdexamuIXfsj9xoWNKIx
 pI1Q==
X-Gm-Message-State: AFq9FYJ3JIKjkJqpWWF9brjY7L9vXSx6hH/8QuUWTkx43WkmHCs/BY4W
 ce31qTw6m92lwmStxwayAyzt4buKOg74s4rEC5T1psz9nnOuXPLAGbtTUosgPkZ4eY3DnhavIuK
 G/p+PgXM=
X-Gm-Gg: AYBFou3Gt57PE0NdlIMvTyJG56uVTIVY4/goGriX6NE/OwVJtg6hWmjO2+WppcKZsti
 biAqDuElI5LMftBsqRcr2kWw4Mo2t2wlTA9HHEBF+j/DL7ny9P98WM8q15Dxpb0Mob6KbEIoCrs
 raVldq575PWRctGUBoK+U9NX6u6Ny1q9HqGUmBgzeSEuquXRNQTvFRGSHybkALYU9q47xXTJG/R
 PzUI7B5YpBOoeJdNljCwMyOSD99sUTVZFL/kgLMIdCzjKea8Lb57dBVSLS/lNJyhN3yi4e9NzmT
 T3rD/s1MsrFecxYcja1RsCsH0/Tz3A1wHS6HfwS/9ogpOKrT37Umda2755BuJGtsIa1m3hpYK+w
 aFY3DGpntaScOxfZlRLlTqXDjMGai6C5UhQJiRdDgadvRh/xSv0uyNttmjcHrSUpfhISMoi6w+Q
 dYxJYiLpToHXPd0808f57y9Z70w7BQzH11j+/jR9N+UTemyLKxVnWbQvPFo9yztd1xP0ETLRlwT
 WjLfWdPHoVURu+8fLC0nMFjIwmS1B6Fl/LYVcSexyyKmqV7Q5wgKNlW+N2oU+AKuExP8zzl9uvP
 EdMzAmkG4sEP
X-Received: by 2002:a05:6512:3138:b0:5b4:ab0c:f606 with SMTP id
 2adb3069b0e04-5b8df0c53a8mr2476835e87.2.1790542134037; 
 Sun, 27 Sep 2026 13:48:54 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5b8e6b02d57sm2042693e87.57.2026.09.27.13.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2026 13:48:51 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <j@j-ernberg.se>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adam Ford <aford173@gmail.com>
Date: Sun, 27 Sep 2026 22:48:42 +0200
Message-ID: <20260927204842.1113860-3-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927204842.1113860-1-j@j-ernberg.se>
References: <20260927204842.1113860-1-j@j-ernberg.se>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xwayland: glx depend on
 mesa3d{, -headers}
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

The glx feature of xwayland checks for dri.pc, which is only provided
by mesa3d{,-headers}.

Establish the dependency chain properly, otherwise xorg-server cannot be
built when using per-package directories, and will fail to build randomly
in the default build when a provider of LIBGL has been enabled.

Graphics stacks will use either mesa3d or mesa3d-headers (nvidia), since
those packages are in conflict with eachother adding them both as
conditional deps is fine, we can't accidentally depend on both.

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Reported-by: Adam Ford <aford173@gmail.com>
Link: https://lore.kernel.org/buildroot/20260803140815.617446-1-aford173@gmail.com/
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

Adam, since this is basically your solution and I just cleaned it up,
let me know if you want a Co-developed-by tag or something to that extent.

 package/x11r7/xwayland/xwayland.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 02a21b96c1..e6ac104e0a 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -39,7 +39,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XWAYLAND_CONF_OPTS += -Dglx=true
-XWAYLAND_DEPENDENCIES += libgl
+XWAYLAND_DEPENDENCIES += \
+	libgl \
+	$(if $(BR2_PACKAGE_MESA3D),mesa3d) \
+	$(if $(BR2_PACKAGE_MESA3D_HEADERS),mesa3d-headers)
 else
 XWAYLAND_CONF_OPTS += -Dglx=false
 endif
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
