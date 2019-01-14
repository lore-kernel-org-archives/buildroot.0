From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Jan 2019 17:01:44 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <7c0307f9-5370-215b-7230-0f83da461c82@mind.be>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home>
 <CAAXf6LVJ6-H-pBA8C9i8LJxmQ=8ufdvOC3uHG5-cqz-WPyt=sg@mail.gmail.com>
 <30afb67d-f31d-4986-8490-2e97f5808eda@mind.be>
 <CAAXf6LVho4978cn=nkFMReanH4o5Z0D81OW5a-k_xWHRP77DQg@mail.gmail.com>
 <7c0307f9-5370-215b-7230-0f83da461c82@mind.be>
Message-ID: <CAAXf6LXy7kQN4SGVx8LjSKxzBTwwzeDKKfo86dO12FZn8FEkdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 13 ene. 2019 a las 23:10, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 11/01/2019 21:09, Thomas De Schampheleire wrote:
> > El jue., 10 ene. 2019 a las 22:25, Arnout Vandecappelle
> > (<arnout@mind.be>) escribi?:
> >>
> >>
> >>
> >> On 26/12/2018 19:33, Thomas De Schampheleire wrote:
> >>> In a similar context I once had following problem:
> >>> http://lists.busybox.net/pipermail/buildroot/2018-August/226955.html
> >>> This was for target binaries, rather than host, but for the below
> >>> discussion it does not matter.
> >>
> >>  I don't think you ever replied to my question in that thread:
> >>
> >>  Let's first find out why it is cleared. patchelf should check for each
> >> directory in rpath if it is actually needed, and only remove it if it is not
> >> needed. So, what library do you have in /opt/foobar/lib, and is it really linked
> >> with the program?
> >>
> >>  Hm, I realize that we never thought about dlopen()ed libraries. Could that be
> >> the cause? I guess that hasn't been a problem up to now because usually programs
> >> using dlopen() will use an absolute path (to a build-time or run-time configured
> >> plugin directory) rather than relying on RPATH.
> >
> > Sorry that I did not seem to have replied on that question.
> >
> > The binary in question did in fact link with the library, there is no
> > dlopen used.
> > Some redacted output showing the initial rpath, which disappears after
> > fix-rpath.
> >
> > $ readelf -d output/target/opt/foobar/bin/fooprogram | rg 'NEEDED|RPATH'
> > ...
> >  0x00000001 (NEEDED)                     Shared library: [libfoo.so.1]
> > ...
> >  0x0000000f (RPATH)                      Library rpath:
> > [/../lib:/opt/foobar/lib:/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib]
> >
> > $ find output/target/ -name libfoo.so.1
> > output/target/opt/foobar/lib/libfoo.so.1
> >
> > $ env HOST_DIR=output/host STAGING_DIR=output/staging
> > TARGET_DIR=output/target support/scripts/fix-rpath target
> >
> > $ readelf -d output/target/opt/foobar/bin/fooprogram | rg 'NEEDED|RPATH'
> > ...
> >  0x00000001 (NEEDED)                     Shared library: [libfoo.so.1]
> > ...
>
>  OK, so that's a bug in our patchelf modification... At least, if libfoo.so.1
> doesn't exist in output/target/lib or output/target/usr/lib.
>
>  If you run patchelf with --debug, it should tell you why the rpath got removed.

Part of the debug output for fooprogram:

patching ELF file `output/target/opt/foobar/bin/fooprogram'
Kernel page size is 4096 bytes
removing directory '/../lib' from RPATH because it's not in rootdir
keeping relative path of
/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib
removing directory
'/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib' from
RPATH because it's not in rootdir
new rpath is `m/repo/isam/buildroot/output/target/opt/foobar/lib'

The last line seems odd with the leading 'm'. I don't know if that is
the problem, I will check it further.
Thanks for pointing to the --debug option.


>
>
> >>> Looking back at this problem, taking into account the above comment
> >>> from the patchelf patch, I would say that my problem would have been
> >>> fixed if case (4) above would not discard the path.
> >>
> >>  I think one motivation for removing redundant rpaths is to avoid having build
> >> directories leaking into target binaries. Especially for reproducible builds
> >> this is important.
> >
> > Ok, I can understand that.
> > But it should only remove directories which are not present in the
> > target directory, e.g. if rpath contains /opt/foobar/lib then the
> > script should check if output/target/opt/foobar/lib exists. If it
> > does, then the rpath can remain, if it does not then it could be
> > removed.
>
>  Indeed, and that's what patchelf is supposed to do. Well, it also checks that
> the library exists.
>
>
> >>> If that change would be adopted, then it would also preserve the rpath
> >>> '/home/thomas/projets/buildroot/output/per-package/host-e2fsprogs/host/lib'.
> >>>
> >>> Of course, in your case you might actually want a different final
> >>> rpath, i.e. rewrite it to the consolidated host directory. I think
> >>> that in this case it would be better to read the rpath via patchelf,
> >>> calculate the transformed rpath from our own script, then writing it
> >>> back via patchelf,  rather than adding more options into patchelf with
> >>> e.g. transformation rules.
> >>
> >>  The problem is that patchelf is rather slow, so running it twice is even slower...
> >
> > How so is it slow, can you clarify? Which times are you talking about?
>
>  I don't remember, but someone did measurements in 2017 and it was slow.

It seems the code already calls patchelf twice:

        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
            # make files writable if necessary
            changed=$(chmod -c u+w "${file}")
            # call patchelf to sanitize the rpath
            ${PATCHELF} --make-rpath-relative "${rootdir}"
${sanitize_extra_args[@]} "${file}"

so by saving the string returned in the first call, we can actually do
a better transformation ourselves.

/Thomas
