From: Sridhar Addagada <sridhar_a@yahoo.com>
Date: Tue, 24 Jan 2012 19:23:49 -0800 (PST)
Subject: [Buildroot] compiling package/libcgi before my cgi code
Message-ID: <1327461829.96179.YahooMailNeo@web120202.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm working to implement web management on our device, and have enabled lighttpd, and created a new directory under packages (packages/mycgi) where i put in my xxx-cgi.c code.? I need to make sure that libcgi compiles before my cgi sources are compiled.? Here is the makefile I've cooked up.? Any suggestions appreciated.

Thanks


#############################################################
#
# Web Management Interface
#
#############################################################
WEBCFG_DIR=$(BUILD_DIR)/webcfg
WEBCFG_SOURCE:=package/webcfg
WEBCFG_DEPENDENCIES = libcgi

$(WEBCFG_DIR)/.unpacked: $(WEBCFG_SOURCE)/webcgi.c
??? mkdir -p $(WEBCFG_DIR)
??? cp $(WEBCFG_SOURCE)/webcgi.c $(WEBCFG_DIR)
??? touch $@

$(WEBCFG_DIR)/.compiled: $(WEBCFG_DIR)/.unpacked
??? $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
??????? $(WEBCFG_DIR)/webcgi.c -o $(WEBCFG_DIR)/webcgi \
??????? -I$(WEBCFG_DIR)/../libcgi-1.0/src $(WEBCFG_DIR)/../libcgi-1.0/src/libcgi.a
??? $(STRIPCMD) $(WEBCFG_DIR)/webcgi
??? touch $@

$(WEBCFG_DIR)/.installed: $(WEBCFG_DIR)/.compiled
??? $(INSTALL) -m0755 $(WEBCFG_DIR)/webcgi $(TARGET_DIR)/usr/sbin/webcgi
??? mkdir -p $(TARGET_DIR)/var/www/html
??? $(INSTALL) -m0444 package/webcfg/webconfig.html $(TARGET_DIR)/var/www/html
??? touch $@

webcgi: $(WEBCFG_DIR)/.installed

ifeq ($(BR2_PACKAGE_WEB_CONFIG_MGMT),y)
TARGETS+=webcgi
endif
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120124/766722be/attachment.html>
