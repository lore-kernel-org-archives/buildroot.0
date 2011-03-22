From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 22 Mar 2011 12:09:13 -0400
Subject: [Buildroot] Add Package: htop
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F914D36@EXV1.corp.adtran.com>
References: <4D88BDC8.6080002@AdTran.com>
	<AANLkTin3jGmmJfRXAa7VHS0ZdcE76V8DVmuEvEZn4XeQ@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F914D36@EXV1.corp.adtran.com>
Message-ID: <AANLkTimJca48ZwkJ0Z3_+GoPimvK0Sekk27zWtFvf1MW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 22, 2011 at 12:01 PM, ANDY KENNEDY wrote:
> From: vapierfilter at gmail.com [mailto:vapierfilter at gmail.com] On Behalf Of Mike Frysinger
>> On Tue, Mar 22, 2011 at 11:18 AM, Andy Kennedy wrote:
>> > +--- a/configure
>> > ++++ b/configure
>>
>> so you patch configure ...
>>
>> > +--- a/configure.ac
>> > ++++ b/configure.ac
>>
>> then you patch configure.ac ...
>>
>> > +HTOP_POST_CONFIGURE_HOOKS = HTOP_RETOUCH_CONFIGURE_AC
>> > +
>> > +define HTOP_RETOUCH_CONFIGURE_AC
>> > + ? ? ? touch -r $(@D)/missing $(@D)/configure.ac
>> > +endef
>>
>> and then you manually touch configure.ac, but dont invoke autotools
>> anywhere. ?what is going on here ?
>
> if you touch the configure.ac file using the timestamp off of missing,
> you don't _need_ to rerun the automake if the configure.ac is near the
> same time as missing and configure. ?This would be a hack. ?Perhaps I
> should mention that in the patch file?

sorry, i missed the -r.  this begs the question of why are you
patching configure.ac at all then if you try and prevent autotools
from running.  any changes made to configure.ac wont be reflected in
configure and other files if autoconf/etc... arent run.

>> you should only be patching generated files, or only the source
>> autotool files. ?and if you do the latter, you should be re-running
>> autotools via HTOP_AUTORECONF=yes, not manually mucking with
>> timestamps and letting the build system figure things out.
>
> I'm confused about this (forgive my ignorance about the overall build
> system). ?So, if I let configure run, then let make run it fails.
> However, I can go back and rm .stamp_configured and re-run make then
> all is well. ?So, if I do HTOP_AUTORECONF, will this do this for me?

the vague description sounds like autotool problems and you should be
using autoreconf.
-mike
