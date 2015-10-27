From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 17:27:03 +0100
Subject: [Buildroot] [PATCH v4] rfkill: new package
In-Reply-To: <20151027161310.GC3555@free.fr>
References: <1445959974-10577-1-git-send-email-sv99@inbox.ru>
 <20151027161310.GC3555@free.fr>
Message-ID: <20151027162703.GD3555@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viacheslav, All,

On 2015-10-27 17:13 +0100, Yann E. MORIN spake thusly:
> Since the previous review, we discussed on IRC, and we discovered
> more issues with your patch, see below...

Vicente had even more comments on my coments. :-)

(Hence the reason why waiting after a review is important.)

> On 2015-10-27 18:32 +0300, Viacheslav Volkov spake thusly:
[--SNIP--]
> > diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
> > new file mode 100644
> > index 0000000..b377c03
> > --- /dev/null
> > +++ b/package/rfkill/rfkill.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# rfkill
> > +#
> > +################################################################################
> > +
> > +RFKILL_VERSION = 0.5
> > +RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
> > +RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
> > +
> > +define RFKILL_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> > +		VERSION_SUFFIX="-br"
> 
> Why do you specify the VERSION_SUFFIX?
> 
> Don't do it, we do not need to "specialise" the generated binaries just
> because they were built with Buldroot.

OK, Vicente explained that without it, the version.sh script will fail
miserably. I understand now.

This should be explained as a comment above the build command:

    # As part of the build, the Maefile tries to construct a version
    # string. By default, it tries to run git commands to get it, and
    # checks that it gets the same version as the one stored in the
    # Makefile. Since it would (at worst) get Buildroot version (for
    # in-tree builds), or (at best) not version string at all (in case
    # Of out-of-tree build), the version.sh script would fail miserably.
    # To avoid this, we feed it a custom VERSION_SUFFIX, which must not
    # be empty, otherwise the version.sh script is run.

> > +endef
> > +
> > +define RFKILL_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 755 $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill
> 
> As I said in my previous review, you should use the install directive
> provided by the package's Makefile, like so;
> 
>     $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C "$(@D) \
>         DESTDIR=$(TARGET_DIR) install

The $(TARGET_CONFIGURE_OPTS) is not needed at install time. Vicente
believes t should be dropped; I believe it is better for consistency, so
the install command uses the exact same environment as the build
command.

So, please keep it. If a maintainer believes it is superfluous, he can
drop it the moment he applies the patch.

> Again, wait a little bit before you resend (like, wait until tomorow).

Still valid, by the way...

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
