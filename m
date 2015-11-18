From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 22:46:16 +0100
Subject: [Buildroot] [PATCH 5/6] core: check host executables have
	appropriate RPATH
In-Reply-To: <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 13 Nov 2015 22:48:51 +0100")
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <87fv03aslz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we build our host programs, and they depend on a host library we
 > also build, we want to ensure that program actually uses that library at
 > runtime, and not the one from the system.

 > We currently ensure that in two ways:
 >   - we add a RPATH tag that points to our host library directory,
 >   - we export LD_LIBRARY_PATH to point to that same directory.

 > With thse two in place, we're pretty much confident that our host
 > libraries will be used by our host programs.

 > However, it turns our that not all the host programs we build end up
 > with an RPATH tag:
 >   - some packages do not use our $(HOST_LDFLAGS)
 >   - some packages' build system are oblivious to those LDFLAGS

 > In this case, there are two situation:
 >   - the program is not linked to one of our host libraries: it in fact
 >     does not need an RPATH tag [0]
 >   - the program actually uses one of our host libraries: in that case it
 >     should have had an RPATH tag pointing to the host directory.

 > As for libraries, it is unclear whether they should or should not have
 > an RPATH pointing to our host directory. as for programs, it is only
 > important they have such an RPATH if they have a dependency on another
 > host lbrary we build. But even though, in practice this is not an issue,
 > because the program that loads such a libray does have an RPATH (it did
 > find that library!), so the RPATH from the program is also used to
 > search for second-level (and third-level...) dependencies, as well as
 > for libraries loaded via dlopen().

 > We add a new support script that checks that all ELF executables have
 > a proper DT_RPATH (or DT_RUNPATH) tag when they link to our host
 > libraries, and reports those file that are missing an RPATH. If a file
 > missing an RPATH is an executable, the script aborts; if only libraries
 > are are missing an RPATH, the script does not abort.

 > [0] Except if it were to dlopen() it, of course, but the only program
 > I'm aware of that does that is openssl, and it has a correct RPATH tag.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
