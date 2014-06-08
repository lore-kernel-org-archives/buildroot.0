From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 8 Jun 2014 13:24:13 +0200
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion
 and internal variables
In-Reply-To: <20140608053821.1c486f66@core2quad.morethan.org>
References: <bug-7172-163@https.bugs.busybox.net/>
 <20140608070329.A41679CEEE@busybox.osuosl.org>
 <20140608053821.1c486f66@core2quad.morethan.org>
Message-ID: <CAHXCMMJuUfxqVJe8HWe5j5hH3GKNUyf_76RM3Wej2=1c+KehMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 8, 2014 at 12:38 PM, Mike Zick <minimod@morethan.org> wrote:
> On Sun,  8 Jun 2014 07:03:29 +0000 (UTC)
> bugzilla at busybox.net wrote:
>
>> https://bugs.busybox.net/show_bug.cgi?id=7172
>>
>> --- Comment #1 from Samuel Martin <s.martin49@gmail.com> 2014-06-08
>> 07:03:28 UTC --- Mike,
>>
>> (In reply to comment #0)
>> > Ref:  man ld.so
>> >
>> > Example:
>> > In menu -> tool chain -> Target Linker Options (BR2_TARGET_LDFLAGS)
>> > to: -Wl,-rpath='$ORIGIN/../lib'
>> > (A relative path from executable to pathname of its required
>> > libraries. The example in ld.so manual.).
>> >
>> > Build BusyBox (which honors BR_TARGET_LDFLAGS, not everything does).
>> >
>> > Use: readelf -dl on the resulting binary and find an entry similar
>> > to: 0x0000000f (RPATH)                      Library rpath:
>> > [outputRIGIN/../lib]
>> >
>> > Where the $O of $ORIGIN has been expanded to an internal value by
>> > the time the content of BR2_TARGET_LDFLAGS is seen by the compiler.
>>
>> Unfortunately, there is no trivial solution. This bug comes from the
>> interaction between Buildroot and the packages' build-systems
>> (especially those based on autotools).
>>
>> I mean there no easy way to correctly escape "$ORIGIN" in makefiles
>> (form Buildroot and the package itself) or/and in sh scripts.
>>
>
> Grumble.
> But I half-way expected that finding.
> ;)
>
>> >
>> > This was when using the Buildroot generation of a toolchain.
>> > Other toolchain selections not tested.
>>
>> The toolchain has nothing to do with this issue.
>>
>>
>> From the couple of experiments I run, the only reliable solution to
>> correctly set RPATH is using chrpath or patchelf at the end of the
>> build.
>>
>
> That (patchelf ref:
> http://anonscm.debian.org/gitweb/?p=collab-maint/patchelf.git;a=summary
> http://nixos.org/patchelf.html)
> was going to be my 'temporary' work-around.

I thought about:
http://nixos.org/patchelf.html
https://github.com/NixOS/patchelf

>
> Along with a post-build script to munge things as required.
>
> Not so temporary now I guess.
>
> - - - -
>
> There is an alternative, for people who only need a very few
> binaries built - -
> Set 'Target Linker Options' to a long string, longer than they
> will need, and after build hex-edit the binaries to the required
> string.
>
> But that gets tiring real soon.  ;)
> And some packages are ignoring 'Target Linker Options' anyway.
> So even with this method, people would still need patchelf.
>
> - - - -
>
> Hmm...
> I guess I should add a selection to build host-patchelf to BR.
> Someone else out there might need it, even if they don't need
> ld.so token expansion in runpath and/or rpath.
>
> Thanks for taking the time to check this out.
> Might have to mark it as: "Can't be fixed" in the bug tracker.
>

BTW, why do you need to tweak RPATH in the target fs? What is your
use-case? (just curious ;-])

Buildroot builds and installs everything consistently, so libraries
get installed in /lib and /usr/lib, and binaries do not have any
RPATH.

Usually, one needs RPATH when some binaries needs libraries that are
not installed in the default locations.
Some others solutions are:
1) set the LD_LIBRARY_PATH in the binary environment;
2) add the additional paths in some $(TARGET_DIR)/etc/ld.so.conf.d/*.conf files.


Regards,

-- 
Samuel
