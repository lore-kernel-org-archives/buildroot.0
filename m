From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:40:24 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: fix build with static libcap and
 shared gnutls
In-Reply-To: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
References: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
Message-ID: <20180503214024.71d04136@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Sorry for the slow feedback on this one.

On Sat,  7 Apr 2018 18:22:34 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/b655d6853c25a195df28d91512b3ffb6c654fc90
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, this happens because when BR2_SHARED_LIBS=y, gnutls installs only a
shared library, while libcap installs both a static library and a
shared library.

But really, the crux of the problem is that LXC shouldn't try to build
a statically linked program when BR2_SHARED_LIBS=y. It doesn't make
sense, because we don't guarantee to provide static libraries when
BR2_SHARED_LIBS=y: some packages do build static libraries
unconditionally, but for examples the autotools packages that obey to
--disable-static will not build/install static libraries when
BR2_SHARED_LIBS=y.

And in fact, I'm wondering how your patch resolves that really. I guess
it disables GnuTLS support in such a situation, but that isn't really
the right fix IMO. I would rather disable the build of the static
version of the LXC program.

Do you think you could have a look into this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
