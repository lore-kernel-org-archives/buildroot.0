Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD356C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 18:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4CA80C4E;
	Tue, 25 Aug 2026 18:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzqqWwog_Z3y; Tue, 25 Aug 2026 18:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787681482;
	bh=EyCccNLmhLdLxrgLCP4CFxCuIyp0N0FW9d64HcWz89A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BYSUlS8TWyqs34IggtnSrXzMt5HHw7M+cNdihgxGUwNUTy+qUatcEk1iFnMGrxEIW
	 FY/3eb89H1m9VeSTc24RSSYXu15FJzNnFRk6/DhW6vff9W2tdjjQ9EIIrNU3+8fL1u
	 K7G1I1IDDPFJ0j/SZmi+7O4VszK2LcG6tA/Yrujx0KUjlVdQc2QsRSCNAOa5z5DO8d
	 8pWqpXUaiMm9738FSe35ybqZazRKQ+KEvk+mUj7vc2hptve7zqOQgCtTKLkHlPN7kt
	 2p6iq3O4o2VfPMF2M34fPQ0lXQGkCtLIHNfNmH0rJlShawaaXLkkQ83tdauaYf+yjS
	 1W7Tn/4cqletw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD3C80540;
	Tue, 25 Aug 2026 18:11:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C1D7472
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 18:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA9F606E1
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 18:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0oAeNVhWNH1 for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 18:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BC7C60604
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 18:11:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1xKqBf1j2e-00KYw1; Tue, 25
 Aug 2026 20:11:15 +0200
Message-ID: <b1733911-86a5-4e32-bf75-9c025792093c@gmx.de>
Date: Tue, 25 Aug 2026 20:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>,
 buildroot@buildroot.org
References: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
X-Provags-ID: V03:K1:LnaYB5zxylFAxyBdLAL4FQKADNxE5x1suxi7GZotSpdSIVfU9K7
 LluERROsOXWIFO6Dxl8zO5u1Y3B5wI5+OrTcrxIHEe1n22cetC9KuIM8yiXY3zOGqwxobg5
 eFbZXQr/BsfrceF7aGETz41uff+F6Yda0MZ+NvtMlwuwTAVIKMG8CPRCMrNHTqOwLoxL4Lu
 3OSkP5PKj7cTNF5GzojsQ==
UI-OutboundReport: notjunk:1;M01:P0:wS8mGP4sV80=;bzFaVht5256nBeMSdA/XfesTtcl
 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
 Og=
Subject: Re: [Buildroot] [PATCH] Avoid segfault on x86-64 with invalid EFI
 boot entries
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

Hi Rhidian!

Am 25.08.26 um 16:30 schrieb Rhidian De Wit:
> Upstream: https://github.com/rauc/rauc/pull/2029

The "Upstream" trailer needs to be in the patch file (see below, or [1] 
for an example).

> Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> ---
>   ...bootcurrent-is-valid-before-using-it.patch | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> 
> diff --git a/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> new file mode 100644
> index 0000000000..38fc02c5bf
> --- /dev/null
> +++ b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> @@ -0,0 +1,43 @@
> +From 931d0af0f66b9afd2a7c9d9532abef1ec67b1f69 Mon Sep 17 00:00:00 2001
> +From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> +Date: Mon, 24 Aug 2026 10:04:24 +0200
> +Subject: [PATCH] Check if bootcurrent is valid before using it
> +

This is were the "Upstream:" should be.

> +Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> +---
> + src/bootloaders/efi.c | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
> +index 19224118..6de5f73d 100644
> +--- a/src/bootloaders/efi.c
> ++++ b/src/bootloaders/efi.c
> +@@ -625,14 +625,17 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
> + 		return NULL;
> + 	}
> +
> +-	GHashTableIter iter;
> +-	g_hash_table_iter_init(&iter, config->slots);
> +-	RaucSlot *slot = NULL;
> +-	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> +-		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> +-			return slot->bootname;
> +-		}
> +-	}
> ++  if (bootcurrent != NULL)
> ++  {
> ++    GHashTableIter iter;
> ++    g_hash_table_iter_init(&iter, config->slots);
> ++    RaucSlot *slot = NULL;
> ++    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> ++      if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> ++        return slot->bootname;
> ++      }
> ++    }
> ++  }

Indentation is very different from the surrounding code (tab vs. 2 
spaces per level), I assume upstream will want that fixed, too.

Best regards,
Fiona


[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/9dc567aa78e6381ff7100b696535f1ffdd8447f7/package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch#L44

> +
> + 	g_set_error(error,
> + 			R_BOOTCHOOSER_ERROR,
> +--
> +2.51.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
