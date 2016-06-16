From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 21:53:10 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616153710.12ef9233@free-electrons.com>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com>
Message-ID: <20160616195310.GF3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, ?ric, All,

On 2016-06-16 15:37 +0200, Thomas Petazzoni spake thusly:
> On Thu, 16 Jun 2016 15:12:06 +0200 (CEST), Eric Le Bihan wrote:
> 
> > Since commit 9c40723, handling of ldconfig in the main Makefile as been dropped,
> > and if /etc/ld.so.conf is found in the target root filesystem, the build fails.
> > 
> > Not being able to run ldconfig and generate the ld.so cache has two drawbacks:
> > 
> >  - it prevents the user from installing some libraries in other locations than
> >    /lib and /usr/lib (e.g. /opt/foo/lib). This can be solved with symlinks,
> >    though.
> 
> Does the dynamic linker uses /etc/ld.so.conf at runtime to find other
> libraries, even if there is no /etc/ld.so.cache? If that's the case,
> then our check for ld.so.conf being absent is somewhat wrong, as it
> would be valid to have, independently of whether ldconfig has created
> ld.so.cache or not.

What I understand is that, to find a library, the linker will:

 1) if there is a cache, see if it knows about that library in the cache;

 2) if no cache, or if not known in the cache, look for ld.so.conf and
    look for that library in all paths listed in there;

 3) if still not found, look in the "well-known" locations, usually
    /usr/lib then /lib  (or their variants, depending on the
    mutlilib/multiarch uglyness)

So, we can well have any combination of existing/non-existing ld.so.cache
or ld.so.conf.

> >  - when running a program, ld.so has to explore all the library paths to find
> >    the correct location of the required libraries. This results in zillions of
> >    failed calls to open(), i.e. wasted time.

Have you actually measured this overhaed?

I'd like we avoid "solving" this if the gain is not even measurable...

> > So, it would be better to add an entry in the system configuration menu so that
> > the user can explicitly disable the sanity check introduced by 9c40723. Hence
> > he/she will be able to run the cross-compiled version of ldconfig (found in
> > ${STAGING_DIR}/sbin/ldconfig) via the version of QEMU matching the target.
> > 
> > Attached are:
> > 
> >  - a patch to add the aforementioned configuration entry, named
> >    BR2_TARGET_LDCONFIG.
> >  - an example of post-build script to run ldconfig via QEMU.
> > 
> > However, instead of using a post-build script, the operations could be performed
> > in a Buildroot Makefile. Which one should be updated? The main Makefile or the
> > Makefile of the skeleton package? In any cases, a dependency to host-qemu will
> > be introduced.
> 
> With the proposal from Yann to have different skeletons for systemd and
> traditional init, I am not sure having this logic in the skeleton
> package is the most appropriate. Indeed, this logic is useful
> regardless of the init system being used.

And even without the one-skeleton-per-init-system, I doubt it belongs
to the skeleton. The cache should be constructed after we have all the
libraries, so it can only really be in target-finalize )or be a hook
thereof).

Now, where to put the actual code? In its own location, no need to
fatten the main Makefile. We can always add .mk fragments, e.g. in
support/mk/ or somesuch.

> However, in order to merge something like this, I'd like to have a
> solution that covers glibc, uClibc and musl, or at least takes those
> different cases into account by making it available only for the C
> libraries that support it (but that mean investigating how uClibc and
> musl support ld.so.conf/ld.so.cache).
> 
> Another thing that bothers me is why it is not possible to have a
> cross-compilation aware ldconfig. This would really be much, much nicer
> than running ldconfig under qemu.

Well, host-qemu: please, no. It is really ugly... :-/

I've started looking at the format for ld.so.cachei (for glibc!), and it
does not seem to be overly complex. It is not trivial, but the bulk of
it is a concatenation of:

    [cache-in-old-format]
    [cache-in-new-format]

The old format is for libc5/glibc2 so we don't care about it at all. It
looks like it is not even required to be present.

The new format is:

    magic
    nb_libs
    libs[0]
    ...
    libs[nb_libs-1]
    string
    string
    ...

Now, I'm not sure what "lib[n]" is (some bitfields with some flags!),
but the stings are pretty obvious: they are a pair "SONAME\0PATH\0",
sorted (alphabetically, I guess). It has to be sorted, because ld.so
expects this: it uses a binary search to find the corresponding library.

I'm still looking at what the "libs[n]" are made of, and how they
correlate to the strings section...

So, I think it would be pretty straightforward to create a cache.
Brought to you under the brand "Famous Last Words (TM)."

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
