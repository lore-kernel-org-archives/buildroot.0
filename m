From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Fri, 12 Jan 2018 10:29:35 +0100
Subject: [Buildroot] Iputils not setting suid root?
Message-ID: <CABhNV21G9hPsHpATOeXUnyPuCpT71XGhVsgXW_Uniq88WUuqSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just changed my setup from using busybox to using iputils.
Now I can't ping/traceroute6 anymore unless I use sudo. Is that normal?
In my ubuntu the suid bit is set, so I just copied that behaviour, and
that works.

I added the patch below to package/iputils/iputils.mk to set the permissions.
Is there any reason why it's not done?

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b20cd12..13e3389 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -69,4 +69,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef

+define IPUTILS_PERMISSIONS
+       /bin/ping        f 4755 0 0 - - - - -
+       /bin/traceroute6 f 4755 0 0 - - - - -
+endef
+
 $(eval $(generic-package))


-------------
[user at arm ~]$ ping google.com
ping: socket: Operation not permitted
ping: socket: Address family not supported by protocol
[user at arm ~]$ ls -l $(which ping)
-rwxr-xr-x 1 root root 47620 Jan  2 12:49 /bin/ping
[user at arm ~]$ sudo chmod u+s /bin/ping
[user at arm ~]$ ping google.com
PING google.com (216.58.212.238) 56(84) bytes of data.
64 bytes from ams16s22-in-f14.1e100.net (216.58.212.238): icmp_seq=1
ttl=55 time=5.57 ms
^C
