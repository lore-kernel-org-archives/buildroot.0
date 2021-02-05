From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 5 Feb 2021 15:42:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-02-04
In-Reply-To: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
References: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Am Fr., 5. Feb. 2021 um 09:18 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>    xtensa    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/e21834d4d2ee580f00f0fdcbd3728787148c0da9
>    nios2     |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/e9bfe730da3faec5884e8950855a34541c3408a9
> microblazeel |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/99ca5aa18074b19f2e6a311c2d38addb697f552b
>   powerpc    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/2b9ad4626a1b6918a8e8d586521626306f5f8133
> microblazeel |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/65108399fb6d7b02d812bc15d5074bfd404764c5
>    nios2     |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/6730e1e6ceebec94a9ad27deac0a4d1bf4661536
>   powerpc    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/16bf1c3b4059a159480d23e6e132dcff05bd9b96
> powerpc64le  |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/985aac8fd746c64e4ad0e093028164d8ae637409
>    mipsel    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/da0e36543cf68e4e9bbe819945a884193f33819a

I checked the reason for the build failure on the netopeer2 package.
It is caused by some files that are created in /dev/shm/sr_* during
the installation process.

I tried to find a solution for that. My first intention was to do a
PRE_INSTALL_HOOK that deletes these files before the installation. But
YANN disclaimed that because we should never delete files in
/dev/shm/. This could lead to failures when doing concurrent parallel
builds.

To be more detailed what is going on:
The netopeer2 package can install the required yang models for runtime
during installation. Therefore an additional script (setup.sh) is
invoked. There the sysrepocfg host tool is used to do the installation
of these yang models. sysrepo will then create this /dev/shm files and
leave them. But with the updated netopeer2 package the shm files are
incompatible and the build errors appear.

So I see here 3 possible solutions:
1. do the PRE_INSTALL_HOOK to remove the files every time (disclaimed by Yann).
2. remove this files by hand (no long term solution).
3. disable the installation of the yang modules .. but then we have a
non functional installation available and we leave the installation of
the yang modules to the user.

What do you think?

-- 
Heiko
