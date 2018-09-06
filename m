From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 6 Sep 2018 23:33:57 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] boost: fix static detection of lock-free atomic ints
In-Reply-To: <20180906210545.6717e9ac@windsurf>
References: <20180905105127.31591-1-fontaine.fabrice@gmail.com>
 <20180906210545.6717e9ac@windsurf>
Message-ID: <CAPi7W81XS3XY46jqAW6RTkrK0iiiqxBsuOdeC01R9O92B95Vaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le jeu. 6 sept. 2018 ? 21:06, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fabrice,
>
> Thanks again for your work on this topic. However, I am sorry, but I
> still don't understand :-/
>
> On Wed,  5 Sep 2018 12:51:27 +0200, Fabrice Fontaine wrote:
>
> > +When build statically, boost is unable to detect lock-free atomics ints
> > +because it tries to link dynamically with boost_system, see
>
> I don't see where it tries to link dynamically with boost_system.
>
> > +Using shell: /bin/sh -c
> > +    argv[0] = '/bin/sh'
> > +    argv[1] = '-c'
> > +    argv[2] = '
> > +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
>  -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline
> -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter
> -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1
> -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o
> "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o"
> "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
> >
> > +gcc.compile.c++
> bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o
> > +
> > +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
>  -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline
> -Wall -pedantic -g -Wextra -Wno-long-long -Wno-unused-parameter
> -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1
> -DBOOST_THREAD_BUILD_DLL=1  -I"." -c -o
> "bin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi/has_atomic_flag_lockfree_test.o"
> "libs/thread/src/../build/has_atomic_flag_lockfree_test.cpp"
>
> Here it builds the object file has_atomic_flag_lockfree_test.o, it uses
> -static, there's no -shared or nothing really wrong here. This tests
> succeeds, so lock-free atomic ints are available, we're all good.
>
> It does *not* try to link against libboost_system at this point.
>
> > +0.033561 sec system; 0.126314 sec user; 288.682473 sec clock
> > +gcc.compile.c++
> bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o
> > +
> > +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
>  -Wl,-elf2flt -static  -Wl,-elf2flt -static -fPIC -pthread -O0 -fno-inline
> -Wall -pedantic -g  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1  -I"."
> -c -o
> "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"
> "libs/system/src/error_code.cpp"
> > +
> > +0.084060 sec system; 0.644133 sec user; 8.858824 sec clock
> > +SEM: <s>gcc-link-semaphore now used by
> <pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
> > +Using shell: /bin/sh -c
> > +    argv[0] = '/bin/sh'
> > +    argv[1] = '-c'
> > +    argv[2] = '
> > +    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o
> "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0"
> -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group
> "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"
> -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g
> -Wl,-elf2flt -static
>
> Here is also does not try to link against libboost_system: it tries to
> *generate* it!
>
> The summarized command is "g++ -o libboost_system.so.1.67.0" so the
> overall goal of the command is to *produce* libboost_system.so.1.67.0,
> not to link against it.
>
That's right it fails because it can't produce it but it produces it in the
goal of linking to it. For more information, you can see more traces of a
successfull build in the PR: https://github.com/boostorg/thread/pull/231.

>
> > +ld (ld-elf2flt): -shared used without passing a shared library ID
>
> Obviously, this fails because building shared libraries is not possible
> in this static-only configuration.


> But I fail to see the relation:
>
>  - Between producing libboost_system.so and the "project boost/thread"
>    thing
>
Here is an extract of the "Project attributes" section of
https://www.boost.org/doc/libs/1_67_0/doc/html/bbv2/tutorial.html
<https://www.boost.org/doc/libs/1_36_0/doc/html/bbv2/tutorial.html>:

"If we want the same requirements for our other target, hello2 , we could
simply duplicate them. However, as projects grow, that approach leads to a
great deal of repeated boilerplate in Jamfiles. Fortunately, there's a
better way. Each project can specify a set of *attributes*, including
requirements:

project
    : requirements <include>/home/ghost/Work/boost <threading>multi
    ;

exe hello : hello.cpp ;
exe hello2 : hello.cpp ;"

So in our case, we have:
project boost/thread
    : requirements <threading>multi
[...]
                          <library>/boost/system//boost_system ;
exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ;

This means that has_atomic_flag_lockfree requires boost_system.
If we move has_atomic_flag_lockfree before the project statement then
boost_system is not required anymore. This also means that all the other
requirements for boost/thread does not apply for this simple test which
seems acceptabe to me.

>
>  - Between inverting "project boost/thread" and the
>    atomic_flag_lock_free test and this issue disappearing.
>
> This still feel very mysterious to me.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180906/a41b789d/attachment.html>
