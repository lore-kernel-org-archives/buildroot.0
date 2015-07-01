From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 1 Jul 2015 07:27:40 +0000
Subject: [Buildroot] [PATCH v2] monkey: new package
In-Reply-To: <20150630121932.5e3bfbb2@free-electrons.com>
References: <570c4a99-dc8a-4605-9c7e-0f08da3ae412@MAIL-SINTERS-01.sinters-int.fr>
 <20150630121932.5e3bfbb2@free-electrons.com>
Message-ID: <e5183b9f-515b-4477-a183-b32c8eb232a1@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

> ...
> I've applied the patch, but really there was still a lot of things
> broken. The most astonishing problem was that with your monkey.mk,
> Monkey was built for the host and not for the target. So I really don't
> see how you could have tested this, unless you're working on x86/x86-64
> embedded systems (but I know you are not!).

You're right, with the autotool -> generic-packages rework I just 
checked the compilation and didn't notice that x86 GCC was used. It 
won't happen again, next time I will fully test patches after each rework.

> So, I've fixed up a whole bunch of issues before applying:
>
>      [Thomas:
>        - Add missing dependency on !BR2_STATIC_LIBS (the source code uses
>          dlopen) and BR2_USE_MMU (the source code uses fork)

Do you have a documentation on "BR dependencies versus functions" to 
learn about that?

>        - Slightly adjust/reword the description of the
>          BR2_PACKAGE_MONKEY_SHARED option.
>        - Remove all the complicated installation logic for the target, and
>          just use "make install" instead.

I didn't know that BR remove all headers from the target image at the 
end of the compilation. Is it the same for the man files?

>        - Pass --no-backtrace when uClibc is used, otherwise the build fails
>          because <execinfo.h> is not available in uClibc.

As I daily use a linaro toolchain, I did not test the uClib and Musl 
configure options. In this case (for future patches), should I include a 
case I cannot test or disable it with depend?

>        - Pass $(TARGET_CONFIGURE_OPTS) in the environment of the configure
>          script., otherwise monkey gets built for the host and not for the
>          target.

Slap me for this one!

>        - Add a post install target hook to remove a broken symlink
>          libmonkey.so installed by Monkey's Makefile when the shared
>          library is not enabled.
>        - Use TARGET_MAKE_ENV when calling make, just because we should.
>        - Pass --malloc-libc so that the libc malloc() is used instead of
>          the builtin jemalloc allocator, which requires more work to
>          cross-compile properly.
>        - Add missing empty line after the .mk header and before the first
>          variable definition.]

> ...

> Also, if you could post a follow-up patch adding an init script that
> starts Monkey at boot time, it would be great.

I notice there is an systemd start script debian/monkey.init but my 
knowledge of init daemons is so limited that I didn't try to 
include/modify this file in BR package declaration.

>
> Thanks!
>
> Thomas

Thanks for the review/fix/commit. I'll try to be more meticulous on the 
next one.

Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: corjon_j.vcf
Type: text/x-vcard
Size: 428 bytes
Desc: corjon_j.vcf
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150701/47bda20e/attachment.vcf>
