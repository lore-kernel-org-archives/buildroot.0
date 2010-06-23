From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 13:18:00 +0200
Subject: [Buildroot] Host libraries - status
In-Reply-To: <20100623112022.4bb9cab0@surf>
References: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
	<20100623090015.199dd823@surf> <20100623112022.4bb9cab0@surf>
Message-ID: <20100623131800.35b2189f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2010 11:20:22 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Ok, I took the time to investigate this. I tried:
> 
> HOST_LDFLAGS += -Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> 
> and I could reproduce the fakeroot problem: "preload library not
> found". This happens because libfakeroot.so doesn't get compiled. This
> in turn happens because ./configure detects that LD doesn't support
> shared libraries, which in turn happens because ./configure detects
> that LD isn't GNU LD, which happens because for ld, "-Wl,-rpath
> -Wl,$(HOST_DIR)/usr/lib" are incorrect options. And it's true, since
> the ld option is just "-rpath", the -Wl thing being here to tell gcc
> to pass these options down to ld.

After seeing that PTXdist does exactly this (see
http://git.pengutronix.de/?p=ptxdist.git;a=blob;f=rules/pre/Rules.make;h=1fd3707311a19bc06d9b0d0668e9fb4ae2f6176d;hb=HEAD#l284),
I decided to go deeper into this.

And in fact, the problem comes from :

	LD="$(HOSTLD) $(HOST_LDFLAGS)" \

which I turned into:

	LD="$(HOSTLD)" \

in HOST_CONFIGURE_OPTS.

With this + the HOST_LDFLAGS as shown above, my mkfontscale test case
is OK, and fakeroot continues to work properly. I managed to build a
X.org stack + ext2 filesystem for ARM correctly.

Generally speaking, I think we shouldn't do:

                CC="$(HOSTCC) $(HOST_CFLAGS)" \
                GCC="$(HOSTCC) $(HOST_CFLAGS)" \
                CXX="$(HOSTCXX) $(HOST_CXXFLAGS)" \
                CPP="$(HOSTCPP) $(HOST_CFLAGS)" \

But only set CC="$(HOSTCC)", and pass CFLAGS in a separate variable.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
