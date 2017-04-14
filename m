From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 09:44:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-04-09
In-Reply-To: <54038d3c-376b-b5cb-d4d2-671d1119d722@mind.be>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
 <20170411144331.699becca@free-electrons.com>
 <20170412095212.1A18EB2050@b01ledav03.gho.pok.ibm.com>
 <20170413053406.GA4103@tungsten.ozlabs.ibm.com>
 <54038d3c-376b-b5cb-d4d2-671d1119d722@mind.be>
Message-ID: <20170414094440.70fd14a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 00:14:08 +0200, Arnout Vandecappelle wrote:

>  I don't think the rpath is wrong. For the target, it *is* indeed /usr/lib.
> AFAIU the RPATH is *not* used as an extra -L equivalent at link time, except
> when -rpath-link is given.

Not really clear to me what happens here. The ld documentation says:

     The linker uses the following search paths to locate required
     shared libraries:
       1. Any directories specified by '-rpath-link' options.
       2. Any directories specified by '-rpath' options.  The difference
          between '-rpath' and '-rpath-link' is that directories
          specified by '-rpath' options are included in the executable
          and used at runtime, whereas the '-rpath-link' option is only
          effective at link time.  Searching '-rpath' in this way is
          only supported by native linkers and cross linkers which have
          been configured with the '--with-sysroot' option.
       3. On an ELF system, for native linkers, if the '-rpath' and
          '-rpath-link' options were not used, search the contents of
          the environment variable 'LD_RUN_PATH'.
       4. On SunOS, if the '-rpath' option was not used, search any
          directories specified using '-L' options.
       5. For a native linker, search the contents of the environment
          variable 'LD_LIBRARY_PATH'.
       6. For a native ELF linker, the directories in 'DT_RUNPATH' or
          'DT_RPATH' of a shared library are searched for shared
          libraries needed by it.  The 'DT_RPATH' entries are ignored if
          'DT_RUNPATH' entries exist.
       7. The default directories, normally '/lib' and '/usr/lib'.
       8. For a native linker on an ELF system, if the file
          '/etc/ld.so.conf' exists, the list of directories found in
          that file.

But it's not clear if by "linker" they are talking about what "ld" is
doing at build time, or what "ld.so" is doing at runtime.

I've did a few experiments, building a dummy shared library and a
program that links to it:

thomas at skate:/tmp/toto$ ls
libtoto.so  libtoto.so.1  main.c  toto.c  toto.o

# -L allows the link to proceed

thomas at skate:/tmp/toto$ gcc -L/tmp/toto -o main main.c -ltoto
thomas at skate:/tmp/toto$ 

# Neither -rpath nor -rpath-link allows ld to find libtoto

thomas at skate:/tmp/toto$ gcc -Wl,-rpath,/tmp/toto -o main main.c -ltoto
/usr/bin/ld: cannot find -ltoto
collect2: error: ld returned 1 exit status

thomas at skate:/tmp/toto$ gcc -Wl,-rpath-link,/tmp/toto -o main main.c -ltoto
/usr/bin/ld: cannot find -ltoto
collect2: error: ld returned 1 exit status

# -L + -rpath, and you get the rpath encoded in the program

thomas at skate:/tmp/toto$ gcc -L/tmp/toto -Wl,-rpath,/tmp/toto -o main main.c -ltoto

thomas at skate:/tmp/toto$ readelf -d main| grep rpath
 0x000000000000000f (RPATH)              Library rpath: [/tmp/toto]

# -L + -rpath-link, and you don't get the rpath encoded in the program

thomas at skate:/tmp/toto$ gcc -L/tmp/toto -Wl,-rpath-link,/tmp/toto -o main main.c -ltoto
thomas at skate:/tmp/toto$ readelf -d main| grep rpath
thomas at skate:/tmp/toto$ 

> > (IMHO this is very poor behaviour from GNU make: it seems to be
> > knowingly producing a broken build but exiting with success, and the
> > only indication is one fairly innocuous looking line of output. There is
> > no option to convert that warning into a fatal error! I even checked the
> > source :-( )
> > 
> > So, what do we do? It seems like it would be nice to catch any circular
> > dependency but is there any good way to do that? I don't like the idea
> > of running make under grep looking for "errors", or trying to manualy
> > detect circular dependencies either... Has this been explored already?  
> 
>  Yes it would be nice to error out on circular dependencies. Also in Kconfig, by
> the way.
> 
>  Our graph-depends detects circular dependencies in the Makefile, so we could
> add it to autobuild-run (prior to the build).

Yes. The thing is that our "make graph-depends" target calls dot
unconditionally, and dot is not necessarily available on the autobuild
instances. So we need to call support/scripts/graph-depends directly
(which is definitely doable).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
