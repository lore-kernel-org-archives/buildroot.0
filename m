Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BADFCA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49C340513;
	Sun, 11 Oct 2026 13:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pm9bXHfnRAc0; Sun, 11 Oct 2026 13:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DEAE2403FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724044;
	b=Dk1iyukhOJthmOh5c6HWmHjDl4xBeFbr9/olJW2jItS3qVY4kwWEzcpPr1m3R4dOcKG3
	 sS16HyjBnqDkgEGqmbqnJ07CkkAacG3naFjTrAKTfNGn657sY4amZTU4kNNnSnSiwXUYT
	 8wvtwZ7bqiCWPd85qQt9+quZFEoVMAn02S8DlQt8G3lx5eHMUQtnzKq5aXOwHtR0xGE1N
	 h699+PTmQRPjkU71DiHKZQKf1HBZcblNAzyhEk5rxOPbTEdSZ01dVZQoHppXWxKdfboVJ
	 KKk9n8Ygq40rF8dioI5uFajvAbDpALvTB7wlAF8lpCg4iOnKX5eUxOqi8tQWnSNObOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lkHJdpZT8rvpDC+X4E3Oy+qwxrQ7RZD7kxCWVlaAr24=;
	b=O8Jqb8Xieub+1e7VOXRD37A3Yqa5ofxfenFDd5ie1avnLxRqn7GmqJREKMpDekVtcPwQ
	 vxavj1/t9OZhZIEC0wWsOzl3H3NSW2bVb9Y/Jr7dyXwL3uOA3bOFM2USxrjN/DzTSXZGg
	 tz/SWcc3YYSSWVHh1N28D/CSh9WC9HuwztAFQAXOlInJ4LbISVc2jJNP2jtR4+ti8xtCO
	 BBC8VnO2bfxP8Vz4JNAAzja1102Ir1X7dYMxZ4peQIdkqSAgtG9tGFp+IzJylmhPCeQnI
	 XEBZd/TOwEr7vbWDJPv76j+wP9CoTTw/gaMUu6a8bI+QCpn43BqAzs5kiG1b3swPqlQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724044;
	bh=lkHJdpZT8rvpDC+X4E3Oy+qwxrQ7RZD7kxCWVlaAr24=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3Y/DXNq8YmJS3SX3IrLDW8vylM691tD1I+rHwsTX+WmRNM6z/ivLVelzPUlu4BW0
	 ChI5hYBY29p2kkrSxtxDnoZJ5ckpVjmUw/Wp1JIILQBWxXFiQviddq9csCvY9z5RtS
	 0s1vMjRiTJwAfulOTZN2Qi+UOCAFp36BvZSHYKXRhTzrm8ZP2tenVFPQxOmwUf0feq
	 FZToUZafEQDE6qo6OXPTjZHriSyhR0/29dnFzrrEfHKGbaTcQRhfrK0MndauhTkVL4
	 LLM9u9ohQ9Y9Ziq28z3WTr4jeQfezNFNI4BPSywsCx45BxxOPOedDCt02hkmxdFfg6
	 PKSARxTJyFAMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEAE2403FC;
	Sun, 11 Oct 2026 13:07:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A987B111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7118605F0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0A3FW7itV5mz for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:07:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94931605EA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724041;
 b=KcQy+/4Fhr/QitfAUYZTdVjYOPQSD/IcUj4DlY9fuQDkjLQThEEnST4b4x0398ZGj4bi
 50Kcpeorxqmy56H38iulzrgo6uFNP4CDWWb4JCAoCdG0yv74uatU3980jJMOtw6lMV+uQ
 1XCPFSf98sBaTJ56Bqgz2nkXql4oWthWBYmmzGEXT+DQfbhPrmaQLC2bjkuIUZrXjve9q
 oa173NRxjNz0JI/R/z6aS1TS0EpTsXadgNbSg/yBVp7vTkizjfKt1eeQzRfC9byZerAxZ
 HcSEVe/4bfVdZnumteZicnTfs1JAvnzHfwe5u040LQKpwxhnmyuF0g8sVkgLRStSagg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724041;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0VZvWJB63IazXVY8X97JkvXrRSDKtxUZkzhDLGkJGLA=;
 b=Wrq8pxgUKKX3B8ZqVDbt6a94gbuT8sI04bLxv7XPpfHOWgBHIkbbWP+Ofjw3VX+MKbNM
 oWntn+NPdHdIfHlvvIO4eILgKCYSh0nZXf2IhC+iGHCLoEs+nli8Q6smh9YQd7wnHG0Qe
 OD+WL1eOKwpOnUnXbzI9O6eBKNR/X344/cYLdJbpaw8TXhJpjSiUvJm6jCTXXjrgOdgV5
 62a39N2fxm9Ua5iM1RZd3sUu6mca8yRquq0YRvHaoIRfSz9bO9rSvWBgchUgxvJiTZmzC
 oGbgvPs/1KBQGXVbxcO0OFr/nul0fpAGbZC5pX40PwvK7LPG1RCbab+1jnYWo+aqyuw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="DLPQZ/zd"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DLPQZ/zd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94931605EA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723664;
 bh=0VZvWJB63IazXVY8X97JkvXrRSDKtxUZkzhDLGkJGLA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=DLPQZ/zduyJadfyZ2RyqBMJciWsJ4z69DgKcBfk7kfNdheJ2EjcBFjKdh/hyDt7KL
 8GaWeuQD2H2S9IFxkyb9y9IBaSk4FRITBdlGo1EhBcyFCBsriMnfxRAcyOgWlXSNR+
 IIusuU/JU4mNPj3SVJ1uwJZ1LvegfbEQf1nxTNVl5mDrajZCRx3UR5Nn1FScDU7xI3
 Cbb1KbD9trQRlYaSqjkfKNg5UW7pIaXACrkewVXJ0FhJLfN0TwYL/IzVX/kkx2KJR8
 PTzG17JzhkK6A4Z7zCP5Iv0t3hEKkEzjnqTq2CRtLSuMKKlrElrA3vA8avCg/VTrEE
 6E0zjRod1uQuA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 qgMH+4rlxBe68ylbQ8fF4RSn3igJRNEQY6UPokf/BKPvQhMXePoJFgN8aIFd4cCB2fMlWz5czqP
 uCaOLGhVERzLUHpKlA0JYzKxukMv/d6WXVFsTCpsxvAhVDDE5BT+ayUbWJMLbR0O67GSfBppEfa
 u8nOukoG7JciXzE38Tq+1qdCoj2pUmtJBv1Qo4Z9NWziVHe4hwVSZ54OKmXY/31jc6H9A7dCT92
 0I6CNZylXFIeSunpis4VBWGHLPT+iaKourhYzzTbmvHEe1Gmv+NxyKMMI+Sw3m4/epDSpLXeBw0
 bZ5j7I5/EZLDHbkHzRwqKsxYzZ6tD3q+bhPkXKLxvN39fKKfMEB/K8ReVTA3KZIaJ1yY8JbknDo
 NhjBzigaCXpjNINSpvlIjBYW0v90fdje/NyIZf7tBsk+RaYa+9mZ6h7fLi6RTgo89lnKy5xh4MR
 K1s9MUpLc31gnmtzQFMkKFajCsEs9Z75VFhP2xFroKlnYvCgyuGn1c6Chx+r5LMhHwt8aPvxado
 2pGNDEjXs8JRksJxdtAi0U+OmsKy/p0GuVWebk7UYHDAY18YTftygbI0mrCR7319V3r7yEAcvmg
 T+JJhYQ=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02BAAA4C5882
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAl-000000007Fz-2dDW
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:35 +0200
Message-ID: <20261011130058.3443432-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 30/52] package/kodi-inputstream-ffmpegdirect:
 Fix build with ffmpeg-7.0
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
---
 .../0001-Update-to-7.1.patch                  | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch b/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch
new file mode 100644
index 0000000000..a82b9a5ee8
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch
@@ -0,0 +1,106 @@
+From c7272c63151921bf4b63792cd2c9afc73fe5d666 Mon Sep 17 00:00:00 2001
+From: Stephan Sundermann <stephansundermann@gmail.com>
+Date: Thu, 11 Apr 2024 17:11:32 +0200
+Subject: [PATCH] Update to 7.1
+
+Upstream: https://github.com/xbmc/xbmc/commit/72fe098c8436c96763f677b4c65d32988b931b5b
+
+[Bernd: ported xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
+ fix to kodi-inputstream-ffmpegdirect 21.3.8-Omega]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/stream/FFmpegStream.cpp | 71 ++-----------------------------------
+ 1 file changed, 2 insertions(+), 69 deletions(-)
+
+diff --git a/src/stream/FFmpegStream.cpp b/src/stream/FFmpegStream.cpp
+index 8bf474f..649e43e 100644
+--- a/src/stream/FFmpegStream.cpp
++++ b/src/stream/FFmpegStream.cpp
+@@ -1012,74 +1012,7 @@ bool FFmpegStream::OpenWithCURL(const AVInputFormat* iformat)
+   if (iformat == nullptr)
+   {
+     // let ffmpeg decide which demuxer we have to open
+-    bool trySPDIFonly = (m_curlInput->GetContent() == "audio/x-spdif-compressed");
+-
+-    if (!trySPDIFonly)
+-      av_probe_input_buffer(m_ioContext, &iformat, strFile.c_str(), NULL, 0, 0);
+-
+-    // Use the more low-level code in case we have been built against an old
+-    // FFmpeg without the above av_probe_input_buffer(), or in case we only
+-    // want to probe for spdif (DTS or IEC 61937) compressed audio
+-    // specifically, or in case the file is a wav which may contain DTS or
+-    // IEC 61937 (e.g. ac3-in-wav) and we want to check for those formats.
+-    if (trySPDIFonly || (iformat && strcmp(iformat->name, "wav") == 0))
+-    {
+-      AVProbeData pd;
+-      int probeBufferSize = 32768;
+-      std::unique_ptr<uint8_t[]> probe_buffer (new uint8_t[probeBufferSize + AVPROBE_PADDING_SIZE]);
+-
+-      // init probe data
+-      pd.buf = probe_buffer.get();
+-      pd.filename = strFile.c_str();
+-
+-      // read data using avformat's buffers
+-      pd.buf_size = avio_read(m_ioContext, pd.buf, probeBufferSize);
+-      if (pd.buf_size <= 0)
+-      {
+-        Log(LOGLEVEL_ERROR, "%s - error reading from input stream, %s", __FUNCTION__, CURL::GetRedacted(strFile).c_str());
+-        return false;
+-      }
+-      memset(pd.buf + pd.buf_size, 0, AVPROBE_PADDING_SIZE);
+-
+-      // restore position again
+-      avio_seek(m_ioContext , 0, SEEK_SET);
+-
+-      // the advancedsetting is for allowing the user to force outputting the
+-      // 44.1 kHz DTS wav file as PCM, so that an A/V receiver can decode
+-      // it (this is temporary until we handle 44.1 kHz passthrough properly)
+-      if (trySPDIFonly || (iformat && strcmp(iformat->name, "wav") == 0)) // && !CServiceBroker::GetSettingsComponent()->GetAdvancedSettings()->m_VideoPlayerIgnoreDTSinWAV))
+-      {
+-        // check for spdif and dts
+-        // This is used with wav files and audio CDs that may contain
+-        // a DTS or AC3 track padded for S/PDIF playback. If neither of those
+-        // is present, we assume it is PCM audio.
+-        // AC3 is always wrapped in iec61937 (ffmpeg "spdif"), while DTS
+-        // may be just padded.
+-        const AVInputFormat* iformat2 = av_find_input_format("spdif");
+-
+-        if (iformat2 && iformat2->read_probe(&pd) > AVPROBE_SCORE_MAX / 4)
+-        {
+-          iformat = iformat2;
+-        }
+-        else
+-        {
+-          // not spdif or no spdif demuxer, try dts
+-          iformat2 = av_find_input_format("dts");
+-
+-          if (iformat2 && iformat2->read_probe(&pd) > AVPROBE_SCORE_MAX / 4)
+-          {
+-            iformat = iformat2;
+-          }
+-          else if (trySPDIFonly)
+-          {
+-            // not dts either, return false in case we were explicitly
+-            // requested to only check for S/PDIF padded compressed audio
+-            Log(LOGLEVEL_DEBUG, "%s - not spdif or dts file, falling back", __FUNCTION__);
+-            return false;
+-          }
+-        }
+-      }
+-    }
++    av_probe_input_buffer(m_ioContext, &iformat, strFile.c_str(), NULL, 0, 0);
+ 
+     if (!iformat)
+     {
+@@ -1535,7 +1468,7 @@ bool FFmpegStream::SeekTime(double time, bool backwards, double* startpts)
+ 
+     if (ret >= 0)
+     {
+-      if (m_pFormatContext->iformat->read_seek)
++      if (!(m_pFormatContext->iformat->flags & AVFMT_NOTIMESTAMPS))
+         m_seekToKeyFrame = true;
+ 
+         m_currentPts = STREAM_NOPTS_VALUE;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
