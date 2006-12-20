From: Boris Itkis (Linux) <borisitk@fortunet.com>
Date: Wed, 20 Dec 2006 14:04:10 -0800
Subject: [Buildroot] Problem with building sudo
In-Reply-To: <20061220182814.GA26024@aon.at>
References: <4579D9F3.1070400@fortunet.com> <20061215151039.GA14633@aon.at>
	<20061215152921.GB14633@aon.at> <4582E603.7090204@fortunet.com>
	<20061220182814.GA26024@aon.at>
Message-ID: <4589B35A.90204@fortunet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Fri, Dec 15, 2006 at 10:14:27AM -0800, Boris Itkis (Linux) wrote:
>   
>> Bernhard Fischer wrote:
>>     
>>> On Fri, Dec 15, 2006 at 04:10:39PM +0100, Bernhard Fischer wrote:
>>>  
>>>       
>>>> On Fri, Dec 08, 2006 at 01:32:35PM -0800, Boris Itkis (Linux) wrote:
>>>>    
>>>>         
>>>>> sudu.mk has a problem for building:
>>>>>
>>>>> $(TARGET_DIR)/usr/bin/sudo
>>>>>
>>>>> it echo's the command to install sudu instead of running it.
>>>>>      
>>>>>           
>>>> I'll look into this.
>>>>    
>>>>         
>>> Can you update and retry? The installation is done via fakeroot, sudo
>>> didn't depend on fakeroot so may not be built for you, depending on your
>>> config.
>>>
>>>  
>>>       
>> The Part I am Refering to is:
>>
>> $(TARGET_DIR)/usr/bin/sudo: $(SUDO_DIR)/sudo
>> 	# Use fakeroot to pretend to do 'make install' as root
>> 	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>> 	$(SUDO_DIR) install" \
>> 		> $(STAGING_DIR)/.fakeroot.sudo
>> 	touch -c $(TARGET_DIR)/usr/bin/sudo
>>
>> If you execute ${STAGING_DIR)/.fakeroot.sudo it does the installation 
>> correctly.
>>
>> May I suggest that you change:
>>
>> 	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>> 	$(SUDO_DIR) install" \
>> 		> $(STAGING_DIR)/.fakeroot.sudo
>>
>> to:
>>
>> 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
>> 	$(SUDO_DIR) install \
>> 		> $(STAGING_DIR)/.fakeroot.sudo
>>
>> I believe that should fix the problem of not automatically installing sudo:
>>     
>
> what does cat .fakeroot.sudo say if you output stdout of that make
> install into it?
>
>   
the consents of .fakeroot.sudo is:

make -j1 
PATH=/opt/armtools/bin:/home/root/dist/arm-tool/buildroot/toolchain_build_arm/bin:/home/root/dist/arm-tool/buildroot/fakebin:/home/root/dist/bin:/usr/bin:/bin:/usr/sbin:/sbin 
AR=/opt/armtools/bin/arm-linux-uclibc-ar 
AS=/opt/armtools/bin/arm-linux-uclibc-as 
LD=/opt/armtools/bin/arm-linux-uclibc-ld 
NM=/opt/armtools/bin/arm-linux-uclibc-nm 
CC=/opt/armtools/bin/arm-linux-uclibc-gcc 
GCC=/opt/armtools/bin/arm-linux-uclibc-gcc 
CXX=/opt/armtools/bin/arm-linux-uclibc-g++ 
CPP=/opt/armtools/bin/arm-linux-uclibc-cpp 
RANLIB=/opt/armtools/bin/arm-linux-uclibc-ranlib 
STRIP=/opt/armtools/bin/arm-linux-uclibc-strip 
OBJCOPY=/opt/armtools/bin/arm-linux-uclibc-objcopy 
DESTDIR=/home/root/dist/arm-tool/buildroot/build_arm/root -C 
/home/root/dist/arm-tool/buildroot/build_arm/sudo-1.6.8p9 install

> Could it be that what you really need is quoting the echoed '"'?
>
> echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=\"$(TARGET_DIR)\" -C
> $(SUDO_DIR) install" > $(STAGING_DIR)/.fakeroot.sudo
>
>
>   
The other option is to change the " to a ` to tiger command execution so 
the command would look like:

	echo `$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C 
	$(SUDO_DIR) install` \
		> $(STAGING_DIR)/.fakeroot.sudo
