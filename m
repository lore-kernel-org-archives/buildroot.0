From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 13 Mar 2013 17:14:09 +0100
Subject: [Buildroot] [PATCH 3 of 3] oprofile 0.9.8: fix compilation on
	powerpc
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C06200429@4rf-nz-orion.local.4rf.com>
References: <patchbomb.1363111853@BEANTN0L019720>
 <e866a53b0e64b92f119b.1363111856@BEANTN0L019720>
 <069B5A25F9844945B625ADE7258AC94C06200429@4rf-nz-orion.local.4rf.com>
Message-ID: <CAAXf6LXsr5Jw4=q8M=oZRbaiLnOzokt_svb2dmiKqvw1oGzwHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Reuben,

On Tue, Mar 12, 2013 at 9:20 PM, Reuben Dowle <reuben.dowle@4rf.com> wrote:
> This series of patches fixes my build error I got when updating to latest buildroot sources on Friday. Fixing this was going to be my first task this Monday. Thanks!
>
> I will check everything is working on my target later today. One possible minor change below:

Thanks for your feedback.
I noticed there is still a problem with one of the patches, but I'm
already looking forward to your runtime test.
See below...

>
>> diff --git a/package/oprofile/oprofile.mk
>> b/package/oprofile/oprofile.mk
>> --- a/package/oprofile/oprofile.mk
>> +++ b/package/oprofile/oprofile.mk
>> @@ -8,7 +8,7 @@ OPROFILE_VERSION = 0.9.8
>>  OPROFILE_SITE =
>> http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-
>> $(OPROFILE_VERSION)
>>  OPROFILE_LICENSE = GPLv2+
>>  OPROFILE_LICENSE_FILES = COPYING
>> -OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
>> +OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel=$(SYSROOT_DIR)
>>  OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
>>  OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
>>  OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf
>> libabi/opimport
>> @@ -29,7 +29,19 @@ ifeq ($(OPROFILE_ARCH),)
>>  OPROFILE_ARCH = $(BR2_ARCH)
>>  endif
>>
>> -OPROFILE_DEPENDENCIES = popt binutils
>> +OPROFILE_DEPENDENCIES = popt binutils libpfm4
>
> I think this dependency is only needed for powerpc. So something like:
>
> OPROFILE_DEPENDENCIES = popt binutils
> ifeq ($(BR2_powerpc),y)
> OPROFILE_DEPENDENCIES += libpfm4
> Endif
>
> Might be better?

As far as I understand, these dependencies are only used for
build-time ordering. This means that libfm4, *if selected in the
config* will be built before oprofile. However, if libpfm4 is not
selected, and you're not on powerpc, you can still build oprofile.
The only benefit from the suggested code above, I think, is that on
non-powerpc targets the unnecessary ordering of oprofile / libpfm4 is
not enforced, but I think this will hardly give an impact on build
time.

Best regards,
Thomas
