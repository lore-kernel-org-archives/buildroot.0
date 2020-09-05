From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 22:03:24 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/multipath-tools: new package
In-Reply-To: <20200905215837.1851ab18@windsurf.home>
References: <20200905192015.1346-1-egorenar-dev@posteo.net>
 <20200905215837.1851ab18@windsurf.home>
Message-ID: <87k0x8uh2r.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

>
> I get:
>
> uxsock.c:20:10: fatal error: systemd/sd-daemon.h: No such file or directory
>  #include <systemd/sd-daemon.h>
>           ^~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
>
> This is due to how SYSTEMD is detected:
>
> ifndef SYSTEMD
>         ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
>                 SYSTEMD = $(shell pkg-config --modversion libsystemd)
>         else
>                 ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
>                         SYSTEMD = $(shell systemctl --version 2> /dev/null | \
>                                 sed -n 's/systemd \([0-9]*\).*/\1/p')
>                 endif
>         endif
> endif
>
> Indeed, if systemd is found using pkg-config, then it falls back to
> using systemctl.. and since my Fedora uses systemd, the multipath-tools
> build system thinks it should enable systemd support.. but I don't have
> systemd enabled in my Buildroot configuration.
>
> And the problem is that there is no way to explicitly disable SYSTEMD
> support...
>
> Also, there are two other things that we should pass explicitly. If you
> look at the Makefile, it does this:
>
> ifndef LIB
>         ifeq ($(shell test -d /lib64 && echo 1),1)
>                 LIB=lib64
>         else
>                 LIB=lib
>         endif
> endif
>
> ifndef RUN
>         ifeq ($(shell test -L /var/run -o ! -d /var/run && echo 1),1)
>                 RUN=run
>         else
>                 RUN=var/run
>         endif
> endif
>
> So for LIB and RUN, it looks at what exists on the build machine...
> which doesn't make sense when cross-compiling. So I think we want t
> pass LIB=lib and RUN=run explicitly.
>
> Could you have a look at the systemd ? Just build a Buildroot
> configuration without systemd, on a build machine that uses systemd,
> and you'll get the failure.


No problem, i'll look into it. I admit i have a machine w/o systemd :)
Best to setup fedora Docker container.

Thanks for feedback
Regards
Alex
