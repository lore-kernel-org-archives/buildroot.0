From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Thu, 20 Nov 2008 19:13:31 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <e4c675870811200656l75ad07b8l253459fa0a3e47a6@mail.gmail.com>
References: <20081111183231.E74AC3C989@busybox.net>
	<e4c675870811200656l75ad07b8l253459fa0a3e47a6@mail.gmail.com>
Message-ID: <COL102-DS1115F46E4B6337F6BB1B92DC0C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agreed, if someone else does not get there first I will try to apply 
tomorrow and save you guys.
I will then be posting my patch to allow support for using central cache 
file (saves configure time)
I then may post a patch for people to try that uses sysroot and isysroot

Cheers
Dan
--------------------------------------------------
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Sent: Thursday, November 20, 2008 2:56 PM
To: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package

> 2008/11/11  <tpetazzoni@uclibc.org>:
>> Author: tpetazzoni
>> Date: 2008-11-11 10:32:31 -0800 (Tue, 11 Nov 2008)
>> New Revision: 24000
>>
>> Log:
>> Fix external toolchain build
>
> While you are looking for a better solution I think this patch will
> save internal toolchain users from a lot of problems
>
> roberto at rafbook:~/gles/buildroot$ svn diff -r24103 package/Makefile.in
> Index: package/Makefile.in
> ===================================================================
> --- package/Makefile.in (revision 24103)
> +++ package/Makefile.in (working copy)
> @@ -38,8 +38,10 @@
> #########################################################################
> ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
> TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
> - -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \
> - -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link
> -Wl,$(STAGING_DIR)/usr/lib
> + -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
> +ifneq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),)
> +TARGET_CFLAGS+=-Wl,--rpath-link -Wl,$(STAGING_DIR)/lib
> -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
> +endif
> TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
> ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
> TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
> @@ -91,8 +93,10 @@
> #########################################################################
> else
> TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
> - -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include \
> - -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link
> -Wl,$(STAGING_DIR)/usr/lib
> + -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include
> -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
> +ifneq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),)
> +TARGET_CFLAGS+=-Wl,--rpath-link -Wl,$(STAGING_DIR)/lib
> -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
> +endif
> TARGET_CXXFLAGS=$(TARGET_CFLAGS)
> TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
> endif
>
> --
> /roberto
>



> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
