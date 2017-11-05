From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:48:17 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <20171105154420.52d67acd@windsurf.home>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <20171105085756.GG2996@scaer> <20171105154420.52d67acd@windsurf.home>
Message-ID: <3bf8725b-d9d8-b2a6-1fb4-fdcca0c96fdc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 15:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 5 Nov 2017 09:57:56 +0100, Yann E. MORIN wrote:
> 
>> In the past, we explicitly got rid of LD_LIBRARY_PATH because it does
>> not work. See 34d081674a (core/pkg-infrastructures: remove LD_LIBRARY_PATH
>> from the environment).
>>
>> Briefly, it does not work when we build a library that is also present
>> on the distro, which is used by a tool from the distro, and we build it
>> in an incompatibl way.
>>
>> So, we'll have to come up with another solution, like your suggested
>> alternative.
>>
>>>  - At the end of the build, in order to make sure that binaries are
>>>    usable without LD_LIBRARY_PATH, we fixup the host binaries to use
>>>    $ORIGIN/../lib. This is more-or-less what was done previously in
>>>    the "make sdk" target, except that instead of turning absolute
>>>    paths into relative paths in the RPATH, we are simply setting the
>>>    RPATH to $ORIGIN/../lib.
>>>
>>>    In order to implement this, the fix-rpath script logic is adjusted
>>>    for the "host" case.
>>>
>>> An alternative strategy would have been to keep the
>>> -Wl,-rpath,$(HOST_DIR) flag, and therefore the absolute RPATH in the
>>> host binaries, and fix such RPATH at the end of the build of every
>>> package. However, that would require calling fix-rpath after the
>>> installation of every package, which is a bit expensive.  
>>
>> I wonder how expensive that would be. It would be nice to time this.
>>
>> Also note that, even if the overhead is noticeable, this would be
>> compensated by the mere fact that we are now doing a parallel build, so
>> we would end up winning.
> 
> Thanks for the feedback. We already discussed this on IRC, and I agree.
> I'll have a look at implementing the solution of doing the patchelf
> adding $ORIGIN/../lib as an RPATH directly after the installation of
> each package.

 Note that according to Wolfgang's measurements (if I remember correctly), doing
fix-rpath on the host dir didn't take too long, but doing it in staging does.
There aren't that many host files.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
