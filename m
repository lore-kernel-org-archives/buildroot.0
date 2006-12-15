From: Boris Itkis (Linux) <borisitk@fortunet.com>
Date: Fri, 15 Dec 2006 10:14:27 -0800
Subject: [Buildroot] Problem with building sudo
In-Reply-To: <20061215152921.GB14633@aon.at>
References: <4579D9F3.1070400@fortunet.com> <20061215151039.GA14633@aon.at>
	<20061215152921.GB14633@aon.at>
Message-ID: <4582E603.7090204@fortunet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Fri, Dec 15, 2006 at 04:10:39PM +0100, Bernhard Fischer wrote:
>   
>> On Fri, Dec 08, 2006 at 01:32:35PM -0800, Boris Itkis (Linux) wrote:
>>     
>>> sudu.mk has a problem for building:
>>>
>>> $(TARGET_DIR)/usr/bin/sudo
>>>
>>> it echo's the command to install sudu instead of running it.
>>>       
>> I'll look into this.
>>     
>
> Can you update and retry? The installation is done via fakeroot, sudo
> didn't depend on fakeroot so may not be built for you, depending on your
> config.
>
>   
The Part I am Refering to is:

$(TARGET_DIR)/usr/bin/sudo: $(SUDO_DIR)/sudo
	# Use fakeroot to pretend to do 'make install' as root
	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C $(SUDO_DIR) install" \
		> $(STAGING_DIR)/.fakeroot.sudo
	touch -c $(TARGET_DIR)/usr/bin/sudo

If you execute ${STAGING_DIR)/.fakeroot.sudo it does the installation 
correctly.

May I suggest that you change:

	echo "$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C $(SUDO_DIR) install" \
		> $(STAGING_DIR)/.fakeroot.sudo

to:

	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR="$(TARGET_DIR)" -C $(SUDO_DIR) install \
		> $(STAGING_DIR)/.fakeroot.sudo

I believe that should fix the problem of not automatically installing sudo:
>>> It generally does not stop compile because on distributions like fedora 
>>> because "touch -c" has a exit code of 0 even if the file does no exist.
>>>       
>> That's a bug.
>>     
>
> Nah, it's of course not. Not exiting with ACK would have been.
> Note to self: the character '0' denotes 0, not 1 ;)
>
>
>   
This is or is not a bug depending on your perspective. If one just 
wishes to display to the user that there is a problem and possibly stop 
compilation then it's not a bug. If one wants to always stop if the file 
does not exist then it is a bug.

If one believes this is a bug then may I suggest that "touch -c" be 
changed to "test -f" or add a "test -f" line after the "touch -c" line.
