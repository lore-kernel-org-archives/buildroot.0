From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:37:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: remove libnsl linking
 with Glibc.
In-Reply-To: <8328c7c8-4c79-20d7-6e7c-425fe3d9fcf7@gmail.com>
References: <20180501200508.13974-1-romain.naour@gmail.com>
 <20180501221254.7f29363b@windsurf.home>
 <8328c7c8-4c79-20d7-6e7c-425fe3d9fcf7@gmail.com>
Message-ID: <20180501223746.1ed2eddf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 May 2018 22:19:13 +0200, Romain Naour wrote:

> Le 01/05/2018 ? 22:12, Thomas Petazzoni a ?crit?:
> > Hello,
> > 
> > On Tue,  1 May 2018 22:05:07 +0200, Romain Naour wrote:  
> >> libnsl has been deprecated from Glibc and no other libc provide it.
> >> Also there is no libnsl package in Buildroot yet, so remove -lnsl for
> >> all toolchains.
> >>
> >> libnsl is now a library that can be packaged later if needed. [1]
> >>
> >> Note: Fedora 28 has switched to the new libnsl library that bring
> >> IPV6 support. [2]
> >>
> >> [1] https://github.com/thkukuk/libnsl.git
> >> [2] https://fedoraproject.org/wiki/Changes/NISIPv6  
> > 
> > This commit log doesn't really explain the motivation for the change.
> > What is the ultimate goal here ?  
> 
> The motivation is to remove libnsl provided by Glibc. Since the new libnsl is
> not packaged in Buildroot. Remove -lnsl from the exim Makefile.

I think the explanation in the commit log should be improved then.

Perhaps something like:

""""
glibc now considers its built-in libnsl as being obsolete, and requires
passing --enable-obsolete-libnsl to have it built and installed. libnsl
is now provided as a separate project, but it isn't packaged yet in
Buildroot.

In preparation for dropping --enable-obsolete-libnsl from the glibc
package, this commit ensures that exim doesn't use libnsl. It was
already the case for uclibc and musl toolchains, so this commit simply
extends that to make sure libnsl is also not used with glibc toolchains.
""""

Does this capture the problem properly ?

Remains some questions though: why is exim linking with libnsl in the
first place ? Doesn't it use symbols from this library ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
