Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A2EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 23:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 515C94053E;
	Mon, 10 Jul 2023 23:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515C94053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtSwA_wxJrSS; Mon, 10 Jul 2023 23:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC22840A85;
	Mon, 10 Jul 2023 23:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC22840A85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 649E51BF3AF
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 23:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4DF40487
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 23:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E4DF40487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkUe05GlJpBz for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 23:41:46 +0000 (UTC)
X-Greylist: delayed 03:30:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC00640166
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net
 [188.165.43.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC00640166
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 23:41:45 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.143.79])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id C627926FEC
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:45:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-252tz (unknown [10.110.115.64])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6FCC71FE0D;
 Mon, 10 Jul 2023 17:45:54 +0000 (UTC)
Received: from armadeus.com ([37.59.142.109])
 by ghost-submission-6684bf9d7b-252tz with ESMTPSA
 id QnWuFtJDrGTSIgAAJnWnWA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 10 Jul 2023 17:45:54 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:45:42 +0200
Message-ID: <20230710174542.16516-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4886968547513002987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrvdekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepffeivdetjeethfdvffeuffevjeevgeetgeekhefhudfhgefhvedvleffveegleevnecuffhomhgrihhnpehiuggvrghsohhnsghorghrugdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00362c398b1-eae8-408c-aa9c-876110b30aa2,
 6C57EA25E347E847A985B030998A1F579C5F0474)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/yavta: update _SITE URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Patrick Gerber <kpa_info@yahoo.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgbG9va3MgbGlrZSB0aGUgcHJvamVjdCBtb3ZlZCB0byBodHRwczovL2dpdC5pZGVhc29uYm9h
cmQub3JnL3lhdnRhLmdpdC4KClVwZGF0ZSBZQVZBX1NJVEUgVVJMIGFjY29yZGluZ2x5LgoKU2ln
bmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJt
YWRldXMuY29tPgotLS0KIHBhY2thZ2UveWF2dGEveWF2dGEubWsgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3lhdnRhL3lhdnRhLm1rIGIvcGFja2FnZS95YXZ0YS95YXZ0YS5tawppbmRleCBkMTZiZWU2OWIx
MTcuLmRiNDgxYjc3Yjk1NyAxMDA2NDQKLS0tIGEvcGFja2FnZS95YXZ0YS95YXZ0YS5taworKysg
Yi9wYWNrYWdlL3lhdnRhL3lhdnRhLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKIAogWUFWVEFfVkVSU0lPTiA9IDU4M2JlZGVmYzJhMjQ3ZDJjZmQzMmQxYjRhMGFi
YmUzZTIwMTVjNzAKLVlBVlRBX1NJVEUgPSBodHRwczovL2dpdC5pZGVhc29uYm9hcmQub3JnL2dp
dC95YXZ0YS5naXQKK1lBVlRBX1NJVEUgPSBodHRwczovL2dpdC5pZGVhc29uYm9hcmQub3JnL3lh
dnRhLmdpdAogWUFWVEFfU0lURV9NRVRIT0QgPSBnaXQKIFlBVlRBX0xJQ0VOU0UgPSBHUEwtMi4w
KwogWUFWVEFfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcuR1BMCi0tIAoyLjQxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
