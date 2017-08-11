From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 11 Aug 2017 18:39:24 +0200
Subject: [Buildroot] [PATCH v2 3/8] grub2: use grub2-tools as a host
	package
In-Reply-To: <20170716153933.4fc8024f@windsurf>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
 <20170426213953.14904-4-nunes.erico@gmail.com>
 <20170716153933.4fc8024f@windsurf>
Message-ID: <CAK4VdL2rd1S_nM=VfGcyrDkdwYO9foBuwnYEbQG4wHbGm2m4CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review and sorry for the late reply as well.
I plan to respin this soon to be reviewed (for 2017.11 now).

On Sun, Jul 16, 2017 at 3:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
>> index 171829d..f0bd2ee 100644
>> --- a/boot/grub2/grub2.mk
>> +++ b/boot/grub2/grub2.mk
>> @@ -9,7 +9,9 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
>>  GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>>  GRUB2_LICENSE = GPL-3.0+
>>  GRUB2_LICENSE_FILES = COPYING
>> -GRUB2_DEPENDENCIES = host-bison host-flex
>> +GRUB2_DEPENDENCIES = host-bison host-flex host-grub2-tools
>
> Do we still need to depend on host-bison and host-flex, now that the
> tools are built by as part of host-grub2-tools ?

I'm not sure who actually needs host-bison or host-flex, if we prefer
to rely on the transitivity I can drop them here and it will continue
working.

> Also, what in boot/grub2/grub2.mk ensures that the tools are *not*
> built ?
>
>> +GRUB2_INSTALL_TARGET = NO
>
> Grub really doesn't install anything to the target ? I thought it
> installed some modules in /usr/lib/grub2 or something like that, that
> grub2 could load dynamically at runtime. Did I miss something?

With the split, grub2-tools started to install the modules to e.g.
/usr/lib/grub/arm64-efi/*.mod. So you are right, and I had not
realized that.
Note that these modules are not needed to boot in the simplest case
though, enabling only grub2 with this patch still results in a
bootable system, at least for our cases in readme.txt.

My first thought now is that these modules should be kept being
installed by grub2 and not be moved to grub2-tools, so I'll revisit
this. Maybe to make it simpler we could drop grub2-tools (target) and
only keep host-grub2-tools? The downside is that the installation of
the grub2 user space tools in the target would end up being not
optional.

>>  # Grub2 is kind of special: it considers CC, LD and so on to be the
>>  # tools to build the native tools (i.e to be executed on the build
>>  # machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
>> -# TARGET_LDFLAGS to build the bootloader itself. However, to add to
>> -# the confusion, it also uses NM, OBJCOPY and STRIP to build the
>> -# bootloader itself; none of these are used to build the native
>> -# tools.
>> +# TARGET_LDFLAGS to build the bootloader itself.
>
> It is not clear to me what is happening now: you no longer pass
> HOST_CONFIGURE_OPTS in GRUB2_CONF_ENV, but we continue to pass
> TARGET_CC/TARGET_CFLAGS/TARGET_CPPFLAGS, etc.
>
> So at the very least, the comment needs to be updated.
>
>>  #
>>  # NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
>>  # use the cross compile variant to ensure grub2 builds
>>
>>  GRUB2_CONF_ENV = \
>> -     $(HOST_CONFIGURE_OPTS) \
>> -     CPP="$(HOSTCC) -E" \
>> +     CPP="$(TARGET_CC) -E" \
>>       TARGET_CC="$(TARGET_CC)" \
>>       TARGET_CFLAGS="$(TARGET_CFLAGS)" \
>>       TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
>>       TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
>> -     NM="$(TARGET_NM)" \
>> -     OBJCOPY="$(TARGET_OBJCOPY)" \
>> -     STRIP="$(TARGET_CROSS)strip"
>> +     TARGET_NM="$(TARGET_NM)" \
>> +     TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
>> +     TARGET_STRIP="$(TARGET_CROSS)strip"
>
> This is the part that confuses me.

This is to intentionally build everything for the target, and leave
anything that has to be built for the host to host-grub2-tools.
I can check if we can drop more of these variables. I was hoping here
to change as little as possible to keep this working and not to have
an even more complex patchset, so that we could continue with a
cleanup on this in further patches.

>> diff --git a/package/grub2-tools/grub2-tools.mk b/package/grub2-tools/grub2-tools.mk
>> index 8bf1a31..f98f4aa 100644
>> --- a/package/grub2-tools/grub2-tools.mk
>> +++ b/package/grub2-tools/grub2-tools.mk
>> @@ -10,6 +10,10 @@ GRUB2_TOOLS_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>>  GRUB2_TOOLS_LICENSE = GPLv3+
>>  GRUB2_TOOLS_LICENSE_FILES = COPYING
>>  GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
>> +HOST_GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
>> +
>> +HOST_GRUB2_TOOLS_CONF_ENV = \
>> +     CPP="$(HOSTCC) -E"
>>
>>  GRUB2_TOOLS_CONF_ENV = \
>>       CPP="$(TARGET_CC) -E" \
>> @@ -29,4 +33,7 @@ GRUB2_TOOLS_CONF_OPTS = \
>>       --enable-libzfs=no \
>>       --disable-werror
>>
>> +HOST_GRUB2_TOOLS_CONF_OPTS = $(GRUB2_TOOLS_CONF_OPTS)
>> +
>>  $(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>
> Perhaps adding a host variant for the grub2-tools package could have
> been a separate patch. But that's not a big deal, the above
> questions/comments are much more important.

I can do this for v3.
