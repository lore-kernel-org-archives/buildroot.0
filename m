From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 14:44:18 +0200
Subject: [Buildroot] Why does host-boost contain only a minimal
 selection?
In-Reply-To: <561CD1A0.8070006@gmail.com>
References: <561CD1A0.8070006@gmail.com>
Message-ID: <20151013144418.6192d5e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anders,

On Tue, 13 Oct 2015 11:40:48 +0200, Anders Norman wrote:

> I have a system set up where I build both natively (for running unit
> tests) and cross. My application uses libboost (package/boost) and fails
> to build natively because the linker can't find libboost-filesystem.so.
> I investigated the issue and find the following in package/boost/boost.mk:
> 
> # keep host variant as minimal as possible
> HOST_BOOST_FLAGS = --without-icu --without-libraries=$(subst
> $(space),$(comma),atomic chrono context coroutine date_time exception
> filesystem graph graph_parallel iostreams locale log math mpi
> program_options python random regex serialization signals system test
> thread timer wave)
> 
> I guess this is why my host-boost does not contain the filesystem part.
> What is the reason for removing almost all parts of host-boost when the
> individual selection flags are already present and used correctly for
> the cross build?

The point of most host-* packages is simply to allow building tools
that are needed to build things for the target. So if a minimal
configuration of Boost is sufficient to build the Boost things on the
host that are needed to build the things for the target, then we prefer
to have such a minimal configuration that is faster to build.

We do not intend to have the configuration of all host packages match
the one of the target packages.

If you want to run your unit tests natively, then you should have a
separate Buildroot configuration targetting x86/x86-64, and therefore
use the target Boost.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
