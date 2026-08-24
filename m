Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D23EC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 11:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8474080D83;
	Mon, 24 Aug 2026 11:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_x9Xw0DtxKv; Mon, 24 Aug 2026 11:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787569665;
	bh=kC4cqMoFsvovwcrKjUT50sF3bRyobosJ/TJ7l7q8Ui8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=cdcjp/kAoqZwgPPqclQrXNsMYDae0yEnUeKBPXbNUsnW6aa3V4Hg+peQKcnd7HRno
	 giKQhMX0w0BDeNGOSOgP4jfUEBZcdOXFHrjKDAwcT2UqPOHs8v1xx3z0120t0EF1EY
	 LVpm8OOqt0wZl9hQthWMvV/5UcIzfiDkzAdqDlsLsc6WuhVAyyobOwsJuJssKU5T0F
	 gL/mB5MIjNgClBxw4rMuhSUWUvwTT7wKhs9ciefk0B0YyEnfhs2cu3KVuQRupDb6VD
	 1QZS/gN0SbwmL03b37EXIsx1KlqtqLXx2OpY+Wrts/VAuNuXCaqtQbM8jUzTfvCkLZ
	 9MH5sMj+IP0zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD7780D10;
	Mon, 24 Aug 2026 11:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2621829B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 184FF6068B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hi7HHxKa2IYB for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 11:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB7BB60686
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:07:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1wa6v12Sgp-00fXfq; Mon, 24
 Aug 2026 13:07:36 +0200
Message-ID: <46ea2d74-b802-42a3-9fa2-56c1f2b76286@gmx.de>
Date: Mon, 24 Aug 2026 13:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>,
 buildroot@buildroot.org
References: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
 <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
X-Provags-ID: V03:K1:mGQJ5lBgQE/PE0H9J70FUcdgtJa3DcLfqZkIl+fBRwT9GEKqvtH
 9DT/x2zst6NPvQiHjUvPyPbg9kE19H71uxQOejQLWjzlHelcZsyWZElbqJHetW+hyL/b7Sg
 cZOFp6uG0vT5XRG/LAIJJQwa6UezMk3BKsnVOMGpmeUpQTUW9Ogmqnty7N+Mh2i+LTvAR8X
 HkHFEiQwPboie5PqWjNZQ==
UI-OutboundReport: notjunk:1;M01:P0:eBOvhUSNEJo=;DDGbeUo3FkM63Aoh+PWjRqYqOMM
 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
 pg=
Subject: Re: [Buildroot] [PATCH 2/2] Check if bootcurrent is valid before
 using it
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

Hi Rhidian,

I think these patches went to the wrong mailing list, there's no such 
file in the Buildroot repo. From the path I guess they might be for 
RAUC. The second one seems to have some indentation issues.

Best regards,
Fiona


Am 24.08.26 um 11:35 schrieb Rhidian De Wit:
> Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> ---
>   src/bootloaders/efi.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
> index 631ea39d..15cbf417 100644
> --- a/src/bootloaders/efi.c
> +++ b/src/bootloaders/efi.c
> @@ -510,12 +510,15 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
>   		return NULL;
>   	}
>   
> -	g_hash_table_iter_init(&iter, config->slots);
> -	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> -		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> -			return g_strdup(slot->bootname);
> -		}
> -	}
> +  if (bootcurrent != NULL)
> +  {
> +    g_hash_table_iter_init(&iter, config->slots);
> +    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> +      if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> +        return g_strdup(slot->bootname);
> +      }
> +    }
> +  }
>   
>   	g_set_error(error,
>   			R_BOOTCHOOSER_ERROR,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
