From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Oct 2016 22:11:31 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <20161005172756.77aea89c@free-electrons.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
Message-ID: <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 5, 2016 at 5:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 5 Oct 2016 17:14:49 +0200, Thomas De Schampheleire wrote:
>
>
>> I read in the archives that there have been multiple attempts to fix
>> it differently, none of which were convincing, but I could not find
>> details about these attempts or why they did not work.
>>
>> I did find a patch by Romain that is rejected but I could not see why:
>> https://patchwork.ozlabs.org/patch/595042/
>> It tells gdb to use a different makeinfo command.
>
> IIRC, what I didn't like with this approach is that it requires us to
> keep a hacked-up version of the missing script in support/scripts/,
> which I really didn't like.
>
>> A similar trick is reported to work in the (still open) upstream bug
>> for this issue:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=18113
>> Essentially, setting MAKEINFO=true when calling the configure script.
>>
>> My question is now: what is not working in that approach?
>
> I honestly don't remember exactly :-/
>
> Feel free to try out yourself: create a minimal Debian chroot with
> texinfo not installed, and try to build gdb (both tarball versions, and
> versions fetched from Git, such as the ones for ARC and Microblaze.

I did that now. While I'm still running some more tests, I already
tested tarball versions 7.10.1 and 7.11.1, and both ARC and Microblaze
git versions. I currently only tested host-gdb, but for all these
cases I can get rid of the host-texinfo dependency with following
extra changes:

GDB_INSTALL_OPTS += MAKEINFO=true
GDB_MAKE_OPTS += MAKEINFO=true
HOST_GDB_INSTALL_OPTS += MAKEINFO=true
HOST_GDB_MAKE_OPTS += MAKEINFO=true

The INSTALL_OPTS were needed for the tarball versions, while the
MAKE_OPTS (and perhaps also the INSTALL_OPTS, not sure) for the git
versions.

I still need to test the (target-)gdb, but I guess it won't make a
difference as the Makefiles are the same.

Is this too simplistic? Am I missing something?

Thanks,
Thomas
