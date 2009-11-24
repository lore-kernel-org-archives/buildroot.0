From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 24 Nov 2009 11:18:55 +0100
Subject: [Buildroot] patch : dbus  remove existing symbolic link
Message-ID: <E4B91C4D3521446D8F69144609024A53@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Building dbus fails if the symbolic link is already present.
this should solve the issue.
 
 
diff -rupN buildroot-2009.11/package/dbus/dbus.mk
buildroot/package/dbus/dbus.mk
--- buildroot-2009.11/package/dbus/dbus.mk 2009-11-23 23:24:09.000000000
+0100
+++ buildroot/package/dbus/dbus.mk 2009-11-24 11:01:44.000000000 +0100
@@ -53,7 +53,8 @@ $(eval $(call AUTOTARGETS,package,dbus))
 
 # fix rebuild if /var/lib is a symlink to /tmp
 $(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
- rm -rf /tmp/dbus
+ if [  -h $(TARGET_DIR)/var/lib/dbus ]; then \
+  rm -rf $(TARGET_DIR)/var/lib/dbus; fi
  touch $@
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
 
 
 
I hope this is the right way to submit a patch, don't shoot me if it isn't
 
Johan
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091124/eafdf610/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_dbus.patch
Type: application/octet-stream
Size: 566 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091124/eafdf610/attachment-0001.obj>
