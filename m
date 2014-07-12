From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jul 2014 23:53:53 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
Message-ID: <20140712215353.GD3582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-12 20:50 +0200, Thomas De Schampheleire spake thusly:
> Here is a brief overview of the currently open bugs. Ideally we can
> close many of them in the context of buildroot-2014.08.
> Contributions in this area are more than welcome!

Thanks for this summary! :-)

> https://bugs.busybox.net/show_bug.cgi?id=7208 critical
> unassigned at buildroot.uclibc.org Glibc C++ aplications crash if they
> use exceptions.
> This problem is caused by a patch adding musl support. How to proceed?

Well, those patches are huge, and they touch very critical pieces of
gcc. I would mark musl support broken and remove the patches, until the
patches are fixed.

Unfortunately, that's already been part of a release, so we can't
silently hide it... :-(

> https://bugs.busybox.net/show_bug.cgi?id=7010 enhancement
> unassigned at buildroot.uclibc.org jamvm builds and runs fine under mips
> (be)
> This problem will be solved once jamvm 1.6.0 is released. The
> maintainer of Jamvm has promised this already for some time, but so
> far the release hasn't been made yet.

No release, no mipseb support. The submitter should press the jamvm
maintainer to do a release.

> https://bugs.busybox.net/show_bug.cgi?id=7172 major
> unassigned at buildroot.uclibc.org Name collision of rpath token
> expansion and internal variables
> The puzzle pieces for a solution are present in this bug report. All
> it needs is someone caring enough to create a proper patch for this.
> Any candidates?

I'm not a fan of all this rpath trickery.

Basically, the submitter (probably) wants this to run his
buildroot-built system from somewhere else than / and does not want to
chroot into it.

Should we add complexity to Buildroot for this use-case?

> https://bugs.busybox.net/show_bug.cgi?id=5900 normal
> unassigned at buildroot.uclibc.org config flags to the Xenomai build
> system ...
> This problem should be investigated a little to see if there is
> actually a problem or not, and if so where the problem is: in
> buildroot or in Xenomai. Any takers?

This one is indeed a bit tricky. I looked at what the Xenomai guys said:

---8<---
Xenomai does not do anything special, it uses the autotools default
which is:
- if you pass CFLAGS and LDFLAGS on the right hand of the configure
command line, the generated makefiles are hardcoded with these flags
values, and you need not do anything special later on to get these flags
used for all the compilations. This has been the recommended way of
passing CFLAGS and LDFLAGS when building autotools-based projects for
many years.

- if you want to pass them as environment variables (so, on the left
hand of the configure command line), the makefiles are not generated
with these flags, so, you have to pass them in the environment of the
"make" command.
---8<---

Which indeed makes sense. And we do pass them as environment variables
in package/pkg-autotools:

    [...]
    $$(TARGET_CONFIGURE_OPTS) \
    $$(TARGET_CONFIGURE_ARGS) \
    $$($$(PKG)_CONF_ENV) \
    ./configure \
    [...]

So we should probably pass them after ./configure, i.e. on the right-hand
side of ./configure.

> https://bugs.busybox.net/show_bug.cgi?id=7262 normal
> unassigned at buildroot.uclibc.org Generating locale en_US.UTF-8 fails on
> 64bit fedora linux host
> Anyone willing to investigate this?

I can have a look...

> 6230 minor unassigned at buildroot.uclibc.org Cannot compile gcc without
> threads (uClibc-based)

ARM noMMU is basically broken, as Gustavo said in a comment.

> 7118 enhancement abrodkin at synopsys.com Package "thrift" requires
> atomic operations

Should be closed, the patch has been applied:
    http://git.buildroot.org/buildroot/commit/package/thrift?id=1aaa14d84f1c920423ed0286b78f64a2b4b2b575

> 3427 enhancement s.martin49 at gmail.com New package: nginx
> 261 enhancement unassigned at buildroot.uclibc.org New package: wxWidgets
> 325 enhancement unassigned at buildroot.uclibc.org New package: ratpoison
> 405 enhancement unassigned at buildroot.uclibc.org New package: OpenVZ tools
> 1309 enhancement unassigned at buildroot.uclibc.org New package: rdiff-backup
> 3655 enhancement unassigned at buildroot.uclibc.org New package: libav
> 3991 enhancement unassigned at buildroot.uclibc.org New Package:
> open-vm-tools (Vmware Tools)

New packages should be posted to the list.

> 7088 minor sonic.zhang at analog.com elfutils on Blackfin doesn't build

> 6878 minor abrodkin at synopsys.com dmraid: disabled on ARC
> 6872 minor unassigned at buildroot.uclibc.org gpsd: disabled on microblaze

For those two, the packages are disabled because of an ICE. WE can't do
much more than disabling the packages. Which is already done. Close
those bugs?

> 7136 normal thomas.petazzoni at free-electrons.com ecryptfs-utils needs
> gettext to run when glibc/eglibc is used

Patches on the list.

> 7142 normal thomas.petazzoni at free-electrons.com ecryptfs needs getent to run

I can have a look.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
