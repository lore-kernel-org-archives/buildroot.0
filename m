From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 15 Jul 2017 13:16:19 -0400
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <87d191afyw.fsf@dell.be.48ers.dk>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk>
Message-ID: <CAFSsvmrO3v-shq_G=yheGVGaJHzUV2-2E2cNq9dwZmq+GX7rLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sat, Jul 15, 2017 at 11:15 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  > Hello,
>  > On Thu, 13 Jul 2017 10:25:48 -0400, Adam Duskett wrote:
>  >> currently there are a few packages in buildroot that are set to not
>  >> be selectable unless the user wishes to use glibc specifically because
>  >> the package uses fts.h.
>  >>
>  >> uClibc actually does have a fts implimentation, and it's selectable in
>  >> uclib-menuconfig.  However; this has two issues with it:
>  >>
>  >> 1) Most users wouldn't know that there is even a uClibc-menuconfig
>  >> 2) Even if the user does select fts support in uClibc-menuconfig, the
>  >> packages that would now compile and work would still not be selectable
>  >> because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.
>  >>
>  >> Enabling fts support increases the size of uclibc by 75~kb according to
>  >> the menuconfig option.  This is a acceptable size increase to fix the
>  >> few packages that require fts.h support.
>  >>
>  >> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
>  > Peter, what is your thought on enabling FTS by default in our uClibc-ng
>  > configuration ?
>
>  > Note that contrary to what Adam commit log says, the size increase is
>  > 7.5 KB.
>
> Hmm, 7.5KB isn't much - But fts isn't enabled by default in uClibc-nc,
> it is a legacy BSD feature and it also isn't supported by musl.
>
Funny enough, musl's wiki is a bit dated.
http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_fts.h_not_included_.3F

"if glibc bug 15838 is fixed by adding an fts64 interface in glibc, we could
consider supporting it with a matching ABI in musl, but it seems more likely
that glibc will just deprecate this interface."

The thing is, bug 15838 WAS fixed a while ago, and fts has had a proper
64bit variant for a while.  Not sure why they are dragging their feet, but
that's another topic for another day.


> It is easy to enable uClibc options, but difficult to disable them again
> later (as users of the affected packages get caught).
>
> Looking around, it seems we are only talking about 3 packages (if the
> annotations are correct):
>
> git grep -l 'fts.h' **/Config.in
> package/libcgroup/Config.in
> package/libselinux/Config.in
> package/libsemanage/Config.in
>

True, but why should we deny uClibc users extra security?

> Do we care enough for selinux users on uClibc (libcgroup seems to only
> be an optional dependency for gst1-rtsp-server) to let all other
> uClibc-ng users pay?
>

I have a core-i5, 16 gigs of ram, and a 256gig Crucial MX200 SSD

Build times/sizes with all packages necessary to compile
already download, no compiler cache:

command ran:  time make uclibc

without FTS:

real 7m39.002s
user 15m30.321s
sys 2m6.026s
target: 856k
output/build/uclibc-1.0.25: 51196

with FTS:
real 7m18.378s
user 15m22.944s
sys 2m4.397s
target: 864K
output/build/uclibc-1.0.25: 51244

So, negligable difference in time to compile.
Negligable size difference.
The added benefit of being able to use SELinux, which
allows for better security.

Hardly a payment in my opinion. :)

> --
> Bye, Peter Korsgaard

Thanks!

Adam
