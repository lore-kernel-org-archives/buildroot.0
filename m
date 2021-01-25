From: manu f <e.fiancette@gmail.com>
Date: Mon, 25 Jan 2021 13:40:13 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <CAGshWo3WX8zmkfbCFTW-D+Q=LAYHm52W_qFOSQE+jw-NQsdEcA@mail.gmail.com>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
 <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
 <20210123114813.0f7048c2@windsurf.home>
 <CAGshWo2ngucacs+BJocUb36G4QX7Q7ssv2_M0R9kAiV+oick1Q@mail.gmail.com>
 <20210124161440.52c2d7d6@gmx.net>
 <CAGshWo31-JML-C6D+T+Bbp8QrsWKZhE2r4-N8HaOAp6z4rkhtQ@mail.gmail.com>
 <20210124173940.29212b62@gmx.net>
 <CAGshWo2TRnTguBc3inO23idP2kMjnXzXeBaOsx=s_jWmh3ddhg@mail.gmail.com>
 <20210124225357.12a7e17e@gmx.net>
 <CAGshWo3WX8zmkfbCFTW-D+Q=LAYHm52W_qFOSQE+jw-NQsdEcA@mail.gmail.com>
Message-ID: <CAGshWo2+Zq9DutPd27rbJbgs+5X=VrK-3_Wo72GXwc57QmyGpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, it's again me!

Well, I remove my python37 package, delete my output directory, select
python3 package from buildroot and host python3 in host utilities  from
buildroot and ...

user at LinuxDev:~/cleta_buildroot$ make BR2_EXTERNAL=$PWD/br-external -C
buildroot/ O=$PWD/output
make: Entering directory '/home/user/cleta_buildroot/buildroot'
/usr/bin/make -j1 O=/home/user/cleta_buildroot/output HOSTCC="/usr/bin/gcc"
HOSTCXX="/usr/bin/g++" syncconfig
  GEN     /home/user/cleta_buildroot/output/Makefile
make[1]: *** No rule to make target 'host-python', needed by
'/home/user/cleta_buildroot/output/build/libevdev-1.8.0/.stamp_configured'.
Stop.
make: *** [Makefile:84: _all] Error 2
make: Leaving directory '/home/user/cleta_buildroot/buildroot'
user at LinuxDev:~/cleta_buildroot$

Always same problem !!
So what's wrong ?
Help needed thx

Le lun. 25 janv. 2021 ? 10:55, manu f <e.fiancette@gmail.com> a ?crit :

> I will use the buildroot python package Peter.
> In fact the app that I must deploy on the Kernel use the version 3.7, I
> know it must work also with the version 3.8 but it was for me an exercise
> to learn how to add a package! (not good result but I learn a lot with your
> help)
>
> Now I understand better how the .mk I made work with the build process.
>
> Again thanks a lot for your help.
>
> Le dim. 24 janv. 2021 ? 22:53, Peter Seiderer <ps.report@gmx.net> a
> ?crit :
>
>> Hello Emmanuel,
>>
>> On Sun, 24 Jan 2021 22:27:06 +0100, manu f <e.fiancette@gmail.com> wrote:
>>
>> > You are right Peter!
>> > You will find my python pakage joined.
>> > Like I told you I am noob in kernel compil, so sure I made bad thing,
>> but I
>> > am here to learn.
>> >
>> > So if I well understood even if I didnt select the package in menu
>> config,
>> > config.in and .mk file interferes with the build..
>> > I use some other config.in and .mk file as model to build these file
>> for my
>> > package, so I make a mistake, if you could look them ?
>>
>> Besides the point I did not understand why you try to install some
>> python37
>> binaries (or source?)....all vars in python37/python37.mk should be
>> named PYTHON37_... (instead of PYTHON_...) and the one in
>> python37/Config.in
>> should be named BR2_PYTHON37...
>>
>> Why not just enable the buildroot python3 package (will be python-3.8.6
>> when using buildroot-2020.02.8)?
>>
>> Regards,
>> Peter
>>
>> >
>> > Regards
>> >
>> > (I remove the tar file in files directory cause it is to heavy to send,
>> but
>> > it's just python37 archive)
>> >
>> > Le dim. 24 janv. 2021 ? 17:39, Peter Seiderer <ps.report@gmx.net> a
>> ?crit :
>> >
>> > > Hello Emmanuel,
>> > >
>> > > On Sun, 24 Jan 2021 17:08:21 +0100, manu f <e.fiancette@gmail.com>
>> wrote:
>> > >
>> > > > Thanks peter.
>> > > > What's mean Buildroot 2020.02.8-dirty?
>> > >
>> > > This indicates normally a buildroot git repository at version
>> > > 2020.02.8 (tag/branch) with local changes ('dirty')...
>> > >
>> > > >
>> > > > About python37, yes I add this custom package but like you see I
>> didn't
>> > > > select it.
>> > >
>> > > But the line '+# BR2_PACKAGE_PYTHON is not set' indicates that
>> > > there is no python package any longer with your build setup
>> > > (and so no host-python available needed by libevdev)...
>> > >
>> > > Hard to judge without knowledge of your br-external but I would
>> suspect
>> > > it contains a package/python directory with a python.mk file without
>> > > an '$(eval $(host-autotools-package))' line (or something like
>> > > that) and a Config.in file with BR2_PACKAGE_PYTHON_37 instead of
>> > > BR2_PACKAGE_PYTHON?
>> > >
>> > > If so try to move .../br-exteranl/package/python to
>> > > .../br-exteranl/package/python-37
>> > >
>> > > Regards,
>> > > Peter
>> > >
>> > > > this config is without livdevdev and it compile right. but if I
>> select
>> > > it I
>> > > > had th error I gave (do you think it could be a problem if I not set
>> > > > libdevdev, I realy not sure I need it, sorry I didn't completly
>> setupp
>> > > this
>> > > > buildroot jus modify some aspect and I am far to master all).
>> > > >
>> > > > But its is strange that I have BR2_PACKAGE_PYTHON not set.
>> > > > I will look later (I am not on my linux computer), I think I even
>> havent
>> > > > pithon item in menu-config...
>> > > > Is this mean I have a problem with python dependencies ? I will
>> check the
>> > > > dependencies logic.
>> > > >
>> > > > Peter, Its very strange that at your side you could compile with
>> > > libdevdev
>> > > > set and not me. Do you have an idea wher I could search?
>> > > >
>> > > > Many thanks for helping.
>> > > >
>> > > > Regards.
>> > > >
>> > > > Emmanuel
>> > > >
>> > > >
>> > > >
>> > > > Le dim. 24 janv. 2021 ? 16:14, Peter Seiderer <ps.report@gmx.net>
>> a
>> > > ?crit :
>> > > >
>> > > > > Hello,
>> > > > >
>> > > > > On Sun, 24 Jan 2021 12:40:31 +0100, manu f <e.fiancette@gmail.com>
>>
>> > > wrote:
>> > > > >
>> > > > > > here my complete .config
>> > > > >
>> > > > > Importing your .config into a plain buildroot-2020.02.8 gives
>> > > > > the following diff:
>> > > > >
>> > > > > @@ -1,9 +1,8 @@
>> > > > >  #
>> > > > >  # Automatically generated file; DO NOT EDIT.
>> > > > > -# Buildroot 2020.02.8-dirty Configuration
>> > > > > +# Buildroot 2020.02.8 Configuration
>> > > > >  #
>> > > > >  BR2_HAVE_DOT_CONFIG=y
>> > > > > -BR2_EXTERNAL_ATOS_PATH="/home/user/cleta_buildroot/br-external"
>> > > > >  BR2_HOST_GCC_AT_LEAST_4_9=y
>> > > > >  BR2_HOST_GCC_AT_LEAST_5=y
>> > > > >  BR2_HOST_GCC_AT_LEAST_6=y
>> > > > > @@ -1446,6 +1445,7 @@
>> > > > >  #
>> > > > >  # BR2_PACKAGE_PERL is not set
>> > > > >  # BR2_PACKAGE_PHP is not set
>> > > > > +# BR2_PACKAGE_PYTHON is not set
>> > > > >  BR2_PACKAGE_PYTHON3=y
>> > > > >  # BR2_PACKAGE_PYTHON3_PY_ONLY is not set
>> > > > >  BR2_PACKAGE_PYTHON3_PYC_ONLY=y
>> > > > > @@ -4174,6 +4174,7 @@
>> > > > >  # BR2_PACKAGE_HOST_PKGCONF is not set
>> > > > >  # BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT is not set
>> > > > >  # BR2_PACKAGE_HOST_PWGEN is not set
>> > > > > +# BR2_PACKAGE_HOST_PYTHON is not set
>> > > > >  # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
>> > > > >  # BR2_PACKAGE_HOST_PYTHON_LXML is not set
>> > > > >  # BR2_PACKAGE_HOST_PYTHON_SIX is not set
>> > > > > @@ -4876,17 +4877,3 @@
>> > > > >  # BR2_VFP_FLOAT is not set
>> > > > >  # BR2_PACKAGE_GCC_TARGET is not set
>> > > > >  # BR2_HAVE_DEVFILES is not set
>> > > > > -
>> > > > > -#
>> > > > > -# External options
>> > > > > -#
>> > > > > -
>> > > > > -#
>> > > > > -# br2-external tree for atos projects (in
>> > > > > /home/user/cleta_buildroot/br-external)
>> > > > > -#
>> > > > > -BR2_PACKAGE_BACKLIGHT_MONITORING=y
>> > > > > -BR2_PACKAGE_TEST_UART=y
>> > > > > -BR2_PACKAGE_APP_MOUNT=y
>> > > > > -BR2_PACKAGE_APP_UPDATER=y
>> > > > > -BR2_NODE_JS_14x=y
>> > > > > -# BR2_PYTHON_37 is not set
>> > > > >
>> > > > >
>> > > > > Note the lines with 'Buildroot 2020.02.8-dirty',
>> > > > >
>> '-BR2_EXTERNAL_ATOS_PATH="/home/user/cleta_buildroot/br-external"',
>> > > > > '+# BR2_PACKAGE_PYTHON is not set' and '-# BR2_PYTHON_37 is not
>> set',
>> > > > > so most likely something with your local change and/or br-external
>> > > > > changing the package python to python37?
>> > > > >
>> > > > > Otherwise the config compiles fine here (even with libevdev
>> enabled)...
>> > > > >
>> > > > > Regards,
>> > > > > Peter
>> > > > >
>> > > > >
>> > > > > >
>> > > > > > Le sam. 23 janv. 2021 ? 11:48, Thomas Petazzoni <
>> > > > > > thomas.petazzoni at bootlin.com> a ?crit :
>> > > > > >
>> > > > > > > On Fri, 22 Jan 2021 23:53:30 +0100
>> > > > > > > manu f <e.fiancette@gmail.com> wrote:
>> > > > > > >
>> > > > > > > > ok, I remove libevdev in Target package =>libraries=>Other
>> and
>> > > its
>> > > > > copile
>> > > > > > > > without error!
>> > > > > > > >
>> > > > > > > > (But I dont know if I realy need this lib... )
>> > > > > > > >
>> > > > > > > > Well why it no compile with libdevdev ?
>> > > > > > > > @ Thomas Petazzoni I saw you already got problem and make
>> patch
>> > > for
>> > > > > > > > host-python interpreter...is there something to see with ?
>> > > > > > >
>> > > > > > > host-python is definitely part of Buildroot 2020.02, so I'm
>> not
>> > > sure
>> > > > > > > how you can get this error. We would need more details, such
>> as the
>> > > > > > > complete .config that reproduces the issue.
>> > > > > > >
>> > > > > > > Thomas
>> > > > > > > --
>> > > > > > > Thomas Petazzoni, CTO, Bootlin
>> > > > > > > Embedded Linux and Kernel engineering
>> > > > > > > https://bootlin.com
>> > > > > > >
>> > > > >
>> > > > >
>> > >
>> > >
>>
>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210125/8e661681/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 132368 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210125/8e661681/attachment.obj>
