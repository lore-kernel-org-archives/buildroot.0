Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A170CA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69FFE607BC;
	Sun,  1 Sep 2024 14:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcHKXgQ9Hfft; Sun,  1 Sep 2024 14:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB0DC60770
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB0DC60770;
	Sun,  1 Sep 2024 14:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE141BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17BE04051A
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bv9cBqbf3ED for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:29:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A132240533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A132240533
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A132240533
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:29:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBDjA-1svAv93KrW-00B1f2; Sun, 01
 Sep 2024 16:29:45 +0200
Date: Sun, 01 Sep 2024 16:29:43 +0200
Message-Id: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFd61GYC/03MQQ6CMBCF4auQWVszHZWiK+9hWIBMYRaAmTYEQ
 3p3K25c/i8v3waBVTjArdhAeZEg85SDDgU8h2bq2UiXGwjpjI6c0b4dm6iympJbZ6++c9UJIf9
 fyl7W3XrUuQcJcdb3Ti/2u/6Uii5/ymINGvTUosXSE/O9H9fjxBHqlNIH6a5MUaAAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725200985; l=1226;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=J98tk5IkTQoUlCiZJXnF4redcbU8KGkuHC/5rGX9YcE=;
 b=Jdzx7s0Z7EmW9lXTP73wRAmIzbpt4p1DoFly4qHrgcP6BA8jhQ5FZf1wgEH5WdCMZd7Js0Dks
 6ads1HgZpCTDqW95bNys3bLkARcCa94eqtqmvEyHhb++D7CzFjhSs6a
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:DuF3iMls1Byhh66hgdjaVpbAn2pxaig1cEtk8D8641YlLHD04St
 Hgfe9Xsauv/qFLHbFuuUeTWI8VfvoKODyZ8rPstJzrMlBzxo0g4gExYUxcDVN05b8tCObDA
 Io9IA+T3VwfaZmOj/+k5kA+NzC7bkxyiu1BfYEA/zg9at5yinqeuouTvzw04UzWqJZspzp1
 wOSbGXn+T1r3ccXy9CSZw==
UI-OutboundReport: notjunk:1;M01:P0:0JhmP6+gv70=;uVyLXyzzvPahVYRdsd60UgGJkjj
 5hDAZem65V7UOLnWidqzRXFzeWLWWUc7jGbCGv0H5vvHjluA72yOhUI0XQieUiTU4wQSWGI34
 I1iI6ouVJOcxZjdvArS2teWeFpqE6RjPdKDtge2ZIvXi5giLi/JfOmAm/Evp8AZXpTGUTndCt
 nBLICRhJLoY9casbV+HZA+4pkywY0luYt5O+OEMhgjP6cerXDKk8E3Rk512ktCqCW9GQTsEnv
 rx3DtDM5BscZ9PgVWJ4jPkVPqEMga7zcP1/YiUu0+U19CYfPTskOuzaaRUhb3jWjglVZARGg1
 bnthyfuh5+okk4b5IDg01ZbDs6p5uLmaexkMqAFk5XKywwBspnWJkUkjlx8AGkMT9uqJuyfwD
 ck+EUGKLrY2FrOJjPbKC9oFc7pQl/p5T6XczR6Lkuao96W1yULmipmFyxu0VAUxUMpNC2C/g/
 w5VOwJQI19LbCUxVvxn8fzAFFkIqPUTX47mXl0qx1/k+WA/D3B3FoRUDSvFFhuqDC0s20Ji+w
 4PV8HJ/1K02Ko0pHBlCXwOFd8AoEWBPMmu7jnLV7TKH+uadbwvvzYKLKGc4qBMe58NE6sA75N
 wbV7dK+OLgP8lqEoOS1AwREoAFeKinIgzbZcvUj0q0OEdxycCTLQMzfBUOtfV13rvcYWvb/bB
 eJKH48LyLwqPPYvL/PlIUmEM2cztNgzUGjq6dQuBIoC/ZfQ1ACE8HnQ7iTi3pYA+6c0jOhQSv
 fURJyngoLFCeiazbJID7/yz5UH7bUsbTwdqL14SpizlWAN57UruWRlFlie2gQW4Exffb5+Ie2
 7peFpRIzK585DD7ehE+7o7NQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725200985; x=1725805785; i=j.neuschaefer@gmx.net;
 bh=GEtgltHeilQWi4RWwzFge9ve0FExNrMzDPSoDDqnmgM=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aIWTPgnxMGVDhFrCfW9+bNlFPb7l4qnMXoiAqi2whIZc4pA80uZOSSHT73Lp3L74
 bdGO9qS1JxtkE84yN29jDeXXs07KBV71w9NW6w2uOA2HNsKKnPDItrAVHXOeLLZ3K
 7BAsGi7T+oiTZkrLDTkz71ByDnhwQMw7lb4OcZiB30H89AhLc9/93GT3oo7fqoHfE
 MkZ0yiXKlh/V8NW1++oj6noPOtg3SoNifvmUmye1vVUgpbBnWZwk/aAr4O5sI/u4l
 cMLn1kvlJnGUwsiEtmmbnwllhsbsvIDzVQ801cWlB4QXe9BrEOI/Grclu/IAlUHzJ
 eQSJVB23WngKgvh84w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=aIWTPgnx
Subject: [Buildroot] [PATCH v2 0/3] Version bump and python bindings for
 rpi-rgb-led-matrix
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBycGktcmdiLWxlZC1tYXRyaXggcGFja2FnZSBhbmQg
YWRkcyB0aGUgcHl0aG9uCmJpbmRpbmdzLCB3aGljaCBhcmUgYnVpbHQgZnJvbSB0aGUgc2FtZSBz
b3VyY2UgY29kZS4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIEFkZCBhIGNvbW1lbnQgYWJvdXQgdXBkYXRp
bmcgdmVyc2lvbnMgdG9nZXRoZXIKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQwODI1LXJnYm1hdHJpeC12MS0wLTBmMmIwMTA2ZjJlZUBnbXgubmV0CgotLS0KSi4g
TmV1c2Now6RmZXIgKDMpOgogICAgICBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeDogdXBkYXRl
IHRvIGxhdGVzdCBjb21taXQKICAgICAgcGFja2FnZS9weXRob24tcmdibWF0cml4OiBuZXcgcGFj
a2FnZQogICAgICBERVZFTE9QRVJTOiBhZGQgSi4gTmV1c2Now6RmZXIgZm9yIHJwaS1yZ2ItbGVk
LW1hdHJpeC9weXRob24tcmdibWF0cml4CgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgv
Q29uZmlnLmluICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1y
Z2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5oYXNoICAgICB8ICAzICsrKwogcGFja2FnZS9weXRo
b24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRyaXgubWsgICAgICAgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrCiBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgu
aGFzaCB8ICAyICstCiBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRy
aXgubWsgICB8ICAzICsrLQogNyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDM3ODAxNzY3ZjY4YzA1NTAwZjFkNDQ5NWI1YmFh
YzBlNzM0MGY3YTkKY2hhbmdlLWlkOiAyMDI0MDcyNy1yZ2JtYXRyaXgtNmViNzE5ZmQ3ODMwCgpC
ZXN0IHJlZ2FyZHMsCi0tCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
