From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Tue, 10 Mar 2015 18:49:50 -0500
Subject: [Buildroot] ldconfig - unknown machine 40
Message-ID: <20150310234950.GA20190@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Thomas,

Thomas Petazzoni <thomas.petazzoni@...> writes:

> 
> Dear Matthias 'muh' Pauligk,
> 
> On Thu, 15 Jan 2015 06:23:54 -0800 (PST), Matthias 'muh' Pauligk wrote:
> 
> > I faced the same problem using buildroot's toolchain.
> > The ld-config is present in the host directory, but the Makefile is looking
> > at the wrong path.
> > So I made a small patch to fix this issue, which is working fine for me:
> 
> The problem is unfortunately not that simple: yes you have a ldconfig
> for glibc toolchains. But not for uClibc based toolchains.
> 
> Best regards,
> 
> Thomas
>

... sorry for dredging up an old thread; however, I was wondering if
you would mind commenting more on ldconfig for glibc toolchains.
Should a host ldconfig be build for Buildroot built glibc
toolchains?

I built a glibc 2.20 arm-buildroot-linux-gnueabihf toolchain from
Buildroot 2015.05-git-00331-gcef6a78 and I don't have an
arm-buildroot-linux-gnueabihf-ldconfig.  Thus, when the build gets
to the finalizing target directory stage, I observe the 'ldconfig -
unknown machine 40' message.

    :
    :
# Mandatory configuration file and auxilliary cache directory
# for recent versions of ldconfig
touch /home/dkehn/devel/buildroot/output/target/etc/ld.so.conf
mkdir -p
/home/dkehn/devel/buildroot/output/target/var/cache/ldconfig
if [ -x
"/home/dkehn/devel/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-ldconfig"
]; \
then \
  /home/dkehn/devel/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-ldconfig
  -r /home/dkehn/devel/buildroot/output/target; \
  else \
      /sbin/ldconfig -r /home/dkehn/devel/buildroot/output/target;
      \
      fi
      /sbin/ldconfig:
      /usr/lib/libglibmm_generate_extra_defs-2.4.so.1 is for
      unknown machine 40.

      /sbin/ldconfig: /usr/lib/libxslt.so.1.1.28 is for unknown
      machine 40.
    :
    :

I thought arm-buildroot-linux-gnueabihf-ldconfig would be present.

Thanks and Regards,
..doug
