From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sun, 09 Jun 2013 20:36:45 +0200
Subject: [Buildroot] [PATCH 1/3] Add on2-8170 kernel modules
In-Reply-To: <20130609174038.GG4312@tarshish>
References: <1370798571-24363-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20130609174038.GG4312@tarshish>
Message-ID: <51B4CB3D.7070101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Right, two things I w   anted to change before sending ;)

v2 is incoming.

On 09/06/2013 19:40, Baruch Siach wrote:
> Hi Alexandre,
>
> On Sun, Jun 09, 2013 at 07:22:49PM +0200, Alexandre Belloni wrote:
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> ---
>>  package/Config.in                            |  1 +
>>  package/on2-8170-modules/Config.in           | 11 +++++++++++
>>  package/on2-8170-modules/on2-8170-modules.mk | 20 ++++++++++++++++++++
>>  3 files changed, 32 insertions(+)
>>  create mode 100644 package/on2-8170-modules/Config.in
>>  create mode 100644 package/on2-8170-modules/on2-8170-modules.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index ce82e99..e915abe 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -272,6 +272,7 @@ source "package/minicom/Config.in"
>>  source "package/nanocom/Config.in"
>>  source "package/neard/Config.in"
>>  source "package/ofono/Config.in"
>> +source "package/on2-8170-modules/Config.in"
>>  source "package/open2300/Config.in"
>>  source "package/openocd/Config.in"
>>  source "package/owl-linux/Config.in"
>> diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
>> new file mode 100644
>> index 0000000..b11d69e
>> --- /dev/null
>> +++ b/package/on2-8170-modules/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_ON2_8170_MODULES
>> +	bool "on2-8170 modules"
>> +	depends on BR2_LINUX_KERNEL
>> +	help
>> +	  Kernel modules for the LTTng 2.0 kernel tracing
>> +	  infrastructure.
> Are you sure?
>
>> +	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
>> +
>> +comment "on2-8170 modules requires a linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
>> new file mode 100644
>> index 0000000..87dc8f2
>> --- /dev/null
>> +++ b/package/on2-8170-modules/on2-8170-modules.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# on2-8170-modules
>> +#
>> +################################################################################
>> +
>> +ON2_8170_MODULES_VERSION = master
> We usually use a specific commit id for consistent results, since maser 
> changes when commits are added.
>
> baruch
>
>> +ON2_8170_MODULES_SITE    = git://github.com/alexandrebelloni/on2-8170-modules.git
>> +
>> +ON2_8170_MODULES_DEPENDENCIES = linux
>> +
>> +define ON2_8170_MODULES_BUILD_CMDS
>> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
>> +endef
>> +
>> +define ON2_8170_MODULES_INSTALL_TARGET_CMDS
>> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
>> +endef
>> +
>> +$(eval $(generic-package))


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
