From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 May 2015 18:33:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/libepoxy: Fix OpenGL /
	EGL dependencies
References: <1430575630-11283-1-git-send-email-bernd.kuhls@t-online.de>
 <20150502165439.149f55a2@free-electrons.com>
Message-ID: <XnsA48EBCC9086CEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150502165439.149f55a2 at free-
electrons.com:

> Dear Bernd Kuhls,
> 
> On Sat,  2 May 2015 16:07:09 +0200, Bernd Kuhls wrote:
> 
>> -     depends on BR2_PACKAGE_MESA3D
>> +     depends on BR2_PACKAGE_HAS_LIBEGL
> 
>     || HAS_LIBGL ?

libepoxy contains code to check for the presence of libgl:
https://github.com/anholt/libepoxy/blob/7422de5b4be7b19d789136b3bb5f932de42
db27c/configure.ac#L153

as an optional dependency

checking for EGL... yes
[...]
checking for X11... yes
checking for GL... no

But EGL is a hard dependency as proven by the autobuild error I am trying 
to fix.

>> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>> +LIBEPOXY_CONF_ENV = \
>> +     CFLAGS="$(TARGET_CFLAGS) \
>> +          -I$(STAGING_DIR)/usr/include/IL \
>> +          -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
>> +          -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
>> +endif
> 
> Shouldn't we instead be using pkg-config here?

Yes, good idea. I will backport this patch:
https://github.com/anholt/libepoxy/commit/d56f21c494b315306215c4730835a9b29
1360e9b

Even with this new patch configure fails when EGL is missing:

checking for EGL... no
configure: error: Package requirements (egl) were not met:

Package egl was not found in the pkg-config search path.
Perhaps you should add the directory containing `egl.pc'
to the PKG_CONFIG_PATH environment variable
No package 'egl' found

Regards, Bernd
