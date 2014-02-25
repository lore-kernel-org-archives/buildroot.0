From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 25 Feb 2014 13:04:48 +0100
Subject: [Buildroot] [PATCH 1/2] infra: improve dependency check in
 virtual packages.
In-Reply-To: <20140224182951.GB11048@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393235404-2693-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140224182951.GB11048@free.fr>
Message-ID: <20140225120446.GA30238@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Feb 24, 2014 at 07:29:51PM +0100, Yann E. MORIN wrote:
[...]
> I don't know about you folks, but I'm beginning to see a pattern here...
>
> If all of our BR2_PACKAGE_HAS_FOOBAR options would match the corresponding
> FOOBAR_DEPENDENCIES, then we could use something like (absolutely untested,
> only pure random thoughts):
>
>     $(eval $(call virtual-package,FooBar))
>
> whith 'virtual-package' something like:
>
>     define virtual-package
>     ifeq ($(BR2_PACKAGE_HAS_$(call upper,$(1))),y)
>     ifeq ($($(call upper,$(1))_DEPENDENCIES),)
>     $(error No $(1) implementation selected. Configuration error.)
>     endif
>     endif
>     endef
>
> But then we would need:
>     s/BR2_PACKAGE_HAS_OPENGL_EGL/BR2_PACKAGE_HAS_LIBEGL/
>     s/BR2_PACKAGE_HAS_OPENGL_GLES/BR2_PACKAGE_HAS_LIBGLES/
>     s/BR2_PACKAGE_HAS_OPENMAX/BR2_PACKAGE_HAS_LIBOPENMAX/
>     s/BR2_PACKAGE_HAS_OPENVG/BR2_PACKAGE_HAS_LIBOPENVG/
IMHO, renaming BR2_PACKAGE_HAS_OPENGL_GLES to BR2_PACKAGE_HAS_LIBGLES and
friends is OK, as it matches the mesa3d naming and sounds less redundant.
> Lua interpreter and PowerVR already match this.
>
> We could even go further, so as to only require a call to 'virtual-package'
> and not to 'generic-package', with some carefully-crafted Makefile
> constructs (but we would loose the capitalisation of eg. lbEGL, since the
> package is named 'libegl', all in lower-case). 'virtual-package' could
> even override FOOBAR_SOURCE="" before calling generic-package behind the
> hood. This would make writing virtual packages even easier.
>
> Thought?
I like the idea. The virtual packages would become one-liners :-)
I'll test it.

Best regards,
ELB
