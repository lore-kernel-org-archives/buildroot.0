From: James Knight <james.d.knight@live.com>
Date: Sun, 11 Dec 2016 22:06:44 -0500
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20160829091638.1236158a@free-electrons.com>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com> <87twe4aav2.fsf@dell.be.48ers.dk>
 <20160828214805.GE5758@free.fr> <20160829091638.1236158a@free-electrons.com>
Message-ID: <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Aug 29, 2016 at 3:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The only major difference being that "override source dir" is meant to
> be a "local" override, i.e something that developers do on their own
> machine, for their own development. While the existing
> BR2_LINUX_KERNEL_CUSTOM_LOCAL is really about having it as part of the
> Buildroot configuration.
>
> But nothing prevents people from having a version-controlled local.mk,
> which makes it not-local anymore.

This.

(sorry for the delay. was trying trying to upgrade from a
2015.11.x-based series to a 2016.11.x-based series and just found out
that BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH is gone; original comments
here [1], if your email is past retention)

For my build environment, I prepare a series of sources before
invoking a Buildroot make. This includes preparing BR2_EXTERNAL
modules, cache content (dl) and my target kernel sources. The
initialization phase allows me to adjust source locations for a
specific build, for example, targeting a local Git repository for
kernel sources instead of a specific tarball. I was able to easily
achieve this by defining a custom local path in my Buildroot
configuration as follows:

    BR2_LINUX_KERNEL_CUSTOM_LOCAL=y
    BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH="$(MYCUSTOM_LINUX_DIR)"

With the revert of this patch, it seems the best "correct" approach is
to use the override-srcdir mechanism. As Thomas mentions though,
modifying my `local.mk` file to be under version control makes it no
longer local anymore. While I would love to have the feature back, if
this is a rare/odd usage, I don't mind modifying my repository to
support custom kernel local paths (rather than customizing a local.mk
file). Thoughts?

I don't believe BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH hurts
reproducibility in all cases. If a build environment ensures the
kernel custom path's content is managed properly for a build invoke,
would there be a reproducibility issue (unless I'm overlooking
something)?

---

On a related note, if the intent is to still leave this reverted,
BR2_LINUX_KERNEL_CUSTOM_LOCAL is still being reference in the
`linux-header` package [2] and `linux/Config.in` [3] (just dead code).
I can whip up a patch if no one wants to take a stab at it?

[1]: https://patchwork.ozlabs.org/patch/641254/
[2]: https://git.buildroot.net/buildroot/tree/package/linux-headers/linux-headers.mk?id=0d7383a0a7f5c69cb0e4a4eb0d32d2536cd7e0e8#n20
[3]: https://git.buildroot.net/buildroot/tree/linux/Config.in#n113
