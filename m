From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jul 2019 22:42:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: switch from gnutls to
 openssl
In-Reply-To: <20190705165040.26254-1-fontaine.fabrice@gmail.com>
References: <20190705165040.26254-1-fontaine.fabrice@gmail.com>
Message-ID: <20190727224246.75bd967e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri,  5 Jul 2019 18:50:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c0a9565ae65336d55cdedc67adff221a7fa1a2c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, but this is not entirely convincing, for two reasons:

 - The actual build failure is due to libgnutls.so using __atomic
   built-ins, without being linked to libatomic.so. This is a problem
   that can affect any other package that uses libgnutls.so (and a
   question is why we're not seeing more failures like this, from other
   packages that use libgnutls).

 - Switching to openssl is certainly OK, but the lxc configure.ac logic
   does just OPENSSL_LIBS='-lssl -lcrypto', which is pretty much
   guaranteed to fail in static linking scenarios, as it doesn't
   account for second-order dependencies of openssl (the classic -lz
   missing).

Could you have a look at the libgnutls.so/libatomic.so issue, and
double check if lxc/openssl builds fine in a static linking
configuration ? For the latter, it is possible that lxc already depends
on libz for another reason, in which case the problem will not be
visible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
