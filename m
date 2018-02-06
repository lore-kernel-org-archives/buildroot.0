From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Feb 2018 00:19:54 +0100
Subject: [Buildroot] [RFCv3 13/15] core: change host RPATH handling
In-Reply-To: <CANQCQpageXf0811NmfBOn1k041qfb2wuRsdNQDTD6dd9tnu2VA@mail.gmail.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-14-thomas.petazzoni@free-electrons.com>
 <CANQCQpageXf0811NmfBOn1k041qfb2wuRsdNQDTD6dd9tnu2VA@mail.gmail.com>
Message-ID: <1a5638cf-828d-32ea-3e07-dd84a176e03a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 23:04, Matthew Weber wrote:
> Thomas,
> 
> On Fri, Dec 1, 2017 at 9:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> [snip]
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -220,7 +220,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/include
>>  HOST_CFLAGS   ?= -O2
>>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>>  HOST_CXXFLAGS += $(HOST_CFLAGS)
>> -HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
>> +HOST_LDFLAGS  += -L$(HOST_DIR)/lib
> 
> Reproduced with the following config
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_SYSTEM_DHCP="eth0"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.6"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.13.config"
> BR2_PACKAGE_CHECKPOLICY=y
> BR2_PACKAGE_POLICYCOREUTILS=y
> BR2_PACKAGE_SETOOLS=y
> BR2_PACKAGE_HOST_CHECKPOLICY=y
> 
> That build will first fail at host-libglib2 (mentioned in previous
> email on this thread) because the autotools test of pcre unicode will
> fail as it can't find the libraries.  See patch
> https://patchwork.ozlabs.org/patch/870130/

 IIUC this patch should no longer be needed if we do -Wl,-rpath-link instead, right?


> Next it will fail at setools because of a python header include now
> only pointing at the python host/include vs the full host/include. It
> seems setuptools by default inherits an include path to python headers
> install location.  See patch
> https://patchwork.ozlabs.org/patch/870131/.

 If setuptools completely ignores the CFLAGS we pass to it, then it should be
fixed in setuptools, not in a per-package patch...


> Last it looks like the rpath still needs to be set so that the linker
> can evaluate the shared library's shared library dependency.  I tested
> the changes below and it builds, plus doesn't leave an rpath in the
> executable (Thanks Roman).
> <<<<<<<<<  CUT
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -238,7 +238,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/include
>  HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
> -HOST_LDFLAGS  += -L$(HOST_DIR)/lib
> +HOST_LDFLAGS  += -L$(HOST_DIR)/lib  -Wl,-rpath-link,$(HOST_DIR)/lib
> 
>  # The macros below are taken from linux 4.11 and adapted slightly.
>  # Copy more when needed.
> <<<<<<<<<  CUT
> The use of LD_LIBRARY_PATH set to the same value also works.  Here's
> my understanding as pulled from the ld man page.
> 
> When using ELF or SunOS, one shared library may require another. This
> happens when an ld -shared link includes a shared library as one of
> the input files. When the linker encounters such a dependency when
> doing a non-shared, non-relocateable link, it will automatically try
> to locate the required shared library and include it in the link, if
> it is not included explicitly. In such a case, the -rpath-link option
> specifies the first set of directories to search. The -rpath-link
> option may specify a sequence of directory names either by specifying
> a list of names separated by colons, or by appearing multiple times.
> The linker uses the following search paths to locate required shared
> libraries.
> 1) Any directories specified by -rpath-link options.
> 2) Any directories specified by -rpath options. The difference between
> -rpath and -rpath-link is that directories specified by -rpath options
> are included in the executable and used at runtime, whereas the
> -rpath-link option is only effective at link time.
> 3) On an ELF system, if the -rpath and rpath-link options were not
> used, search the contents of the environment variable LD_RUN_PATH.
> 4) On SunOS, if the -rpath option was not used, search any directories
> specified using -L options.
> 5) For a native linker, the contents of the environment variable
> LD_LIBRARY_PATH.
> 6) The default directories, normally `/lib' and `/usr/lib'.

 I have read this section of the manpage several times over the years, and now
is the first time it makes sense to me :-)

 So indeed, for NEEDED libraries within libraries that you link with, ld will
not look at -L but it will only look at -rpath-link and -rpath (the rest is not
relevant in our context). So if we remove -rpath, it does make sense that we
pass -rpath-link instead (we already pass -L as well).

 That said, I still don't understand why it didn't work without -rpath-link.
Indeed, there *is* a DT_RUNPATH set in the library (at least according to the
commit log of this patch, since fix-rpath is run at the end of installation),
but it's set to $ORIGIN/../lib instead of to an absolute path. So, does ld not
look at DT_RUNPATH? Or does it evaluate $ORIGIN in an unexpected way?


 Finally, note that we said in the Buildroot meeting that this patch is in fact
probably NOT needed for per-package SDK, because the NEEDed libraries are in
fact installed in the location specified by the absolute RPATH. It's just weird
to have an RPATH referring outside of the per-package staging, but it's not an
actual problem.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
