From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 21 Jun 2012 16:55:30 +0000 (UTC)
Subject: [Buildroot] preparing rootfs with gcc in buildroot
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
 <20120621142848.4caafde0@skate>
 <CAGXs5wXPo4wtWY9H0Ec761e0zEUCa_3u3-YH04jzZcW_m=ju+Q@mail.gmail.com>
Message-ID: <jrvjm2$sls$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-21, Kevin Wilson <wkevils@gmail.com> wrote:

> Thanks for your quick answer!
>
> I do admit that I am a bit of (heavy) hacker and I am intending to
> use buildroot a bit beyond its usual usage.
>
> I though of things like -
>
>   1) Adding tests programs of my own
>
>   2) Adding some code to packages (let's say, iptables, openswan)
>      Partly for hacking, partly for adding code for my own development
>      needs.
>
> It seems to mt that though it is possible to do it in buildroot cross
> compiling, in the end, for each and every change in
> iptables/openswan, I will have to install all the rootfs.tar; I don't
> think there is a way to prepare something like a package.

It was suggested that its easier to cross-compile your application. 
That doesn't mean you have to do it inside the buildroot framework.
It's trivial to cross-compile simple applications outside of
buildroot.  If all you're using is libc, then all you have to do is

   arm-linux-gcc -o foo file1.c file2.c file3.c

Building something that uses libc and autoconf stuff is almost as
easy.
   
Then you can 'scp foo target:' and run it.  Or you can NFS mount the
host directory where you do the edit/build and it's even simpler.

If you want to build things that use libraries that were built as part
of buildroot, then you have to add a couple more command line options
to tell the compiler/linker where to find the include and library
files created by buildroot (e.g. <wherever>/output/target.

In my project, the stuff I cross-compile outside of buildroot is
eventually packaged as .ipk files (sort of a stripped-down version of
Debian's .deb packages), and then I use ipkg-cl on the target to
install and update the "non-buildroot" applications.

-- 
Grant Edwards               grant.b.edwards        Yow! Don't hit me!!  I'm in
                                  at               the Twilight Zone!!!
                              gmail.com            
