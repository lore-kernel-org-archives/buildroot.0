From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Jun 2013 15:25:29 +0100
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <8738swej95.fsf@dell.be.48ers.dk>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
 <8738swej95.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8iYbYKBsS6Mku-NOgvdKigP9Doyy8_++joecKk7t31qRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2013 15:15, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  >> This works, but is afaik less efficient for the static lib case.
>  >>
>  >> The real fix is imho to build the object files twice, like how libtool
>  >> does it.
>  >>
>  >> If you look at the Debian package, they work around it by adding a
>  >> seperate .c -> .sho build rule, which adds -fPIC, and then link the .so
>  >> file with the .sho files instead.
>
>  Thomas> Are you sure there are not already many packages that build
>  Thomas> things only once with -fPIC and use that for both the static
>  Thomas> and the shared library?
>
>  Thomas> What you're proposing here is quite the opposite to what you
>  Thomas> merged (from me) in a33baa1ef9dadbec8e45d411c30d636fa6b8872a
>  Thomas> (icu: don't build object files twice).
>
> I've never claimed I was consistent ;) What I'm saying is simply that
> the "correct" way to do this, is to build the object files twice similar
> to how E.G. libtool does it.
>
> For something as small (and possibly performance sensitive) as bzip2 I
> think it is worthwhile doing it.
>
> --
> Bye, Peter Korsgaard

Hi Peter,

The problem here is that Debian uses a single Makefile to build both
the static and the shared library but in buildroot we use
the Makefile for the static one and Makefile-libbz2_so for the shared
one. In this case, doing what Debian did is not possible
but what we can do is to remove the *.o files within the
Makefile-libbz2_so before we try to build the shared library.

--
Regards,
Markos Chandras
