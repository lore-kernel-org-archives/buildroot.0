From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2016 23:13:43 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <20160118230345.52b8f054@free-electrons.com>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
Message-ID: <20160118221343.GD3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-18 23:03 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Jan 2016 22:47:04 +0100, Yann E. MORIN wrote:
> 
> > Yes, it *is* functionally equivalent. It just looks weird that you have
> > to define the kernel version after (as 'as a conseuence of) the headers
> > version, since logically, it is the opposite that one would want.
> > 
> > However, as you said, it would not be very practical to implement that
> > in a user-friendly way:
> >   - on one hand, it seems totally more logical to define the toolchain
> >     options before enblign a kernel,
> >   - on the other hand, the kernel headers version is very dependent on
> >     the running kernel version.
> > 
> > Chicken'n'egg problem... :-(
> > 
> > So, do we agree that we should drop this patch?
> 
> I also don't like the way the patch is implemented, but I think the
> problem raised by this patch is real. Sometimes people have kernel
> sources that contain some custom kernel headers needed for their
> userspace libraries/applications, and we have no mechanism to allow
> them to use their custom kernel source for the linux-headers package,
> which is a bit annoying.

Ah... I just looked, and indeed all we have is an option to manually
specify the version, nad there is no way to use any of the other sources
that we have for the kernel (tarball, git tree...)

Indeed, we do not have the same functionality.

So, what should we do:

  - "duplicate" for the headers the many ways we have to retrieve a
    kernel's source tree?

  - find a better way to implement Karoly's needs?

IIRC, I think I already suggested that we set the version string from
Kconfig, a bit like:

    choice
        bool "headers version"

    [...]

    config BR2_PKG_HEADERS_AS_KERNEL
        bool "like kernel"
        depends on BR2_LINUX_KERNEL

    comment "blabla needs a kernel to be built"
        depends on !BR2_LINUX_KERNEL

    [...]

    endchoice

    config BR2_DEFAULT_KERNEL_HEADERS
        string
        default BR2_LINUX_KERNEL_VERSION if BR2_PKG_HEADERS_AS_KERNEL

Which will avoid having to deal with tricky Makefile code like this
patch does.

(Yes, it is possible to use another Kconfig variable as a default
value.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
