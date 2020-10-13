From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Oct 2020 08:20:17 +0200
Subject: [Buildroot] make creates a memory overflow
In-Reply-To: <003941d3da6d442c9a6740bfda3dd956@go-sys.de> (Michael Fischer's
 message of "Fri, 9 Oct 2020 13:55:38 +0000")
References: <003941d3da6d442c9a6740bfda3dd956@go-sys.de>
Message-ID: <87r1q2r6ji.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

 > Hello all,
 > I use VirtualBox with SuSE linux to compile Buildroot.

 > For my other projects I use the default make settings -j

 > /etc/environment
 > export MAKEOPTS='-j'
 > export MAKEFLAGS='-j'

That is not a safe setting. -j without a number tells make to use as
many processes as it wants to use, which for a big thing like Buildroot
can be a LOT. A more sensible setting is nr-of-CPUs (+1), which matches
the default logic we have for BR2_JLEVEL.

 > When I use this, than buildroot crashes the Virtualbox with a memory overflow. > 8GB

 > I found this in the /package/Makefile

 > MAKE1 := $(HOSTMAKE) -j1
 > override MAKE = $(HOSTMAKE) \
 >         $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))


 > I'm not sure but I think this should be 

 >         $(if $(findstring j,$(filter-out -j%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))


No, the intention is for the logic to not get confused about variables
passed on the make command line, as they are added to MAKEFLAGS after
a -- seperator, E.G.:

make -k foo=j
MAKEFLAGS='k -- foo=j'

-- 
Bye, Peter Korsgaard
