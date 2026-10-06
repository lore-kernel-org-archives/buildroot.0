Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F97CA6006
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D3F340655;
	Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaR1KjDnsNxK; Tue,  6 Oct 2026 16:29:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 66D6040634
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304188;
	b=Am3U53P0I69RYy2wpW3YbJ0E6r5PHsbY8KP4WaNd3jRnoveffDTBtCX2BP6Dw1xGDnl8
	 tOAkqujfuNFRhRY0tZxBe2fEV7wHKfo74xKVMWwiI5fPzGKubdFrlmoVgMP/HYj35pbn4
	 YIVobXYQBIgntjCeEpzrMQ4hTcrxozClgneWTORJxgWHgU8v7tJ/SfQtau1feD7oZXvUx
	 UnIwZHRKgDcUpqKBeUMfxLXV8VDmQfri6h+yFMep1Zg1MqwMjUzHhs2X+3rh5duKgx2Xx
	 hbRbVtJ51oNAYoyy/cPMFFqVSOOgiACgRfpVvecRBAuDtFjohOxfHSG0/9hQ2zwP4wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ihzomWD0YEfXveqTvWHVDQ/pFID/axAEkYGVrIG2BCQ=;
	b=ov3lHuu9zzAfJwhUF9Yh2mKRUWLsxbOZvRQyxJbOITJtjeJS9FwNpz8riTqIHskG8uP6
	 ut8nabSzQyX/lPCLxhH1YIxhMNNq0XiW9y8lg/qMbdma1C+mWL9iG7D2wllFzPUeAtl85
	 j+nFb9yv29+q3Aj8N4G1/0RoaH1R+YHnFokiTshwP3mkIQdxKVql/z8z6fqaX/PPtVqz/
	 ZBDm6h50syeqBBed3xZo/0fJdEygQFqCp2w8sRxsWG1JK3J8FHqKrQs9OlxW55KjVJ3tZ
	 YLhR1FtcOKRBtmtpa32IcHrJ4nY6lZmvwxD9/6zEZu45rITnoWNGDj4EUvs707BWy5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jrWnDRnx;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304188;
	bh=ihzomWD0YEfXveqTvWHVDQ/pFID/axAEkYGVrIG2BCQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgvDfn8CCMx4dlynUzQwdpkrtA1Ic9ZButzsVK+hcGMyvr/4Rd3n3hlfJhaeIUtIp
	 5JxpEtgmdfSn/NoNwpGarCuPCf5IkcIollIhSmgKZc3hQRYqqtoqgTP7AWvPkUiK+a
	 5dQydLY2zEoXMYMGJOHuy+GKW1z/KVDoxhF8y4sXX+ihF65EOfE7GtXvIYxFAggWE7
	 IeR020ox/JRGjGF5yO0DAd9V+t+YKkbZ8iqjb+AOdaTFuoozz5BJ9JUjmaqSg41bLX
	 e3oXTiJDImojcn8J/SEdNQFgzBwI791lF+AcD4k4iXS+DN3TqNsb80Fz1r/IgEh8/y
	 wFLFBNrgcXuYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D6040634;
	Tue,  6 Oct 2026 16:29:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA6334E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 115B2403D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-XW3PKxZxCZ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:23:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 08054405B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303810;
 b=R+gYuEX3qdE4OGbhMLtnX7OSSV7u65pJp7/+WOu4jUsIK5QYdARBo+1RNtEZQBbCSH4l
 DeRK1DWKOwJXjqwn/d3hrdSC/hiXB4CMCkRmxR64m9WJ1St55llWNft79N4ACiEg9kVwy
 4T2HlwG6SqlaO1vc2alemCS0jYWIu0pfi5RNqc3zm4F7+m0Bb1rs7cr60fy3oR/iYGABr
 wr+h7k5JfP3dxcA2nrEYY0sasCDe7QnjVWXebKBzxtv5/Wqo2Yk8YU++vT7TDav+q3W2O
 +zPrvAtzcfZnarM/b9lUOrHJdipoIwyPLb7KYCn2BbGYkU7objp+xFVAnqwuLgVTgUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303810;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yRbovnMwhLS9udHfvj6isLeHMLlqNlLiTxYDNuI5qeE=;
 b=Rbm1TfP7z10VrtQJV3eAHnzSZOKfIW0Chzcke3rrkveMt76ehuZWSVUM5Wu//Cg+K95r
 g0I1RSxZvqTB3fkZnmE239ziA8SXp6q+z3o2Rpq5ywBUnNk0ezaaEZYNw4dDMFm+oQRdJ
 dF/ZjNzwiKn+LtLwHPz5mWVbbhgzhDLw97j+YlMF9kgCULs+PB0gT15S6+JrEOW3N8f1t
 qshB7GNNnMheQxCt7ZQdvNYuPse92J/LY9G9kHPv9hKy+eX3ocY2GL3lGrSvHiMmJsBrX
 NaAZGAZvqLe3u3sbyz3sLSpNU0fe5SlK1GKrdGooL04PhYFrzZp/Iumyd+5CHIKKRjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jrWnDRnx; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jrWnDRnx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08054405B3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303702;
 bh=yRbovnMwhLS9udHfvj6isLeHMLlqNlLiTxYDNuI5qeE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jrWnDRnxCTiwxa9XeHV2iMXJeZnVu4NiHVpSp20xMD9jYUpeiAtBMGTzljPx6TYoZ
 bZ5xGHNJutMB4jwVrXdJ0wD5yYE4+2HXCTWyB+YR6FPWVNHFClIwE0Ztd6obl/boT8
 ssJMSmX6MQa3YuJkNydxpmMxjXCEu2ejjCYjCLNhjLemEc/qQ2qht8iG3lWx98TD2Z
 bGoKd+Kbi91/+JbYxzYQaI4aHIG16HaCyb8JigsN67W5lQWLKLobFqrkHPfUl8yYIO
 D3LSYXonxc6gsAbPcYX6DiAUfWrUHyc4mOQZSlrdUsOXokxy8x9p0PzU5k9uspBFRt
 ZM8EOpPgYQ+XQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 BAvEw6TDSXuhO4hG+nQ/Xp1FucU6vMoRRR6/0vug0SxuRsU6NfHTaKqLrbZ/rJ+hF/PP3zx5+HQ
 17sA3FdEiYXSfbttOc38tfg/kcEeJdDfRwdmLnxfggee40QaoxyWt0oF+7P6JdZcnU+lnb4Ca7N
 fUMQTZiQvhMFoQJH6Thdor0UsG97TorEt3CKFVYJGzT6ppGcx3ndi9bqQw3rZ+wo3dEVBJPUm3/
 zwus3d990dJm8+5sFGK85KpDP4t14K/0WW6xisv8h7HQZ7f7f9ibgqhx8vASHSo0q7u8hl6BXDl
 aggU3RjyXGhvqT0Zlixq3v7LuPbc4zCRyccsGi0Di4gAqaO0K+/SFQBdHROATdVRf54mD3agk8N
 A0t9KLcwTWnTu9bcZ2LORmqBuiJsLzCfGyo31+u3SjmlXEIWF2xoa+1zGDCfh+b+q51u546YkJG
 JOqmVWc1yaq3pLX2G9vbHQy9gzBzhn0eOeH5vPVuXpKwfDMxkk98Czo2dPdkv63zTeCtb94IPtK
 Z6yZjm93jHQhHEc7gMpGe24r0oHQQTDzpPbc/SB3kiey8oq63cwbNNO8AFHj/kM6MmhkFVm7ahK
 bRV/C3w=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 829D3A4C432D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uo-000000000ir-24Dx
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:41 +0200
Message-ID: <20261006162106.3439373-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 60/84] package/shairport-sync: fix build with
 ffmpeg 9.x
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
 ...lution-code-1-to-be-multithreaded-2-.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/shairport-sync/0001-Update-the-convolution-code-1-to-be-multithreaded-2-.patch

diff --git a/package/shairport-sync/0001-Update-the-convolution-code-1-to-be-multithreaded-2-.patch b/package/shairport-sync/0001-Update-the-convolution-code-1-to-be-multithreaded-2-.patch
new file mode 100644
index 0000000000..9c3e4bbdf8
--- /dev/null
+++ b/package/shairport-sync/0001-Update-the-convolution-code-1-to-be-multithreaded-2-.patch
@@ -0,0 +1,76 @@
+From db8b65c01c60c5666f674ff9e1a30cca0f62d89d Mon Sep 17 00:00:00 2001
+From: Mike Brady <4265913+mikebrady@users.noreply.github.com>
+Date: Mon, 13 Oct 2025 13:26:20 +0100
+Subject: [PATCH] Update the convolution code: (1) to be multithreaded, (2) to
+ work on multichannel audio and (3) to work on 48k and 44.1k audio.
+
+    Allow multiple impulse response (IR) files with a new setting: "convolution_ir_files"
+    When convolution starts, Shairport Sync will look for an IR file with a sample rate
+    matching the input (44.1k or 48k) and channel count.
+    If one can't be found, it will look for a single-channel IR file with the same rate.
+    It will always choose the first match in the file list supplied "convolution_ir_files".
+
+    Allow multithreading -- use the "convolution_thread_pool_size" to set the number of threads to use.
+
+    Deprecate "convolution" -- use "convolution_enabled" instead.
+    Deprecate "convolution_max_length" -- use "convolution_max_length_in_seconds" instead.
+    Deprecate "convolution_ir_file" -- use "convolution_ir_files" instead.
+    Update corresponding D-Bus methods and properties.
+
+Update the loudness code to work on 48k and well as 44.1k audio and with multichannel audio.
+
+    Deprecate "loudness" -- use "loudness_enabled" instead.
+    Update corresponding D-Bus methods and properties.
+
+Fix a deprecated FFmpeg warning.
+
+Update HiFi-LoFi FFT convolver to latest available.
+
+Upstream: https://github.com/mikebrady/shairport-sync/commit/d043f983305042035966a38e88fcce0236eb3bb4
+
+[Bernd: backported ffmpeg 9.x fix to 4.3.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ shairport.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/shairport.c b/shairport.c
+index 87ac0ea7..6c19c314 100644
+--- a/shairport.c
++++ b/shairport.c
+@@ -160,12 +160,27 @@ int has_fltp_capable_aac_decoder(void) {
+   int has_capability = 0;
+   const AVCodec *codec = avcodec_find_decoder(AV_CODEC_ID_AAC);
+   if (codec != NULL) {
+-    const enum AVSampleFormat *p = codec->sample_fmts;
+-    if (p != NULL) {
+-      while ((has_capability == 0) && (*p != AV_SAMPLE_FMT_NONE)) {
+-        if (*p == AV_SAMPLE_FMT_FLTP)
++
++    const enum AVSampleFormat *formats = NULL;
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++    // New API (FFmpeg 7.1+) for getting formats
++    debug(3, "getting sample formats the new way");
++    int format_count = 0;
++    if ((avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_SAMPLE_FORMAT, 0,
++                                      (const void **)&formats, &format_count) < 0) ||
++        (format_count == 0))
++      formats = NULL; // not clear if the returned pointer is nulled on error or on zero items
++#else
++    debug(3, "getting sample formats the old way");
++    // older API
++    formats = codec->sample_fmts;
++#endif
++
++    if (formats != NULL) {
++      while ((has_capability == 0) && (*formats != AV_SAMPLE_FMT_NONE)) {
++        if (*formats == AV_SAMPLE_FMT_FLTP)
+           has_capability = 1;
+-        p++;
++        formats++;
+       }
+     }
+   }
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
