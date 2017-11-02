From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 18:43:38 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031230519.3feb2619@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
Message-ID: <20171102174338.GD3238@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-31 23:05 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> >          arc |   host-gdb-arc-2017.09-rc1-gdb | NOK | http://autobuild.buildroot.net/results/43eae264991aa369490236c7bd59c0b6a67fcf25 | ORPH
> 
> checking whether /usr/bin/g++ supports C++11 features with -h std=c++11... no
> configure: error: *** A compiler with support for C++11 language features is required.
> make[2]: *** [configure-gdb] Error 1
> 
> The ARC special version needs:
> 
>         depends on BR2_HOST_GCC_AT_LEAST_4_8
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> Just like the gdb 8.0 version.
> 
> Yann, perhaps you could have a look at this ?

I'm not sure how I got dragged into an ARC-related issue... ;-]

But here, we're speaking about the host-gdb, and that one is not
protected:

    config BR2_PACKAGE_HOST_GDB
        bool "Build cross gdb for the host"
        # When the external toolchain gdbserver is used, we shouldn't
        # allow to build a cross-gdb, as the one of the external
        # toolchain should be used.
        depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
        depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
        depends on !BR2_microblaze
        depends on !BR2_nios2
        depends on !BR2_or1k
        help
          Build a cross gdb that runs on the host machine and debugs
          programs running on the target. It requires 'gdbserver'
          installed on the target, see BR2_PACKAGE_GDB_SERVER to
          enable it.

    [--SNIP--]

    config BR2_GDB_VERSION
        string
        default "arc-2017.09-rc1-gdb" if BR2_arc

And on that autobuilder, the host gcc is a 4.7 (toward the top of the
file): http://autobuild.buildroot.org/results/43eae264991aa369490236c7bd59c0b6a67fcf25/config

So, we'd need to add:

    config BR2_PACKAGE_HOST_GDB
        depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc

or something like that?

> >         m68k |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/5bff9fbd24264b3515a669d585e10ef23127d569 |     
> >       mipsel |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/d1c8e74477797b597c38186343e4d6c69b05560d |     
> 
> SVN repo is dead, and it locks up the build until we time out? Doesn't
> look great. Yann? :-)

Not sure why I got fragged into an SVN-related issue... ;-]

The repository is not dead from here, though:

    $ svn ls http://svn.xiph.org/trunk/Tremor
    Redirecting to URL 'https://svn.xiph.org/trunk/Tremor':
    Error validating server certificate for 'https://svn.xiph.org:443':
     - The certificate is not issued by a trusted authority. Use the
       fingerprint to validate the certificate manually!
    Certificate information:
     - Hostname: xiph.org
     - Valid: from Mar 31 21:45:50 2016 GMT until Mar 31 21:45:50 2018 GMT
     - Issuer: StartCom Class 2 IV Server CA, StartCom Certification
       Authority, StartCom Ltd., IL
     - Fingerprint:
       B9:AF:55:63:87:0A:45:9C:BD:B9:39:43:08:DA:7C:CA:87:20:BF:11
    (R)eject, accept (t)emporarily or accept (p)ermanently? t
    CHANGELOG
    COPYING
    [...]

But there is an https redirect, and the certificate is not recognised
somehow (my Firefox has no problem with it, though)...

We should probably at least add '--non-interactive' to have it at least
fail if it needs to prompt.

We could also make use of '--trust-server-cert-failures=ARG' where ARG
is one of 'unknown-ca', 'cn-mismatch', 'expired', 'not-yet-valid' or
'other'. But I am a bit reluctant at silently quiesce certificate
errors...

Your call.

> > microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/20a9a75f701ce70c2ae434085a85ad8d34adc67b | ORPH
> >          arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/46844b028989808aa7340c14af22f2855ec803d8 | ORPH
> > 
> 
> Not sure. Is it just:
> 
> 
> make[2]: *** [jim/libjim.a] Error 1
> make[2]: *** Waiting for unfinished jobs....
> usb_modeswitch.c: In function 'checkSuccess':
> usb_modeswitch.c:1579:7: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
>     if (i == CheckSuccess-1) {
> 
> That makes the build fail?

The problem is higher in the stack:

    autosetup/system.tcl:203 /home/peko/autobuild/instance-2/output/build/usb_modeswitch-2.5.0/jim/autosetup/config.guess: unable to guess system type

Regards,
Yann E. MORIN.

> Baruch, you are the last person who bumped this package, could you have a look?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
