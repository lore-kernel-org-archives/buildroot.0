From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Nov 2011 15:24:58 +0100
Subject: [Buildroot] [git commit] gdb: fix kconfig dependency handling
	with !BR_TOOLCHAIN_BUILDROOT
In-Reply-To: <20111124150905.40405e14@skate> (Thomas Petazzoni's message of
 "Thu, 24 Nov 2011 15:09:05 +0100")
References: <20111124134059.5A2918F66D@busybox.osuosl.org>
 <20111124150905.40405e14@skate>
Message-ID: <87ipm9a98l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I don't get why two different options are needed here. Could you expand
 Thomas> a bit on that ?

 >> +config BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 >> +	default y if !BR2_TOOLCHAIN_HAS_THREADS
 >> +	bool
 >> +

 Thomas> I also don't get this "default y if !BR2_TOOLCHAIN_HAS_THREADS". Could
 Thomas> you give some details ?

I tried to do so in the commit message - But I'll give it another try.

We need 2 things:

- An option to test in helper.mk when we use external uClibc based
  toolchains

- Something to ensure you cannot enable the effected GDB versions with
  incompatible toolchains

Those two things are not the same (E.G. if you don't have threads
support then you can use the new GDB versions without thread
debugging). The 2nd (_IF_NEEDED) option is not strictly needed, you
could also just write out the complicated logic for each GDB 7.x
version, but that's kind of ugly and I had some problems getting kconfig
to handle it, so I added the helper option instead.

I hope this helps, otherwise just ask.

-- 
Bye, Peter Korsgaard
