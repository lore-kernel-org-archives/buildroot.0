From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 16:23:48 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
In-Reply-To: <fb34984c55052f386dd7e0b9534c6a39@openmailbox.org>
References: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
 <55ECB52C.3070806@mind.be> <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
 <55ED7E62.6080806@mind.be> <fb34984c55052f386dd7e0b9534c6a39@openmailbox.org>
Message-ID: <55ED9DF4.8030803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-15 16:08, C?dric Marie wrote:
> Le 2015-09-07 14:09, Arnout Vandecappelle a ?crit :
>>  Good point, you're right. Perhaps add a comment to clarify that.
>> # Override value passed in the environment
> 
> OK. I'll add a comment.
> 
>>  Garbage in, garbage out :-)
> 
> Yes, but the error will only occur when it comes to compiling an autotools
> package. It may be disturbing to be notified so late, that the option was not
> correct. Well, in my case, it is simply ignored, so we're not notified at all...
> that's no better.
> 
> make V=0/1 is Buildroot "API", and althought it is the same as autotools "API",
> I think we should "translate" it, and prevent Buildroot from forwarding invalid
> values. Just my opinion, and my experience in C language :-)
> 
> So maybe - if you agree that it should be checked - that should be done at the
> beginning, in root Makefile.

 Sounds good to me.

[snip]
>>  I don't remember saying anything about BR2_VERBOSE, and I also can't find it in
>> the mails I sent (but I didn't check too carefully).
> 
> 
> It was not very clear because I didn't write any code to explain what I meant,
> but I initially proposed to check $(origin V) and $(V) in the root Makefile, and
> export BR2_VERBOSE (0 or 1). Then, in infrastructures, it was not necessary to
> check $(origin V) anymore, but simply check BR2_VERBOSE value.
> 
> export BR2_VERBOSE=

 Yeah, this I remember. It's the export that I have a problem with. Nothing
(currently) uses this variable so there is no need to export it. I also don't
see which scripts would ever use it, since most scripts already are verbose by
default.

> ifeq ("$(origin V)", "command line")
> ifeq ($(V),0)
> BR2_VERBOSE=0
> else ifeq ($(V),1)
> BR2_VERBOSE=1
> endif
> 
> Then, in pkg-cmake.mk:
> ifeq ($(BR2_VERBOSE),1)
> CMAKE_VERBOSE = VERBOSE=1
> endif
> 
> 
>> I may have said something
>> about exporting such a variable - since nobody uses it there's no point
>> exporting it. Also, it doesn't match the naming convention: if it is a purely
>> internal (non-exported) variable, it should be just VERBOSE; if it is an
>> exported variable, it should be BR_VERBOSE because it is not user-visible or
>> Kconfig related (only user-visible or Kconfig options should have the BR2_
>> prefix, all others should have a BR_ prefix).
> 
> OK, so I should use BR_VERBOSE.

 Well, no, because it shouldn't be exported so it's purely internal to the
makefiles so VERBOSE is enough.

 Actually, the VERBOSE already existed and is in fact used in one case:
package/qt/qt.mk


>>  Documentation updates should probably be in a separate patch since it usually
>> gets some more discussion about wording etc. and that shouldn't stop the
>> acceptance of the code change itself.
> 
> OK. 3 patches so far :-)

 Or maybe 4:

1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial I think)
2. Define VERBOSE based on V= passed on command line
3. Use VERBOSE in autotools and cmake
4. Update documentation.


 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
