Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCEEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCE180D5C;
	Mon, 19 Aug 2024 11:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nR0Du0-eCFR; Mon, 19 Aug 2024 11:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97AB80E0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C97AB80E0A;
	Mon, 19 Aug 2024 11:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 725191BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F25380E17
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWD6li6ZpX7G for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C9180D5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77C9180D5C
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:06:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FBEF8601D; Mon, 19 Aug 2024 11:06:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:00:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad6e6f5d598a9311fc9141e4b9b08820562d1792
X-Git-Newrev: e7b3286c79436bc145fd97e78a582cab81f98e87
X-Patchwork-Hint: ignore
Message-Id: <20240819110621.6FBEF8601D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: revert upstream
 commit to fix brcmfmac
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7b3286c79436bc145fd97e78a582cab81f98e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert the upstream wpa_supplicant commit 41638606054 ("Mark
authorization completed on driver indication during 4-way HS offload").
That commit breaks WPA2-PSK and WPA3-SAE for brcfmac driver in upstream
Linux kernels. For details refer to the hostapd mailing list discussion
and redhat bugzilla:
- http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
- https://bugzilla.redhat.com/show_bug.cgi?id=2302577

Alternative option would be to disable offload in brcmfmac driver
adding "brcmfmac.feature_disable=0x82000" to Linux command line.

Final decision is not yet agreed upon on the hostapd mailing list,
but reporter and maintainer are inclined to revert the patch. So this
change adds revert to Buildroot to improve user experience for such
boards as Orange Pi Zero Plus2, BananaPro, and others. Later on the
patch will be updated according to hostapd upstream changes.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-authorization-completed-on-driver-indica.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
new file mode 100644
index 0000000000..89954eb7c5
--- /dev/null
+++ b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
@@ -0,0 +1,55 @@
+From 170d8a433308ee39f87af94acaef461f8e80b67b Mon Sep 17 00:00:00 2001
+From: Janne Grunau <janne-fdr@jannau.net>
+Date: Sun, 4 Aug 2024 13:24:42 +0200
+Subject: [PATCH] Revert "Mark authorization completed on driver indication during 4-way HS offload"
+
+This reverts commit 41638606054a09867fe3f9a2b5523aa4678cbfa5.
+
+Signed-off-by: Janne Grunau <janne-fdr@jannau.net>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Upstream: not yet sent, ongoing discussion http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
+
+---
+ wpa_supplicant/events.c | 25 ++++++++-----------------
+ 1 file changed, 8 insertions(+), 17 deletions(-)
+
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 49917f7aa..bbb3a3eda 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -4327,23 +4327,14 @@ static void wpa_supplicant_event_assoc(struct wpa_supplicant *wpa_s,
+ 		eapol_sm_notify_eap_success(wpa_s->eapol, true);
+ 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_PSK) &&
+ 		   wpa_key_mgmt_wpa_psk(wpa_s->key_mgmt)) {
+-		if (already_authorized) {
+-			/*
+-			 * We are done; the driver will take care of RSN 4-way
+-			 * handshake.
+-			 */
+-			wpa_supplicant_cancel_auth_timeout(wpa_s);
+-			wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
+-			eapol_sm_notify_portValid(wpa_s->eapol, true);
+-			eapol_sm_notify_eap_success(wpa_s->eapol, true);
+-		} else {
+-			/* Update port, WPA_COMPLETED state from the
+-			 * EVENT_PORT_AUTHORIZED handler when the driver is done
+-			 * with the 4-way handshake.
+-			 */
+-			wpa_msg(wpa_s, MSG_DEBUG,
+-				"ASSOC INFO: wait for driver port authorized indication");
+-		}
++		/*
++		 * We are done; the driver will take care of RSN 4-way
++		 * handshake.
++		 */
++		wpa_supplicant_cancel_auth_timeout(wpa_s);
++		wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
++		eapol_sm_notify_portValid(wpa_s->eapol, true);
++		eapol_sm_notify_eap_success(wpa_s->eapol, true);
+ 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_8021X) &&
+ 		   wpa_key_mgmt_wpa_ieee8021x(wpa_s->key_mgmt)) {
+ 		/*
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
