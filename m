From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 9 Jul 2016 15:06:23 +0200
Subject: [Buildroot] [Patch v3 2/3] python-meson: new package
In-Reply-To: <20160703202421.GC3482@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160703202421.GC3482@free.fr>
Message-ID: <20160709150623.0be8fb35@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Le Sun, 3 Jul 2016 22:24:21 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> On 2016-06-24 21:22 +0200, Eric Le Bihan spake thusly:
> > This new package provides the host variant of the Meson Build
> > System, an open source build system meant to be both extremely
> > fast, and as user friendly as possible.  
> 
> This should be named "meson", not "python-meson".

OK.

> > More precisely, Meson creates configuration files for the Ninja
> > build system.
> > 
> > Besides building Meson, it generates a cross-compilation
> > configuration file ("$(HOST_DIR)/etc/meson/cross-compilation.conf")
> > as well as a wrapper for QEMU
> > ("$(HOST_DIR)/usr/bin/meson-exe-wrapper"), used to perform checks
> > when cross-compiling (hence the dependency on host-qemu).  
> 
> We've (briefly) discussed this patch during the summer camp, and we
> all believe that this dependency on host-qemu is really ugly.
> 
> We're not very much interested in having this in Buildroot in the
> state it is in this patch. Especially since (as far as I could see)
> you do not provide a package that uses meson (do you plan on sending
> one?).
> 
> However, after looking a bit at the Meson documentation, especially
> about cross-compilation, it appears that we can avoid having to ru
> nsuch "target" tests.
> 
> For example (from the Meson doc itself):
> 
>     sizeof_int = 4
>     sizeof_wchar_t = 4
>     sizeof_void* = 4
> 
>     alignment_char = 1
>     alignment_void* = 4
>     alignment_double = 4
> 
>     has_function_printf = true
> 
>     c_args = ['-DCROSS=1', '-DSOMETHING=3']
>     c_link_args = ['-some_link_arg']
> 
> Also, if you look (in the meson sources) at cross/ubuntu-armhf.txt:
> 
>     [binaries]
>     # we could set exe_wrapper = qemu-arm-static but to test the case
>     # when cross compiled binaries can't be run we don't do that
>     c = '/usr/bin/arm-linux-gnueabihf-gcc'
>     cpp = '/usr/bin/arm-linux-gnueabihf-g++'
>     ar = '/usr/arm-linux-gnueabihf/bin/ar'
>     strip = '/usr/arm-linux-gnueabihf/bin/strip'
>     pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'
>     
>     [properties]
>     root = '/usr/arm-linux-gnueabihf'
>     
>     has_function_printf = true
>     has_function_hfkerhisadf = false
>     
>     [host_machine]
>     system = 'linux'
>     cpu_family = 'arm'
>     cpu = 'armv7' # Not sure if correct.
>     endian = 'little'
> 
> So, if we can feed it all the required config options, we can probably
> avoid running qemu.
> 
> The basic idea is that we start with a simple such config file, which
> we preseed with the obvious things. Then, as we add more packages, we
> can complement that file step by step.
> 
> We'd basically have a few start-point files:
>   - per architecture
>   - per C library
>   - optionally, a meson-basd package would generate its own blob
> 
> Those files would be concatenated to form the cross-compilation.conf.
> 
> Or so this is the overall idea.
> 
> Do you think this is an possible solution? Would mind looking into it?

Indeed, for the basic cases, defining an "exe_wrapper" which uses
host-qemu is not mandatory. I'll post a new series for a new package
named "meson", where the dependency has been removed and the
cross-compilation configuration file simplified. This should be
sufficient for the users wanting to add a package which uses pkg-config
for dependency management and does not require exotic platform checks.

ATM, there are not many new projects using Meson, so I will not provided
packages using it. But some projects, like Gstreamer [1] are being
ported from autotools to Meson. 

[1] http://blog.nirbheek.in/2016/05/gstreamer-and-meson-new-hope.html

Regards,

-- 
ELB
