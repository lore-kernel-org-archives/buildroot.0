Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DB0C55ABA
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 19:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378D68099D;
	Wed,  5 Aug 2026 19:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8JQtzVdzyts; Wed,  5 Aug 2026 19:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC51809B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785959169;
	bh=MkP3kTlxoMHfRZ3veHHV5Qnwilc94FKZcBZ0M2Trn84=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oo0LJY0pECRVMEHgqZLPalPSN9W8nkExjrlvGkjTAT1RUV4CD4KNjr0IqN6S9OrdT
	 ywcqh7OQk9ffMa0xEGS7jsjF3D5D0MnyZSW57Ltt6tpOBDZ//d3a1ZoP66tA+OEWji
	 phG39xvzz6TVKf6IlPcU+iLet15cW9Z290oKncO9rHWN7LjcBYH4cbCZ/CrgMyxjGs
	 IPF2KU+3HdZkEvLbIjPApsK1ZaFY7jIOCh2uHm/0zBRqlCfw0dGlv41EHB+gUnJni1
	 9twH6qpEbLOD/zvlM5dsB4EzIErVDz8KCwBRMEfBiWUvimOyCTIUX9LW80HJpfRMdK
	 rXKBF4BEssEqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC51809B0;
	Wed,  5 Aug 2026 19:46:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02190730
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E87564021B
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Oi0HclkZKRZ for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 19:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FA264005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA264005E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FA264005E
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:46:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CA0E8B0054E;
 Wed,  5 Aug 2026 21:46:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Aug 2026 21:46:01 +0200
MIME-Version: 1.0
Date: Wed, 05 Aug 2026 21:46:01 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260804205148.2586329-1-fiona.klute@gmx.de>
References: <20260804205148.2586329-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <4f1b5c34043ad18b496984bc80ab019a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785959164;
 bh=VEmSqNzcpy1ERZJP1AlbaANSDf7uxvX+tba+kB9f6BA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fW3L6R2FEpJjl3bq8JhSAH7cIeIfmuSdYfevK81CqaGNf+CQUUTx/UupNkF69GEcI
 S1hYn81MzPYY8ppOYsfMcimFuEtFO3ZgZof7nWQ5ppUWV/QBC0VpKwbtjllKZrNL7m
 VGU/lkuzeM78YuP+SbCPzUXiKTDp86GYR41sKAOI4mBiwd0hSVJkJ838rHa7bWxo6F
 lUvL2YmqMWjilln95F3Dy8aSwGLZ6PYdwDk2zpbwRFvE3Pac2q4zrRzoljtNc465WH
 fc+peM/6W1d7f/CVxq7j6lKFW/Gs/a36tHVjKHyr+dwFhssHeONodOQOL/uSV/r7Vw
 5m624hnCWmzLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fW3L6R2F
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libglib2: security bump to
 version 2.88.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/08/2026 22:51, Fiona Klute via buildroot wrote:
> There have been a number of security fixes of mixed severity in
> libglib2 since 2.86.0, sorted by release:
> 
> 2.87.1
> * CVE-2025-13601: Incorrect calculation of buffer size in
>   g_escape_uri_string()
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3827
> * CVE-2025-14087: Buffer underflow on Glib through glib/gvariant via
>   bytestring_parse() or string_parse() leads to OOB Write
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3834
> * CVE-2025-14512: GIO: Integer overflow in file attribute escaping
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3845
> 
> 2.87.3
> * CVE-2026-1484: Integer Overflow -> Buffer Underflow on Glib through
>   glib/gbase64.c via g_base64_encode_close() leads to OOB Write
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3870
> * CVE-2026-1485: Buffer underflow on Glib through
>   gio/gcontenttype-fdo.c via parse_header() lead to OOB Read/Write
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3871
> * CVE-2026-1489: Integer Overflow on Glib through glib/guniprop.c via
>   output_marks() lead to OOB Write in glib/gutf8.c:g_unichar_to_utf8()
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3872
> 
> 2.88.1
> * CVE-2026-58010: Buffer Over-read on GLib through
>   glib/gvariant-serialiser.c:1253 via gvs_tuple_is_normal()
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3915
> * CVE-2026-58011: OOB Read on GLib through
>   glib/gdatetime.c:g_date_time_get_ymd via invalid `GDateTime`
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3917
> * CVE-2026-58012: Buffer Over-read on GLib's g_regex_replace() through
>   glib/gregex.c:string_append() via g_utf8_next_char()
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3918
> * CVE-2026-58013: Buffer Over-read on GLib through glib/giochannel.c
>   via "g_io_channel_read_line_backend"
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3925
> * CVE-2026-58014: Off-by-one Error on GLib through glib/gkeyfile.c via
>   "g_key_file_get_locale_string_list"
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3930
> * CVE-2026-58015: Path Traversal on GLib DBus through
>   glib/gio/gdbusauthmechanismsha1.c via keyring_lookup_entry,
>   mechanism_client_data_receive (COOKIE_SHA1 Client Authentication)
>   leads to Arbitrary File Read (sort of)
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3931
> 
> 2.88.3
> * CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
>   SASL line buffering
>   https://gitlab.gnome.org/GNOME/glib/-/work_items/3985
> 
> Full upstream changelog:
> https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS?ref_type=tags
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
