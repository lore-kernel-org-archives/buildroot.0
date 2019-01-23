From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed, 23 Jan 2019 09:53:10 -0600
Subject: [Buildroot] Error when installing to staging directory
In-Reply-To: <1548257896385.11693@jhuapl.edu>
References: <1548107272423.65265@jhuapl.edu>
 <CANQCQpZ-NUo_5cjPFFNiYaJh_SEeTRS8=Kyt4greg7mRTqSdVw@mail.gmail.com>
 <1548167904630.87035@jhuapl.edu>
 <CANQCQpZ8mV=BrnhMKG6mj6tKP1yaT_9qOPMCp0c098FrpUnK_w@mail.gmail.com>
 <1548257896385.11693@jhuapl.edu>
Message-ID: <CAH=K+6=oPqgjyUMbRn-=2jrXP6VAxP+Wk+TvR1Kp_7_tv88j4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anastasia,
On Wed, Jan 23, 2019 at 9:38 AM Raffucci, Anastasia
<Anastasia.Raffucci@jhuapl.edu> wrote:
>
> Matthew,
>
> I am having some difficulties to test with 2018.11.x.
>
> Makefile:569: *** liblinear is in the dependency chain of nmap that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

This usually happens when a dependency is selected in the packages .mk
file, but not declared a dependency in the Config.in file. I would
start searching there. This file is in $br_root/package/nmap/Config.in

Hope this helps,

Sam

>
> I am not sure what I need to modify or install in addition to be able to use this version of buildroot.
>
>
> Yes, I am running with fresh clone 2017.11.x. I do not copy, or modify any files in buildroot folder.
> I am using external compiler:
> (https://releases.linaro.org/components/toolchain/binaries/7.1-2017.05/arm-linux-gnueabi/)
> gcc-linaro-7.1.1-2017.05-x86_64_arm-linux-gnueabi.tar.xz
> In my $ROOT I have:
> $ ls
> bashrc.local  build/  build_all.sh  defconfig/  overlays/  post-image.sh  pre-image.sh  skeleton/
>
> and I run: $source build_all.sh
>
> build_all.sh:
> #!/bin/sh
> source bashrc.local
> cd
> if [ ! -d buildroot ]; then
>         git clone git://git.busybox.net/buildroot
> fi
> cd buildroot
> git checkout origin/2017.11.x
> cd $ROOT
> cp defconfig/defconfig build/.config
> if [ -f Makefile ]; then
>         make
> else
>         # first run
>         make O=$ROOT/build -C ~/buildroot
> fi
>
> bashrc.local:
> export ARCH=arm
> export ROOT=$PWD
> export CROSS_TOOL_PATH=/tmp/gcc-linaro-7.1.1-2017.05-x86_64_arm-linux-gnueabi
> export CROSS_TOOL_PREFIX=arm-linux-gnueabi
>
> I am reading "host/ contains the installation of tools compiled for the host that are needed for the proper execution of Buildroot, including the cross-compilation toolchain." I also compared the contents of host/ now and when it was working and it is different.
> I expect to have: arm-buildroot-linux-gnueabi  bin  doc  etc  include  lib  lib64  libexec  man  sbin  share  usr  var
> But I currently have: arm-buildroot-linux-gnueabi  bin  lib  lib64  share  usr
> Maybe because of the previous error that is not printed to the screen. So there are obvious missing folders. I think these are the part from cross compiler.
> $ ls /tmp/gcc-linaro-7.1.1-2017.05-x86_64_arm-linux-gnueabi/
> arm-linux-gnueabi/                           lib/
> bin/                                         libexec/
> gcc-linaro-7.1.1-2017.05-linux-manifest.txt  share/
> include/
>
> Anastasia
> ________________________________________
> From: Matthew Weber <matthew.weber@collins.com>
> Sent: Tuesday, January 22, 2019 10:41 AM
> To: Raffucci, Anastasia
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Error when installing to staging directory
>
> Raffucci,
>
> On Tue, Jan 22, 2019 at 8:38 AM Raffucci, Anastasia
> <Anastasia.Raffucci@jhuapl.edu> wrote:
> >
> > I am using origin/2017.11.x (0edec09c322744ce1820337487e9bcb9cbcf7ab7) No modifications.
>
> Would you mind testing with 2018.11?
>
> When you copy over to the new location, is it a fresh 2017.11 git
> clone?  Are you using a target that's already in buildroot or are
> there additional files you copy into the buildroot folder after GIT
> cloning?
>
> You mention doing a out of tree build.  I assume that folder is never
> relocated and always created new when you do your "make O=<out of tree
> location> <defconfig name>_defconfig" to setup your build?
>
> > Not sure what you mean by br2-external. I guess I am not using it. Should I?
>
> Not necessarly, it's a way you can manage customization but not
> required.  Checkout details in the manual about keeping customizations
> outside of buildroot if you have interest in that.
>
> >
> > -----Original Message-----
> > From: Matthew Weber [mailto:matthew.weber at collins.com]
> > Sent: Monday, January 21, 2019 9:51 PM
> > To: Raffucci, Anastasia
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] Error when installing to staging directory
> >
> > Raffucci,
> >
> >
> > On Mon, Jan 21, 2019 at 3:48 PM Raffucci, Anastasia <Anastasia.Raffucci@jhuapl.edu> wrote:
> > >
> > > Buildroot Support Team,
> > >
> > >
> > > I am relatively new to Buildroot and embedded Linux. I used Buildroot once for one project before the one I am working on right now. I have some support from people that are using it around me as well. But here is one problem I am struggling to solve.
> > >
> > >
> > > I am having a problem where the process breaks when trying to install staging directory. I am building out of tree with custom skeleton and overlays. I was able to build root file system once. But when I cloned my project to another location on the same machine, I have this error:
> > >
> > >
> >
> > Which version of buildroot is your build based on and are there any modifications or use of a br2-external?
> >
> > >
> > > >>> skeleton-custom  Installing to staging directory
> > > rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg
> > > --exclude .bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty
> > > --exclude '*~' /home/user/linux/buildroot/skeleton/
> > > /home/user/linux/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/
> > > ln -snf lib
> > > /home/user/linux/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/li
> > > b32 ln -snf lib
> > > /home/user/linux/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/us
> > > r/lib32
> > > ln: failed to create symbolic link
> > > '/home/user/linux/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/u
> > > sr/lib32': No such file or directory
> > > package/pkg-generic.mk:273: recipe for target
> > > '/home/user/linux/buildroot/build/skeleton-custom/.stamp_staging_insta
> > > lled' failed
> > > make[1]: ***
> > > [/home/user/linux/buildroot/build/skeleton-custom/.stamp_staging_insta
> > > lled] Error 1
> > > Makefile:16: recipe for target '_all' failed
> > > make: *** [_all] Error 2
> > >
> > >
> > >
> > > I am not reusing any files or directories that get generated by the Buildroot. I also make sure to checkout buildroot git repository to not have any local changes. Unless it is hidden by .gitignore... What could possibly cause this error? As far as I see, everything in /host directory is populated by the Buildroot process. So why the sysroot/usr is missing? Am I missing to export another environment variable for Buildroot that gets set once when you run it first time and always there unchanged? Please help.
> >
> > Would you mind pastebin sharing your .config, environment values and command line history showing your initial build and then what you do
> > when you setup your new build location?    That would help give us an
> > idea of what sequence might be leading up to this error.
> >
> > Thanks!
> > Matt
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Sam Voss | Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 263 4039

sam.voss at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
