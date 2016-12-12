From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Dec 2016 18:35:27 +0100
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <87twe4aav2.fsf@dell.be.48ers.dk> <20160828214805.GE5758@free.fr>
 <20160829091638.1236158a@free-electrons.com>
 <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
Message-ID: <20161212173527.GC3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2016-12-11 22:06 -0500, James Knight spake thusly:
> On Mon, Aug 29, 2016 at 3:16 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > The only major difference being that "override source dir" is meant to
> > be a "local" override, i.e something that developers do on their own
> > machine, for their own development. While the existing
> > BR2_LINUX_KERNEL_CUSTOM_LOCAL is really about having it as part of the
> > Buildroot configuration.
> >
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

But what I want is to be able to use local sources fior Qt5 that I
prepare for my board; so I'll want to add the same feature for Qt5.
Then Thomas will want to use local sources for barebox; so he'll want to
add the same feature for barebox. Then Peter will need it for whatever,
so he'll want to add it for that as well...

It's an endless hunt, and one we do not want to pursue.

We already have a way to specify a local source tree, it is the override
mechanism.

If your build system already "prepares" the sources for the linux kernel
(I gues, git clone, git checkout stuff, apply patches, whatever), it
means you have the opportunity to also generate a local.mk file with:

    LINUX_OVERRIDE_SRCDIR = $(MYCUSTOM_LINUX_DIR)

And as Thomas pointed out, the file can be renamed.

I personally have a local.mk that looks like:

    ################################################################################
    # <FOO>_OVERRIDE_SRCDIR go in there:
    -include $(dir $(lastword $(MAKEFILE_LIST)))/local-override.mk

    ################################################################################
    # Clean more, please!
    clean: local-clean
    distclean: local-distclean

    local-distclean: local-clean

    local-clean:
        @rm -f br.log
        @rm -f $(O)/br.log

So I have all my build dirs with this one local.mk that includes the
override one if it exists at all, and where I put the OVERRIDE_SRCDIR
variables.

Sorry, but I still believe your use-case does not require
BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH at all, and that you'd probably be
better served with using OVERRIDE_SRCDIR from a generated local.mk.

You can thus generate the linux tree however you want in your
Jenkins/Gitlab-CI/whatever/...

(although, like Thomas, I wonder why you don't simply have said sources
in git directly and refer to a sha1 or tag from your config files...)

Regards,
Yann E. MORIN.

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
> 
> ---
> 
> On a related note, if the intent is to still leave this reverted,
> BR2_LINUX_KERNEL_CUSTOM_LOCAL is still being reference in the
> `linux-header` package [2] and `linux/Config.in` [3] (just dead code).
> I can whip up a patch if no one wants to take a stab at it?
> 
> [1]: https://patchwork.ozlabs.org/patch/641254/
> [2]: https://git.buildroot.net/buildroot/tree/package/linux-headers/linux-headers.mk?id=0d7383a0a7f5c69cb0e4a4eb0d32d2536cd7e0e8#n20
> [3]: https://git.buildroot.net/buildroot/tree/linux/Config.in#n113

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
