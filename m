From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Oct 2014 18:14:40 +0200
Subject: [Buildroot] [PATCH] set simple network setup via the system
 configuration submenu
In-Reply-To: <713198091.26528967.1413214443914.JavaMail.root@openwide.fr>
References: <713198091.26528967.1413214443914.JavaMail.root@openwide.fr>
Message-ID: <543D4BF0.90709@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?my,
>>> With regards to systemd, as far as I could figure it still uses
>>> /etc/network/interfaces but with different names. AFAIU there is no
>>> sane
>>> default to replace the "eth0" name so I did not put a different
>>> default
>>> when systemd is used
>> I checked on my Fedora machine that use systemd and there is no
>> directory /etc/network.
>> Instead there is a /etc/networks file.
>> But I don't know systemd so much...
>
> * systemv init
>
> configuration is done by net-utils (or busybox) via /etc/network/*
>
> inittab calls /etc/rc.d/S40network which calls ifup -a
>
> (this file is part of skeleton/ so is always here)
>
> this is the well known configuration infrastructure we all know and
> love.
>
>
> * systemd without networkd
>
> buildroot will automatically add a network.service which will do
> the equivalent of S40network (i.e : call "ifup -a") The same
> infrastructue is used, so the script still works
>
> * systemd with networkd
>
> systemd-networkd is in charge of setting up the network using
> systemd rules it will find throughout the filesystem
> (/etc/systemd/network /usr/lib/systemd/network)
>
> I don't generate a networkd rule in this case. I don't know if
> this is a wanted feature. I'll have a look at how complicated
> this is...
ok
>>> ---
>>>    Makefile                               |  1 +
>>>    support/scripts/generate-interfaces.sh | 75
>>>    ++++++++++++++++++++++++++++++++
>>>    system/Config.in                       | 78
>>>    ++++++++++++++++++++++++++++++++++
>>>    3 files changed, 154 insertions(+)
>>>    create mode 100755 support/scripts/generate-interfaces.sh
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e788f1b..71cad7d 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -477,6 +477,7 @@ $(BUILD_DIR)/.root:
>>>    	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
>>>    	@mkdir -p $(TARGET_DIR)/usr
>>>    	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>>> +	./support/scripts/generate-interfaces.sh $(TARGET_DIR)
>> generate-interfaces.sh is only called when the target directory is
>> created.
>> What happen if the Buildroot's configuration is modified ?
>> What's about calling this script from target-finalize ?
>>
>> If unlikely another interfaces file exist on the overlay directory
>> which
>> network configuration must be used ?
>>
> I have moved this to system/system.mk which is where most of
> the system submenu stuff is added. These are all added to
> TARGET_FINALIZE which works for me. If a user adds an
> overlay, the overlay is applied after TARGET_FINALIZE so
> the user's version of the file would be use, which seems to
> me like the correct behaviour
I'm agree with you.
>> Also, $(TOPDIR) must be used here instead of '.'
> fixed, will respin
[snip]
>>> +
>>> +config BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
>>> +	bool "IPv4 with parameters manually specified"
>>> +	help
>>> +	   Configure IPv4 by specifying each parameter separately
>>> +endchoice
>>> +
>>> +if BR2_SIMPLE_NETWORK_1_IPV4_MANUAL
>>> +config BR2_SIMPLE_NETWORK_1_IPV4_ADDRESS
>>> +	string "IP Address of the first network interface"
>>> +
>>> +config BR2_SIMPLE_NETWORK_1_IPV4_NETMASK
>>> +	string "Netmask of the first network interface"
>>> +
>>> +config BR2_SIMPLE_NETWORK_1_IPV4_BROADCAST
>>> +	string "Broadcast Address of the first network interface"
>>> +
>>> +config BR2_SIMPLE_NETWORK_1_IPV4_GATEWAY
>>> +	string "Address of the gateway for the first network interface"
>>> +endif
>> These configs settings needs a default value (like for the interface
>> name)
>> otherwise the script generate-interface will fail if only
>> BR2_SIMPLE_NETWORK_1_IPV4_MANUAL has been selected.
> Yes, that's on purpose... There is no sane default afaik for IP
> address when nothing is known on about the intranet topology...
I understand but I'm thinking about autobuilders here.
The autobuilder will randomly enable BR2_SIMPLE_NETWORK_1_IPV4_MANUAL in the
configuration without set any value in other BR2_SIMPLE_NETWORK_1_IPV4_.

> I am opened to any suggestion on default values but I think it's
> safer to consider this an incorrect setup and refuse to build
An exception may be added in autobuilders to prevent to build with
BR2_SIMPLE_NETWORK_1_IPV4_MANUAL set ? Through ?

>
>
> At this point i'll wait a couple of days for extra comments and i'll
> look into networkd generation.
>
> After that I will respin the patch...
Ok, thanks.

Best regards,
Romain
