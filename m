From: Mike Zick <minimod@morethan.org>
Date: Sun, 13 Jul 2014 08:29:27 -0500
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <20140713090535.GC3588@free.fr>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <20140712215353.GD3582@free.fr>
 <20140712205430.1abdf0bf@core2quad.morethan.org>
 <20140713090535.GC3588@free.fr>
Message-ID: <20140713082927.328541e9@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Jul 2014 11:05:35 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Mike, All,
> 
> On 2014-07-12 20:54 -0500, Mike Zick spake thusly:
> > On Sat, 12 Jul 2014 23:53:53 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > 
> > > > https://bugs.busybox.net/show_bug.cgi?id=7172 major
> > > > unassigned at buildroot.uclibc.org Name collision of rpath token
> > > > expansion and internal variables
> > > > The puzzle pieces for a solution are present in this bug
> > > > report. All it needs is someone caring enough to create a
> > > > proper patch for this. Any candidates?  
> > > 
> > > I'm not a fan of all this rpath trickery.
> > > 
> > > Basically, the submitter (probably) wants this to run his
> > > buildroot-built system from somewhere else than / and does not
> > > want to chroot into it.
> > > 
> > > Should we add complexity to Buildroot for this use-case?
> > >
> > 
> > Some members here in the past have expressed interest in supporting
> > after-market firmware creation for consumer devices.
> 
> And I am completely OK with that. What I'm arguing about is whether we
> want to support running a Buildroot system out-side of / , ie. when
> the root of the generated filesystem is not the root at runtime.
> 
> What I'm saying is that, if one wants to run the Buildroot generated
> system as a complement to an existing system, that should be done by
> chrooting into the Buildroot system, so that / is seen as / .
>

Well, in this application of after-market support (the Amazon Kindle)
that is how we run Debian on the grayscale e-books.
In fact, have been doing that for about 4 years now. ;)
http://www.mobileread.com/forums/showthread.php?t=96048

But a chroot (by design) does place significant limits on what parts
of the existing system outside of the chroot can be used/accessed.
 
> > Buildroot does provide the string field for the end-user to pass
> > custom link-time options.
> > 
> > The point is, it should either work or be documented as to its
> > limitations.
> 
> OK, I agree.
>

Of the, what? three?, ld.so tokens, only one of them has a conflict
with the buildsystem (token string: $ORIGIN and the BR output variable
$O)

Something that I imagine is rarely used at a system level.
It is more of a custom application building thing than a system build.

And, in fact, I found that I don't need to use it.
Going down that usage path lead to too many complications.  ;)

> > That meets any definition of a "bug" in Buildroot.
> > Not a "unsupported use case", a "bug", as in "broke" by
> > implementation".
> 
> Well, this is a bit borderline, IMHO. ;-)
> 
> But OK, either we make it work (without adding too much complexity),
> or we document it as a limitation.
> 

I don't think it is a major limitation to the Buildroot user community.

A mention in the options help text, a mention in the manual and an
addition to the known bugs list should be enough until someone really 
needs it fixed.

Which may be never.  ;)

> > I would be glad to fix it for you if I could.
> 
> Oh, but you already provided quite a good analysis of the problem, and
> even hinted to a possible solution. That's already good! :-)
> 
> Of course, the above is just my own feelings on the issue. I'd like to
> get ThomasP's feelings on the issue, and your proposed solution.
>

I would be all right with just mentioning that the ld.so token "$ORIGIN"
can not be included in the custom link options field.

- - - - topic change - - - -

The existing packages that do not recognize that field can be a separate
(individual package) issue.

I have no idea how many packages that might be, it isn't a field that
gets tested by the autobuilders.

I don't think the autobuilder script handles "expected fail" defconfigs.
And an "expected pass" system can't distinguish between an option
correctly passed and used
vs
an option that never gets passed (and does not cause the build to fail).

For an example of packages needing help (in the lua-infrastructure):
The Lua-5.1 package ignores it, the LuaJit-2.0.3 package recognizes
and uses the custom link options field.

Mike

> Regards,
> Yann E. MORIN.
> 
