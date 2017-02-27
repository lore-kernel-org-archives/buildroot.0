From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:20:49 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <CA+-urNQUEmsQy2_8UcL5FQqq10O-nQjNUY_nxwcD8mHxCtW2tw@mail.gmail.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <CA+-urNQUEmsQy2_8UcL5FQqq10O-nQjNUY_nxwcD8mHxCtW2tw@mail.gmail.com>
Message-ID: <20170227212049.035b8d71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 11:54:19 -0500, Frank Hunleth wrote:

> >>         i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/92f9a6b804072a521ad0b25086a0a5ed33eaf53e
> >>          arc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a04ba24c6cd61bf6f2128a0e869f679cb3f2eac3  
> >
> > Static linking issues, with a CMake based package. Frank, Samuel, could
> > you have a look?
> >  
> 
> I took a quick look. The issue is due to a transitive dependency on
> zlib not being added to the linker invocation. The rabbitmq utilities
> make calls to libcrypto.a which has calls to zlib. I don't use cmake
> enough to know how this is normally fixed with that tool. If there's
> another example somewhere that I can copy, I don't mind submitting a
> fix.

The proper solution for this is to use pkg-config to discover the
libraries. pkg-config has the relevant information about transitive
dependencies that are needed for static linking to work properly.

It is worth noting that the problem does not occur only with
openssl->zlib, but also with libintl.

> p.s. Fwiw, rabbitmq-c is actually maintained by Joris Lijssens, so I'm
> adding him to the cc list in case he has run into this. My rabbitmq
> package is rabbitmq-server, but my project with rabbit also uses
> rabbitmq-c.

Ah, yes, indeed, my bad. Thanks for adding Joris in the loop then. He
should anyway have received notifications of the build failures.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
