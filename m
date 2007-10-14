From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 14 Oct 2007 11:30:49 +0200
Subject: [Buildroot] PATCH: set BR2_INET_RPC dependency for nfs-utils
	and portmap
In-Reply-To: <471159C8.4050603@promwad.com>
References: <471159C8.4050603@promwad.com>
Message-ID: <200710141130.49413.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 14 October 2007 01:50:32 Ivan Kuten wrote:
> Set BR2_INET_RPC dependency for nfs-utils and portmap:

We had the same issue in BusyBox, and solved it the other way around: have
tools needing RPC do a 'select' on RPC, such as (this is not a patch!):

---8<---
Index: package/nfs-utils/Config.in
===================================================================
--- package/nfs-utils/Config.in (revision 20237)
+++ package/nfs-utils/Config.in (working copy)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	default n
+	select BR2_INET_RPC
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
Index: package/portmap/Config.in
===================================================================
--- package/portmap/Config.in   (revision 20237)
+++ package/portmap/Config.in   (working copy)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
 	default n
+	select BR2_INET_RPC
 	help
 	  The standard portmapper for RPC services.

---8<---

This is, imho, better this way because what people really want is NFS or
portmap, and might not know that RPC is needed to make those two available.

Having NFS and portmap visible and 'select' the needed RPC support is more
straightforward. But again, this is my humble opinion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
