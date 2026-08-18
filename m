Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB770C5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 23:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6B280C04;
	Tue, 18 Aug 2026 23:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h08L-GTHCk_t; Tue, 18 Aug 2026 23:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787096150;
	bh=8YSkH7PSM8yQbacsNeEK7ctRjF59x2whSJBAMpykiAE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A/2UxogZed2kl7eaA47BJs/WDjz69PCA0XYRxtQMlQsYls0r1WkDZMYtvJ4NEot4D
	 NomhPziLy29Ozp3TZVcHd17dLHbk8Yw6fIROMOiYejNB5AwYZh7e2g+CZOssl51TBp
	 S9UllEaC7TZJxRiLGS9r1CpwYRNvPbS5ShxfCwbbNgkLc3u8KiDw/yxLm1QIkIml3Z
	 fsweOLCF13cylJZMsJSahW5r2doYgNdnFE/fnV/8qxRre+5u/W3NojwujJgIzDcjbU
	 x04vHMIvSSFMC/rxs1rH3GuiCTTNTzenhRKZrPPw77b9290Q0CevxjJyhMwDru8+ox
	 kekyU5PFXpKew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BA480C09;
	Tue, 18 Aug 2026 23:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D93A29B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 23:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639624058F
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 23:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpX2ss0VTRnb for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 23:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2C7840711
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 23:35:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1wUZe82w7H-00nHOh; Wed, 19
 Aug 2026 01:35:43 +0200
Message-ID: <05fa60ef-a53f-4581-8845-0faa1b549919@gmx.de>
Date: Wed, 19 Aug 2026 01:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
References: <20260802194421.1914703-1-fiona.klute@gmx.de>
 <20260802194421.1914703-2-fiona.klute@gmx.de> <aoTSw0AjOev0Ae2M@windsurf>
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
In-Reply-To: <aoTSw0AjOev0Ae2M@windsurf>
X-Provags-ID: V03:K1:XJPt9X2uMtI5tVoJVyYe710rcN2CEEjzZo3E4v0IF+rhuIxVbpd
 GbBVkjuBbdV5jDo5SB19N5id+NqEs9/yvs2eldy9QsMJdUEpoJeZTF/FFRgWFOeVuak2d1V
 AjzGTB9eSLC3f1G/basivHttrE3EStePAd2SSQa3m0LZqERRJuk9wAqZYTdnWPv/ytZkNQd
 sRbfKoOCO54ZWyim8v0ig==
UI-OutboundReport: notjunk:1;M01:P0:dZNA7K+zvP8=;rLPrJ+KuQAqfaoWM0BtIj8AJex4
 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
Subject: Re: [Buildroot] [PATCH v3 2/2] package/btrfs-progs: bump to version
 7.1
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

Hi Thomas!

Am 18.08.26 um 23:48 schrieb Thomas Petazzoni:
> Hello,
> 
> On Sun, Aug 02, 2026 at 09:44:21PM +0200, Fiona Klute via buildroot wrote:
>> Upstream changelog:
>> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.1
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>> ---
>> Changes v2 -> v3:
>> * update to btrfs-progs 7.1 instead of 7.0
> 
> Thanks, applied.

Thank you! :-)

> Please note that generating a btrfs filesystem fails for me, but it
> already failed before your bump. I think the issue was already
> discussed with Julien and is SELinux related:
> 
> ERROR: zoned: unable to stat /home/thomas/projets/buildroot/output/images/rootfs.btrfs
> NOTE: several default settings have changed in version 5.15, please make sure
>        this does not affect your deployments:
>        - DUP for metadata (-m dup)
>        - enabled no-holes (-O no-holes)
>        - enabled free-space-tree (-R free-space-tree)
> 
> Rootdir from:       /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target
> ERROR: getting a xattr value failed for /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target attr security.selinux: No data available
> ERROR: failed to add xattr item for the top level inode: Operation not permitted
> ERROR: failed to copy rootdir inode: Operation not permitted
> ERROR: unable to traverse directory /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target: 1
> /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/fakeroot: line 11: 539047 Segmentation fault         (core dumped) /home/thomas/projets/buildroot/output/host/bin/mkfs.btrfs -f -r '/home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target' -L '' --byte-count '100m' --nodesize '16384' --sectorsize '4096' /home/thomas/projets/buildroot/output/images/rootfs.btrfs
> make: *** [fs/btrfs/btrfs.mk:55: /home/thomas/projets/buildroot/output/images/rootfs.btrfs] Error 139

Yes, that looks like the problem Julien described. He tried to patch it, 
the problem is that the patch breaks building a target with SELinux (at 
least on a non-SELinux host, haven't tested with):
https://salsa.debian.org/clint/fakeroot/-/merge_requests/38

I suspect the permission would have to faked by default on a non-SELinux 
host (and possibly inside fakeroot with SELinux), but I haven't had time 
to dig into it.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
