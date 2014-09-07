From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 07 Sep 2014 11:49:18 +0800
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140906203640.09c6d8be@free-electrons.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
Message-ID: <540BD5BE.7020801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/14 02:36, Thomas Petazzoni wrote:
> Hello,
> 
> Fran?ois, Nathaniel, see below.
> 
> 
>>        arm |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/03b15dde13d804e5b8b0df7f887ce0552c69fa6d/
> 
> configure: error: no termcap library found
> Makefile:8229: recipe for target 'configure-gdb' failed
> 
> Seems like Nathaniel autobuilder does not have the ncurses development
> libraries installed (also causing build failures in host-mysql, for
> example). What is our policy regarding ncurses? I have it installed in
> my autobuilder because I use it to run "make menuconfig". But it's true
> it's not technically absolutely required to run a Buildroot build.
> 
> Should we add dependency on host-ncurses where appropriate? Or should
> we make ncurses development files on the build machine a mandatory
> dependency? What if the user uses only xconfig or gconfig?
> 

I don't have it installed purely because this chroot is *just* for the
autobuilder.

I'm leaning towards host-ncurses because it seems to be the cleaner way
to do it, but assuming that the host has it installed is probably a
fairly safe assumption.

Only issue is that some people might have a build server they upload the
config to, but even then installing ncurses-dev shouldn't really be a
big deal.

> 
> /usr/bin/perl "-Iinc" /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap /usr/share/perl/5.20/ExtUtils/typemap -typemap typemap  SSLeay.xs > SSLeay.xsc && mv SSLeay.xsc SSLeay.c
> make[1]: *** No rule to make target '/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/perl5/5.18.2/i686-linux/CORE/vutil.h', needed by 'SSLeay.o'.  Stop.
> 
>>        arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/c1454491c21c81a2f01b5f21aeff5c39f0a49155/
> 
> Issue on Nathaniel autobuilder instance:
> 
> gzip: /home/chroot/media/code/buildroot/autobuilder/instance-0/dl/yaml-1.1.1.tgz: not in gzip format
> 
> Nathaniel, could you have a look at the yaml-1.1.1.tgz tarball? Also,
> look at ftop-1.0.tar.gz, which has a similar issue. It would be good to:
> 
>  *) Save those tarballs somewhere else so we can study what they look
>     like and hopefully understand the problem.
> 
>  *) Then immediately remove them from the instance-<X>/dl/ directory,
>     so that future builds will not fail due to this.

The offending tarballs have been moved out. I've checked them with file,
gzip and even opened them in file-roller and I can't see an issue. They
are up at http://nroach44.info/misc/br/ if you want to take a look.

I have a suspicion that they may have been redownloaded, but I'm not
sure if buildroot does wget -c or similar size checking logic by default.

A few days back when I was testing the autobuilder I was getting errors
on a mirror, from memory php's, so that might have something to do with
the issue.

> 
> Thomas
> 
