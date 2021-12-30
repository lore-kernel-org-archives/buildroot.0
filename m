Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC987C433FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F46660BD9;
	Thu, 30 Dec 2021 15:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zrkCkW6QVHb; Thu, 30 Dec 2021 15:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FEF60773;
	Thu, 30 Dec 2021 15:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 919811BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81205410E1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuYwnxR5g7vD for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:14:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4A89410BD
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B523282DDD; Thu, 30 Dec 2021 15:08:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:14:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 810afe6bf7bf5c5150a3efca433b3233403f8397
X-Git-Newrev: 5a171e82058d3d40649daf88226ce04caf2d5a32
X-Patchwork-Hint: ignore
Message-Id: <20211230150846.B523282DDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liboping: add patch to fix suid
 root feature
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a171e82058d3d40649daf88226ce04caf2d5a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch from upstream merge quest [1] to fix suid root feature.

[1] https://github.com/octo/liboping/pull/35

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ckets-when-adding-hosts-not-when-doing-th.patch | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch b/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
new file mode 100644
index 0000000000..4f3eea6274
--- /dev/null
+++ b/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
@@ -0,0 +1,91 @@
+From ac878566eb935fd3ebfb804e6bd9e1690d4a65e3 Mon Sep 17 00:00:00 2001
+From: Tollef Fog Heen <tfheen@err.no>
+Date: Tue, 20 Mar 2018 22:40:32 +0100
+Subject: [PATCH] Open raw sockets when adding hosts, not when doing the
+ pinging
+
+This allows this to run as non-root again, without this, oping will
+have dropped privileges before trying to ping, which then fails to
+open the necessary raw sockets.
+
+Fixes: #34
+
+[Upstream: https://github.com/octo/liboping/pull/35/commits/a88c51f38dafa1fba9118045176754bec05d3c94]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/liboping.c | 48 +++++++++++++++++-------------------------------
+ 1 file changed, 17 insertions(+), 31 deletions(-)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index 39b0041..f98e810 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -1344,41 +1344,10 @@ int ping_send (pingobj_t *obj)
+ 	struct timeval nowtime;
+ 	struct timeval timeout;
+ 
+-	_Bool need_ipv4_socket = 0;
+-	_Bool need_ipv6_socket = 0;
+-
+ 	for (ptr = obj->head; ptr != NULL; ptr = ptr->next)
+ 	{
+ 		ptr->latency  = -1.0;
+ 		ptr->recv_ttl = -1;
+-
+-		if (ptr->addrfamily == AF_INET)
+-			need_ipv4_socket = 1;
+-		else if (ptr->addrfamily == AF_INET6)
+-			need_ipv6_socket = 1;
+-	}
+-
+-	if (!need_ipv4_socket && !need_ipv6_socket)
+-	{
+-		ping_set_error (obj, "ping_send", "No hosts to ping");
+-		return (-1);
+-	}
+-
+-	if (need_ipv4_socket && obj->fd4 == -1)
+-	{
+-		obj->fd4 = ping_open_socket(obj, AF_INET);
+-		if (obj->fd4 == -1)
+-			return (-1);
+-		ping_set_ttl (obj, obj->ttl);
+-		ping_set_qos (obj, obj->qos);
+-	}
+-	if (need_ipv6_socket && obj->fd6 == -1)
+-	{
+-		obj->fd6 = ping_open_socket(obj, AF_INET6);
+-		if (obj->fd6 == -1)
+-			return (-1);
+-		ping_set_ttl (obj, obj->ttl);
+-		ping_set_qos (obj, obj->qos);
+ 	}
+ 
+ 	if (gettimeofday (&nowtime, NULL) == -1)
+@@ -1698,6 +1667,23 @@ int ping_host_add (pingobj_t *obj, const char *host)
+ 	ph->table_next = obj->table[ph->ident % PING_TABLE_LEN];
+ 	obj->table[ph->ident % PING_TABLE_LEN] = ph;
+ 
++	if (ph->addrfamily == AF_INET && obj->fd4 == -1)
++	{
++		obj->fd4 = ping_open_socket(obj, AF_INET);
++		if (obj->fd4 == -1)
++			return (-1);
++		ping_set_ttl (obj, obj->ttl);
++		ping_set_qos (obj, obj->qos);
++	}
++	if (ph->addrfamily == AF_INET6 && obj->fd6 == -1)
++	{
++		obj->fd6 = ping_open_socket(obj, AF_INET6);
++		if (obj->fd6 == -1)
++			return (-1);
++		ping_set_ttl (obj, obj->ttl);
++		ping_set_qos (obj, obj->qos);
++	}
++
+ 	return (0);
+ } /* int ping_host_add */
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
