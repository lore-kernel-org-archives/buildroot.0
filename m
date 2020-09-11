From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 22:22:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/minidlna: fix
 CallStranger a.k.a. CVE-2020-12675
Message-ID: <20200911201727.22D0288183@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1f8ff7e920fbd455f0fbbfbba09826e6c8a3e47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

No MINIDLNA_IGNORE_CVES entry is added as no CVE has been assigned to
minidlna. Indeed, CallStranger vulnerability affect(ed) most of the UPnP
stacks (e.g. gupnp, libupnp)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ab9118831a86353c39bdc111cb3171f28efa717)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch b/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch
new file mode 100644
index 0000000000..7406ce2e9e
--- /dev/null
+++ b/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch
@@ -0,0 +1,133 @@
+From 51bfbee51fd0376b5a66c944134af3e9972d8592 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Sep 2020 11:22:48 +0200
+Subject: [PATCH] upnphttp.c: fix CallStranger a.k.a. CVE-2020-12695
+
+Import CheckCallback function from miniupnpd source code:
+https://github.com/miniupnp/miniupnp/commit/0d9634658860c3c8c209e466cc0ef7002bad3b0a
+
+IPv6 code was kept even if minidlna does not support it currently.
+
+This code is licensed under BSD-3-Clause like minidlna.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/minidlna/support-requests/71]
+---
+ upnphttp.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 82 insertions(+), 10 deletions(-)
+
+diff --git a/upnphttp.c b/upnphttp.c
+index 974434e..3be793e 100644
+--- a/upnphttp.c
++++ b/upnphttp.c
+@@ -742,6 +742,70 @@ check_event(struct upnphttp *h)
+ 	return type;
+ }
+ 
++/**
++ * returns 0 if the callback header value is not valid
++ * 1 if it is valid.
++ */
++static int
++checkCallbackURL(struct upnphttp * h)
++{
++	char addrstr[48];
++	int ipv6;
++	const char * p;
++	int i;
++
++	if(!h->req_Callback || h->req_CallbackLen < 8)
++		return 0;
++	if(memcmp(h->req_Callback, "http://", 7) != 0)
++		return 0;
++	ipv6 = 0;
++	i = 0;
++	p = h->req_Callback + 7;
++	if(*p == '[') {
++		p++;
++		ipv6 = 1;
++		while(*p != ']' && i < (sizeof(addrstr)-1)
++		      && p < (h->req_Callback + h->req_CallbackLen))
++			addrstr[i++] = *(p++);
++	} else {
++		while(*p != '/' && *p != ':' && i < (sizeof(addrstr)-1)
++		      && p < (h->req_Callback + h->req_CallbackLen))
++			addrstr[i++] = *(p++);
++	}
++	addrstr[i] = '\0';
++	if(ipv6) {
++		struct in6_addr addr;
++		if(inet_pton(AF_INET6, addrstr, &addr) <= 0)
++			return 0;
++#ifdef ENABLE_IPV6
++		if(!h->ipv6
++		  || (0!=memcmp(&addr, &(h->clientaddr_v6), sizeof(struct in6_addr))))
++			return 0;
++#else
++		return 0;
++#endif
++	} else {
++		struct in_addr addr;
++		if(inet_pton(AF_INET, addrstr, &addr) <= 0)
++			return 0;
++#ifdef ENABLE_IPV6
++		if(h->ipv6) {
++			if(!IN6_IS_ADDR_V4MAPPED(&(h->clientaddr_v6)))
++				return 0;
++			if(0!=memcmp(&addr, ((const char *)&(h->clientaddr_v6) + 12), 4))
++				return 0;
++		} else {
++			if(0!=memcmp(&addr, &(h->clientaddr), sizeof(struct in_addr)))
++				return 0;
++		}
++#else
++		if(0!=memcmp(&addr, &(h->clientaddr), sizeof(struct in_addr)))
++			return 0;
++#endif
++	}
++	return 1;
++}
++
+ static void
+ ProcessHTTPSubscribe_upnphttp(struct upnphttp * h, const char * path)
+ {
+@@ -759,17 +823,25 @@ ProcessHTTPSubscribe_upnphttp(struct upnphttp * h, const char * path)
+ 		 * - respond HTTP/x.x 200 OK 
+ 		 * - Send the initial event message */
+ 		/* Server:, SID:; Timeout: Second-(xx|infinite) */
+-		sid = upnpevents_addSubscriber(path, h->req_Callback,
+-		                               h->req_CallbackLen, h->req_Timeout);
+-		h->respflags = FLAG_TIMEOUT;
+-		if (sid)
+-		{
+-			DPRINTF(E_DEBUG, L_HTTP, "generated sid=%s\n", sid);
+-			h->respflags |= FLAG_SID;
+-			h->req_SID = sid;
+-			h->req_SIDLen = strlen(sid);
++		/* Check that the callback URL is on the same IP as
++		 * the request, and not on the internet, nor on ourself (DOS attack ?) */
++		if(checkCallbackURL(h)) {
++			sid = upnpevents_addSubscriber(path, h->req_Callback,
++				                       h->req_CallbackLen, h->req_Timeout);
++			h->respflags = FLAG_TIMEOUT;
++			if (sid)
++			{
++				DPRINTF(E_DEBUG, L_HTTP, "generated sid=%s\n", sid);
++				h->respflags |= FLAG_SID;
++				h->req_SID = sid;
++				h->req_SIDLen = strlen(sid);
++			}
++			BuildResp_upnphttp(h, 0, 0);
++		} else {
++			DPRINTF(E_WARN, L_HTTP, "Invalid Callback in SUBSCRIBE %.*s",
++	       		       h->req_CallbackLen, h->req_Callback);
++			BuildResp2_upnphttp(h, 412, "Precondition Failed", 0, 0);
+ 		}
+-		BuildResp_upnphttp(h, 0, 0);
+ 	}
+ 	else if (type == E_RENEW)
+ 	{
+-- 
+2.28.0
+
