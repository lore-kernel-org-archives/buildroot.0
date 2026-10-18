Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC10CCF2CA
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A0560727;
	Sun, 18 Oct 2026 20:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYPVmG0U0wgn; Sun, 18 Oct 2026 20:03:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63A41606FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792353806;
	b=nEVYxz5aMFpStHlDEzUMXPPWZ54kdadade4lKwL55oVAwH5ftYMGsDC2lVQjpPgERO36
	 0i/o4CXCGvDTxlcnxTvSooNlOIN0WtPCqgvRJOeYPe8Soy17jRAbFhEenP4FJUrNQtSVL
	 a28nE8uXasgYzoAYhcu3/cHillOJe1WdjgOsQOMiW9lyNTeXz3rGYCnZQ/lCO3Ec1tK9b
	 HyU0upnlu3t3AO31Ou2IEgNDyaWn1BOb8uOh4UFi4ToMxRDPReUK/4u1vA7wUQwHpS0r4
	 b30G4dBPPfRyfAYbe8DICcGH99KIgQx/Tck1pmSLsosZ6lMXyZ89hqN1zY/MF5rCKxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792353806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nYC0MYuJw16Y3uNoRVV5jTstsgHV7+CRLj4n3W28p+c=;
	b=hjlafplzhR1EZD9zh3ce9mnf9NwSN2iIaAkHTIgJm1bR/zmQXb8511rFfD50aBs/6e73
	 q5OoCPbQGEdNYcfhh58rlbkohpEvF9GBTlxuZC1Yc/NxedeUYonAM+YCg2yDn4DP0eO83
	 c1sMI1FjDXXRGQTbNad0zLTW9MPI1agjSnZxASU/5dfBchzsrc6T3evX76EyeqrgIomdw
	 1NEAQwIOzXpu7Xq4m40VowJwm/nuQxOnOTuAgQ1KPek27vGP5TGzq7l/miWNKd/i8x3x9
	 UndchP+WfqjUxr0B0Lr6t8mIj7NFz4XBBvzhyPJnnHalYmDixmeIESAU60ftb6AIKiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792353806;
	bh=nYC0MYuJw16Y3uNoRVV5jTstsgHV7+CRLj4n3W28p+c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IajBKxVhGnUUWqGCCRZrAEw7EiydobGPUM75biHTTJ7NW4FyxSacIaUvqplMnVGVG
	 YvvuTiWbW6npAh2Zn5vUx9jT4Ege/0AfJiKbbB7SwtARB1YOc3iPIYMWxOYZV3geyu
	 nRHEFMt/jpmMcjVuwgtkt7Q/guaoLMd7L0B1ZMqCS8L99npCgeH/GL4hgvAWwqWupt
	 sBiqyn5Di3xJeGeFvzY57LbePN4oEwnPosxlqnhNVrMwiGi+c1uffjWRe6lHlBlGOH
	 zvr2FqZiSCMCWwNwHusTxS97t2gG+Ax1tVU9uwAJqlbob5bliKKBelhqLRkWt9zFxc
	 3h09RfHJknV+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A41606FD;
	Sun, 18 Oct 2026 20:03:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A1D1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B021406CA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45rXmn8ipEpd for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FC6B406D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792353800;
 b=KgKpF3BF81M3fUxSkvsWO1451QkRrCy6luwch3HewfFiOcbpiyyo4NrzgzQuZVZ8XajA
 IhcsRsOnnDybupeTOulg+kreU4wJBaqKmq+M1V0cQbb8z0ZE/DSEMBgotugUP3Q2XEdtr
 nlg34W9L1AB7csTfoDSVba4qtXp2V0iXQtt4cU68+tLx1AL6tnI0GP3ZYWlUWuTP9b8/H
 9Fwg9UZqLbO+LK0J3f1kDmi3UdzI+gQLGiVWoFGB5t9TacjLplp+AwpuJFQxkykAlx6DK
 UC7FrCU9cwIsUy09Zv2nUfXnTb+dysstrEwyH/lT9tgcfn6a+bp6lhjFA+rApbMyLqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792353800;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9TJVc2qo7B9o2LFQAJTeQMRBw39JhOa8GebCOjq+iAc=;
 b=YUCvAouQRigWTWP6Cbg4igkfjViH1peQd/tsQQSMs3XjOT3wJrahtn5DAX+7yMi/uUNF
 5+1C5G8v4/QfjqSlW95WNq4lBh+ysKlF3zfnlaFWioDZMGO9I+EZDtdadbfe3Qn36h79Z
 SJcp4YwJ0V7RW8FgZzAFBdPQCk59Insf+Ic6v5egqLUwL+B5ZIK0dwjwDuvBEGiybAVg0
 IfzYSQHB7D78hCh46/b6N6LNuG1EnaEG1Za6J/jgCw01zRIJEg53jXrzJFQJN1+p+i45M
 xRScAqOM9ezWtreOOhUmN3aH3LfYtpna9IeGfYYZWN5fATDgOtfvSIzhdTm2aEs3f+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FC6B406D4
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 373D3983EB; Sun, 18 Oct 2026 20:01:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:03:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1ceeaeb6df0cd0afa10aa08092d050f908a5c9
X-Git-Newrev: c4528935750831b19b092d86c3823de6570ce43c
X-Patchwork-Hint: ignore
Message-Id: <20261018200158.373D3983EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect: fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4528935750831b19b092d86c3823de6570ce43c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Update-to-7.1.patch                       | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
