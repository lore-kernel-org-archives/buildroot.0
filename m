Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63ACC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4821640905;
	Mon, 21 Mar 2022 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJCykr9XoNST; Mon, 21 Mar 2022 16:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAC940992;
	Mon, 21 Mar 2022 16:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 928821BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E43414A2
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HInlhuyVDilr for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:22:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD7BE410E9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5DBE8498E; Mon, 21 Mar 2022 16:13:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:20:56 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 60a54bc0e88dc534c830996db3642cfd1dd1979f
X-Git-Newrev: a13ada770aab7132f994cb0ab8791df9e7fa90ae
X-Patchwork-Hint: ignore
Message-Id: <20220321161333.D5DBE8498E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/minidlna: fix
 CVE-2022-26505
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a13ada770aab7132f994cb0ab8791df9e7fa90ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

A DNS rebinding issue in ReadyMedia (formerly MiniDLNA) before 1.3.1
allows a remote web server to exfiltrate media files.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c7520b7ea1d4276fa762fa3be971155fcf2b2d01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ttp-Protect-against-DNS-rebinding-attacks.patch | 66 ++++++++++++++++++++++
 package/minidlna/minidlna.mk                       |  3 +
 2 files changed, 69 insertions(+)

diff --git a/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
new file mode 100644
index 0000000000..6d601f53b9
--- /dev/null
+++ b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
@@ -0,0 +1,66 @@
+From c21208508dbc131712281ec5340687e5ae89e940 Mon Sep 17 00:00:00 2001
+From: Justin Maggard <jmaggard@arlo.com>
+Date: Wed, 9 Feb 2022 18:32:50 -0800
+Subject: [PATCH] upnphttp: Protect against DNS rebinding attacks
+
+Validate HTTP requests to protect against DNS rebinding.
+
+[Retrieved from:
+https://sourceforge.net/p/minidlna/git/ci/c21208508dbc131712281ec5340687e5ae89e940/]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ upnphttp.c | 17 +++++++++++++++++
+ upnphttp.h |  2 ++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/upnphttp.c b/upnphttp.c
+index c8b5e99..62db89a 100644
+--- a/upnphttp.c
++++ b/upnphttp.c
+@@ -273,6 +273,11 @@ ParseHttpHeaders(struct upnphttp * h)
+ 				p = colon + 1;
+ 				while(isspace(*p))
+ 					p++;
++				n = 0;
++				while(p[n] >= ' ')
++					n++;
++				h->req_Host = p;
++				h->req_HostLen = n;
+ 				for(n = 0; n < n_lan_addr; n++)
+ 				{
+ 					for(i = 0; lan_addr[n].str[i]; i++)
+@@ -909,6 +914,18 @@ ProcessHttpQuery_upnphttp(struct upnphttp * h)
+ 	}
+ 
+ 	DPRINTF(E_DEBUG, L_HTTP, "HTTP REQUEST: %.*s\n", h->req_buflen, h->req_buf);
++	if(h->req_Host && h->req_HostLen > 0) {
++		const char *ptr = h->req_Host;
++		DPRINTF(E_MAXDEBUG, L_HTTP, "Host: %.*s\n", h->req_HostLen, h->req_Host);
++		for(i = 0; i < h->req_HostLen; i++) {
++			if(*ptr != ':' && *ptr != '.' && (*ptr > '9' || *ptr < '0')) {
++				DPRINTF(E_ERROR, L_HTTP, "DNS rebinding attack suspected (Host: %.*s)", h->req_HostLen, h->req_Host);
++				Send404(h);/* 403 */
++				return;
++			}
++			ptr++;
++		}
++	}
+ 	if(strcmp("POST", HttpCommand) == 0)
+ 	{
+ 		h->req_command = EPost;
+diff --git a/upnphttp.h b/upnphttp.h
+index e28a943..57eb2bb 100644
+--- a/upnphttp.h
++++ b/upnphttp.h
+@@ -89,6 +89,8 @@ struct upnphttp {
+ 	struct client_cache_s * req_client;
+ 	const char * req_soapAction;
+ 	int req_soapActionLen;
++	const char * req_Host;        /* Host: header */
++	int req_HostLen;
+ 	const char * req_Callback;	/* For SUBSCRIBE */
+ 	int req_CallbackLen;
+ 	const char * req_NT;
+-- 
+2.34.1
+
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index adea200f4f..01ee8d0028 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -12,6 +12,9 @@ MINIDLNA_CPE_ID_VENDOR = readymedia_project
 MINIDLNA_CPE_ID_PRODUCT = readymedia
 MINIDLNA_SELINUX_MODULES = minidlna
 
+# 0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
+MINIDLNA_IGNORE_CVES += CVE-2022-26505
+
 MINIDLNA_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
