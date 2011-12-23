From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 23 Dec 2011 09:26:18 +0100
Subject: [Buildroot] [PATCH v4 5/5] New package: python-netifaces
In-Reply-To: <4EF31EEC.2090401@visionsystems.de>
References: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
 <1324555715-32123-6-git-send-email-yegorslists@googlemail.com>
 <4EF31EEC.2090401@visionsystems.de>
Message-ID: <4EF43B2A.7080608@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.12.2011 13:13, schrieb Yegor Yefremov:
> Am 22.12.2011 13:08, schrieb yegorslists at googlemail.com:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/Config.in                            |    1 +
>>  package/python-netifaces/Config.in           |    9 +++++++++
>>  package/python-netifaces/python-netifaces.mk |   26 ++++++++++++++++++++++++++
>>  3 files changed, 36 insertions(+), 0 deletions(-)
>>  create mode 100644 package/python-netifaces/Config.in
>>  create mode 100644 package/python-netifaces/python-netifaces.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 71e1889..666a224 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -240,6 +240,7 @@ if BR2_PACKAGE_PYTHON
>>  menu "external python modules"
>>  source "package/python-dpkt/Config.in"
>>  source "package/python-mad/Config.in"
>> +source "package/python-netifaces/Config.in"
>>  source "package/python-serial/Config.in"
>>  source "package/python-setuptools/Config.in"
>>  endmenu
>> diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
>> new file mode 100644
>> index 0000000..199191c
>> --- /dev/null
>> +++ b/package/python-netifaces/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_PYTHON_NETIFACES
>> +	bool "python-netifaces"
>> +	depends on BR2_PACKAGE_PYTHON
>> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS
>> +	help
>> +	  Portable access to network interfaces from Python.
>> +
>> +	  http://alastairs-place.net/projects/netifaces
>> +
>> diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
>> new file mode 100644
>> index 0000000..9a626ef
>> --- /dev/null
>> +++ b/package/python-netifaces/python-netifaces.mk
>> @@ -0,0 +1,26 @@
>> +#############################################################
>> +#
>> +# python-netifaces
>> +#
>> +#############################################################
>> +
>> +PYTHON_NETIFACES_VERSION = 0.6
>> +PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
>> +PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
>> +
>> +PYTHON_NETIFACES_DEPENDENCIES = python host-python-setuptools
>> +
>> +define PYTHON_NETIFACES_BUILD_CMDS
>> +	(cd $(@D); \
>> +		CC="$(TARGET_CC)"		\
>> +	$(HOST_DIR)/usr/bin/python setup.py build)
>> +endef
>> +
>> +define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
>> +	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
>> +	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
>> +endef
>> +
>> +
>> +$(eval $(call GENTARGETS))
>> +
> 
> This is what I get:
> 
>>>> python-netifaces 0.6 Building
> (cd /home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/python-netifaces-0.6; CC="/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/bin/arm-none-linux-gnueabi-gcc" /home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/bin/python setup.py build)
> running build
> running build_ext
> checking for getifaddrs... not found. (cached)
> checking for getnameinfo... not found. (cached)
> checking for socket IOCTLs... not found. (cached)
> checking for optional header files... netash/ash.h netatalk/at.h netax25/ax25.h neteconet/ec.h netipx/ipx.h netpacket/packet.h linux/irda.h linux/atm.h linux/llc.h linux/tipc.h linux/dn.h. (cached)
> checking whether struct sockaddr has a length field... no. (cached)
> checking which sockaddr_xxx structs are defined... at ax25 in in6 ipx un ash ec ll atmpvc atmsvc dn irda llc. (cached)
> building 'netifaces' extension
> /home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/bin/arm-none-linux-gnueabi-gcc -fno-strict-aliasing -O2 -I/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/include -I/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -DHAVE_NETASH_ASH_H=1 -DHAVE_NETATALK_AT_H=1 -DHAVE_NETAX25_AX25_H=1 -DHAVE_NETECONET_EC_H=1 -DHAVE_NETIPX_IPX_H=1 -DHAVE_NETPACKET_PACKET_H=1 -DHAVE_LINUX_IRDA_H=1 -DHAVE_LINUX_ATM_H=1 -DHAVE_LINUX_LLC_H=1 -DHAVE_LINUX_TIPC_H=1 -DHAVE_LINUX_DN_H=1 -DHAVE_SOCKADDR_AT=1 -DHAVE_SOCKADDR_AX25=1 -DHAVE_SOCKADDR_IN=1 -DHAVE_SOCKADDR_IN6=1 -DHAVE_SOCKADDR_IPX=1 -DHAVE_SOCKADDR_UN=1 -DHAVE_SOCKADDR_ASH=1 -DHAVE_SOCKADDR_EC=1 -DHAVE_SOCKADDR_LL=1 -DHAVE_SOCKADDR_ATMPVC=1 -DHAVE_SOCKADDR_ATMSVC=1 -DHAVE_SOCKADDR_DN=1 -DHAVE_SOCKADDR_IRDA=1 -DHAVE_SOCKADDR_LLC=1 -I/home/YegorYefremov/projects/versioned/tests/br-queue-python/output
/h
> ost/usr/include/python2.7 -c netifaces.c -o build/temp.linux-x86_64-2.7/netifaces.o
> In file included from /home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/include/python2.7/Python.h:58:0,
>                  from netifaces.c:1:
> /home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/include/python2.7/pyport.h:849:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
> netifaces.c:143:6: error: #error You need to add code for your platform.
> netifaces.c:268:1: warning: 'string_from_sockaddr' defined but not used
> netifaces.c:360:1: warning: 'add_to_family' defined but not used
> error: command '/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/bin/arm-none-linux-gnueabi-gcc' failed with exit status 1
> 
> Even if I cheat and let the test for getifaddrs etc. be successful and netifaces.c gets cross-compiled, the process failed as setup.py tries to create a library and uses gcc instead of cross-compiler. Any ideas?

Have found some resources, but still don't really understand, how to use it in BR:

http://whatschrisdoing.com/blog/2009/10/16/cross-compiling-python-extensions/
http://pypi.python.org/pypi/distutilscross

I've installed distutilscross and exported the needed environment variables, but setup.py still doesn't take specified crosscompiler while checking for headers (renamed output/host/usr/bin/arm-none-linux-gnueabi-gcc and setup.py didn't complain). Another thing that I don't really understand, how should distutilscross help if I don't include this package?

Yegor
