From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 06 Dec 2010 14:29:39 -0600
Subject: [Buildroot] [PATCH] add insserv to use LSB compliant init
 scripts and dynamically configure init order
In-Reply-To: <20101206210924.75330f3d@surf>
References: <96b265c099c9a9d7673ed6061aa562878ac45be0.1291587953.git.smiley73@users.sourceforge.net>
	<20101206210924.75330f3d@surf>
Message-ID: <20101206142939.363466ukki3ve10k@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun,  5 Dec 2010 16:26:19 -0600
> heiko at zuerker.org wrote:
>
>> +config BR2_PACKAGE_INSSERV
>> +	bool "insserv"
>> +	help
>> +	  This small package provides a tool for process controlling
>> +	  in System V boot scripts.
>> +	  It works for LSB compliant init scripts.
>> +	  http://wiki.debian.org/LSBInitScripts
>
> Just curious, how do you use this in the context of Buildroot ?

I'm currently trying to get buildroot working as a build system for  
Devil-Linux.
Unfortunately I can't go the minimalistic route with most things,  
since I need to stay aligned with the current stable release.

> By default, Buildroot uses Busybox init, which isn't SysV compliant (it
> doesn't support runlevels). And how would this interact with the
> Buildroot build process ?

I call it as part of BR2_ROOTFS_POST_BUILD_SCRIPT, in order to get the  
init scripts ordered initially.
Later we do use insserv during upgrades, to fix any new dependencies.

Insserv works only with BR2_PACKAGE_SYSVINIT, maybe I should add this  
as a dependency.

>> +#INSSERV_DEPENDENCIES=zlib
>> +#HOST_INSSERV_DEPENDENCIES=host-zlib
>
> Useful ? Comments ?

Nope, just me forgetting to clean up my stuff after I copy scripts.

>> +define INSSERV_CONFIGURE_CMDS
>> +	echo "#!/bin/sh" > $(@D)/tests/common
>> +	echo "exit 0" >> $(@D)/tests/common
>> +	chmod +x $(@D)/tests/common
>> +endef
>> +
>> +define HOST_INSSERV_CONFIGURE_CMDS
>> +	echo "#!/bin/sh" > $(@D)/tests/common
>> +	echo "exit 0" >> $(@D)/tests/common
>> +	chmod +x $(@D)/tests/common
>> +endef
>
> Those sound strange. Maybe a short comment above would clarify a bit.

Okay I'll add that.
It's basically just disabling some tests, which would fail otherwise.

> Thanks!

I'm still learning how buildroot works, so my apologies for any  
patches I sent in which need fixing.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
