From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 2 Mar 2016 16:29:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-01
In-Reply-To: <20160302162156.2c4d6d13@free-electrons.com>
References: <20160302073023.58B81101BA9@stock.ovh.net>
 <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
 <20160302160423.0143a79b@free-electrons.com>
 <878u20kiw7.fsf@dell.be.48ers.dk>
 <20160302162156.2c4d6d13@free-electrons.com>
Message-ID: <CANCHnQoWnuBNh=qWgxTJXpoaJcpBr5ERcpX_3huWUciwNUhFug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 March 2016 at 16:21, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> So this is horrible broken :/
>
> Ah, I understand better. I was confused by Jeroen's report, since his
> report was essentially "nginx concludes that SPARC is big endian",
> which was not wrong at all.



> Thanks for the explanation. Then indeed, passing NGX_HAVE_LITTLE_ENDIAN
> seems like the right thing to do.
>
> Does this means that nginx has never worked on little endian platforms ?

It worked fine for me so far. I am looking at some code in
src/http/ngx_http_parse.c where it sets up things according to

#if (NGX_HAVE_LITTLE_ENDIAN && NGX_HAVE_NONALIGNED)

which is not the case on my target system (nginx configuration has a
similarly interesting way to determine NGX_HAVE_NONALIGNED but that's
OK for ARM as they don't account for that at all).

so then I looked if that might be the cause of the problem (being
miscompilation with GCC 4.9.3 which I am now working around by setting
CFLAGS = -O1).

And then I found that on an amd64 host the endian test returned the
wrong result. So I asked this list if the test similarly returns the
wrong result on other systems and if the autobuild system should
perhaps flag that kind of error.

Regards,
     jer
