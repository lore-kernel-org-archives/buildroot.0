From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Feb 2014 14:10:09 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <20140205134957.463211f6@skate>
References: <patchbomb.1391597406@argentina>
 <ab1e96c7872d5567b2a4.1391597410@argentina>
 <20140205134957.463211f6@skate>
Message-ID: <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 5, 2014 at 1:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 05 Feb 2014 11:50:10 +0100, Thomas De Schampheleire wrote:
>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -332,7 +332,6 @@ ifneq ($(BR2_LARGEFILE),y)
>>  DISABLE_LARGEFILE= --disable-largefile
>>  endif
>>
>> -ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>>  # The configure option varies, but since unknown options are ignored
>>  # we can pass all of them.
>>  DISABLE_DOCUMENTATION = \
>> @@ -342,7 +341,6 @@ DISABLE_DOCUMENTATION = \
>>       --disable-documentation \
>>       --with-xmlto=no \
>>       --with-fop=no
>> -endif
>
> So the DISABLE_DOCUMENTATION variable now always has the same value,
> and is only used in pkg-autotools.mk in one place. So I believe it
> makes sense to remove this variable altogether, and simply pass all the
> appropriate --<something> options directly in the <pkg>_CONFIGURE_CMDS
> of pkg-autotools.mk.

OK.
By the way, I added on my own todo list that we should try to expand
the automatically passed options, for example:
--disable-manpages --disable-man-pages --disable-manuals etc. as some
of them are used in several packages...

>
>
>> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
>> --- a/package/kmod/kmod.mk
>> +++ b/package/kmod/kmod.mk
>> @@ -19,12 +19,9 @@ KMOD_LICENSE_FILES = libkmod/COPYING
>>  # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
>>  KMOD_CONF_OPT = --disable-static --enable-shared
>>
>> -# manpages not installed to host and needs xsltproc
>> +# manpages not installed and needs xsltproc
>>  HOST_KMOD_CONF_OPT = --disable-manpages
>> -
>> -ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>>  KMOD_CONF_OPT += --disable-manpages
>> -endif
>
> Then merge this KMOD_CONF_OPT += line with the existing KMOD_CONF_OPT
> line above.

I did not do that because the --disable-static --enable-shared setting
is accompanied with a comment:
# static linking not supported, see
# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
KMOD_CONF_OPT = --disable-static --enable-shared

and I felt that adding --disable-manpages here would be confusing.
With this extra info, what is your position?

>
>> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
>> --- a/package/netsnmp/netsnmp.mk
>> +++ b/package/netsnmp/netsnmp.mk
>> @@ -44,9 +44,7 @@ else
>>  endif
>>
>>  # Docs
>> -ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>> -     NETSNMP_CONF_OPT += --disable-manuals
>> -endif
>> +NETSNMP_CONF_OPT += --disable-manuals
>
> Ditto here. Now that it is no longer conditional, you can add
> --disable-manuals to the already existing NETSNMP_CONF_OPT
> unconditional definition.

Here I agree, I will change it.

Best regards,
Thomas
