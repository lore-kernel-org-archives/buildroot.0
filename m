From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 9 Oct 2019 14:54:33 +0200
Subject: [Buildroot] [PATCH v2 5/9] package/libnetconf2: add package
In-Reply-To: <20191009141504.37bf7928@windsurf>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-6-heiko.thiery@gmail.com>
 <20191009141504.37bf7928@windsurf>
Message-ID: <CAEyMn7Z8AkpQjH0v5M_2gPg8h6DaK+boSqxbaY7VYbmRDShvfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > +config BR2_PACKAGE_LIBNETCONF2
> > +     bool "libnetconf2"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on !BR2_STATIC_LIBS
> > +     depends on BR2_USE_MMU
> > +     select BR2_PACKAGE_LIBYANG
> > +     select BR2_PACKAGE_LIBSSH
> > +     select BR2_PACKAGE_LIBSSH_SERVER
>
> I thought libssh was now an optional dependency ?

This has to be removed from here and has to be added to the sysrepo
package that enables it.

Is the normal way to make it configurable at the place where it is
needed. In this example the sysrepo has to be select the dependencies?

> > +     help
> > +       libnetconf2 is a NETCONF library in C intended for building
> > +       NETCONF clients and servers.
> > +
> > +       https://github.com/CESNET/libnetconf2
> > +
> > +config BR2_PACKAGE_LIBNETCONF2_SSH
> > +     bool
> > +     help
> > +       SSH support for libnetconf2
> > +
> > +config BR2_PACKAGE_LIBNETCONF2_TLS
> > +     bool
> > +     help
> > +       TLS support for libnetconf2
>
> Do we need configurable options for this ? In general, we prefer to
> have automatic dependencies, i.e just rely on whether a dependent
> package is enabled or not. This would give in your .mk file:

I will remove this since it is not required here. This is just a
leftover because I tested each package separatly with the test-pkg
script.

> +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
> +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
> +LIBNETCONF2_DEPENDENCIES += libssh
> +else
> +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
> +endif
>
> > +config BR2_PACKAGE_HOST_LIBNETCONF2_SSH
> > +     bool
> > +     help
> > +       SSH support for host-libnetconf2
> > +
> > +config BR2_PACKAGE_HOST_LIBNETCONF2_TLS
> > +     bool
> > +     help
> > +       TLS support for host-libnetconf2
>
> We generally don't make host packages configurable, and if they are,
> certainly not with options in Config.in, but in Config.in.host. Do you
> really need the host variant of libnetconf2 to have SSL/TLS support ?

I will remove that .. just thought it has to be selectable.
