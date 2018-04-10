From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Apr 2018 19:09:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <147906727.2330850.1523328627127.JavaMail.zimbra@datacom.ind.br>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

2018-04-10 5:00 GMT+02:00 Carlos Santos <casantos@datacom.ind.br>:

> > From: "Carlos Santos" <casantos@datacom.ind.br>
> > To: "buildroot" <buildroot@buildroot.org>
> > Cc: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>, "Thomas Petazzoni"
> <thomas.petazzoni@bootlin.com>
> > Sent: Monday, April 9, 2018 11:50:27 PM
> > Subject: Re: [Buildroot] [autobuild.buildroot.net] Your build results
> for 2018-04-07
>
> >> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> >> To: "Carlos Santos" <casantos@datacom.ind.br>
> >> Sent: Sunday, April 8, 2018 3:00:16 AM
> >> Subject: [autobuild.buildroot.net] Your build results for 2018-04-07
> >
> >> Hello,
> >>
> >> This is the list of Buildroot build failures that occured on
> >> 2018-04-07, and for which you are a registered architecture developer
> >> or package developer. Please help us improving the quality of
> >> Buildroot by investigating those build failures and sending patches to
> >> fix them. Thanks!
> >>
> >> Results for the 'master' branch
> >> ===============================
> >>
> >> Build failures related to your packages:
> >>
> >>     powerpc |               tpm2-abrmd-1.3.0 |
> >>     http://autobuild.buildroot.net/results/b29a2f868438a2210873
> ea72f491db63175848be
> >>
> >> --
> >> http://autobuild.buildroot.net
> >
> > The it's a problem libglib2, not in tpm2-abrmd:
> >
> > $ echo -e '#include <gio/gio.h>\nint main(){return 0;}' |
> > host/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc -x c -I
> > staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall
> -Werror
> > -c - -o /tmp/foo.o
> > In file included from staging/usr/include/glib-2.0/g
> object/gbinding.h:29:0,
> >                 from staging/usr/include/glib-2.0/glib-object.h:23,
> >                 from staging/usr/include/glib-2.0/gio/gioenums.h:28,
> >                 from staging/usr/include/glib-2.0/gio/giotypes.h:28,
> >                 from staging/usr/include/glib-2.0/gio/gio.h:26,
> >                 from <stdin>:1:
> > staging/usr/include/glib-2.0/gobject/gobject.h: In function
> 'g_set_object':
> > staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value
> computed is
> > not used [-Werror=unused-value]
> > cc1: all warnings being treated as errors
> >
> > This was after commit 4dcfcd17c09b5684e95943de119b95a34c93ad63, so the
> > bump to libglig2 v2.56.1 did not solve the problem.
>
> It seems to be relates do this specific tollchain. I can't reproduce it
> using the host compiler:
>
> $ gcc --version
> gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)
> $ echo -e '#include <gio/gio.h>\nint main(){return 0;}' | gcc -x c -I
> staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall
> -Werror -c - -o /tmp/foo.o
>
> [no error]
>
> Indeed, this is an issue with libglib2 on powerpc.
It seems it doesn't like the following statement:
g_object_ref (new_object);

because the return value of g_object_ref is "not used".

I can make a patch to return a void value:
(void) g_object_ref (new_object);

But if I fix this one, there is a lot more errors:

src/access-broker.c: In function 'access_broker_set_property':
src/access-broker.c:71:9: error: value computed is not used
[-Werror=unused-value]
src/command-source.c: In function 'command_source_set_property':
src/command-source.c:149:9: error: value computed is not used
[-Werror=unused-value]
src/command-source.c: In function 'command_source_on_new_connection':
src/command-source.c:277:5: error: value computed is not used
[-Werror=unused-value]
src/command-source.c: In function 'command_source_new':
src/command-source.c:429:5: error: value computed is not used
[-Werror=unused-value]
cc1: all warnings being treated as errors

Each time, it's a call to g_object_ref.

So, I search a bit and it seems that the issue is link to this definition
from gobject.h:

#if defined(__GNUC__) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED
>= GLIB_VERSION_2_56
/* Make reference APIs type safe with macros */
#define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
#define g_object_ref_sink(Obj) ((__typeof__(Obj)) (g_object_ref_sink) (Obj))
#endif

These lines have been added by commit https://github.com/GNOM
E/glib/commit/3fae39a5d742afe73741f5fd7aa24e3ae8182f06.
I don't understand why it's not working on powerpc so I will just send a
patch for libglib2 to put back old behavior if __powerpc__ is defined.


> --
> Carlos Santos (Casantos) - DATACOM, P&D
> ?The greatest triumph that modern PR can offer is the transcendent
> success of having your words and actions judged by your reputation,
> rather than the other way about.? ? Christopher Hitchens
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/bf4221eb/attachment.html>
