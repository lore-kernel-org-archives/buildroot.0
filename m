Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC857C44501
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 11:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98BD40FA3;
	Thu,  9 Jul 2026 11:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELSn7GT2D-zp; Thu,  9 Jul 2026 11:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D629B40F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783595351;
	bh=ZW3dN61/Za0mnq79Vx3OJQMcf4QdrxIUFub/rN9CTIc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1CNg6F0hNwPp0E8mg3xGFpVKTXyvtpmU3dENGS+3UDDqVLJusTL4z/CpFvx7vCPL
	 GAY6Wz/no2xjPGyFsBjxRSm2Z8/MHrkbJ4GhkFImLTEvM5Uv0pRfQXi7IWJYpFwv6Y
	 fHF22fpBNWhAzl7hZ0CuP3YQnPqXCkTMyGUfX/DAbzat4BoCk9WTIY671EIW2O17eW
	 HL3Ntn1BS6kI/wtEBCoRiamdPqDZM8numY+JDOA8TyS/Rk8aGvHbmObL/Cn+TjGTKj
	 8tm+dGBWABX2ipZjFtn6+AClPee7HmjxfVOtPx++lM/QuzbGZ6p9RC21ZZinkhlW95
	 RZ+e2NuV+azkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D629B40F94;
	Thu,  9 Jul 2026 11:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D69A2E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F6AE4078F
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87XD_L0za8gC for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 11:09:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AF0A4078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF0A4078C
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AF0A4078C
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:04 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id E8CA3BDE6313;
 Thu, 09 Jul 2026 13:09:01 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 13:08:07 +0200
Message-ID: <20260709110822.305873-4-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709110822.305873-1-br025@umbiko.net>
References: <20260709110822.305873-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783595342; bh=Gg+NQs+OiLo6WZl09SHDxtg9tX3fVE8cknab7ttKEKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=4Gnhow0IIhmP0shvI+1EUQ0K4sNeHjiaOtK3x5VXlyT+68WrWieeLfozxZa1vRYKB
 YD/T1fDMJ2FN3P0n+7oGJ5KY5CjVoEmuJqoD4L1sR+pUhI6PnGQFKfhGiwDcUvEHlA
 zYn7rBoh7HmBBJdgvpFqSh4c0DTH22CcsCvxR+24=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=4Gnhow0I
Subject: [Buildroot] [PATCH v2 03/11] package/mpd: reorder config items
 based on order in meson_options.txt
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

MPD has 99 configurable options; of these, 44 are exposed in Buildroot's
Config.in. Sort order and grouping of these options are different within
the MPD project and Buildroot, which makes a comparison difficult.

Reorder entries in Config.in to reflect their order in meson_options.txt.
Also update at least some of the help texts to more closely resemble what
is published in the MPD manual.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/Config.in | 345 +++++++++++++++++++++++-------------------
 1 file changed, 187 insertions(+), 158 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e0ee7fa533..9c3db26783 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -20,26 +20,148 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
-comment "Archive plugins"
+# linux kernel features
 
-config BR2_PACKAGE_MPD_BZIP2
-	bool "bzip2"
-	select BR2_PACKAGE_BZIP2
+config BR2_PACKAGE_MPD_IO_URING
+	bool "io_uring"
+	select BR2_PACKAGE_LIBURING
 	help
-	  Enable bzip2 archive support.
+	  Asynchronous I/O using kernel io_uring subsystem
 
-config BR2_PACKAGE_MPD_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_SQLITE
+comment "Network support"
+
+config BR2_PACKAGE_MPD_TCP
+	bool "tcp sockets"
+	default y
 	help
-	  Enable sqlite database support.
-	  If you don't use sqlite it will use an ASCII database.
+	  Enable MPD to listen on tcp sockets.
 
-config BR2_PACKAGE_MPD_ZZIP
-	bool "zzip"
-	select BR2_PACKAGE_ZZIPLIB
+	  You want this on if MPD and the client(s) work
+	  on different machines (the usual scenario).
+
+comment "Audio formats"
+
+config BR2_PACKAGE_MPD_DSD
+	bool "dsd"
+	help
+	  Enable DSD audio support.
+
+comment "Database plugins"
+
+choice
+	prompt "UPnP"
+	default BR2_PACKAGE_MPD_UPNP_PUPNP if BR2_PACKAGE_MPD_UPNP # legacy
+	default BR2_PACKAGE_MPD_UPNP_DISABLED
+	help
+	  Enable MPD to access a UPnP based media server.
+
+	  For further information, see
+	  https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-or-mpdupnp.html
+
+config BR2_PACKAGE_MPD_UPNP_PUPNP
+	bool "pupnp"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_MPD_CURL
+	help
+	  Provides UPnP database access through libupnp
+	  (the legacy Portable SDK for UPnP devices).
+
+	  Introduces least additional dependencies.
+
+config BR2_PACKAGE_MPD_UPNP_NPUPNP
+	bool "npupnp"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBNPUPNP
+	select BR2_PACKAGE_MPD_CURL
+	help
+	  Provides UPnP database access through libnpupnp
+	  (a C++ reimplementation of the Portable UPnP library).
+
+	  This implementation is more modern, but also brings
+	  additional features not needed in this context, thus
+	  consuming more space.
+
+config BR2_PACKAGE_MPD_UPNP_DISABLED
+	bool "disabled"
+	help
+	  No UPnP client functionality.
+
+endchoice
+
+config BR2_PACKAGE_MPD_LIBMPDCLIENT
+	bool "libmpdclient"
+	select BR2_PACKAGE_MPD_TCP
+	select BR2_PACKAGE_LIBMPDCLIENT
+	help
+	  Enable support for the proxy database plugin. Provides
+	  access to the database of another MPD instance.
+
+if  BR2_PACKAGE_MPD_LIBSMBCLIENT || \
+	BR2_PACKAGE_MPD_UPNP_PUPNP || \
+	BR2_PACKAGE_MPD_UPNP_NPUPNP
+
+comment "Neighbour plugins"
+
+config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
+	bool "neighbor discovery support"
+	help
+	  Enable support for neighbor discovery.
+	  This option can be used in conjunction with the smbclient
+	  plugin to provide a list of SMB/CIFS servers or with the
+	  UPnP plugin to provide a list of UPnP servers on the local
+	  network. The neighbor plugin needs configuration in
+	  mpd.conf. For further information take a look at the MPD
+	  documentation.
+
+endif
+
+# Storage plugins not configurable, are disabled by default
+# Playlist plugins not configurable, are enabled by default
+
+comment "Input plugins"
+
+config BR2_PACKAGE_MPD_CDIO_PARANOIA
+	bool "cdio-paranoia"
+	select BR2_PACKAGE_LIBCDIO_PARANOIA
+	help
+	  Play audio CDs using cdio-paranoia.
+
+config BR2_PACKAGE_MPD_CURL
+	bool "curl"
+	select BR2_PACKAGE_MPD_TCP
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Open remote files or streams over HTTP using libcurl.
+
+config BR2_PACKAGE_MPD_LIBMMS
+	bool "mms"
+	select BR2_PACKAGE_LIBMMS
 	help
-	  Enable ZIP archive support.
+	  Play streams with the MMS protocol using libmms.
+
+config BR2_PACKAGE_MPD_LIBNFS
+	bool "nfs"
+	select BR2_PACKAGE_LIBNFS
+	help
+	  Allow MPD to access files on NFS servers without actually
+	  mounting them (i.e. with libnfs in userspace, without help
+	  from the kernel's VFS layer).
+
+config BR2_PACKAGE_MPD_LIBSMBCLIENT
+	bool "samba"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_SAMBA4
+	help
+	  Allows MPD to access files on SMB/CIFS servers
+	  (e.g. Samba or Microsoft Windows).
+
+comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 comment "Commercial services"
 
@@ -52,30 +174,29 @@ config BR2_PACKAGE_MPD_QOBUZ
 	help
 	  Play songs from the commercial streaming service Qobuz.
 
-comment "Converter plugins"
+comment "Archive plugins"
 
-config BR2_PACKAGE_MPD_LIBSAMPLERATE
-	bool "libsamplerate"
-	select BR2_PACKAGE_LIBSAMPLERATE
+config BR2_PACKAGE_MPD_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
 	help
-	  Enable libsamplerate input support.
-	  Select this for software sample rate conversion.
+	  Allows to load single bzip2 compressed files using libbz2.
 
-config BR2_PACKAGE_MPD_LIBSOXR
-	bool "libsoxr"
-	select BR2_PACKAGE_LIBSOXR
+config BR2_PACKAGE_MPD_ZZIP
+	bool "zzip"
+	select BR2_PACKAGE_ZZIPLIB
 	help
-	  Enable libsoxr resampler support.
-	  The SoX Resampler library performs software sample-rate
-	  conversion.
+	  Allows to load music files from ZIP archives using zziplib.
 
-comment "Decoder plugins"
+comment "Tag plugins"
 
-config BR2_PACKAGE_MPD_DSD
-	bool "dsd"
+config BR2_PACKAGE_MPD_ID3TAG
+	bool "id3tag"
+	select BR2_PACKAGE_LIBID3TAG
 	help
-	  Enable Digital Speech Decoder (DSD) support to play audio
-	  files encoded in a digital speech format.
+	  Enable ID3 support.
+
+comment "Decoder plugins"
 
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
@@ -110,13 +231,6 @@ config BR2_PACKAGE_MPD_FLUIDSYNTH
 comment "fluidsynth support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_MPD_LIBSNDFILE
-	bool "libsndfile"
-	select BR2_PACKAGE_LIBSNDFILE
-	help
-	  Enable libsndfile input/streaming support.
-	  Select this if you want to play back WAV files.
-
 config BR2_PACKAGE_MPD_MAD
 	bool "mad"
 	default y
@@ -154,6 +268,13 @@ config BR2_PACKAGE_MPD_SIDPLAY
 	help
 	  Enable C64 SID support.
 
+config BR2_PACKAGE_MPD_LIBSNDFILE
+	bool "sndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enable libsndfile input/streaming support.
+	  Select this if you want to play back WAV files.
+
 config BR2_PACKAGE_MPD_TREMOR
 	bool "tremor"
 	depends on !BR2_PACKAGE_MPD_VORBIS
@@ -182,58 +303,39 @@ config BR2_PACKAGE_MPD_WAVPACK
 
 comment "Encoder plugins"
 
+comment "for ogg/vorbis encoding enable vorbis decoder"
+	depends on ! BR2_PACKAGE_MPD_VORBIS
+
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
 	select BR2_PACKAGE_LAME
 	help
-	  Enable lame (mp3) encoding support.
+	  Encodes into MP3 using the LAME library.
 
 config BR2_PACKAGE_MPD_TWOLAME
 	bool "twolame"
 	select BR2_PACKAGE_TWOLAME
 	help
-	  Enable TwoLAME mp2 encoding.
+	  Encodes into MP2 using the TwoLAME library.
 
-comment "Input plugins"
+comment "Filter plugins"
 
-config BR2_PACKAGE_MPD_CDIO_PARANOIA
-	bool "cdio-paranoia"
-	select BR2_PACKAGE_LIBCDIO_PARANOIA
-	help
-	  Enable cdio-paranoia support.
-
-config BR2_PACKAGE_MPD_CURL
-	bool "curl"
-	select BR2_PACKAGE_MPD_TCP
-	select BR2_PACKAGE_LIBCURL
+config BR2_PACKAGE_MPD_LIBSAMPLERATE
+	bool "libsamplerate"
+	select BR2_PACKAGE_LIBSAMPLERATE
 	help
-	  Enable curl streaming (http) support.
+	  libsamplerate (also known as Secret Rabbit Code) is a library
+	  for performing sample rate conversion of audio data.
 
-config BR2_PACKAGE_MPD_LIBMMS
-	bool "mms"
-	select BR2_PACKAGE_LIBMMS
-	help
-	  Enable MMS support.
+	  https://libsndfile.github.io/libsamplerate
 
-config BR2_PACKAGE_MPD_LIBNFS
-	bool "nfs"
-	select BR2_PACKAGE_LIBNFS
+config BR2_PACKAGE_MPD_LIBSOXR
+	bool "libsoxr"
+	select BR2_PACKAGE_LIBSOXR
 	help
-	  Enable Network File System (NFS) support.
-
-comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	  High quality, one-dimensional sample-rate conversion library.
 
-config BR2_PACKAGE_MPD_LIBSMBCLIENT
-	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_SAMBA4
-	help
-	  Enable Samba support.
+	  https://sourceforge.net/p/soxr/wiki/Home
 
 comment "Output plugins"
 
@@ -305,7 +407,16 @@ config BR2_PACKAGE_MPD_SHOUTCAST
 	help
 	  Enable shoutcast streaming output support.
 
-comment "Miscellaneous plugins"
+comment "Miscellaneous libraries"
+
+config BR2_PACKAGE_MPD_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Select this to enable the sticker database.
+
+	  Stickers are pieces of information attached to songs. Some
+	  clients use them to store ratings and other volatile data.
 
 config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	bool "avahi (zeroconf) support"
@@ -315,6 +426,7 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	help
 	  Enable Avahi (zeroconf) support.
+
 	  Select this for multicast DNS/DNS-SD service discovery
 	  support. This allows MPD to publish service information on a
 	  local network.
@@ -322,89 +434,6 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_MPD_IO_URING
-	bool "io_uring"
-	select BR2_PACKAGE_LIBURING
-	help
-	  Asynchronous I/O using kernel io_uring subsystem
-
-config BR2_PACKAGE_MPD_LIBMPDCLIENT
-	bool "libmpdclient"
-	select BR2_PACKAGE_MPD_TCP
-	select BR2_PACKAGE_LIBMPDCLIENT
-	help
-	  Enable libmpdclient support.
-
-config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
-	bool "neighbor discovery support"
-	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || !BR2_PACKAGE_MPD_UPNP_DISABLED
-	help
-	  Enable support for neighbor discovery.
-	  This option can be used in conjunction with the smbclient
-	  plugin to provide a list of SMB/CIFS servers or with the
-	  UPnP plugin to provide a list of UPnP servers on the local
-	  network. The neighbor plugin needs configuration in
-	  mpd.conf. For further information take a look at the MPD
-	  documentation.
-
-config BR2_PACKAGE_MPD_TCP
-	bool "tcp sockets"
-	default y
-	help
-	  Enable MPD to listen on tcp sockets.
-
-	  You want this on if MPD and the client(s) work
-	  on different machines (the usual scenario).
-
-choice
-	prompt "UPnP"
-	default BR2_PACKAGE_MPD_UPNP_PUPNP if BR2_PACKAGE_MPD_UPNP # legacy
-	default BR2_PACKAGE_MPD_UPNP_DISABLED
-	help
-	  Enable MPD to access a UPnP based media server.
-
-	  For further information, see
-	  https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-or-mpdupnp.html
-
-config BR2_PACKAGE_MPD_UPNP_PUPNP
-	bool "pupnp"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_MPD_CURL
-	help
-	  Provides UPnP database access through libupnp
-	  (the legacy Portable SDK for UPnP devices).
-
-	  Introduces least additional dependencies.
-
-config BR2_PACKAGE_MPD_UPNP_NPUPNP
-	bool "npupnp"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBNPUPNP
-	select BR2_PACKAGE_MPD_CURL
-	help
-	  Provides UPnP database access through libnpupnp
-	  (a C++ reimplementation of the Portable UPnP library).
-
-	  This implementation is more modern, but also brings
-	  additional features not needed in this context, thus
-	  consuming more space.
-
-config BR2_PACKAGE_MPD_UPNP_DISABLED
-	bool "disabled"
-	help
-	  No UPnP client functionality.
-
-endchoice
-
-comment "Tag plugins"
-
-config BR2_PACKAGE_MPD_ID3TAG
-	bool "id3tag"
-	select BR2_PACKAGE_LIBID3TAG
-	help
-	  Enable ID3 support.
-
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, host-gcc 10, gcc 12, headers 5.6"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
