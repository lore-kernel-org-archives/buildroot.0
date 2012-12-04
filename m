From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 04 Dec 2012 21:21:00 +0200
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
 <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
Message-ID: <50BE4D1C.3020702@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bogdan

4.12.2012 10:13, Bogdan Radulescu kirjoitti:
>
>
>
> ----- Original Message -----
> From: Bryan Hundven <bryanhundven@gmail.com>
> To: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
> Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> Sent: Tuesday, December 4, 2012 5:33 AM
> Subject: Re: [Buildroot] elfutils and the perf userspace tool
>
> On Mon, Dec 3, 2012 at 2:20 PM, Bogdan Radulescu
> <bogdan_radulescu99@yahoo.com> wrote:
>>
>> Hello everybody,
>>
>> I am using buildroot for generating a distro for ARM. I am able to add additional packages to buildroot or to use arm-linux-gcc directly to compile simple C programs.
>>
>> Still I haven't yet understood how to cross compile the perf userspace tool and I think it would be a very nice addition to buildroot.
>>
>> The perf tool requires elfutils and the kernel sources it comes with.
>>
>> My first problem is that elfutils will not successfully compile, as you can see here:
>> http://pastie.org/pastes/5474687/text
>>
>> My elfutils.mk file looks like this http://pastie.org/pastes/5474697/text
>>
>> Please tell me how do I move further from this.
>>
>> Thanks,
>> Bogdan
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> I forgot to cc buildroot at ... eh.
>
> Original response:
>
> I think you need the argp-standalone, as I don't think uclibc provides libargp.
>
> -Bryan
>
>
>
> Hi Bryan,
>
> As you can see in the elfutils.mk file I already added argp-standalone as a dependency. It compiles OK.
> I am also linking against it, still something goes wrong at some point.
>
> Bogdan
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

It's not enough to give -largp in LDFLAGS.

elfutils doesn't give a damn about LDFLAGS and goes it own way.

What you need is to add -largp explicitly into a line that links libdw

You could try saving the following and also remember to add
ELFUTILS_AUTORECONF = YES
line to your elfutils.mk

diff -Naur elfutils-0.155.org/libdw/Makefile.am
elfutils-0.155/libdw/Makefile.am
--- elfutils-0.155.org/libdw/Makefile.am    2012-12-04
21:02:32.309083801 +0200
+++ elfutils-0.155/libdw/Makefile.am    2012-12-04 21:06:41.205098676 +0200
@@ -111,7 +111,7 @@
         -Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
         -Wl,--version-script,$<,--no-undefined \
         -Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
-        -ldl $(zip_LIBS)
+        -ldl $(zip_LIBS) -largp
     if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
     ln -fs $@ $@.$(VERSION)

There might other places too where you have to add that -largp

You probably(if you are using uClibc) need to explicitly add also -lintl
to the same line with -largp.
At least that was what I had to do to make it compile even tought I had
gived configure script the option "--disable-nls".

Also you will need to probably (again if using uClibc) have fts.h with
your uClibc-installation
and sometime later you will probably hit into a obstack missing problem.
That can only be solved by including gnulib stuff into your source.

And there was some other (uClibc related) stuff that needed patching too
that I can't now
remember

All in all, elfutils belongs sadly to the software category:

 "Im doing things my own way, Im using non-portable glibc stuff and
I don't give a crab about portability. Nah-nah-naaa"

:-(

It's hard but doeable. And the end result might be that only the libelf
part of elfutils will work
(I only needed that so it did not matter in my case) and not the programs.

Regards
Stefan
