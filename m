From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 May 2018 21:48:18 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/exim: remove libnsl linking
 with Glibc.
In-Reply-To: <70ad90d2-a090-3cea-d850-1a4122f75ed5@lucaceresoli.net>
References: <20180504210246.29930-1-romain.naour@gmail.com>
 <70ad90d2-a090-3cea-d850-1a4122f75ed5@lucaceresoli.net>
Message-ID: <145a31da-eb68-e8f6-a70d-494eefbddd4b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On 16/05/2018 17:12, Luca Ceresoli wrote:
> Hi Romain,
> 
> On 04/05/2018 23:02, Romain Naour wrote:
>> glibc now considers its built-in libnsl as being obsolete, and requires
>> passing --enable-obsolete-libnsl to have it built and installed. libnsl
>> is now provided as a separate project [1], but it isn't packaged yet in
>> Buildroot.
>>
>> In preparation for dropping --enable-obsolete-libnsl from the glibc
>> package, this commit ensures that exim doesn't use libnsl. It was
>> already the case for uclibc and musl toolchains, so this commit simply
>> extends that to make sure libnsl is also not used with glibc toolchains.
>>
>> Only Exim's nis.so and nisplus.so lookup modules require libnsl,
>> but they are not build by default. So we can safely remove -lnsl
>> from the Makefile-Linux. If someone want these modules, a new libnsl
>> package must be added first to provide nsl library.>
>> Note: Fedora 28 has switched to the new libnsl library that bring
>> IPV6 support. [2]
> 
> ...and this triggered host toolchain issues such as:
> 
> http://autobuild.buildroot.net/results/a362dfef9e5187931431000c54f03f841d17c847/
> 
> The reason is that the host tools generates by exim (namely buildconfig)
> are built out of build-br/Makefile, which is assembled by concatenating
> together several makefiles including OS/Makefile-Linux. So the
> buildconfig tool will try to link against libnsl, but that's not needed.
> 
> As a positive side effect, this patch fixes the above issue.
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 

As discussed, I suggest the following changes to the log message. Feel
free to improve them.

Subject:

+package/exim: remove libnsl linking with Glibc.
-package/exim: remove libnsl linking and fix native tools build

Remove from description:

Note: Fedora 28 has switched to the new libnsl library that bring
IPV6 support. [2]

Add to description:

This also fixes the following build error on recent distributions where
libnsl is not installed (e.g. Fedora 28 which has switched to the new
libnsl library that brings IPV6 support. [2]):

  /bin/sh ../scripts/Configure-os.c
  /usr/bin/gcc buildconfig.c
  /usr/bin/ld: cannot find -lnsl
  collect2: error: ld returned 1 exit status

This happens while exim builds a host tool named buildconfig. The build
is done in build-br/Makefile, which in turn is assembled by
concatenating together several makefiles, including OS/Makefile-Linux.
So the buildconfig tool will be built with the same $(LIBS) as the
target executables, including -lnsl. Removing -lnsl also fixes building
buildconfig since it does not need libnsl.

Bye,
-- 
Luca
