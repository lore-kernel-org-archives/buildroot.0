From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Mar 2012 08:48:37 +0100
Subject: [Buildroot] AX25 support packages
In-Reply-To: <CACQGsYQZMnE-dHw=1a8QKogQ_GNjwDQOZ+4dXnBHs6d-CiB6UQ@mail.gmail.com>
References: <CACQGsYQZMnE-dHw=1a8QKogQ_GNjwDQOZ+4dXnBHs6d-CiB6UQ@mail.gmail.com>
Message-ID: <20120313084837.6919a6b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jo?o,

Le Tue, 13 Mar 2012 00:49:12 +0000,
Jo?o Ferreira <joaoahf@gmail.com> a ?crit :

> I realized that *buildroot* do not have AX.25 *userland* software
> support. Specially the AX25lib and AX25-tools, available at:
> 
>    - http://www.linux-ax25.org/pub/libax25/libax25-0.0.12-rc2.tar.gz
>    -
> http://www.linux-ax25.org/pub/ax25-tools/ax25-tools-0.0.10-rc2.tar.gz
> 
> 
> So, I made the packages for that software (see attach), and I wonder
> that it might be useful for some *buildroot* users (specially those
> who are radio amateur).
> The packages include one patch, who will bypass the setpgrp()
> verification in configure script.
> 
> I test that packages using crosscompile (i386->ARM) and everything
> works as expected.
> 
> Fell free to use that packages as you want, and give some comments
> about it.

Thanks for this work. Could you submit it as proper Git patches, so
that we could review them by replying to e-mail and ultimately merge
them by preserving your authorship? And if you don't know Git, it's a
good opportunity to start using it. You can see
http://elinux.org/Buildroot_how_to_contribute for guidelines on how to
contribute to Buildroot using Git.

In the mean time some small comments on your work:

 * For libax25/Config.in. Indentation of the help text should only be
   one tab + two spaces

 * For the patch in libax25/, it should carry a description and your
   Signed-off-by line. Also, we generally don't like patches on the
   configure script itself, but rather a patch on the configure.in or
   configure.ac file (and then you need to activate
   LIBAX25_AUTORECONF=YES in the libax25.mk file)

 * In the libax25.mk file, remove the LIBAX25_INSTALL_TARGET line,
   because the YES value is the default. Remove the empty
   LIBAX25_CONF_OPT and LIBAX25_DEPENDENCIES lines. Also remove the
   arguments to the AUTOTARGETS macro, they are no longer necessary. So
   the last line should just be $(eval $(call AUTOTARGETS))

 * Similar general comments for the ax25tools, plus:

   - Your Config.in file should select the LIBAX25 package

   - If ax25tools are really tools, you don't need the
     AX25TOOLS_INSTALL_STAGING = YES line (and neither the
     AX25TOOLS_INSTALL_TARGET = YES, since this is the default).
     Installation to staging is only needed for libraries.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
