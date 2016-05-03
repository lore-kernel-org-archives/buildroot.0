From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 3 May 2016 19:05:06 +0200
Subject: [Buildroot] [PATCH] ficl: new package
In-Reply-To: <20160428140435.75da877f@free-electrons.com>
References: <1461571758-19709-1-git-send-email-francois.perrad@gadz.org>
 <20160428140435.75da877f@free-electrons.com>
Message-ID: <CAB0FRstDSqLh9JZdO7s+7Nrhb4Y3a4NuVVCc9NmoC4BZ0ZpeLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-28 14:04 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 25 Apr 2016 10:09:18 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> I'm curious: are you really using this stuff? The last release dates
> back from 2010, there has been no commits in the CVS (irk!) repository
> for the last 5 years. And the previous release was made in 2004, i.e 12
> years ago. I really would like to understand if this is really used by
> you on embedded systems before accepting in Buildroot a package for
> which we know nothing will ever move upstream.
>

Yes. I'll do it.

>> diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
>> new file mode 100644
>> index 0000000..94cda8a
>> --- /dev/null
>> +++ b/package/ficl/0001-fix-Makefile.patch
>> @@ -0,0 +1,45 @@
>> +fix Makefile
>
> Please write a better description. "fix Makefile" is clearly not
> enough. Explain *what* you are fixing.

OK

>
>> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
>> new file mode 100644
>> index 0000000..142b083
>> --- /dev/null
>> +++ b/package/ficl/ficl.mk
>> @@ -0,0 +1,49 @@
>> +################################################################################
>> +#
>> +# ficl
>> +#
>> +################################################################################
>> +
>> +FICL_VERSION = 4.1.0
>> +FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl4.1
>
> Please do something like:
>
> FICL_VERSION_MAJOR = 4.1
> FICL_VERSION = $(FICL_VERSION_MAJOR).0
> FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)

OK

>
>> +FICL_LICENSE = BSD-2c
>> +FICL_LICENSE_FILES = ReadMe.txt
>> +FICL_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +FICL_EXE = ficl
>> +define FICL_INSTALL_LIB_STAGING
>> +     $(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
>> +endef
>> +else
>> +FICL_EXE = main
>> +define FICL_INSTALL_LIB_STAGING
>> +     $(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(STAGING_DIR)/usr/lib/libficl.so.$(FICL_VERSION)
>> +     ln -sf libficl.so.$(FICL_VERSION) $(STAGING_DIR)/usr/lib/libficl.so.4
>> +     ln -sf libficl.so.$(FICL_VERSION) $(STAGING_DIR)/usr/lib/libficl.so
>> +endef
>> +define FICL_INSTALL_LIB_TARGET
>> +     $(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(TARGET_DIR)/usr/lib/libficl.so.$(FICL_VERSION)
>> +     ln -sf libficl.so.$(FICL_VERSION) $(TARGET_DIR)/usr/lib/libficl.so.4
>> +     ln -sf libficl.so.$(FICL_VERSION) $(TARGET_DIR)/usr/lib/libficl.so
>> +endef
>> +endif
>
> This doesn't really take into account the BR2_SHARED_STATIC_LIBS=y
> case. What about instead something like this:
>
> ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> define FICL_INSTALL_STATIC_LIB
>         $(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
> endef
> endif
>
> ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> define FICL_INSTALL_SHARED_LIB
>         $(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
>         ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
>         ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
> endef
> endif
>
> and then:
>
> define FICL_INSTALL_STAGING_CMDS
>         $(FICL_INSTALL_STATIC_LIB,$(STAGING_DIR))
>         $(FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
>         ... install headers ...
> endef
>
> define FICL_INSTALL_TARGET_CMDS
>         $(FICL_INSTALL_STATIC_LIB,$(TARGET_DIR))
>         $(FICL_INSTALL_SHARED_LIB,$(TARGET_DIR))
>         ... install programs ...
> endef
>

OK

>> +define FICL_BUILD_CMDS
>> +     $(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
>> +     CPPFLAGS="$(TARGET_CPPFLAGS) -I. -Dlinux" $(FICL_EXE)
>
> This last line should be indented with one more tab.

OK

>
> Also, it's not clear to me why the ficl executable to build is
> different between the static case and the shared case. Can you
> elaborate on that?

See in the weird Makefile.linux

Fran?ois

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
