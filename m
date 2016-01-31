From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:33:25 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
In-Reply-To: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131083325.73aab970@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 23:51:33 +0100, Bernd Kuhls wrote:
> The issue is discussed here:
> http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/127196
> 
> I consider this patch an ugly hack but I could compile ~900 packages
> without a gettext-related error, so I put this patch up for discussion.

I've looked at your patch, and I don't think it's such a hack. It
really fixes the root of the problem: 1/ convince gettext that musl has
a valid gettext implementation so that it doesn't build/install its own
libintl library and 2/ convince the gettext.m4 logic in all packages
that the provided libintl implementation is good enough for them.

I have just one question.

> +# prevent gettext overwriting musl's libintl.h
> +define GETTEXT_DO_NOT_INSTALL_LIBINTL_H
> +	$(SED) '/\$$(INSTALL_DATA) libintl.h/d' $(@D)/gettext-runtime/intl/Makefile.in
> +endef
> +GETTEXT_POST_PATCH_HOOKS = GETTEXT_DO_NOT_INSTALL_LIBINTL_H
> +endif

Why is this part needed ? By passing ac_cv_gnu_library_2_1=yes and
ac_cv_gnu_library_2=yes, aren't you convincing gettext to not
build/install its libintl library ? If so, why is gettext still
installing its own libintl.h ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
