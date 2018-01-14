From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 14:30:16 +0100
Subject: [Buildroot] linux-firmware hash mismatch (tar-1.30)
In-Reply-To: <20180111105557.6f97bb46.john@metanate.com>
References: <20180109161531.47ec21e0.john@metanate.com>
 <87vag9plt1.fsf@dell.be.48ers.dk>
 <20180111105557.6f97bb46.john@metanate.com>
Message-ID: <20180114133016.GA20105@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, Peter, All,

(adding Thomas and Arnout)

On 2018-01-11 10:55 +0000, John Keeping spake thusly:
> On Wed, 10 Jan 2018 20:15:38 +0100, Peter Korsgaard wrote:
> > >>>>> "John" == John Keeping <john@metanate.com> writes:  
> >  > ERROR: linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b.tar.gz has wrong sha256 hash:
> >  > ERROR: expected: 28d359523a36c1cdc3e85a8e148bb2d68b036d28b10f0e80a192f3dc29f02c16
> >  > ERROR: got     : bf6fe8d7620949a3e771954cb6d9d18dcf000d37ecc910a7cf69723c1798e246
> >  > ERROR: Incomplete download, or man-in-the-middle (MITM) attack  
> >  > After a bit of digging, it looks like this is caused by tar-1.30 which
> >  > includes the following fix:  
> >  > * --numeric-owner now affects private headers too.  
> > Gaah, what a mess :/

And that's not all.

Between 1.26 and 1.28 [*] the header for "long links" or "long names"
has changed. Previously, the "mode" field was al set to zero, but now it
is set to some non-zero value (not sure which, though...)

> >  > I'm not sure whether anything can be done to avoid this problem, but
> >  > hopefully reporting it will save the next person some debugging time.  
> > 
> > I also don't quite see any good solutions either :/
> > 
> > Did you try bringing it up with tar upstream? Perhaps there is a way to
> > disable this? Alternatively we can build tar-1.29 for the host and use
> > that instead of whichever tar version is available on the build machine,
> > but this will slow down the build.
> 
> No, I didn't bring it up with tar upstream; I'm not sure there's much
> point since it is a clear bug fix to the --numeric-owner option.
> 
> I don't think it's possible to reproducibly create bit-identical
> archives without using the same software version to produce the archive.

Alas, this means that we can only depend on building our own tar...

Even when we eventually support using a local git-clone cache, this we
not solve the issue has the hashes we store are on the generated
tarball...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
