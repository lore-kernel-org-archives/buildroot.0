From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 13:24:04 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
 <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
Message-ID: <99a8adb3-3fa3-7050-e31f-16d2ee67ea12@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 06:10, Sam Bobroff wrote:
> On Tue, Nov 08, 2016 at 02:04:31AM +0100, Arnout Vandecappelle wrote:
>>
>>
>> On 07-11-16 22:51, Thomas Petazzoni wrote:
>>> Also, are we going to need to patch libtool.m4 in each and every
>>> package around? libtool.m4 from sdl is from libtool 2.2 which is not
>>> _that_ old (by the standards of libtool upgrade speed, of course), so
>>> we're likely to find many other packages in the same situation, aren't
>>> we?
> 
> From the libtool git history it looks like the issue is fixed after
> libtool 2.4.2.418.
> 
>>  Let me rephrase this.
>>
>>  You should actually update support/libtool/buildroot-libtool-v1.5.patch and
>> support/libtool/buildroot-libtool-v2.2.patch which will fix all packages in one
>> fell swoop. (That is, assuming that v2.4 is OK already.)
> 
> That sounds great, but that system seems to be set up to patch only
> ltmain.sh, and the code that needs patching isn't there.
> 
> The change needs to be in aclocal/libtool.m4 

 Arg, my bad. I didn't look at the patch itself :-)

> but I can't patch that and
> then propagate the change to configure, because AUTORECONF doesn't work
> for that package. (Maybe it would work for other packages, but I suspect
> there would be problems updating a single file on it's own.)

 For most packages, AUTORECONF works. But it's really not nice to have to
autoreconf a large number of packages just because one platform which many
people don't use is not supported...


> I suppose I could try auto-patching configure and/or configure.in (or
> .ac) along the same lines as ltmain.sh... what do you think?

 Autopatching configure.in/ac will not work because it's actually libtool.m4,
right? You could autopatch that, but some packages will not bundly libtool.m4 I
guess.

 Autopatching configure is going to be very hard I expect, because the location
and context of the hunk to be patched is probably very volatile. But if it does
work, it's probably the way to go. You would also have to patch libtool.m4 if it
exists, to keep things consistent. And you'd probably want to ignore errors from
patch.

 Otherwise, I'm afraid I don't see how we can solve this in a generic way...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
