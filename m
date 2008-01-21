From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 21 Jan 2008 11:10:30 +1100
Subject: [Buildroot] [PATCH] more python enhancements
In-Reply-To: <20080118123750.GA14604@aon.at>
References: <20080118025745.GA30978@cloud.net.au>
	<20080118123750.GA14604@aon.at>
Message-ID: <20080121001030.GA19176@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 18, 2008 at 01:37:50PM +0100, Bernhard Fischer wrote:
> On Fri, Jan 18, 2008 at 01:57:45PM +1100, Hamish Moffatt wrote:
> >+	cp -a $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/
> 
> NO.
> There is no portable "cp -a", either use $(INSTALL) which would be
> preferred or if nothing else helps cp -dpf

Portability is a nice goal but I think the horse has already bolted.
There's a ton of packages using "cp -a" already. Do you think there is
much chance of building on a non-GNU system?

"cp -dpf" doesn't do directories. Need -dpr.

> >+	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)
> >+	cp -a $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/
> 
> $(INSTALL) -D 

install doesn't seem to copy whole directories in any circumstance, 
which config is (hence the cp -a).

[10:56AM] hamish at bach:~/tmp $ mkdir testdir
[10:56AM] hamish at bach:~/tmp $ install -D testdir installtest
install: omitting directory `testdir'

> >+python-test:
> >+	@echo Version = $(PYTHON_VERSION)
> 
> What's that supposed to do? remove this, please.

Will do, thanks.

> >+config BR2_PACKAGE_PYTHON_DEV
[..]
> It would be saner to have this as one central know like i did for
> HAVE_{MAN,INFO}PAGES, fwiw (at least that's what i have in my tree).

True. Do you want to create an item in the top-level Config.in? I will
happily amend the python package to use it.

New patch attached.

cheers,
Hamish

$ grep "cp -a" */*.mk
acpid/acpid.mk:	cp -a $(ACPID_DIR)/acpid $(TARGET_DIR)/usr/sbin/acpid
atk/atk.mk:	cp -a $(STAGING_DIR)/lib/libatk-1.0.so $(TARGET_DIR)/lib/
atk/atk.mk:	cp -a $(STAGING_DIR)/lib/libatk-1.0.so.0* $(TARGET_DIR)/lib/
avahi/avahi.mk:	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
avahi/avahi.mk:	cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
avahi/avahi.mk:	cp -af $(BASE_DIR)/package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
avahi/avahi.mk:	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
avahi/avahi.mk:	cp -af $(BASE_DIR)/package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
berkeleydb/berkeleydb.mk:	cp -a $(STAGING_DIR)/lib/libdb*so* $(TARGET_DIR)/lib/
bind/bind.mk:	    cp -a libdns*so* libisc*so* libbind9*so* \
bison/bison.mk:	cp -a package/bison/yacc $(TARGET_DIR)/usr/bin/yacc
bridge/bridge.mk:	cp -af $(BRIDGE_BUILD_DIR)/brctl/brctl $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
bridge/bridge.mk:	#cp -af $(BRIDGE_BUILD_DIR)/brctl/brctld $(TARGET_DIR)/usr/sbin/
cairo/cairo.mk:	cp -a $(STAGING_DIR)/lib/libcairo.so $(TARGET_DIR)/lib/
cairo/cairo.mk:	cp -a $(STAGING_DIR)/lib/libcairo.so.2* $(TARGET_DIR)/lib/
curl/curl.mk:	cp -a $(CURL_DESTDIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
curl/curl.mk:	cp -a $(CURL_DESTDIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
customize/customize.mk:		cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
dash/dash.mk:	cp -a $(DASH_DIR)/$(DASH_BINARY) $(TARGET_DIR)/$(DASH_TARGET_BINARY)
dbus-glib/dbus-glib.mk:	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so* $(STAGING_DIR)/usr/lib
dbus-glib/dbus-glib.mk:	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so.2* $(TARGET_DIR)/usr/lib
dbus-glib/dbus-glib.mk:	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/dbus-binding-tool $(TARGET_DIR)/usr/bin
fontconfig/fontconfig.mk:	cp -a $(STAGING_DIR)/usr/bin/fc-cache $(TARGET_DIR)/usr/bin/
fontconfig/fontconfig.mk:	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
grep/grep.mk:	    cp -a $(GNUGREP_DIR)/src/grep $(GNUGREP_DIR)/src/egrep \
gtk2-engines/gtk2-engines.mk:	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/engines/*.so \
gtk2-engines/gtk2-engines.mk:	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
hostapd/hostapd.mk:	cp -af $(BASE_DIR)/package/hostapd/defconfig $(HOSTAPD_DIR)/hostapd/.config
hostapd/hostapd.mk:	cp -af $(HOSTAPD_DIR)/hostapd/hostapd $(TARGET_DIR)/usr/sbin/
hostapd/hostapd.mk:	cp -af $(HOSTAPD_DIR)/hostapd/hostapd_cli $(TARGET_DIR)/usr/sbin/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/driver/etc/hostap_cs.conf $(TARGET_DIR)/etc/pcmcia/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/utils/hostap_crypt_conf $(TARGET_DIR)/usr/bin/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/utils/hostap_diag $(TARGET_DIR)/usr/bin/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/utils/prism2_param $(TARGET_DIR)/usr/bin/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/utils/prism2_srec $(TARGET_DIR)/usr/bin/
hostap/hostap.mk:	cp -af $(HOSTAP_DIR)/hostapd/hostapd $(TARGET_DIR)/usr/sbin/
hwdata/hwdata.mk:	cp -a $(HWDATA_DIR)/pci.ids $(TARGET_DIR)/usr/share/hwdata
hwdata/hwdata.mk:	cp -a $(HWDATA_DIR)/usb.ids $(TARGET_DIR)/usr/share/hwdata
libdaemon/libdaemon.mk:	cp -af $(LIBDAEMON_DIR) $(LIBDAEMON_DIR)-0rig
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libglib-2.0.so $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libglib-2.0.so.0* $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so.0* $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so.0* $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so $(TARGET_DIR)/lib/
libglib2/libglib2.mk:	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so.0* $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgtk.so $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgtk-1.2.so.0 $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgtk-1.2.so.0.9.1 $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgdk.so $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgdk-1.2.so.0 $(TARGET_DIR)/lib/
libgtk12/libgtk12.mk:	cp -a $(STAGING_DIR)/lib/libgdk-1.2.so.0.9.1 $(TARGET_DIR)/lib/
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/libgtk-x11-2.0.so $(TARGET_DIR)/lib/
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/libgtk-x11-2.0.so.0* $(TARGET_DIR)/lib/
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/libgdk*-2.0.so $(TARGET_DIR)/lib/
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/libgdk*-2.0.so.0* $(TARGET_DIR)/lib/
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/engines/*.so \
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/printbackends/*.so \
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/immodules/*.so \
libgtk2/libgtk2.mk:	cp -a $(STAGING_DIR)/lib/gtk-2.0/2.10.0/loaders/*.so \
liblockfile/liblockfile.mk:	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
libxml2/libxml2.mk:	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
libxml2/libxml2.mk:	cp -af $(LIBXML2_DIR)/usr/include/libxml2 $(TARGET_DIR)/usr/include/libxml2
lockfile-progs/lockfile-progs.mk:	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
lvm2/lvm2.mk:	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
madwifi/madwifi.mk:#	cp -af defnoconfig $(HOSTAPD_DIR)/hostapd/.config
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/athstats $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/80211stats $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/athkey $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/athchans $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/athctrl $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/athdebug $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/80211debug $(TARGET_DIR)/usr/sbin/
madwifi/madwifi.mk:	cp -af $(MADWIFI_DIR)/tools/wlanconfig $(TARGET_DIR)/usr/sbin/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/etc/matchbox/ $(TARGET_DIR)/etc/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox $(TARGET_DIR)/usr/share/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox/pixmaps/hourglass-*.png $(TARGET_DIR)/usr/share/matchbox/pixmaps/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/etc/matchbox/ $(TARGET_DIR)/etc/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox $(TARGET_DIR)/usr/share/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox/* $(TARGET_DIR)/usr/share/matchbox/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox/* $(TARGET_DIR)/usr/share/matchbox/
matchbox/matchbox.mk:	cp -af $(STAGING_DIR)/usr/share/matchbox/matchbox-keyboard $(TARGET_DIR)/usr/share/matchbox/
metacity/metacity.mk:	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
metacity/metacity.mk:	cp -a package/metacity/Xsession $(TARGET_DIR)/etc/X11/
mkdosfs/mkdosfs.mk:	cp -a $(MKDOSFS_DIR)/$(MKDOSFS_BINARY) $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
mrouted/mrouted.mk:	cp -a $(MROUTED_DIR)/$(MROUTED_BINARY) $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
netsnmp/netsnmp.mk:	cp -a $(STAGING_DIR)/usr/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
netsnmp/netsnmp.mk:	cp -a $(STAGING_DIR)/usr/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
newt/newt.mk:	cp -a $(NEWT_DIR)/libnewt.a $(STAGING_DIR)/usr/lib/
newt/newt.mk:	cp -a $(NEWT_DIR)/newt.h $(STAGING_DIR)/usr/include/
newt/newt.mk:	cp -a $(NEWT_DIR)/libnewt.so* $(STAGING_DIR)/usr/lib/
newt/newt.mk:	cp -a $(STAGING_DIR)/usr/lib/libnewt.so* $(TARGET_DIR)/usr/lib/
openntpd/openntpd.mk:	cp -af $(OPENNTPD_DIR)/ntpd.conf $(TARGET_DIR)/etc/ntpd.conf
openssl/openssl.mk:	cp -a $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpango-1.0.so $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpango-1.0.so.0* $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangox-1.0.so $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangox-1.0.so.0* $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangoft2-1.0.so $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangoft2-1.0.so.0* $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangoxft-1.0.so $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangoxft-1.0.so.0* $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so.0* $(TARGET_DIR)/lib/
pango/pango.mk:	cp -a $(STAGING_DIR)/lib/pango/1.5.0/modules/*.so $(TARGET_DIR)/lib/pango/1.5.0/modules/
patch/patch.mk:	cp -a $(GNUPATCH_DIR)/$(GNUPATCH_BINARY) $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
python/python.mk:	cp -a $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/
python/python.mk:	cp -a $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/
sqlite/sqlite.mk:	cp -a $(STAGING_DIR)/usr/bin/sqlite3 $(TARGET_DIR)/usr/bin
sqlite/sqlite.mk:	cp -a $(STAGING_DIR)/lib/libsqlite3*.so* $(TARGET_DIR)/lib/
tar/tar.mk:		cp -a $(GNUTAR_DIR)/$(GNUTAR_BINARY) \
tcpdump/dhcpdump.mk:	cp -af $< $@
tftpd/tftpd.mk:	    cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi
ttcp/ttcp.mk:	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_BUILD_DIR)
ttcp/ttcp.mk:	cp -af $(TTCP_BUILD_DIR)/ttcp $(TARGET_DIR)/usr/bin/
wipe/wipe.mk:	cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
xerces/xerces.mk:	cp -a $(STAGING_DIR)/lib/libxerces-c.so* $(TARGET_DIR)/usr/lib
xerces/xerces.mk:	cp -a $(STAGING_DIR)/lib/libxerces-depdom.so* $(TARGET_DIR)/usr/lib

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-python3.patch
Type: text/x-diff
Size: 2389 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080121/37bd0e80/attachment.bin 
