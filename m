Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65484C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F213F80E28;
	Sun, 16 Aug 2026 19:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ki8hPiknJ_8; Sun, 16 Aug 2026 19:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F7A80E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907890;
	bh=nqN+59PLJhwktwxr5Tmj3+6CWZzI7xGDAch4RxRuegw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S12orZtZq6jF1oKj6rrJT99ZGD1jKBLu0LTdpcKd+lei6Cx3dbdWj3atSfFY+gfvA
	 NqunZ2Su8jQsHSdwBpImI1NUIst6VZHUxwtvZvlRQbEWWrIG0Z2RkuFRDrNX+SwZWC
	 L5TJxNsYCaG80GdjGE3pHqXRdc3ytNKOKEgQz5pIh0DVfjE9S/iNEeNPgP4490vgrQ
	 8YlAzcRKxIjCb4Y6Bzf+CgIE3+6SNpq+1kPDufXDyygMITQB17C7DdCQ6HTXS3+3IT
	 1pvHc658l89KLmOM8Btxc3f+DaBXv1KjjNKwEEGpm7PwxGeS/fdeuq6U9u4lwEmA2R
	 aNtU/Cd+rMm/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F7A80E29;
	Sun, 16 Aug 2026 19:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6CEA3A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A80DB80DF2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bu--G0jJ7oMS for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DD6680DC8
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD6680DC8
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rJOc0POZ
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DD6680DC8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-936d00181abso119154685a.2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907881; x=1787512681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CKtbZP82DmL7wCDbvJlXimowgyCYOWhhmK9Jbs/GTeE=;
 b=rJOc0POZ1uy2xwe5dXnej05qNXLB5TCxXCG6P2lHSN+NhisEdGSM+YwuGhl2uKC+8f
 L6k7o/qHPwV0mqlUAboRGrCG2EgqzN4lhFDbldAtqFBpaV9GCkG2tZOiUdYwiOeuE5nU
 auhi1dUTpflwkNp1fCLIrOlTNpnLr1l48YWzRL2JTQeGXxvmEv0RvBIlgeRtoAE7pYan
 FdP6S8p83vkTbOSm+IHQOuk994Cam9duu/WtYk+aga2XdS+Hh+bNX9Mq50QiGNbnBsvA
 X+iXW9THny7mtMXiZfOejCUj9+E7Uq6U4JU1kM8u6ekKwCleEeNyWYttzpp0A5Qkw8RG
 X0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907881; x=1787512681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CKtbZP82DmL7wCDbvJlXimowgyCYOWhhmK9Jbs/GTeE=;
 b=fWYUU23P0+MPz8ABcpnDoI7CuLisCB5Pq1pCxBEc/Ot5yer4APxY2sIyIWTvNzOfJO
 STjivaJGKVkM/JId9n3WQNbIO5sF0hyx9U+Agt8XTTprTXTxC9a9wnvIDkN+XhFZwmEr
 zzCIkbmh3+xB00q01YV5+2SPDakcmad89a57pggMwEOfGVJtM/QFVVB/nc99sMzQ9y9x
 /iF/mLrcMBU0laBfQYO3aUaHoHhEuqQ3rbM/DmKyi2O5vxlAMspDk630zIWnr81wb1WL
 1EZ3T6ixNtXljaY7fYortJYnZ3FtSSiw0N6hrDyBnKr4PsI4gnB/VM4CVgvcJ8rZMlD0
 Grlg==
X-Gm-Message-State: AOJu0Yxgqre928fPwuejRQf4jQVTsK7tZtO8IS6a1cvlGxB5APOyROZr
 i/rzaGggSDVXI1cTkPnApPK1JtuJg3Fh+0XeiL66jhijsu3E8svpKotqmB25Lg==
X-Gm-Gg: AR+sD11QHqKktsk8SavKecPlmWtI+UqdtXna5O5uKr9bxJqGUt+vUgTqTBOHY05q09z
 Ue/h2dsk7puLbf14/GGPOTNQz5lzY68SohwXNBcHz7LsCsxbvmeJjwlUkVOMCQfY8P4H+RhPyHb
 WQjUIrD+S3lfqCAXIw22ZxKtugL2BGT1V4xNTipAQZ1qOIm3XPCQMtvCb+vZ8QWy7ZNUvzj3CHq
 qypTe+V0nZ+h4AO4cmv06jAuh6SSOPm75GBqEskeu/31IUa1DX1n77AHtaiO1xk4SHAfTRtK9Lv
 Tb6clUqsJ08XLMbMWcZJDseuAsUv949bhR433+d9OeUF8kekDv37k+YZirc0Fwysk6in6YXhuRQ
 EzVGP9ZK3uiv6rwAkxSTlsaukO5ClAxwjWcCTZuEK4jEV5PJcJ0mdWoJo6KELKa9r2dfEo038MI
 bklSmouVKD9QAz+5SIRrkJFQItVZMRvVZ+jATXmLNpni7rPtB6XAu0cOrUgLFNy6qTHGAE4pLMm
 MlSoyLxxZ/giyR1Z3KrTeysww8=
X-Received: by 2002:a05:620a:72b4:b0:936:cae6:5869 with SMTP id
 af79cd13be357-936d23607b3mr1640510085a.46.1786907880931; 
 Sun, 16 Aug 2026 12:18:00 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:18:00 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:28 -0400
Message-ID: <20260816191830.533747-7-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] package/sdl3_ttf: build plutosvg support
 when available
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

Colour emoji fonts store their glyphs as SVG, which SDL3_ttf renders
through plutosvg. Without it those glyphs are skipped and the rest of
the font still renders.

plutosvg is packaged in the swift-linux ports tree rather than in
Buildroot, so BR2_PACKAGE_PLUTOSVG is undefined on a plain Buildroot and
the branch selects SDLTTF_PLUTOSVG=OFF - the behaviour before this
commit. Not for upstream until plutosvg and plutovg are packaged there.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/sdl3_ttf/sdl3_ttf.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 130e07746e..660661a5b7 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -26,4 +26,14 @@ else
 SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=OFF
 endif
 
+# plutosvg renders the SVG glyphs in a colour emoji font, through the
+# FreeType OpenType-SVG hooks. Without it those glyphs are skipped and the
+# rest of the font still renders.
+ifeq ($(BR2_PACKAGE_PLUTOSVG),y)
+SDL3_TTF_DEPENDENCIES += plutosvg
+SDL3_TTF_CONF_OPTS += -DSDLTTF_PLUTOSVG=ON
+else
+SDL3_TTF_CONF_OPTS += -DSDLTTF_PLUTOSVG=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
