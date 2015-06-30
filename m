From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:19:32 +0200
Subject: [Buildroot] [PATCH v2] monkey: new package
In-Reply-To: <570c4a99-dc8a-4605-9c7e-0f08da3ae412@MAIL-SINTERS-01.sinters-int.fr>
References: <570c4a99-dc8a-4605-9c7e-0f08da3ae412@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150630121932.5e3bfbb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien CORJON,

On Mon, 29 Jun 2015 09:02:43 +0000, Julien CORJON wrote:
> From: Morgan Delestre <m.delestre@sinters.fr>
> 
> Monkey is a small, fast and lightweight open source Web Server for GNU/Linux. 
> It has been designed with focus in embedded devices, therefore its scalable by 
> nature having a low memory and CPU consumption and an excellent performance.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> Changes v1 -> v2:
>   - Fix typo (suggested by Alexandre)
>   - Change autotools for generic-package (suggested by Thomas)
>   - Add hash file
>   - Add licence
>   - Add uClib & musl support
>   - Add shared library option

I've applied the patch, but really there was still a lot of things
broken. The most astonishing problem was that with your monkey.mk,
Monkey was built for the host and not for the target. So I really don't
see how you could have tested this, unless you're working on x86/x86-64
embedded systems (but I know you are not!).

So, I've fixed up a whole bunch of issues before applying:

    [Thomas:
      - Add missing dependency on !BR2_STATIC_LIBS (the source code uses
        dlopen) and BR2_USE_MMU (the source code uses fork)
      - Slightly adjust/reword the description of the
        BR2_PACKAGE_MONKEY_SHARED option.
      - Remove all the complicated installation logic for the target, and
        just use "make install" instead.
      - Pass --no-backtrace when uClibc is used, otherwise the build fails
        because <execinfo.h> is not available in uClibc.
      - Pass $(TARGET_CONFIGURE_OPTS) in the environment of the configure
        script., otherwise monkey gets built for the host and not for the
        target.
      - Add a post install target hook to remove a broken symlink
        libmonkey.so installed by Monkey's Makefile when the shared
        library is not enabled.
      - Use TARGET_MAKE_ENV when calling make, just because we should.
      - Pass --malloc-libc so that the libc malloc() is used instead of
        the builtin jemalloc allocator, which requires more work to
        cross-compile properly.
      - Add missing empty line after the .mk header and before the first
        variable definition.]

Things like dependencies on BR2_STATIC_LIBS/BR2_USE_MMU, I understand
that they could have slipped through. But the fact that the binaries
got built for the host indicates that you haven't even built+tested the
package.

Also, if you could post a follow-up patch adding an init script that
starts Monkey at boot time, it would be great.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
