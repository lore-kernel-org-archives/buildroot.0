From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 11 Apr 2018 09:39:24 -0300 (BRT)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <147906727.2330850.1523328627127.JavaMail.zimbra@datacom.ind.br>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
 <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
 <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
Message-ID: <345647775.2610070.1523450364355.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, April 10, 2018 3:53:44 PM
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Your build results for 2018-04-07

[...]

>> Indeed, this is an issue with libglib2 on powerpc.
>> It seems it doesn't like the following statement:
>> g_object_ref (new_object);

>> because the return value of g_object_ref is "not used".

>> I can make a patch to return a void value:
>> (void) g_object_ref (new_object);

>> But if I fix this one, there is a lot more errors:

>> src/access-broker.c: In function 'access_broker_set_property':
>> src/access-broker.c:71:9: error: value computed is not used
>> [-Werror=unused-value]
>> src/command-source.c: In function 'command_source_set_property':
>> src/command-source.c:149:9: error: value computed is not used
>> [-Werror=unused-value]
>> src/command-source.c: In function 'command_source_on_new_connection':
>> src/command-source.c:277:5: error: value computed is not used
>> [-Werror=unused-value]
>> src/command-source.c: In function 'command_source_new':
>> src/command-source.c:429:5: error: value computed is not used
>> [-Werror=unused-value]
>> cc1: all warnings being treated as errors

>> Each time, it's a call to g_object_ref.

>> So, I search a bit and it seems that the issue is link to this definition from
>> gobject.h:

>> #if defined(__GNUC__) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >=
>> GLIB_VERSION_2_56
>> /* Make reference APIs type safe with macros */
>> #define g_object_ref(Obj) ((__typeof__(Obj)) (g_object_ref) (Obj))
>> #define g_object_ref_sink(Obj) ((__typeof__(Obj)) (g_object_ref_sink) (Obj))
>> #endif

>> These lines have been added by commit [
>> https://github.com/GNOME/glib/commit/3fae39a5d742afe73741f5fd7aa24e3ae8182f06 |
>> https://github.com/GNOME/glib/commit/3fae39a5d742afe73741f5fd7aa24e3ae8182f06 ]
>> .
>> I don't understand why it's not working on powerpc so I will just send a patch
>> for libglib2 to put back old behavior if __powerpc__ is defined.

> Disabling this feature on powerpc is not a good solution for the glib
> developers: [ https://bugzilla.gnome.org/show_bug.cgi?id=795138 |
> https://bugzilla.gnome.org/show_bug.cgi?id=795138 ] .
> So except if someone knows why this define doesn't work on powerpc, perhaps we
> could remove -Werror from tpm2-abrmd package and hope that other glib packages
> will not break on powerpc ...

I investigated it a little bit more and it seems to be restricted to
the rather old GCC used in that build.

$ host/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc --version
powerpc-ctng_e500v2-linux-gnuspe-gcc (crosstool-NG hg+-c65fcf8a34b7) 4.7.3
$ echo -e '#include <glib-object.h>\n' | host/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
                 from staging/usr/include/glib-2.0/glib-object.h:23,
                 from <stdin>:1:
staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is not used [-Werror=unused-value]
cc1: all warnings being treated as errors

Using newer GCC versions:

$ host/bin/powerpc-e500v2-linux-gnuspe-gcc --version
powerpc-e500v2-linux-gnuspe-gcc (crosstool-NG 1.20.0) 4.8.2
$ echo -e '#include <glib-object.h>\n' | host/bin/powerpc-e500v2-linux-gnuspe-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
[success]

$ host/bin/powerpc-buildroot-linux-uclibc-gcc --version
powerpc-buildroot-linux-uclibc-gcc.br_real (Buildroot 2016.08-git-01162-g94c7298) 4.9.3
echo -e '#include <glib-object.h>\n' | host/bin/powerpc-buildroot-linux-uclibc-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
[success]

$ host/bin/powerpc-e500v2-linux-gnuspe-gcc --version
powerpc-e500v2-linux-gnuspe-gcc (crosstool-NG bf52f9a) 5.3.0
$ echo -e '#include <glib-object.h>\n' | host/bin/powerpc-e500v2-linux-gnuspe-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
[success]

$ host/bin/powerpc-linux-gcc --version
powerpc-linux-gcc.br_real (Buildroot 2017.08-git-01078-g95b1dae) 6.3.0
echo -e '#include <glib-object.h>\n' | host/bin/powerpc-linux-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
[success]

So I think we should make libglib2 depend on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 if
the target architecture is PowerPC. Do you agree?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
