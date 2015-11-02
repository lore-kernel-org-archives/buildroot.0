From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 2 Nov 2015 07:38:17 -0300
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths
 (branch yem/xorg)
In-Reply-To: <20151102003607.1fa9f695@gmx.net>
References: <cover.1446416019.git.yann.morin.1998@free.fr>
 <20151102003607.1fa9f695@gmx.net>
Message-ID: <56373D19.6080303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/15 20:36, Peter Seiderer wrote:

>> The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
>> path variables returned by pkgconf are now prefixed with the sysroot
>> directory.
>>
>
> ...this commit breaks some other packages too, see [1] for libv4l example.
>
> This commit removed a patch named '0002-fix-double-sysroot.patch', I think
> this patch should somehow be forward ported to the new pkconf packet...
>
> Regards,
> Peter

Hi Peter.
That's wrong, double-sysroot is natively removed by the newer versions 
of pkgconf, if you have this:

./usr/lib/pkgconfig/libxslt.pc:Libs: -L${libdir} -lxslt  -lxml2 
-L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
-lz -lm -ldl -lm

And do this:

$ ./pkg-config --libs libxslt
-L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
-lxslt  -lz -ldl -lm -lxml2

The output is as expected.

The problem is two-fold as we discussed with Yann last night.
On one side the pkg-config manpage says:

  PKG_CONFIG_SYSROOT_DIR
   Modify  -I  and -L to use the directories located in target sys?
   root.  this option is useful when cross-compiling packages  that
   use  pkg-config  to  determine CFLAGS and LDFLAGS. -I and -L are
   modified to point to the new system  root.  this  means  that  a
   -I/usr/include/libfoo will become -I/var/target/usr/include/lib?
   foo with a PKG_CONFIG_SYSROOT_DIR  equal  to  /var/target  (same
   rule apply to -L)

So pkgconf is being "too happy" in applying the sysroot prefix to all 
directories it finds in any variable.

On the other hand on the previous 0001-fix-variable.patch it did:

if ( !strcmp(req.variable, "includedir") ||
         !strcmp(req.variable, "mapdir") ||
         !strcmp(req.variable, "sdkdir") ||
         !strcmp(req.variable, "libdir"))
               printf("%s%s\n", sysroot_dir, req.buf);
       else
               printf("%s\n", req.buf);

So it was adding the sysroot prefix for mapdir & sdkdir as well, very 
much out of specification (we'll call the manpage a spec), catering for 
package abuse.

In the end our previous pkgconf was working out of spec, which may be 
ok, but poses the question, how many of these variables should be 
patched/prefixed as well? Because in the future other packages with 
their $nonstandard variable may need this as well, and patching and 
patching pkgconf for eternity doesn't sound so great.

First pkgconf should be patched to fix the out-of-spec functionality and 
send that upstream, but variable exceptions won't roll.

For the second problem i think mangling the .pc files would be best for 
the special variables, based on a per-package definition where you can 
say which other variables should be prefixed.

Regards.
