Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CC4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 17:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3080D604DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 17:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3080D604DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE399405E3;
	Fri, 12 Nov 2021 17:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpXaZGxXB8sy; Fri, 12 Nov 2021 17:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46088405DA;
	Fri, 12 Nov 2021 17:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1CCD1BF3BD
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA73461533
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1av3JN1hmtHI for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 17:22:18 +0000 (UTC)
X-Greylist: delayed 01:17:59 by SQLgrey-1.8.0
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 258A561525
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 17:22:18 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EFA3920E11;
 Fri, 12 Nov 2021 16:04:16 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 17:04:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033e5f6a02-f012-4dfe-a10b-dcf80b73bd5d,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <buildroot@buildroot.org>
Date: Fri, 12 Nov 2021 17:04:12 +0100
Message-ID: <20211112160413.2736382-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112160413.2736382-1-clg@kaod.org>
References: <20211112160413.2736382-1-clg@kaod.org>
MIME-Version: 1.0
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2f12d8a3-483e-4ce0-b54f-89859d0fa846
X-Ovh-Tracer-Id: 10412322340156181411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Subject: [Buildroot] [PATCH 2/3] configs/qemu_ppc64_e5500: Enable dhcp on
 network interface
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgdmlydGlvLW5ldC1wY2kgZGV2aWNlIHdpdGggYSB1c2VyIG1vZGUgaG9zdCBuZXR3b3Jr
IGJhY2tlbmQKClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+
Ci0tLQogYm9hcmQvcWVtdS9wcGM2NC1lNTUwMC9yZWFkbWUudHh0ICB8IDIgKy0KIGNvbmZpZ3Mv
cWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcgfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9wcGM2
NC1lNTUwMC9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9wcGM2NC1lNTUwMC9yZWFkbWUudHh0Cmlu
ZGV4IDYxZDUxZjdmNGRkMC4uN2M4YzgwYWY0NDU4IDEwMDY0NAotLS0gYS9ib2FyZC9xZW11L3Bw
YzY0LWU1NTAwL3JlYWRtZS50eHQKKysrIGIvYm9hcmQvcWVtdS9wcGM2NC1lNTUwMC9yZWFkbWUu
dHh0CkBAIC0xLDUgKzEsNSBAQAogUnVuIHRoZSBlbXVsYXRpb24gd2l0aDoKIAotIHFlbXUtc3lz
dGVtLXBwYzY0IC1NIHBwY2U1MDAgLWNwdSBlNTUwMCAtbSAyNTYgLWtlcm5lbCBvdXRwdXQvaW1h
Z2VzL3VJbWFnZSAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGlmPXZpcnRp
byxmb3JtYXQ9cmF3IC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcm9vdHdhaXQgcm9vdD0vZGV2L3Zk
YSIgLXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhpYyAjIHFlbXVfcHBjNjRfZTU1MDBfZGVmY29u
ZmlnCisgcWVtdS1zeXN0ZW0tcHBjNjQgLU0gcHBjZTUwMCAtY3B1IGU1NTAwIC1tIDI1NiAta2Vy
bmVsIG91dHB1dC9pbWFnZXMvdUltYWdlIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZz
LmV4dDIsaWY9dmlydGlvLGZvcm1hdD1yYXcgLW5ldCBuaWMsbW9kZWw9dmlydGlvLW5ldC1wY2kg
LW5ldCB1c2VyIC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSIg
LXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhpYyAjIHFlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmln
CiAKIFRoZSBsb2dpbiBwcm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHRoYXQgc3Rh
cnRlZCBRZW11LgpkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZp
ZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKaW5kZXggMjg2ZDc5YTI2YjZk
Li4wOWFhYzUwMjUyMmIgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZj
b25maWcKKysrIGIvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZwpAQCAtMiw3ICsy
LDggQEAKIEJSMl9wb3dlcnBjNjQ9eQogQlIyX3Bvd2VycGNfZTU1MDA9eQogCi0jIFNlcmlhbCBw
b3J0IGNvbmZpZworIyBTeXN0ZW0KK0JSMl9TWVNURU1fREhDUD0iZXRoMCIKIEJSMl9UQVJHRVRf
R0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlTMCIKIAogIyBJbWFnZQotLSAKMi4zMS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
