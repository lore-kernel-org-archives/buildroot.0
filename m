From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun, 30 Oct 2016 18:31:05 -0400
Subject: [Buildroot] [PATCH v2 5/5] lttng-babeltrace: bump to version
	1.4.0
In-Reply-To: <20161030220658.GJ18077@free.fr>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-6-eeppeliteloop@gmail.com>
 <20161030220658.GJ18077@free.fr>
Message-ID: <CAB4xu_3G7HfqEwK6D0vBG05FOYCpaSCsgzMTqT-CHnJddmuHiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 30, 2016 at 6:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Philippe, All,
>
> On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
>> Current patches are dropped because they were merged upstream.
>>
>> Official Babeltrace's website changed from
>> <http://www.efficios.com/babeltrace> to <http://diamon.org/babeltrace>.
>>
>> Official upstream site of Babeltrace for the distribution of tarballs
>> changed from lttng.org to efficios.com (see
>> <http://diamon.org/babeltrace>).
>
> Also, the package has changed name from "lttng-babeltrace" to just
> "babeltrace". Maybe we could reflect this change in Buildroot as well?
>
> If so, do not forget to add an entry in Config.in.legacy.

I remember trying to do this once, and you guys nacked me because
"there always has been pushback from Peter against gratuitous
renaming". My patch did not include an entry in `Config.in.legacy`,
however.

If you're willing, I can rename it in another patch after bumping to v1.4.0.

>
>> I'm removing the host package build, as users can get Babeltrace on
>> major Linux distributions using their package manager.
>
> This should be a separate patch (but see my other comment in my previous
> reply to patch 3/5).
>
>> Since Babeltrace 1.4, there is support for printing debug information
>> along with compatible traces and event records. Babeltrace needs
>> elfutils in this case. If elfutils exists in the BR image, then this
>> feature is enabled.
>
> So, we discussed this with Philippe on IRC, but elfutils is not always
> available. It needs glibc or uClibc, and is not availa for musl. Also,
> it needs shared libs and wchar.
>
> However, lttng-babeltrace by itself does not have all of those
> requirements, so Philippe was wondering how to inform the user that
> debugging info would not be available in those cases.
>
> I think adding a kconfig comment in that case is appropriate (see
> below).
>
>> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> [--SNIP--]
>> diff --git a/package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch b/package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>> new file mode 100644
>> index 0000000..831a04c
>> --- /dev/null
>> +++ b/package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>> @@ -0,0 +1,30 @@
>> +From d3cce60dfde30bd2fd67caa3fbc5f111131c243a Mon Sep 17 00:00:00 2001
>> +From: Philippe Proulx <eeppeliteloop@gmail.com>
>> +Date: Fri, 28 Oct 2016 01:48:25 -0400
>> +Subject: [PATCH] configure.ac: remove elfutils version test for Buildroot
>> +
>> +The AX_LIB_ELFUTILS macro builds an executable file and executes it to
>> +discover the version of elfutils. Obviously we cannot execute a
>> +cross-compiled program here, hence this test is removed because we know
>> +that elfutils's version is greater than 0.154 anyway in Buildroot.
>
> It's a pity we can't feed it with the result, with one of the ac_cv_*
> cache variables. :-(

Yes it scks.

>
> Maybe you could push such a feature upstream, so we can use it at the
> next release?

I will. I'll make sure the next BR release does not need to patch any of the
LTTng/Babeltrace projects.

>
> [--SNIP--]
>> diff --git a/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch b/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
>> new file mode 100644
>> index 0000000..641835c
>> --- /dev/null
>> +++ b/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
>> @@ -0,0 +1,36 @@
>> +From 27e37d2621317d25e08ba0683bf8540b05b9347d Mon Sep 17 00:00:00 2001
>> +From: Philippe Proulx <eeppeliteloop@gmail.com>
>> +Date: Fri, 28 Oct 2016 02:09:20 -0400
>> +Subject: [PATCH] tests/lib/Makefile.am: remove unneeded -static flag
>> +
>> +Having those -static flags breaks the build in shared-only builds.
>> +
>> +Upstream does not even know why those flags are passed here, and they
>> +are about to remove them as of this date.
>
> Please, add a pointer to the upstream discussion about those flags.

It happened on IRC but I will create a PR and point to it.

>
>> diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
>> index d362779..8aafc6d 100644
>> --- a/package/lttng-babeltrace/Config.in
>> +++ b/package/lttng-babeltrace/Config.in
>> @@ -14,18 +14,19 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
>>         to/from another trace format.
>>
>>         Babeltrace is the reference implementation of the Common
>> -       Trace Format (see <http://diamon.org/docs/ctf/>). Babeltrace
>> +       Trace Format (see <http://diamon.org/ctf/>). Babeltrace
>>         can decode and display LTTng traces, since the latter are
>>         written using the CTF format.
>>
>> +       The babeltrace utility is built with debug information
>> +       printing support when the elfutils package is selected.
>
> Drop this sentence, but add a config option for it:
>
>     if BR2_PACKAGE_LTTNG_BABELTRACE
>
>     config BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO
>         bool
>         default y
>         depends on !BR2_bfin # elfutils
>         depends on !BR2_STATIC_LIBS # elfutils
>         depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

How are we supposed to track the dependencies of elfutils in all
the projects that need it? Copying the `depends` lines like this seems
precarious.

>         select BR2_PACKAGE_ELFUTILS
>
>     comment "handling debug info in traces needs a glibc or uClibc toolchain w/ dynamic library"
>         depends on !BR2_bfin # elfutils
>         depends on BR2_STATIC_LIBS \
>                 || !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>
>     endif
>
> Then, in the .mk, see below...
>
>>         Having this tool on the target is not mandatory. You can
>>         transfer the binary trace output from the target to your
>> -       development workstation, and use babeltrace here. Buildroot
>> -       automatically builds a host babeltrace in
>> -       $(O)/host/usr/bin/babeltrace as a dependency of the
>> -       lttng-tools package.
>> +       development workstation, and use babeltrace here. Babeltrace
>> +       is packaged for all major Linux distributions.
>
> To be adapted if you make it a host-package in the "Host utilities"
> sub-menu (which I'd like you do, pretty please! ;-) ).

Will do.

>
> [--SNIP--]
>> diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
>> index b2e03a9..ced1024 100644
>> --- a/package/lttng-babeltrace/lttng-babeltrace.mk
>> +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
>> @@ -4,18 +4,21 @@
>>  #
>>  ################################################################################
>>
>> -LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
>> -LTTNG_BABELTRACE_VERSION = 1.2.4
>> +LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
>> +LTTNG_BABELTRACE_VERSION = 1.4.0
>>  LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
>>  LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
>>  LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
>> -
>>  LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
>> -HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
>> -     host-popt host-util-linux host-libglib2 host-pkgconf
>>
>> -# for 0002-configure-fix-uuid-support-detection-on-static-build.patch
>> +# For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>>  LTTNG_BABELTRACE_AUTORECONF = YES
>>
>> +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
>
> Here, use:
>
>     ifeq ($(BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO),y)

Yes, that was my first solution. I changed it to the `depends` before
submitting v1 because I didn't have such a complex
`BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO` block.

Thanks for the tips,
Phil

>
>> +LTTNG_BABELTRACE_DEPENDENCIES += elfutils
>> +LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
>> +else
>> +LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
>> +endif
>> +
>>  $(eval $(autotools-package))
>> -$(eval $(host-autotools-package))
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
