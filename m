Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA41C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 18:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3272980FA0;
	Wed, 14 Oct 2026 18:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5m2zvtfD6aJf; Wed, 14 Oct 2026 18:06:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D306980F88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792001210;
	b=iNSpgVdIV4mbMGXRnY2fhj4lrd8aZ9NhEVw+lbtKGsFk2m5mGepuwdBW/ZHJanzuCrRM
	 hl59e5wBZpgB+mkDGe/dn/GCVGKqHhutLbqf7yPsL9DY7QGBkDuerwmjJuZBSGW40ZK76
	 u21fPXfE5sisOLefcEODjRPZKKwbfiDFXQp13BuXXilV+Uqy6Ro4iBFxU/r5PSWmiKT5i
	 dQMOGtmm352kTBw1Yz+Fkwg1qi795rGV53DLXgN4JwyokbT6fi0peVE28JG3PR+maYoFJ
	 Nb2hhcqlHqDVcnoxt2ktPQfDXK9N7dDI7FfxUsIRJNY9qY+tFn1ykyTxT/QU/p5qRww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792001210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=R0LfI11u2iRsofWnr1gH1gSNIetiF8Lu/4YxswBqnN8=;
	b=VrSXeNuFuJBEiO/NLl1TCslkqtjfsZ0ELI1H85qEebl4Sz8vZCOABMQGX8x8lAN4OmIF
	 hZOPxGT1l2MBhtiLE2ZbLqjLYuX+2q+7LPK2CuOArtrm1lUwQhYB/veKggzULMvE6C6/F
	 3vp93sJPe4SoF7FuY8EZscvLefCFZ+BmvVx2ETlrH+yP5kuNRWlSWiFHZNvidhDRXQC4h
	 SjvbLooEsD0vjElFpmQ+FplHhm1poZwRE9c33xdD+CVbnLUtC7P6W4aub6yi0EhYD/Aur
	 PtrPhAbaJnmjaHbHOa/8ivgRdcVbIAL9dwxZJfxbXt8KmJx3uLZfY5HNPRywE086GjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792001209;
	bh=R0LfI11u2iRsofWnr1gH1gSNIetiF8Lu/4YxswBqnN8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mjg2lpihuK3XRw47beJAkIpQvbs7hFIQBiHBRPxA9jnuy8Nt3CZ+6UsmQGINvEg9e
	 C2nbTofCbgHVA1SjsJOYzImMpm+8nN8E/ogYFnLGcXUVQXUn8rKUDlJ6xVGgPTSs6Z
	 JPgW7yFxkeb/qkW1eEjgY/8coV+gxHz9sYSD2rFrLpH4Kt9dAQw1fjRGHtCDyiT3TI
	 oL3zMBaSHAbsF3ioJiWKxFXiuuqY3UW7FrF+0mEYLe1RJ2UFUB/brIuE7qmhMbGk/1
	 MMCUKrNYc0rJ/eG6wRrqDEsjBydnkreQEKK5/UWozTiTB2WngFlTNsvKwaEZrtNJiw
	 rZEvrBs2v+Mpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D306980F88;
	Wed, 14 Oct 2026 18:06:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95F1C2AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8801840191
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rxf_RmKWldMC for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 18:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 205834009D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792001207;
 b=Lnkf/3aZg95c3Gy2mJzU7i5PQmKrD68MwwhBiue55rAyHErOXPOh/uI+kepPvSSr68fA
 O8qiO4nRzy2MKSyngcIbeZvU1WGpNEC9SwgKVM+33ejZXpKuz12rglprJDdyICKFrJUTJ
 FOplsHG2nmUi/CxkSKER2m7EJ1zmBCnDS4niN2741OxYZQ6Cxqyv5IittKkBDYpZ69UIJ
 JH3ZtO6edULdxwr7ADhxq3ID6sF+7udThYGPOGb/S6u3SV/Qdgsa2l6b0oKAuHChv03O3
 9oRErUDA2llX7GNQb1pCMGhTVjJYh2eqhNf688lyt5o0lXUe+c59yNkGGkXFu+CMHkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792001207;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Lmk8BWzJtjIp0PmD5/BfURhZUeBpoJyssC5HAnhV81A=;
 b=ohoTmtzqw3Pg/sPA994IQNYEMoo9w/QXiCIqlTe2n+Aix7xFEZA8XOe4B3uEgcJQT7kx
 kPHss+rmIIuCaHXF8r2+TSglQ9zB8CFDQl/gr+PA5Y5EwGWpN3nNjyiSKjQp9w7kvRTQc
 h7F1qo5tv1XDE8GwQnLCoK4kROGirInS3EvUTCaeH1T97QvbbDR4x4yd1P7atuy4l73KP
 a1pJ9TUMQOcwXVWuCBMdm9KghI1b1nnWXDtgJ07R/61HKoqRC9FcJ04FM5zVqLSMAYrWH
 r9fjN7+Qft7Jx7RB+7JwpaXnupB7m492BtHTwOM+atutV2K8o6+f5I9DkMdSeonot9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=B+KTwgj7; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 205834009D
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:06:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1x77Dz0RCG-00IvDu; Wed, 14
 Oct 2026 20:06:43 +0200
Message-ID: <274a24d1-ca0b-4724-a22a-b3d31b446184@gmx.de>
Date: Wed, 14 Oct 2026 20:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20261014065829.22477-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261014065829.22477-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:80jq+qzgZYFRtcvblEqxeGdJ7H6XcpCEOVrqCKGVnrGRTw+hQOo
 hOAXrpnX9ssIwrrleLPIf9GU4N8BUawn57f27BmwKUuN3dozpXZvIU7guRbD2OrKx0losqe
 zNuThUK5qjG43n32A6GCaiCD330Ic6cwh1xyjdW44vrMKEuV3YSO6whiTWSdPvttxghJaIh
 uyyZca/njMPvnHAX/B4WQ==
UI-OutboundReport: notjunk:1;M01:P0:B/l+mVeArSc=;4CSDRnJe0qBGDVlN6mfrvYP4rJT
 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
Subject: Re: [Buildroot] [PATCH] package/libzlib: upstream patch for
 CVE-2026-85091
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 14.10.26 um 08:58 schrieb Thomas Perale via buildroot:
> This fixes the following vulnerability:
> 
> - CVE-2026-85091:
>      zlib versions 1.3.1.2 through 1.3.2 contain a heap buffer overflow
>      vulnerability in the gz_vacate() function when processing non-blocking
>      gzwrite() operations with stale external buffer pointers. Attackers
>      can trigger the overflow by calling gzprintf() or gzvprintf() after a
>      write stall, causing an unchecked memmove() to write beyond the
>      internal input buffer boundary.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-85091
>   - https://security-tracker.debian.org/tracker/CVE-2026-85091
>   - https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thank you!

> ---
>   ...overflow-bug-in-non-blocking-gzwrite.patch | 31 +++++++++++++++++++
>   package/libzlib/libzlib.mk                    |  2 ++
>   2 files changed, 33 insertions(+)
>   create mode 100644 package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> 
> diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> new file mode 100644
> index 0000000000..32aaabcc76
> --- /dev/null
> +++ b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> @@ -0,0 +1,31 @@
> +From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
> +From: Mark Adler <git@madler.net>
> +Date: Wed, 16 Sep 2026 16:26:14 -0700
> +Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
> +
> +This addresses CVE-2026-85091.
> +
> +Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
> +CVE: CVE-2026-85091
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + gzwrite.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/gzwrite.c b/gzwrite.c
> +index b217b85ce..512329244 100644
> +--- a/gzwrite.c
> ++++ b/gzwrite.c
> +@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
> +             n -= state->strm.avail_in;
> +             state->x.pos += n;
> +             len -= n;
> +-            if (ret == -1)
> ++            if (ret == -1) {
> ++                state->strm.avail_in = 0;
> ++                state->strm.next_in = state->in;
> +                 return state->again ? put - len : 0;
> ++            }
> +         } while (len);
> +     }
> +
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index d71d5d5233..9ce08d7093 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -15,6 +15,8 @@ LIBZLIB_PROVIDES = zlib
>   LIBZLIB_CPE_ID_VENDOR = zlib
>   LIBZLIB_CPE_ID_PRODUCT = zlib
>   
> +LIBZLIB_IGNORE_CVES += CVE-2026-85091
> +
>   # It is not possible to build only a shared version of zlib, so we build both
>   # shared and static, unless we only want the static libs, and we eventually
>   # selectively remove what we do not want
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
