From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 00:07:01 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
Message-ID: <20120627000701.506f534e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This e-mail is a request for comments and suggestions on how to handle
RPC support in the future.

At the moment, Buildroot makes the assumption that glibc and eglibc
toolchains provide RPC support, while we are careful to handle non-RPC
uClibc toolchains, since RPC is an optional feature in uClibc.

However, this status has changes since (e)glibc 2.14 (released in May
2011) and its subsequent version 2.15 (released in March 2012). The
RPC support has been completely removed from (e)glibc, and the
developers recommend to use the tirpc library instead. Apparently,
tirpc offers additional benefits over the traditional RPC support that
was part of (e)glibc, such as improved IPv6 support.

Since quite a while, Crosstool-NG allows to produce toolchains with
(e)glibc 2.14/2.15, and since 2012.03, Sourcery CodeBench toolchains
are also using (e)glibc 2.15. None of those toolchains have RPC
support, but Buildroot for the moment assumes that they do since they
are glibc-based.

So I've created a package for libtirpc, which after a few fixes, seems
to work fine. But now, the hard part is how to handle this new package
in terms of dependencies, and this is where I'd like to have your
opinion.

I have essentially two problems:

 *) Should we consider libtirpc just an add-on for (e)glibc, and
    therefore make it visible/available/used only when a (e)glibc
    toolchain lacking RPC support is used, or instead, should we offer
    libtirpc as soon as the toolchain lacks RPC support (which would
    also be the case for uClibc toolchain with no RPC support from the
    C library) ?

 *) Should we make the dependency from packages on libtirpc a
    "select", like all other library dependencies, or a "depends on", to
    mimic what we currently do for RPC support (packages "depends on
    BR2_INET_RPC", and they show a comment if BR2_INET_RPC isn't
    available) ?

 *) How to handle the case of the Crosstool-NG backend? With the
    current Crosstool-NG backend, we have no idea which version of
    (e)glibc is being built, so we have no idea whether RPC support
    will be provided by the toolchain. Should we add a config option
    saying "My toolchain will have RPC support", which we will then
    check after the toolchain build, like we do with external
    toolchains? Other suggestions?

One possible plan is to do something like:

config BR2_TOOLCHAIN_HAS_NATIVE_RPC
       bool

This option is selected by glibc toolchains < 2.14 (external
toolchains) and by internal toolchains that have RPC support enabled.

Then, in the packages, we can do (if we decide to handle it like a
library dependency, i.e transparently for the user):

config BR2_PACKAGE_FOO
       select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

and in their .mk file:

ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
FOO_DEPENDENCIES += libtirpc
endif

And we unconditionally enable RPC support in the package (for example,
we tune the Busybox configuration file or other customization).

Other suggestions? Thoughts?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
