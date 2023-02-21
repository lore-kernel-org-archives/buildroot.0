Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F17C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF0C61249;
	Tue, 21 Feb 2023 17:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF0C61249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sgwh0Q3D6_wl; Tue, 21 Feb 2023 17:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD5E61295;
	Tue, 21 Feb 2023 17:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD5E61295
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B15501BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8883182B3E
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8883182B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZBjlSSdS4Op for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C9ED82A6C
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C9ED82A6C
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 52A222037D;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:54 -0600
Message-Id: <20230221172205.2450111-4-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=RHmNOsbFC+rd18PZzziMOaI11mYO8xd5rWfJU2W4vc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vK53Iq4MBjSsm8JItvIHN3/5mLGwCPuXTCec8kKQycrFksAIBRohg62WJ2buOOiNi
 l4MqVoTOtv9brpKN4P5T1LuYOo1b2OdCWbCHHlrzxShyFQ6lQO+ETKTAKFXL82T+9s
 spo4nlZuB7mpcTcCo//uiwZzJbZCpuJoXSZBpd80=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=vK53Iq4M
Subject: [Buildroot] [PATCH 04/15] package/pkg-autotools: add FOO_AUTOPOINT
 flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogVmluY2VudCBGYXppbyA8dmZhemlvQGdtYWlsLmNvbT4KCkFkZCBhIG5ldyB2YXJpYWJs
ZSB0byBydW4gYXV0b3BvaW50IGR1cmluZyBhdXRvcmVjb25mLgoKVGhpcyB2YXJpYWJsZSBkZXBl
bmRzIG9uIEZPT19BVVRPUkVDT05GID0gWUVTLiBJdCBpcyBtdXR1YWxseSBleGNsdXNpdmUKdG8g
Rk9PX0dFVFRFWFRJWkUuIElmIGJvdGggYXJlIHNldCwgRk9PX0FVVE9QT0lOVCBpcyBpZ25vcmVk
IHRvIHByZXNlcnZlCnByZXZpb3VzIGJlaGF2aW9yLgoKVGhpcyBzdXBwb3J0IGlzIGJlaW5nIGFk
ZGVkIHBlciBhIHByZXZpb3VzIGRpc2N1c3Npb24gWzFdLgoKVGhlIHVzYWdlIG9mIGdldHRleHRp
emUgbmVlZHMgdG8gYmUgcmVtb3ZlZCBjdXogbWFtYSBzYXlzIHNvIFsyXS4KICAuLi4gaXMgbm90
IHBhcnQgb2YgdGhlIEdOVSBidWlsZCBzeXN0ZW0sIGluIHRoZSBzZW5zZSB0aGF0IGl0IHNob3Vs
ZAogIG5vdCBiZSBpbnZva2VkIGF1dG9tYXRpY2FsbHksIGFuZCBub3QgYmUgaW52b2tlZCBieSBz
b21lb25lIHdobyBkb2VzbuKAmXQKICBhc3N1bWUgdGhlIHJlc3BvbnNpYmlsaXRpZXMgb2YgYSBw
YWNrYWdlIG1haW50YWluZXIuIEZvciB0aGUgbGF0dGVyCiAgcHVycG9zZSwgYSBzZXBhcmF0ZSB0
b29sIGlzIHByb3ZpZGVkLCBzZWUgSW52b2tpbmcgdGhlIGF1dG9wb2ludCBQcm9ncmFtIFszXQoK
VXNpbmcgZ2V0dGV4dGl6ZSBoYXMgdGhlIHVuaW50ZW5kZWQgY29uc2VxdWVuY2Ugb2YgdXBkYXRp
bmcgdGhlIHBhY2thZ2UKYmFzZWQgb24gdGhlIHZlcnNpb24gb2YgaG9zdC1nZXR0ZXh0IHZzIHdo
YXQgd2FzIGNob3NlbiBieSB0aGUgdXBzdHJlYW0KbWFpbnRhaW5lci4gQXMgbWFtYSBzYWlkIGFi
b3ZlLCB3ZSBzaG91bGQgdXNlIGF1dG9wb2ludC4gRG8gYXMgc2hlIHNheXMKdG8gYXZvaWQgZnVy
dGhlciBzY29sZGluZyAoZ2V0dGV4dGl6ZSBzaG9laG9ybmluZyBhbmQgcGFja2FnZSBwYXRjaGlu
ZykuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDE3MDgyNzExMDkyMC4xNTU3OS0xLWFsZWtzYW5kZXJAYWxla3NhbmRlci5lcy8KWzJd
IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ2V0dGV4dC9tYW51YWwvaHRtbF9ub2RlL2dl
dHRleHRpemUtSW52b2NhdGlvbi5odG1sClszXSBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJl
L2dldHRleHQvbWFudWFsL2h0bWxfbm9kZS9hdXRvcG9pbnQtSW52b2NhdGlvbi5odG1sCgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AZ21haWwuY29tPgotLS0KIHBhY2thZ2Uv
cGtnLWF1dG90b29scy5tayB8IDE3ICsrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtn
LWF1dG90b29scy5tayBiL3BhY2thZ2UvcGtnLWF1dG90b29scy5tawppbmRleCA0MThjZDEwOTQ1
Li40ODQ4NTU2N2Q3IDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZy1hdXRvdG9vbHMubWsKKysrIGIv
cGFja2FnZS9wa2ctYXV0b3Rvb2xzLm1rCkBAIC0xNTIsNiArMTUyLDE1IEBAIGlmbmRlZiAkKDIp
X0dFVFRFWFRJWkUKICBlbmRpZgogZW5kaWYKIAoraWZuZGVmICQoMilfQVVUT1BPSU5UCisgaWZk
ZWYgJCgzKV9BVVRPUE9JTlQKKyAgJCgyKV9BVVRPUE9JTlQgPSAkJCgkKDMpX0FVVE9QT0lOVCkK
KyBlbHNlCisgICQoMilfQVVUT1BPSU5UID89IE5PCisgZW5kaWYKK2VuZGlmCisKKwogaWZlcSAo
JCg0KSxob3N0KQogICQoMilfQVVUT1JFQ09ORl9PUFRTID89ICQkKCQoMylfQVVUT1JFQ09ORl9P
UFRTKQogZW5kaWYKQEAgLTI0MCw4ICsyNDksMTQgQEAgaWZlcSAoJCQoJCgyKV9BVVRPUkVDT05G
KSxZRVMpCiBpZmVxICgkJCgkKDIpX0dFVFRFWFRJWkUpLFlFUykKICQoMilfUFJFX0NPTkZJR1VS
RV9IT09LUyArPSBHRVRURVhUSVpFX0hPT0sKICQoMilfREVQRU5ERU5DSUVTICs9IGhvc3QtZ2V0
dGV4dAotZW5kaWYKICQoMilfQVVUT1JFQ09ORl9FTlYgKz0gQVVUT1BPSU5UPS9iaW4vdHJ1ZQor
IyBhdXRvcG9pbnQgaXMgcHJvdmlkZWQgYnkgZ2V0dGV4dAorZWxzZSBpZmVxICgkJCgkKDIpX0FV
VE9QT0lOVCksWUVTKQorJCgyKV9ERVBFTkRFTkNJRVMgKz0gaG9zdC1nZXR0ZXh0CiskKDIpX0FV
VE9SRUNPTkZfRU5WICs9IEFVVE9QT0lOVD0kJChIT1NUX0RJUikvYmluL2F1dG9wb2ludAorZWxz
ZQorJCgyKV9BVVRPUkVDT05GX0VOViArPSBBVVRPUE9JTlQ9L2Jpbi90cnVlCitlbmRpZgogJCgy
KV9QUkVfQ09ORklHVVJFX0hPT0tTICs9IEFVVE9SRUNPTkZfSE9PSwogIyBkZWZhdWx0IHZhbHVl
cyBhcmUgbm90IGV2YWx1YXRlZCB5ZXQsIHNvIGRvbid0IHJlbHkgb24gdGhpcyBkZWZhdWx0aW5n
IHRvIFlFUwogaWZuZXEgKCQkKCQoMilfTElCVE9PTF9QQVRDSCksTk8pCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
