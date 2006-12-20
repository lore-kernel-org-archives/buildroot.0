From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 20 Dec 2006 19:28:15 +0100
Subject: [Buildroot] Problem with building sudo
In-Reply-To: <4582E603.7090204@fortunet.com>
References: <4579D9F3.1070400@fortunet.com> <20061215151039.GA14633@aon.at>
	<20061215152921.GB14633@aon.at> <4582E603.7090204@fortunet.com>
Message-ID: <20061220182814.GA26024@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 15, 2006 at 10:14:27AM -0800, Boris Itkis (Linux) wrote:
>Bernhard Fischer wrote:
>>On Fri, Dec 15, 2006 at 04:10:39PM +0100, Bernhard Fischer wrote:
>>  
>>>On Fri, Dec 08, 2006 at 01:32:35PM -0800, Boris Itkis (Linux) wrote:
>>>    
>>>>sudu.mk has a problem for building:
>>>>
>>>>$(TARGET_DIR)/usr/bin/sudo
>>>>
>>>>it echo's the command to install sudu instead of running it.
>>>>      
>>>I'll look into this.
>>>    
>>
>>Can you update and retry? The installation is done via fakeroot, sudo
>>didn't depend on fakeroot so may not be built for you, depending on your
>>config.
>>
>>  
>The Part I am Refering to is:
>
>$(TARGET_DIR)/usr/bin/sudo: $(SUDO_DIR)/sudo
>	# Use fakeroot to pretend to do 'make install' as root
>	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>	$(SUDO_DIR) install" \
>		> $(STAGING_DIR)/.fakeroot.sudo
>	touch -c $(TARGET_DIR)/usr/bin/sudo
>
>If you execute ${STAGING_DIR)/.fakeroot.sudo it does the installation 
>correctly.
>
>May I suggest that you change:
>
>	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>	$(SUDO_DIR) install" \
>		> $(STAGING_DIR)/.fakeroot.sudo
>
>to:
>
>	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>	$(SUDO_DIR) install \
>		> $(STAGING_DIR)/.fakeroot.sudo
>
>I believe that should fix the problem of not automatically installing sudo:

what does cat .fakeroot.sudo say if you output stdout of that make
install into it?

Could it be that what you really need is quoting the echoed '"'?

echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=\"$(TARGET_DIR)\" -C
$(SUDO_DIR) install" > $(STAGING_DIR)/.fakeroot.sudo
