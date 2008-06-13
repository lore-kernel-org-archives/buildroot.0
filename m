From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Fri, 13 Jun 2008 22:11:35 +1200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <20080613095801.GA31077@cloud.net.au>
References: <20080613055326.B817D3C7CA@busybox.net>
	<20080613062509.GA27054@cloud.net.au> <48522AB7.9000501@gmail.com>
	<20080613095801.GA31077@cloud.net.au>
Message-ID: <485247D7.5050708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> -$(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
>> -	(cd $(LIBUSB_DIR); rm -rf config.cache; \
>> -		$(TARGET_CONFIGURE_OPTS) \
>> -		$(TARGET_CONFIGURE_ARGS) \
>> -		ac_cv_header_regex_h=no \
>>     
>
> It looked to me like something important was lost in your patch (it
> doesn't mention ac_cv_header_regex_h anywhere after patching), but
> looking at libusb's configure script it doesn't seem to be used anyway.
>   

I looked around at a few packages (xorg, glib, gtk) and saw they used a 
really tidy makefile.
Theres a bunch of targets in packages/Makefile.autotools.in that you can 
use to automate the process of building packages.
I just rewrote the entire libusb.mk to take advantage of those targets.

>> +$(LIBUSB_TARGET_INSTALL_TARGET): $(LIBUSB_TARGET_INSTALL_STAGING)
>> +	$(call MESSAGE,"Installing to target")
>>     
>> -libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
>> +$(LIBUSB_TARGET_UNINSTALL):
>> +	$(call MESSAGE,"Uninstalling")
>>     
>
> Why the messages? Is this standard among our autotools-using packages?

Im just copying the format of the package install process in 
Makefile.autotools.in.
That and I think it looks better :)

The purpose of overriding the un/install to target is to stop the 
copying of static libs and docs to the target filesystem. Theyre still 
copied to the $(STAGING_DIR) though.

$(LIBUSB_TARGET_INSTALL_TARGET): $(LIBUSB_TARGET_INSTALL_STAGING)
    $(call MESSAGE,"Installing to target")
    cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
    $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
    $(Q)touch $@

~Matt
