From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 Jan 2015 22:59:48 +0100
Subject: [Buildroot] [PATCH 1/3] package/infozip: fix LARGE_FILE_SUPPORT
	check
In-Reply-To: <CACQ1gAghO21=Tx3z7XeJR-NDaSErX_en-tWZ6qHezrRpsKy+VA@mail.gmail.com>
References: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
 <CACQ1gAghO21=Tx3z7XeJR-NDaSErX_en-tWZ6qHezrRpsKy+VA@mail.gmail.com>
Message-ID: <54C2C454.1080909@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard, all,

Le 23/01/2015 15:41, Richard Genoud a ?crit :
> Hi Romain !
> 
> 2015-01-23 0:44 GMT+01:00 Romain Naour <romain.naour@openwide.fr>:
>> LARGE_FILE_SUPPORT check was dropped in commit cc4dedd9.
>>
>> Since then there is a runtime error:
>> zip warning : Not supported (uzoff_t not same size as zoff_t)
>>
>> So remove the previous patch and rework and split each
>> cross-compilation fixes to differents patches.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  ...emove-Check-C-compiler-type-optimization-.patch | 130 +++++++++++
>>  .../0002-configure-Don-t-use-host-CPP.patch        |  37 ++++
>>  ...003-Makefile-Use-CFLAGS-from-command-line.patch |  30 +++
>>  ...4-configure-use-LDFLAGS-from-command-line.patch |  35 +++
>>  .../infozip-0001-configure-fix-cross-build.patch   | 237 ---------------------
>>  5 files changed, 232 insertions(+), 237 deletions(-)
>>  create mode 100644 package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
>>  create mode 100644 package/infozip/0002-configure-Don-t-use-host-CPP.patch
>>  create mode 100644 package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
>>  create mode 100644 package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
>>  delete mode 100644 package/infozip/infozip-0001-configure-fix-cross-build.patch
>>
> 
> I reverted my fix and applied your 3 patches series, but I still have :
> zip error: Not supported (uzoff_t not same size as zoff_t)
> 
> I'm on 2014.11, with Linaro ARM 2014.09 (BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM)
> (for a cortex-A15 cpu)
> 
> I noticed some messages during configure :
> [...]
> Check for size_t
> Check for off_t
> Check size of UIDs and GIDs
> (Now zip stores variable size UIDs/GIDs using a new extra field.  This
>  tests if this OS uses 16-bit UIDs/GIDs and so if the old 16-bit storage
>  should also be used for backward compatibility.)
> /lib/ld-linux-armhf.so.3: No such file or directory
> -- test failed - conftest returned 255 - disabling old 16-bit UID/GID support
> Check for Large File Support
> /lib/ld-linux-armhf.so.3: No such file or directory
> -- no Large File Support - conftest returned 255
> Check for wide char support
> -- have wchar_t - enabling Unicode support
> Check for gcc no-builtin flag
> Check for rmdir
> [...]
> 

Thanks for the report !

Here is the problem in the unix/configure script:

# compile it
$CC -o conftest conftest.c >/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo -- UID/GID test failed on compile - disabling old 16-bit UID/GID support
  CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
else
# run it
  ./conftest

It try to run an ARM binary on x86 Host for Large File Support and for the size
of UIDs and GIDs check.

So, removing the LFS test and lets infozip.mk set LARGE_FILE_SUPPORT flags is a
good things in the end.

I'll rework the series.
I haven't the issue since my target is a x86 system...

Best regards,
Romain Naour
