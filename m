Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5960DC5518F
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 10:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF7434070D;
	Tue,  4 Aug 2026 10:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASU7qVezG8I2; Tue,  4 Aug 2026 10:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0194140696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785840433;
	bh=8kXtTO7R9Pz3ffntbvfeHgGi/SFwjwv9nNchwOEmua0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bm5RyeQ+uwXXZCmVued5dzhC8pgdOVtMxLmdrDJA4fDtRq8sVAtubLPbX2imTd4VY
	 T/IYri7q6swdlNim+A4G+4vvbkdLoVmyX7kT5pE4YIbsGGGqzePz2G6musVjXUYRvA
	 Oyc2auDwgrQWhD1gyT7CHA11cMVQ1c3dBnBxjenSxCTqnob3vvTFnMKWWasvnVfkNZ
	 uKaasr14UTrHfT3r9j30yO+SBtnAZMKnvFDhHiM7xkD5/o2FH0KSKVABcFz6iIfWJN
	 m5pTdeZRUVgWIxRIuK74PL+eQqujZEiKKbA4hN003m3On2l8kzY4QorfuqOcmCcJvh
	 qEmvvGjOmdKCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0194140696;
	Tue,  4 Aug 2026 10:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BCB6350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221F440071
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2p1OUWhn7iz for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 10:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60F714005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F714005F
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60F714005F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:47:11 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-92e7632b193so276821685a.2
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 03:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785840430; x=1786445230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OVoXnRt6TL1lz57wIuVRyp/S6P5RC7KxA2vxlHe87s0=;
 b=rYqpW1sWGs0nW0rlcvolllRVM2pMh2CjcEOCVp5QtIYJqy5igMCy6DZveshlgDLYGF
 eQ0QQRjzQugfvb7kL7Kwyuq7Qor4hjf4KG81VIEX4NYGWuhkNqsybkIo11NtQukv65qK
 v3YD5og/0+8eZI/kDvmTGelyGp0k90PzYFFCrcZ+qZsskaChuDdKzLJQyruNDTC/8DaJ
 UUQt9P+G2xNxM+j3ppdSKm/IXizWpqEvqyNwXzZjKU8QFQic0ZT9PskwzYsiCb4xUobm
 ClAQSiGGeypgucstELgXH00vamzvb02wbh7icMBcJPhkGsHw259TL0TsXO9vzj2hoC2m
 Ozsg==
X-Gm-Message-State: AOJu0Yx7lrT/C+IRUEjcJX0beBXu89IQsjD5YKWNjaaIMEx+Yj9lqAYt
 bpr8fqpKgO/zVNIlvNACYAVC7FK6QnLv7WntYF7rKlVdKWNcDE/8iRKcPraETgpRV1c=
X-Gm-Gg: AR+sD12NrIdHM4DuyAXn+/FXv0iCIBEJF6vNrqVGvelrMInTQvD1W9oLebq4klteK8Y
 NQp9ssBEJ1AMEZM0o3wkZZ1rrCxIRF4VnEbTFggj/AZYMy2GIEt7jOodqtvW/qM8ZwN9a8Mwys3
 1tHv0CBC8fcCwZsbI17QWuxpEYlA4YzptqoEbzfMoh+yUdjpdqHnbTgrtAaNV6vUjQGNNBFqq79
 fFm2QnKvd5dY7GWiHMZ86whsZah+UgrluuGnlGj1jzwdpIqNf9G6hYBBBCogjMx7DhCbd3ODd+p
 T5IQUXYyee908KarwydT4j/uQRME6gzexilpKTjVK9JoxNNLa3u/73Y4mHeJJ8kDtuD7ypMV9uD
 0/SFmi+CPvfp/NK/2XkHW+zuPU66HprcBX1AifwPaAE+awoDb6wi8ZPzsuqWN6BlaPS/R3SDqme
 rCYkcT34qGk6Lyxlt1TmJPjulM59eGQARfdVyFY6OVYbdJtR/WQXIeOny7VIuigxAdp7IKIR4YM
 UZbnRxDXnmIIgs=
X-Received: by 2002:a05:620a:6019:b0:92e:5b45:b572 with SMTP id
 af79cd13be357-934a06d59d1mr2811910985a.1.1785840429902; 
 Tue, 04 Aug 2026 03:47:09 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93641937889sm45603085a.44.2026.08.04.03.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 03:47:08 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Tue,  4 Aug 2026 06:47:30 -0400
Message-ID: <20260804104730.433500-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785840430; x=1786445230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OVoXnRt6TL1lz57wIuVRyp/S6P5RC7KxA2vxlHe87s0=;
 b=R+N9B1gW1LosFSOspPdgwZBzGaVjN+EkMTU6f7zRLdJ5Uj1DcSpjtE7kcwzXl/UsS1
 NaNpeAb86Cadikj5SPy3Pwl7yeJM1Im8W/tqlQh6P+8V7eeKuU7KUGmFQWksDlO5a96i
 bg/ngrALB2Qd3o2zakg7++REAWTgFEl2CkQnUjRvx9iKPqniHX+sjO5BIwPEswU7evQ2
 0Fxbgujcye1UiUiPBzXL2ccKuXcvNkieWML3neSWSG35PX1/mpybtEoBJsh7FBWz67XM
 k6N2vQy3IJYfAwMp5QAJ+hEzLYAQarTRMwHW0o1125ysLXTGDLnSU/vpgjDpoUla0nR0
 ZFjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=R+N9B1gW
Subject: [Buildroot] [PATCH 1/1] package/libgtk4: enable introspection when
 gobject-introspection is enabled
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

libgtk4 passes -Dintrospection=disabled unconditionally, so Gtk-4.0.gir is
never installed. webkitgtk depends on gobject-introspection and generates
WebKit-6.0.gir, which includes Gtk-4.0.gir, so building both fails:

  FAILED: WebKit-6.0.gir
  Couldn't find include 'Gtk-4.0.gir' (search path:
  '['.../usr/share/gir-1.0', ...]')

Tie the option to BR2_PACKAGE_GOBJECT_INTROSPECTION and add the dependency,
the way package/libgtk3 already does. Systems without introspection keep the
previous behaviour.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/libgtk4/libgtk4.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 0d86835609..9a5ed651a8 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -34,11 +34,17 @@ LIBGTK4_CONF_OPTS = \
 	-Dsysprof=disabled \
 	-Dtracker=disabled \
 	-Dcolord=disabled \
-	-Dintrospection=disabled \
 	-Ddocumentation=false \
 	-Dscreenshots=false \
 	-Dman-pages=false
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK4_CONF_OPTS += -Dintrospection=enabled
+LIBGTK4_DEPENDENCIES += gobject-introspection
+else
+LIBGTK4_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
 LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
 LIBGTK4_CONF_OPTS += -Dx11-backend=true
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
