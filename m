From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 10:58:57 +0100
Subject: [Buildroot] [PATCH 5/8] samba4: remove dependency on specific C
 libraries
In-Reply-To: <56A6AA66.1060504@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A6AA66.1060504@gmail.com>
Message-ID: <20160126105857.532efa8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Tue, 26 Jan 2016 00:06:14 +0100, Romain Naour wrote:

> Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> > samba4 relies on the $ORIGIN feature of the dynamic linker, which used
> > to not be implemented in old uClibc versions. However:
> > 
> >  - this feature is supported by glibc
> >  - this feature is supported by uClibc-ng, which is the only uClibc
> >    version we are going to support
> >  - this feature is supported by musl
> > 
> > Consequently, we can completely remove the dependency of samba4 on
> > certain C libraries. This means that samba4 can now be built against
> > the musl C library.
> 
> I'm not able to select samba4 with a musl toolchain.
> Samba4 needs BR2_TOOLCHAIN_HAS_NATIVE_RPC which is not selected/detected with
> internal/external toolchains.
> 
> So, no samba4 with musl for the moment ;-)

Indeed. Enabling on musl was solely based on the fact that musl has
support for $ORIGIN since version 0.9.13:

0.9.13 release notes

new features:
- iconv support for EUC-KR and Big5 (including HKSCS) encodings
- field widths (POSIX 2008 feature) in strftime
- recursive rpath and $ORIGIN support in dynamic linker
[...]

What the patch means is that there is a priori no reason to have samba4
depend on uclibc-ng || glibc due to $ORIGIN support: now all of glibc,
uclibc and musl have this functionality.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
