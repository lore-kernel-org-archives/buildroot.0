From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 07 Sep 2014 22:27:19 +0200
Subject: [Buildroot] [PATCH v6] bcache-tools: Adding package.
In-Reply-To: <20140907091826.GA31418@free.fr>
References: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
 <20140906104208.GA3957@free.fr> <540C076B.30901@tribudubois.net>
 <20140907091406.GA4230@free.fr> <20140907091826.GA31418@free.fr>
Message-ID: <540CBFA7.3070603@tribudubois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/07/2014 11:18 AM, Yann E. MORIN a ?crit :
> Jean-Christophe, All,
>
> On 2014-09-07 11:14 +0200, Yann E. MORIN spake thusly:
>> On 2014-09-07 09:21 +0200, Jean-Christophe DUBOIS spake thusly:
>>> Le 09/06/2014 12:42 PM, Yann E. MORIN a ?crit :
>> [--SNIP--]
>>>>> diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
>>>>> new file mode 100644
>>>>> index 0000000..880bf5e
>>>>> --- /dev/null
>>>>> +++ b/package/bcache-tools/bcache-tools.mk
>>>>> @@ -0,0 +1,31 @@
>>>>> +################################################################################
>>>>> +#
>>>>> +# bcache-tools
>>>>> +#
>>>>> +################################################################################
>>>>> +
>>>>> +BCACHE_TOOLS_VERSION = v1.0.7
>>>>> +BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
>>>>> +BCACHE_TOOLS_LICENSE = GPLv2
>>>>> +BCACHE_TOOLS_LICENSE_FILES = COPYING
>>>>> +BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev
>>>> ... so you do not need to depend on it here, just in the Config.in file.
>>> Well, I need to make sure that "udev" is build before bcache-tools because
>>> it tries to put files in the /lib/udev/ directory of the target file system
>>> ans this directory doesn't exist before the udev package is built.
>> In this case, just add:
>>
>>      # bcache-tools forgets to create the required directory... :-/
>>      define BCACHE_TOOLS_UDEV_DIR
>>          mkdir -p $(TARGET_DIR)/lib/udev/
>>      endef
>>      BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_UDEV_DIR
>>
>> And you're done. ;-)
> Of course, since cafeine hasn't yet fully kicked-in in my body, this
> can/should be squashed in the existing PRE_INSTALL hook which creates
> the man8 directory.

OK, I'll do it this way.

Now just for my information, why is it better to force the creation of a 
missing directory rather
than force as a dependency the build of the package bringing this directory?

JC

>
> Regards,
> Yann E. MORIN.
>
