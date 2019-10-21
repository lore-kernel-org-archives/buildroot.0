From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 21 Oct 2019 10:54:28 +0100
Subject: [Buildroot] [PATCH 2/3] pkgconf: Add pkgconf system lib and
 include path
In-Reply-To: <27aa9b47-98e6-0a0e-bfaa-623f0a942b87@mind.be>
References: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
 <20191001124132.107700-2-thomas.preston@codethink.co.uk>
 <27aa9b47-98e6-0a0e-bfaa-623f0a942b87@mind.be>
Message-ID: <ae91194e-0305-9b1a-ff4d-c59be6db3bd0@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/2019 22:07, Arnout Vandecappelle wrote:
>  Hi Thomas,
> 
> On 01/10/2019 14:41, Thomas Preston wrote:
>> Buildroot does not reconfigure pkgconf system library and system include
>> dirs to STAGING_DIR. This means that pkgconf prints the sysroot system
>> library and system include dirs instead of letting the compiler handle
>> the logical sysroot. This breaks the -isystem compiler flag, as it
>> increases the priority of the system library and system include
>> directories. For example:
>>
>> 	$ output/host/bin/pkg-config --cflags glib-2.0
>> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0
>> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/glib-2.0/include
>> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include
>>
>> A header in `.../sysroot/usr/include` will be included before a header
>> in any directory specified with -isystem flags. Specifically, this
>> breaks the Chromium build system, which expects a C++ math.h in a
>> bundled LLVM C++ library, and gets a GNU C math.h instead.
>>
>> Fix this by telling pkgconf about the sysroot's system library and
>> system include directories, so that it doesn't accidentally print them.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>> ---
>>  package/pkgconf/pkg-config.in | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
>> index 8795f64b68..894069c492 100644
>> --- a/package/pkgconf/pkg-config.in
>> +++ b/package/pkgconf/pkg-config.in
>> @@ -1,8 +1,12 @@
>>  #!/bin/sh
>>  PKGCONFDIR=$(dirname $0)
>> +DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
>> +DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
>>  DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
>>  DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
>>  
>> -PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
>> +PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
>> +	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
> 
>  Since these variables are not overridden by HOST_CONFIGURE_OPTS, they will also
> be set for host compilation, which is wrong. However, the worst that can happen
> is that it hides some bug during host compilation, because the only thing these
> variables do is to remove staging include paths and these are anyway wrong for
> host compilation.
> 

I agree the staging include paths are wrong for host compilation, but I think 
we should override those variables using HOST_MAKE_ENV because the bug it hides
is the same bug this patch attempts to fix. 

That is, when building for the host some /usr/include headers included with -I
will take over -isystem headers.

Either way, the personality change should fix this properly. For now, I can
send a fixup for this patch, if you agree it is needed.

>  Therefore I've applied to master. With one change though: I changed the order
> of the variables to minimize the diff here (i.e. keep LIBDIR first) and to make
> it alphabetical (i.e. INCLUDE before LIBRARY, which is anyway more logical as
> well IMO).

Ok that makes sense. Thanks for taking the time to review and add this.
