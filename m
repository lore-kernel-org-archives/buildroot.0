From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 09:06:47 +0100
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2017-11-15
In-Reply-To: <1510851029.31683.28.camel@synopsys.com>
References: <20171116070015.DBD4B20671@mail.free-electrons.com>
 <1510851029.31683.28.camel@synopsys.com>
Message-ID: <20171117090647.4f104447@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 16:50:30 +0000, Alexey Brodkin wrote:

> > ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_f92fb57954904d55
> > 839ecc7e0759f52869fb8987&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> > fE&s=YR3T_mxXLqDkCWBrYCkWPkZcIItCeTYfI8mnL3siESE&e=
> > ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_0d14e112d5ca94cf
> > 36cbd2605d270215236ffbde&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> > fE&s=_dHTQWl51LzxdleE3rcayzRk1v03T7kC6mFmqrmLj3g&e=
> > ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_4634366b7dfea6d6
> > f11ae4d4410e35beed80f9e7&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> > fE&s=kxc6E07u2PjhognKYoc-m1pEszYqY_uZUCAsvmnnw4c&e=  
> 
> All build above failed on your "gcc112" machine and we cannot reproduce the same problem locally
> on CentOS 7.x machines.
> 
> I remember you mentioned one of your build servers is non-x86 machine.
> Is this the one? If that's a flavour of x86 still what is its Linux distro?
> 
> BTW maybe it worth adding not only host name but its architecture and distro version in Autobuilder artifacts?

All these errors indeed occur on ppc64le. I have already started
investigating this qt-4.8.7 issue. I reproduced it on gcc112, and
started looking into it. The issue is that for some reason, qt uses the
target compiler to build qmake, and therefore later fails to run qmake.

Interestingly, this doesn't happen if the target architecture is ARM.
If the target architecture is ARM, Qt says:

====
Determining system architecture...
(Linux:3.10.0-514.10.2.el7.ppc64le:ppc64le) 64-bit PowerPC (powerpc)
    'arm' is supported
    'powerpc' is supported
System architecture: 'arm'
Host architecture: 'powerpc'
====

So, System architecture != Host architecture, and therefore it uses the
host compiler to build qmake, and everything is fine.

But with Xtensa or ARC as the target architecture, I get:

====
Determining system architecture...
(Linux:3.10.0-514.10.2.el7.ppc64le:ppc64le) 64-bit PowerPC (powerpc)
    'powerpc' is supported
System architecture: 'powerpc'
Host architecture: 'powerpc'
Symbol visibility control enabled.
====

I.e, it thinks that the target architecture is PowerPC. Of course,
building Qt4 for ARC and Xtensa does work on other build machines, so
it's not just "Qt's configure script doesn't know about ARC or Xtensa".
I haven't yet figure out what's going on here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
