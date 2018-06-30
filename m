From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 18:38:49 +0200
Subject: [Buildroot] [PATCHv2] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <CAOJ2eMf9iAP4kgqPWv2HwD0hBvzeWD7H7xONh0dZtDO1FoY=MQ@mail.gmail.com>
References: <20180630135645.2956-1-yann.morin.1998@free.fr>
 <CAOJ2eMf9iAP4kgqPWv2HwD0hBvzeWD7H7xONh0dZtDO1FoY=MQ@mail.gmail.com>
Message-ID: <20180630163849.GE2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2018-06-30 19:03 +0300, Stefan Becker spake thusly:
> On Sat, Jun 30, 2018 at 4:56 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > This is pretty confusing, because taken literally, this would amount to
> > running a command like:
> >
> >     tar cf my-sdk.tar -C output/host/ .
> >
> > This creates a tarbomb [0], which is very bad practice, because when
> > extracted, it creates multiple files in the current directory.
> > ...
> > So, we fix that mess by giving the top-most directory a recognisable
> > name, based on the target tuple and the Buildroot version, which we also
> > use as the name of the archive (suffixed with the usual +.tar.gz+.)
> 
> Sorry, but I can neither follow nor agree with this logic. The above
> tar command line is IMHO *exactly* how the SDK tarball should be
> generated, because it leaves the choice up to the user of the tarball
> *how* to use/integrate it downstream.
> 
> Anything else, especially directory names that change with every
> build, only creates unnecessary hoops the user of the SDK has to jump
> through every time.

Well, on my side, I *do* want an artefact that is versioned, so that I
am sure users do not extract a new one over a previous one, so that they
can work on different versions at the same time.

Versionned artefacts are a requirement for some people.

And I do want that version to represent something that I can actually
identify. By default, I *do* want it to identify the version of
Buildroot that was used to generate that SDK. But I understand that
someople may want another identifier, hence the variable to customise
it.

> > We offer the user the possibility to override that default by specifying
> > the +BR2_SDK_PREFIX+ variable on the command line.
> 
> Does "export BR2_SDK_PREFIX=" make sure that no prefix is used, i.e.
> you get the same output as the tar command above? If the answer is YES
> then this should be mentioned in the manual.

Using an empty value is indeed not supported. This should indeed be
documented in the manual.

The rationale behind that limitation, is two fold. First, if you don;t
want a prefix at all, then you can just generate the tarball easily,
directly from output/host/. Second, it is not trivial to ensure that the
prefix is really interpreted as directory component, because we append
'/' in the trasnform regexp; with an empty value, we would not have to
append it.

> Does "export BR2_SDK_PREFIX=" disable the variable part of the tarball
> name? Judging from the diffs the answer is likely NO, i.e. you can't
> disable the version part of the tarball name.

Well, again, if you don't like the tarball that is generated, you can
just use 'prepare-sdk' and get back to your previous situation.

> > We choose to make the existing rule to generate the tarball, and
> > introduce a new rule to just prepare the SDK, rather than keep the
> > existing rule as-is and introduce a new one to generate the tarball,
> > because it makes sense to have the simplest rule do the correct thing,
> > leaving advanced, power users use the longest command.
> 
> I'm not really happy with this, but at least I now have the choice and
> just need to update one line in the build script to disable all this
> useless stuff.

Well, I prefer the rule of least surprise, so that users by default do
not have surprises when they use (i.e. extract) the generated tarball.
Getting a tarbomb is very bad for most users. And I prefer to adapt my
scripts to accomodate with that (tar's --strip-components=1, as already
mentionned), rather than trash my home dir, or any other precious location.

> > If someone
> > already had a wrapper that called 'sdk' and expected just the host
> > directory to be prepared, then this is not broken; it just takes a bit
> > longer (gzip is pretty fast).
> 
> I would be careful with such statements. Based on my experience with
> our automated build system generating the tarballs from output/target
> & output/host takes a non-trivial amount of the total build time.

It does, yes, but compare the time it takes to generate a multi-gigabyte
archive, with the actual time it takes to do the build that lead to that
multi-gigabyte archive.

But now, I took *all* the feedback for the first iteration, to provide a
situation that works for everyone. If the discussion on this new patch
makes it that the maintainer do not want it in the end, then fine.

> Regards, Stefan

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
