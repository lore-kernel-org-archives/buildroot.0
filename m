From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 13 Jul 2013 16:57:46 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <20130713160720.34d850a8@skate>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
 <20130711134646.6ef211dd@skate>
 <201307111402.34152.yann.morin.1998@free.fr>
 <CAEYzJUHpYVBAgHnrj73aMwj8pw+p_bScMToM-BSZh3bm--q2gA@mail.gmail.com>
 <20130713160720.34d850a8@skate>
Message-ID: <CAEYzJUGeeaQgCevK2SbwfLFcvmt9EtZFJwjhaxYzUjcdKb=Ofg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 July 2013 16:07, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bj?rn Forsman,
>
> On Fri, 12 Jul 2013 19:07:58 +0200, Bj?rn Forsman wrote:
>
>> > I believe it is much better that Buildroot chokes on a select list of
>> > variables, warn about a few others, and accept the rest.
>>
>> If you think about it, the downloader is actually a bit different from
>> the builder. At some point Buildroot will (like all other build
>> systems) grow support for checking each downloaded file against
>> checksums specified in the package build file. And once you have that,
>> it doesn't really matter how dirty the environment in the *downloader*
>> is, because it will be guaranteed to match the checksum, or fail. It
>> is only in the *builder* that the environment must be clean.
>
> I am not sure to understand why you separate the download side and the
> build side here. Both are done with Buildroot makefiles, there is
> nothing different in terms of environment variables between those
> steps.

They are not separate right now, but they could be. Because of the
possibility to use checksums to verify the downloader, and because
that is not possible to do with the builder, I think the two can be
seen as quite different things.

Even though they are both implemented in makefiles, I don't think it's
difficult to run them in different environments. man env ?

>> Are there any reasons for allowing env vars, other than BR2_*, to slip
>> through from host and into the Buildroot *builder* processes? I cannot
>> think of any.
>
> Yes, we allow passing HOSTCC, UCLIBC_CONFIG_FILE, BUSYBOX_CONFIG_FILE,
> and a bunch of other environment variables (see the Buildroot manual).

Ok. Those variables are special to Buildroot, similar to BR2_* vars.
So I think they fall under the same category. In fact, they *could* be
renamed to BR2_*, because the are non-standard anyways, unlike
LD_LIBRARY_PATH etc. Note that I'm not suggesting that they are
renamed, just that they are Buildroot specific.

> Also, some environment variables like LD_LIBRARY_PATH or LD_PRELOAD
> should just be usable by the user, if he has some funky setup that
> requires those environment variables to hold special values.

Are you thinking of Yann's use case? That was for the download phase,
which I agree could run in an unmodified host environment. I was
asking if it would make any sense to allow LD_LIBRARY_PATH etc. into
the *build* phase (configure && make). I think the build phase is the
one where most bugs happen because of different host environments :-)

Anyways, I was just throwing my idea out there. I've been playing with
nixos[1] lately, and have been inspired by its "pure" build system. It
tries very hard to prevent the host environment from affecting the
build result.

[1] https://nixos.org/

Best regards,
Bj?rn Forsman
