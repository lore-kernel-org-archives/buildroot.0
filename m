From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Sep 2007 10:47:08 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lm-sensors
In-Reply-To: <20070914092913.GA26234@aon.at>
References: <20070901180109.C927EA5D29@busybox.net>	<12670634.post@talk.nabble.com>
	<20070914092913.GA26234@aon.at>
Message-ID: <46EA589C.3060407@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,

Meant to say thank you for adding this package. I managed to get it 
building with the following patch:

Index: package/lm-sensors/lm-sensors.mk
===================================================================
--- package/lm-sensors/lm-sensors.mk	(revision 19797)
+++ package/lm-sensors/lm-sensors.mk	(working copy)
@@ -40,6 +40,10 @@
  $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): 
$(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
  	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
  	$(STRIP) $(STRIP_STRIP_ALL) $@
+	cp -dpf $(LM_SENSORS_DIR)/etc/sensors.conf.eg 
$(TARGET_DIR)/etc/sensors.conf
+	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so.3.1.4 $(TARGET_DIR)/lib
+	(cd $(TARGET_DIR)/lib && ln -s libsensors.so.3.1.4 libsensors.so.3)
+	(cd $(TARGET_DIR)/lib && ln -s libsensors.so.3 libsensors.so)

  lm-sensors: uclibc libsysfs $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)

Bernhard Fischer wrote:
> On Fri, Sep 14, 2007 at 01:15:13AM -0700, Hebbar wrote:
>> Hi aldot,
> 
> Hi Gururaja
>>  make mklibs fails for lm-sensors because of missing lib libsensors.so.3.
>> When i searched i actually found it in $(LM_SENSORS_DIR)/lib/ folder
>> symbolically linked to libsensors.so.3.1.4. so i think we need to copy it
>>from here to root/usr/lib directory as the sensors binary is placed there.
> 
> Can you send a tested patch, please?
> 
> TIA,
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
