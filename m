Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A0CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478AF60681;
	Tue, 13 Oct 2026 21:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AOi7vkt6w9f; Tue, 13 Oct 2026 21:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F7456089E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928279;
	b=CJoTUUUrSKsKdemEFNgom/D6cqeU1zkP9BahwIBZlDEG1Sm3BQzA5cYxGPpzO4oytotC
	 9eV3MobwHDKk90xg+BRoziDnI2qCnAk2yYUsMWuluDPM9iTeMdK7Qx0ytERnG0ew8cCz3
	 7D8l0mUmaYg/8pLNtF9d9A4gYRMrTybOJqjPN+ylkCZ0XV61lMg74qH9lV+y82GFwEHNw
	 qsG4zzwVxCcxO7sGRWmYhSuoeWeBT6516SHP4fcp1YAkKZVWoDxIDeqF4Jfr5uAaDrx8P
	 hqVVJPXA5JrC34CeEj0A7Ezrt2hV3KCRxcIqOSwrLpyfAmeb3P6P2cneugmP7pjZN5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lkHJdpZT8rvpDC+X4E3Oy+qwxrQ7RZD7kxCWVlaAr24=;
	b=Hwi8ClS2Z/723EmJJXxRSrZy86RC42/n3p00QdmtVy+iQTOOJc/ys5tIM1grBG5H3as6
	 OBxV0ZB0bwfZKw20dtkhnskqHJn0APdf78GmWllFpL1RCytl2DcIGJ/nowdwzyAcAPRjp
	 lq7v4Q56YiBymdmFnsfJdz/sZCxIvdn5bXd6x8Ga/v57bOFO/NlXlOG0qet0qH2m8OxHe
	 HJu+T+MfqKqd5tvrqTZOTCaaUXIUKc2Edhb7MDHKWAt+dlK9GXhQN1CGE/n21sQ0uM9xj
	 pabQMJhq+k+/VbGyoZtDDTqMeRwoGSC1+tYmuSimehs4b2mGX8sLMW0QC1xOdECV0Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928279;
	bh=lkHJdpZT8rvpDC+X4E3Oy+qwxrQ7RZD7kxCWVlaAr24=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snEoKiPYevTe3MziPBsmSnl+OFM5nCO2A0ZWUPfqLheTAvlmqORofydkHNZf1l7Vg
	 rusbiQLAV/gx5lQQ/OzwQKJR0Da1BPvXpTSI8f2SBh9CFCZ23w0webUfJ81smlaqtg
	 zSA9l3REIrEB6lJTKOWWqELBKs7BMC5YzNzOPacfinBvF4emf6C7ULEVD+rPLvpO5S
	 snILvbCrnduZm1S8G5YnHqzqGzbopYcQzSYPPeGHeoTz/A2B2JEHIQG3FZfC0+vrW0
	 2CB1sMgebHk+W5K6OHQEQQ/mg0+TTO6gDSJQD3fWvrnaTp54FoTG9u8fjpBHWOGmJi
	 r66+MGg7NcMrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7456089E;
	Tue, 13 Oct 2026 21:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA42235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D6AF809F6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv9yJtYJrd9D for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:51:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C7E9809EC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928277;
 b=A4P2JpETuyW+Q9Q0gCNe10zNoZPkSxVuuvrnRYcPJuZv9+8hyrzhPHBStluUrzxBe8Sz
 X6fJx5RhZ8+LjaiHK/CUAmirNLew7yC5Lr5+mZ8AS/JDM0w4WGCUtKyDymfLk98NDcDcI
 v9dap2tE2JYlzuR0M/qSWno+n04K5I9qZzmdBN3yU75t2kACXq/lpTKpzFQC3ifxLaIxn
 07uDj2igZyiPrbdS4G5kZj9XDw+idXsRdLDyMn0Gzk4/lCo9HIBla0NaEOBQrxKouYd3f
 wem3nO5c/APvbDrwgdhc9cF9eyroc9SnVUrlpMTebxYexnNbh8gQaeoLXvWW7nMwA7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928277;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0VZvWJB63IazXVY8X97JkvXrRSDKtxUZkzhDLGkJGLA=;
 b=q/iGM6naOwFCF2MfrxnuTp6MTESh7BbKVqtp6bEzcEvE1l4puW3RvyN1wcullaf8pUFM
 x/OjJXYL1caRpE/hzPKVCCTY+Q3pOIv1VYP4eOpgCuWBhlaX864ONMvScVthucjXkbnY5
 5rO3AMPA6dsDlPj0NdMroPc2Rhomc4uAY9hmN/x5wumrubs7gDDeLa9+lA3IbymQ0EYUo
 JF1dhlQrmv4XJoO81w6Y74XcF+HsOq15kxbDmkEA1o4C8NCWNRauxxWBsN1fZzwrIMIPu
 Qi5nBkmwGacgQup4MUYbptaHlq3uoxsbKHYrZ4jdryoiaSpn55JgtxnB40tgVGdtGFA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iwjUYEbM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iwjUYEbM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C7E9809EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928232;
 bh=0VZvWJB63IazXVY8X97JkvXrRSDKtxUZkzhDLGkJGLA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=iwjUYEbMyllx81DyCYjkFrj3p3L0OxOd1z2PC4tpwkhciOy+/nf8Q8T/NTCmNOCFB
 Nndmsi1uZEo+zxp1gwB3CixbTsVa9LH/fpRtm36WenLF4E/kOH/Dx0ZQKEPGrBVDJ8
 P0N+THRSd0/Co1teuO5LVQPk5q26ym0keM6Hja+0PJyk5cMS4ePd1mzj36aR168XZk
 DwDgTdRB/LlmlVpI8mV4jovecY/jRvzPiZVfwzrjPvvacELmtUo20T6SlTU/RjuEsu
 KvDb4gpH8BWwYN8RarZNIHvc6FjPYknxawj7Z9c7vuqfdn4qZ9bslRpzS5Y+2Juz+u
 QrdBzDmlS+7SQ==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 95Im1hNsm6pVx4n5aQeNTNZjAJ4p1fC4jjeJ0UNk+07Ir1hszYJxlNsB30j7v9NGx+tMo6yJ2eK
 hVuVudJOpkb6LpR/IKb+FR0cZ5d7XRgzbE8ia5ehXZd35pv1AtEoFqeJhGEeXuFz6CM93S3Me72
 2D8ASN0d9r2El1jOsensuah6TqnoIV7k/6d6jOKJQZWFUOZrVcfI0Qsa7EyS99Iwg01XvfNQ8kO
 jQiAUXkY+FNbIjTOzaGYaNnA4czXGgUp/TigHBx0hpZbT4/GmNx/uXGO2AHKcIt7lqLnaQ4Q0mr
 R+lA/OMi45GBMbn5gUBX+yHmBmuDgKZP4gvN/na+khfnj5/M8QYMhyds6e+aofABJnrnzfDB5E9
 nkHhZa8yRgKyp95ejiFFh+OTvE3gzazMS/vRu3FHcMjYtyv4fA70ZK2Z2XI8yUXDt6rR2KL0Zpg
 jPU9BpJ8JynFCxlNKy48RHjMN084CCxk1qEW5R5/DUws5B2vXI4PeE6DmqUplx2KQU1+BdpX3+V
 1xV6E2X5R48Bg+AnvRGu65Bq7OgS3tjLwU4eRH8VizueP1UKDbUccWgO442IQynk1NyE83Z4Lei
 ImDt
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76BF7A4C59AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:50:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37044)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkOF-000000001g9-3rRY
 for buildroot@buildroot.org; Tue, 13 Oct 2026 21:50:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:50:28 +0200
Message-ID: <20261013215029.317512-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013215029.317512-1-bernd@kuhls.net>
References: <20261013215029.317512-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 4/5] package/kodi-inputstream-ffmpegdirect: Fix
 build with ffmpeg-7.0
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
