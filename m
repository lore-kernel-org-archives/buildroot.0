Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A838CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A138280DB4;
	Tue,  6 Oct 2026 16:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDWX2wbK_xHm; Tue,  6 Oct 2026 16:29:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E6AF80C73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304186;
	b=UV1uS3KvETUmHVjj8YABuaS0xxVYyyaKkuxaUBrrHP7s1rG2dg6jUwKbcJ1aJCa0LBj3
	 4ftxdgkcB4vswK4U9qVa0ffv3UhTLLH94xMhLglk1hnOgrHisJDnj40OmbEUJ+/2FReL4
	 j1pR3JLGNwKHLKYFx0Y2Py+qXnzSTNLVOpWeIxf2fTRGhPrBGAWU+PJeXlbQFaC80/9/c
	 Bko2aBTA9rDqxOXOKdais3Wt9ABiA7ypMLvQeesSmWgdQiU83U+3f3H1Zo09TTHRsHaIc
	 9dFWAkmYRYLBA5/wJO5sdPJ4ajoY+ECWzqYMO8xY9yvIu8yK85+rHedzWi4VJ8UMGxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HqWy7NfaZtyCzVuffanDJKBVQCylFaH+7ubl4t0g4/0=;
	b=BJubNpjZ8ruAtJiDoLHCpZrILvLB7O+w1pmrEfBmYfCNlfAEw/kLOF8gQURmbr+uyE6K
	 ktqhgH7wCEtBoZvzdgMPDrCbo9dzf1JlFaQNhd+2ZFD7AaYrKa6EvCQuanCD3xX8bFglh
	 tiC93lhi5vEoo+eO49cYuw2boTDfVjrL3GMDxvoVpf1yqq/WmPnEhMIog1FMVPjAvYLYU
	 6Fq8KOr4u+cylnsCuoDggFNZTHgQhNZp2tfv+uX84PhW+pe0CULO8Q+jM0gUySu8G+qHW
	 fU09PLMMrXL/fMg/CKAAaTTj4akBglnsPtDlLne8h2FV7qORV2WZ4e1D1rf32x3UaPg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Aw2EwFNO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304186;
	bh=HqWy7NfaZtyCzVuffanDJKBVQCylFaH+7ubl4t0g4/0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVtAupzyj6/6P4slas4W5ARlVbFrXI0jGG6BwISCOohy3f/DDn00oU7CH/xwNh5Ow
	 rHrlAtkQKfe3ljZVGeT+n7UpYRmgHBdVfB1meZtIzxfQ4TI3nrc8sKB1PLvQB0r6Sw
	 YNmuU2KT62vVZMjzuEvGTjQBhOSS53qX0iM1KcB8T09Mk9brcswe/c6CcGcOFc3vpg
	 mb3y3oWKoalR0lbdAxQcieuOE3eXPPOcHBKAmmDweJy+5Kd6ylwIFHfwQBHo2vGlk5
	 sHMPwTTvRxkxXOZ0Eed47LC1YbHpz9+Oc1zU0OsdDrVtuzF6d1IC7h5MPmNial91Qw
	 q2d/3v+gLKYtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6AF80C73;
	Tue,  6 Oct 2026 16:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4168334E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3320C809B1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rk7web_ogEE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2718880994
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303798;
 b=Poqf4seQQ12pNQ0UYH+LKuuEHWOODoVh6ruBnq5KRTS9mxgZHtZSp4d7J9iUuBd3glVq
 eaBsBuVjla6SkEIrWOoXB5wzp72Gyl7onCrDxS0uJFHpZN4m9JRqnwEbtJ3fIbkPHV/q6
 N7Kof0JIonA8wjnrwqoMXI1TZG1M13mYxUqTGg9TVsy53nrNreOLYvgweuv/GgaCrdhHD
 B4XEhNOzmzyqU2usqgDPmCIKPo+giU9y7EXaxlzp/CGInSS26LxzVvTV4HL12hWanWEQI
 PAcyOs2mHntinMNF7dztcqFSmoJ3jR1cDQvCOJNLIlGGUbq8laq8heAnLW5WT57QIag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303798;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=S/iJC93LISU9/Vvey4gezulf9Fyu8l5l/mzNmdDy9DE=;
 b=hn9ryoLPTvtYMhPFZyj6LViECEKsnLQ5zku7p3DrIdqBMAbtF6Ne2UxSb6l3uHcIjmpK
 8XaTidXBpDee0VreCtF4dwHT7WRdzedCTYROmIVsWFHy84t3r8R6CbDhBBvIfOj31ovYG
 n4zwn9YiwZlt8WAhDZfGFaWdPvgxF2JhJomrIXMdwEhjZ55yAlEL8zU/BtuwvlxKRvcrm
 dGDEaWjZuLn7Y1FAHs3Zxyqi3VFnvid9ujs8lqtqjwgqAyNkcZIo9e+3WuIEVPH0ofHRU
 QurKLCuqXu1xcPgt4MDN7O2fkWa6b3pz8ZqDUzCJLleY+53WPm7oVfhsnPb8szIisMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Aw2EwFNO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Aw2EwFNO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2718880994
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303702;
 bh=S/iJC93LISU9/Vvey4gezulf9Fyu8l5l/mzNmdDy9DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Aw2EwFNO7TzlPGisx69e8NzZYBBxBudrUfPxYslCy+PX3dJfrkKYS3947kyk6OhJw
 kcWmliMi52QM1k/PSRfbHtaS+m9QLteIiveSPXu19pQf0jJLWVmI5kO4gcprvj8fXU
 ICKT9uZDaH2LK5UnCMbTVUVXAOKoilZ7PhK6Z7qLU/BtGXdX8PKt+YYLkyEppSMgSd
 GSPWC9hYEeQ5wbck6vpMdUy7YYnBpeGYdyPs/iBs+AYXE3USjHDsO8PNuwqAawK0Tf
 vDaDBWLrRjNG6g3nqME8/pNG5XD58SieSOu/3e1SVEUiG6yarm1vLh3N9ENoYedYb5
 QlV1jW1LWopjg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 8ol4L4veMW0EjKKhul8hB+307iPHJast5wgrPSXU8j2akMCsArp7QO6FSXNpAr7W8Yf3pvMlg9Q
 hkz2eTOzJF1FsR7D5mf1+VsJqHcuctubL489258TEQ7LGlBQ8Bw5KiAU9LUcOzHOXdbVNanO0T+
 au6RUTVE8es1+4TL+CV3sUJKy+nEedyn8GW8twjhh15QslF47SQXctHC5MfnKREZ4Au/Bmtvmy1
 yUXwouQaZOg8ca7w2AaMo6Az0Fu+lN64G8GpgcztN2XR51wkEx+Wf2QfSh7B/4hRel6Vy67xTi3
 oICIFZHQjcYG3x3jd5G5ViL7JT2pErAsP7/zTpyHkIzgUH+gJOJgXPW08EShaITIbst9M6w3Hj0
 hbxbYxnklQQOhr7vrcyD+RfbivFLvg5othIa7FSEFixISOTbDgCIDoFTiQwLYZS68R2W4dBARtd
 nE+EosrbS0frx3Kf/BScNG9xBaUVQ8w+f86+vTpjYGL2iMfCzGRpRU4xSH1MlpRMfChJELYzlmE
 MCTnuj630MTgxLavqpph4OlsHHsZzmbhKd0Gb2vkcrLKJCBNHA1TpzdwrIY/Tmp6EqcS7OdINqI
 xdbp4+pC8pKxi9iq+bQIDqiUr4zV53bt3ccRyEa4K0Z+QtcbLOQqux62zgz5g9Dp
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54624A4C42FC;
 Tue,  6 Oct 2026 18:21:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uo-000000000ir-1N7z;
 Tue, 06 Oct 2026 16:21:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue,  6 Oct 2026 18:20:40 +0200
Message-ID: <20261006162106.3439373-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 59/84] package/opencv4: fix build with ffmpeg
 9.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 ...FFmpeg-after-AVCodec-pix_fmts-remova.patch | 58 ++++++++++++++
 ...se-avcodec_get_supported_config-for-.patch | 76 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
 create mode 100644 package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch

diff --git a/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch b/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
new file mode 100644
index 0000000000..fabb364441
--- /dev/null
+++ b/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
@@ -0,0 +1,58 @@
+From 700cd32ffd59ed3c6f6aec1919867653d8b125ea Mon Sep 17 00:00:00 2001
+From: Aadhu23 <aadhavansalthivel5@gmail.com>
+Date: Thu, 16 Jul 2026 09:21:37 +0000
+Subject: [PATCH] videoio: support FFmpeg after AVCodec::pix_fmts removal
+
+Upstream: https://github.com/opencv/opencv/commit/700cd32ffd59ed3c6f6aec1919867653d8b125ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index 65045a2bc7..bb5e4c1088 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,6 +757,30 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++            if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
++                const AVPixelFormat *pix_fmts = NULL;
++                int num_pix_fmts = 0;
++
++                int ret = avcodec_get_supported_config(
++                    NULL,
++                    c,
++                    AV_CODEC_CONFIG_PIX_FORMAT,
++                    0,
++                    (const void **)&pix_fmts,
++                    &num_pix_fmts);
++
++            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                    for (int i = 0; i < num_pix_fmts; i++) {
++                        if (pix_fmts[i] == hw_native_fmt) {
++                            *hw_pix_fmt = hw_native_fmt;
++                            if (hw_check_codec(c, hw_type, disabled_codecs))
++                                return c;
++                        }
++                    }
++                }
++            }
++#else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+                 for (int i = 0; c->pix_fmts[i] != AV_PIX_FMT_NONE; i++) {
+                     if (c->pix_fmts[i] == hw_native_fmt) {
+@@ -766,6 +790,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     }
+                 }
+             }
++#endif
+             for (int i = 0;; i++) {
+                 const AVCodecHWConfig *hw_config = avcodec_get_hw_config(c, i);
+                 if (!hw_config)
+-- 
+2.47.3
+
diff --git a/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch b/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch
new file mode 100644
index 0000000000..e87876ae40
--- /dev/null
+++ b/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch
@@ -0,0 +1,76 @@
+From 83ed22ca2800267050a4a9a94afab605c990c0e0 Mon Sep 17 00:00:00 2001
+From: Arnesh Banerjee <linkrinku13@gmail.com>
+Date: Tue, 4 Aug 2026 19:49:11 +0530
+Subject: [PATCH] videoio(ffmpeg): use avcodec_get_supported_config for
+ framerates on FFmpeg 9
+
+AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+FFmpeg 9, so direct field access no longer builds against FFmpeg 9.
+
+Read the supported frame rate list through avcodec_get_supported_config()
+when building against libavcodec 61.13.100 or newer. That call returns the
+same list plus its entry count, so the loop iterates by count instead of the
+old sentinel terminator. Older FFmpeg keeps the previous field access.
+
+Upstream: https://github.com/opencv/opencv/commit/83ed22ca2800267050a4a9a94afab605c990c0e0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 34 +++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index a7fb1eda9a..d5b950392c 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,6 +2627,39 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
++    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
++    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
++    // with its entry count, so use it when available.
++#if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
++    const AVRational *supported_framerates = NULL;
++    int num_supported_framerates = 0;
++    if (codec)
++        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                     (const void **)&supported_framerates, &num_supported_framerates);
++    if (supported_framerates && num_supported_framerates > 0){
++        AVRational req = {frame_rate, frame_rate_base};
++        const AVRational *best=NULL;
++        AVRational best_error= {INT_MAX, 1};
++        for(int i = 0; i < num_supported_framerates; i++){
++            const AVRational *p = &supported_framerates[i];
++            AVRational error= av_sub_q(req, *p);
++            if(error.num <0) error.num *= -1;
++            if(av_cmp_q(error, best_error) < 0){
++                best_error= error;
++                best= p;
++            }
++        }
++        if (best == NULL)
++        {
++#ifdef CV_FFMPEG_CODECPAR
++            avcodec_free_context(&c);
++#endif
++            return NULL;
++        }
++        c->time_base.den= best->num;
++        c->time_base.num= best->den;
++    }
++#else
+     if(codec && codec->supported_framerates){
+         const AVRational *p= codec->supported_framerates;
+         AVRational req = {frame_rate, frame_rate_base};
+@@ -2650,6 +2683,7 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+         c->time_base.den= best->num;
+         c->time_base.num= best->den;
+     }
++#endif
+ 
+     c->gop_size = 12; /* emit one intra frame every twelve frames at most */
+     c->pix_fmt = pixel_format;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
