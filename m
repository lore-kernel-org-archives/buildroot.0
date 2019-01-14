From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Jan 2019 21:19:00 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <CAAXf6LXy7kQN4SGVx8LjSKxzBTwwzeDKKfo86dO12FZn8FEkdQ@mail.gmail.com>
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
 <CAAXf6LXy7kQN4SGVx8LjSKxzBTwwzeDKKfo86dO12FZn8FEkdQ@mail.gmail.com>
Message-ID: <CAAXf6LUSeC7bA7S59BwXd72uOZdf3g7vs0e_t5axFt+zLULvDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 14 ene. 2019 a las 17:01, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> El dom., 13 ene. 2019 a las 23:10, Arnout Vandecappelle
> (<arnout@mind.be>) escribi?:
> >
> >
> >
> > On 11/01/2019 21:09, Thomas De Schampheleire wrote:
> > > El jue., 10 ene. 2019 a las 22:25, Arnout Vandecappelle
> > > (<arnout@mind.be>) escribi?:
> > >>
> > >>
> > >>
> > >> On 26/12/2018 19:33, Thomas De Schampheleire wrote:
> > >>> In a similar context I once had following problem:
> > >>> http://lists.busybox.net/pipermail/buildroot/2018-August/226955.html
> > >>> This was for target binaries, rather than host, but for the below
> > >>> discussion it does not matter.
> > >>
> > >>  I don't think you ever replied to my question in that thread:
> > >>
> > >>  Let's first find out why it is cleared. patchelf should check for each
> > >> directory in rpath if it is actually needed, and only remove it if it is not
> > >> needed. So, what library do you have in /opt/foobar/lib, and is it really linked
> > >> with the program?
> > >>
> > >>  Hm, I realize that we never thought about dlopen()ed libraries. Could that be
> > >> the cause? I guess that hasn't been a problem up to now because usually programs
> > >> using dlopen() will use an absolute path (to a build-time or run-time configured
> > >> plugin directory) rather than relying on RPATH.
> > >
> > > Sorry that I did not seem to have replied on that question.
> > >
> > > The binary in question did in fact link with the library, there is no
> > > dlopen used.
> > > Some redacted output showing the initial rpath, which disappears after
> > > fix-rpath.
> > >
> > > $ readelf -d output/target/opt/foobar/bin/fooprogram | rg 'NEEDED|RPATH'
> > > ...
> > >  0x00000001 (NEEDED)                     Shared library: [libfoo.so.1]
> > > ...
> > >  0x0000000f (RPATH)                      Library rpath:
> > > [/../lib:/opt/foobar/lib:/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib]
> > >
> > > $ find output/target/ -name libfoo.so.1
> > > output/target/opt/foobar/lib/libfoo.so.1
> > >
> > > $ env HOST_DIR=output/host STAGING_DIR=output/staging
> > > TARGET_DIR=output/target support/scripts/fix-rpath target
> > >
> > > $ readelf -d output/target/opt/foobar/bin/fooprogram | rg 'NEEDED|RPATH'
> > > ...
> > >  0x00000001 (NEEDED)                     Shared library: [libfoo.so.1]
> > > ...
> >
> >  OK, so that's a bug in our patchelf modification... At least, if libfoo.so.1
> > doesn't exist in output/target/lib or output/target/usr/lib.
> >
> >  If you run patchelf with --debug, it should tell you why the rpath got removed.
>
> Part of the debug output for fooprogram:
>
> patching ELF file `output/target/opt/foobar/bin/fooprogram'
> Kernel page size is 4096 bytes
> removing directory '/../lib' from RPATH because it's not in rootdir
> keeping relative path of
> /home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib
> removing directory
> '/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib' from
> RPATH because it's not in rootdir
> new rpath is `m/repo/isam/buildroot/output/target/opt/foobar/lib'
>
> The last line seems odd with the leading 'm'. I don't know if that is
> the problem, I will check it further.
> Thanks for pointing to the --debug option.

Sorry for the confusion, this specific problem is caused by my calling
fix-rpath with relative reference to the target directory.
(the code in patchelf could perhaps be made more robust by resolving
the input 'rootdir' with realpath as well.)

The actual output after fixing that parameter problem is:

output/host/bin/patchelf --debug --make-rpath-relative
/home/tdescham/repo/isam/buildroot/output/target
--no-standard-lib-dirs
/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/bin/fooprogram

patching ELF file
`/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/bin/fooprogram'
Kernel page size is 4096 bytes
removing directory '/../lib' from RPATH because it's not in rootdir
keeping relative path of
/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib
removing directory
'/home/tdescham/repo/isam/buildroot/output/target/opt/foobar/lib' from
RPATH because it does not contain needed libs
new rpath is `/opt/foobar/lib'

So the logic above seems correct, but it is not correctly stored in
the binary. After running patchelf, the rpath is cleared. I will
investigate that further.

/Thomas
