From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 17:27:15 +0100
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <87twe4aav2.fsf@dell.be.48ers.dk> <20160828214805.GE5758@free.fr>
 <20160829091638.1236158a@free-electrons.com>
 <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
Message-ID: <20161212172715.4a8ab39f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 22:06:44 -0500, James Knight wrote:

> > But nothing prevents people from having a version-controlled local.mk,
> > which makes it not-local anymore.  
> 
> This.
> 
> (sorry for the delay. was trying trying to upgrade from a
> 2015.11.x-based series to a 2016.11.x-based series and just found out
> that BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH is gone; original comments
> here [1], if your email is past retention)
> 
> For my build environment, I prepare a series of sources before
> invoking a Buildroot make. This includes preparing BR2_EXTERNAL
> modules, cache content (dl) and my target kernel sources. The
> initialization phase allows me to adjust source locations for a
> specific build, for example, targeting a local Git repository for
> kernel sources instead of a specific tarball. I was able to easily
> achieve this by defining a custom local path in my Buildroot
> configuration as follows:
> 
>     BR2_LINUX_KERNEL_CUSTOM_LOCAL=y
>     BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH="$(MYCUSTOM_LINUX_DIR)"
> 
> With the revert of this patch, it seems the best "correct" approach is
> to use the override-srcdir mechanism. As Thomas mentions though,
> modifying my `local.mk` file to be under version control makes it no
> longer local anymore. While I would love to have the feature back, if
> this is a rare/odd usage, I don't mind modifying my repository to
> support custom kernel local paths (rather than customizing a local.mk
> file). Thoughts?
> 
> I don't believe BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH hurts
> reproducibility in all cases. If a build environment ensures the
> kernel custom path's content is managed properly for a build invoke,
> would there be a reproducibility issue (unless I'm overlooking
> something)?

I don't really feel very strongly about this.

However, what was odd with BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH is that
we were providing this for the Linux kernel package, but not for any
other package. I think the reason we removed it is because someone
wanted to add the same feature to U-Boot or some other package, and we
said we didn't want to add this possibility to each and every package
in Buildroot.

I am however surprised that you need something like this for a build
that will be done by others. Why is it that you need to "prepare your
kernel sources" before starting the build? Why aren't you referencing a
given commit in some Git repository?

In the worst case, adding local.mk (which you can rename, it's
configurable in BR2_PACKAGE_OVERRIDE_FILE) to your version control
system will do the trick. But I'm still interested in understanding
your more global use case for this functionality.

> On a related note, if the intent is to still leave this reverted,
> BR2_LINUX_KERNEL_CUSTOM_LOCAL is still being reference in the
> `linux-header` package [2] and `linux/Config.in` [3] (just dead code).
> I can whip up a patch if no one wants to take a stab at it?
> 
> [1]: https://patchwork.ozlabs.org/patch/641254/
> [2]: https://git.buildroot.net/buildroot/tree/package/linux-headers/linux-headers.mk?id=0d7383a0a7f5c69cb0e4a4eb0d32d2536cd7e0e8#n20
> [3]: https://git.buildroot.net/buildroot/tree/linux/Config.in#n113

Please submit a patch :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
