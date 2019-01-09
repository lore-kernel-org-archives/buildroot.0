From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Jan 2019 14:39:28 +0100
Subject: [Buildroot] [PATCH 00/19] support: limit install-time
 instrumentation to current package's files (branch yem/files-list-2)
In-Reply-To: <20190108213037.GI4022@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWsWTntZdve0sGs8HDJSS9=RKeupaYTYO2TuG3oEHdf+A@mail.gmail.com>
 <CAAXf6LXj1_YNqd4N9Jr=ygi2YgN3fYYCEjkhzD=xaH5Lco6Pqg@mail.gmail.com>
 <20190108213037.GI4022@scaer>
Message-ID: <CAAXf6LUZ6OouT40zROoSZ6h-ws2u4b8zY0+OwQmyvUgT9Kz9HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 22:30, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-01-08 16:53 +0100, Thomas De Schampheleire spake thusly:
> > El mar., 8 ene. 2019 a las 13:51, Thomas De Schampheleire
> > (<patrickdepinguin@gmail.com>) escribi?:
> > > El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> > > (<yann.morin.1998@free.fr>) escribi?:
> > > > Currently, the instrumentation steps, that we run after a package is
> > > > installed, get confused about the files that package may have be
> > > > responsible for.
> [--SNIP--]
> > > > This series is thus an attempt at fixing all those issues.
> [--SNIP--]
> > > For reference, the discussion thread when commit 7fb6e782542f was submitted:
> > > http://lists.busybox.net/pipermail/buildroot/2018-March/215979.html
> > > and my comments on moving away from the md5sum to the mtime approach:
> > > http://lists.busybox.net/pipermail/buildroot/2018-March/216331.html
>
> I do realise today that I did not reply to you back at that time.
> Apologies.
>
> Still I have no idea on how we could have _easily_ fixed the issue
> anyway. The solution proposed by Trent would have been way too
> complicated to come up with in a timely manner, no md5sum-ing staging/
> and host/ would prevent PPD, and thus TLPB, to eventually land.
>
> > > I will be cross-checking this series against these comments, as an
> > > accurate list in packages-file-list.txt is important for me. In my
> > > current tree, I reverted commit 7fb6e782542f and disabled
> > > check-uniq-files on staging and host, to alleviate the time impact but
> > > still have an accurate list.
> >
> > I finished reviewing, thanks for this interesting series and clear commits.
> >
> > Regarding my old comments linked above, I think the packages-file-list
> > will still be off if a package installs a file with a fixed timestamp,
> > typically a timestamp in the past. I should test this series against
> > our use case to see if we actually have such a case, but I'd need to
> > do some preparatory work first so it may take some time.
>
> As I already said, we already have the issue with our skeleton, anyway.
>
> For our skeleton, we can probably fix it quite easily with some rsync
> trickery (but I could not find how, so far).
>
> But for a more generic solution, we'd need a way to detect files that
> were not previously present but now are.
>
> So we'd need to maintain a list of files from before the installation
> and another for after the installation. And oh wait, isn't that
> basically what we previously did (modulo the md5)? ;-)

Without md5sum, there is only a find before and after each package
installation, which shouldn't take long.

The md5 is only necessary if you care about changing existing files.
And normally, if you change existing files, their timestamp will be
updated, so your solution with '-newer-than foo_before' should be
fine. Only when you change files and still keep their old timestamps,
would something be missed.

So, a possible solution could be a combination of the original 'find
before+after' solution and your new 'newer-than foo_before' solution.
Am I talking gibberish?

/Thomas
