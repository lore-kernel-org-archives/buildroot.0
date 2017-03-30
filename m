From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 00:33:24 +0200
Subject: [Buildroot] Which order: $(MAKE) $(TARGET_CONFIGURE_OPTS) or
 $(TARGET_CONFIGURE_OPTS) $(MAKE)
In-Reply-To: <20170329214959.54454e17@free-electrons.com>
References: <CAAXf6LUHH5Lo=LSSfjGRQ=onT4Bm_WfLAFc0RDjfcT_ZmADmbA@mail.gmail.com>
 <20170329213552.6455f568@free-electrons.com>
 <CAAXf6LVwhzcCnEXKaBku5WfwKeR7GHX0v4VFu4kvdxMobW=g9w@mail.gmail.com>
 <20170329214959.54454e17@free-electrons.com>
Message-ID: <b1916b12-70d7-54a5-791c-f80657fb0b84@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 21:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 29 Mar 2017 21:43:18 +0200, Thomas De Schampheleire wrote:
> 
>> But, on the other hand, if a package would do:
>>
>> CFLAGS = -I../include
>>
>> then we cannot use either approach because one approach will ignore
>> the -I../include, and the other will ignore our own settings. In that
>> case, a patch of the package is required, right?
> 
> Correct. But I guess in many cases we don't realize when the package
> "ignores" our CFLAGS, because there is nothing in our CFLAGS that is
> really mandatory for the thing to build.
> 
> Of course, the fact that our CFLAGS may be ignored means that the
> package may not have the correct optimization level, debugging level,
> stack smashing protection flags, etc. I remember at some Buildroot
> meeting, we discussed the idea of injecting a fake CFLAGS, and then
> checking in the toolchain wrapper that we have this fake flag. But I'm
> sure this would cause lots and lots of false positives.

 Lots and lots of positives, indeed, but they wouldn't be false. They would be
annoying to fix, however, if there are really lots and lots.

 That's why I toyed with the idea of coding the CFLAGS directly in the toolchain
wrapper. But that's not good either, because in some cases a package really may
want to remove some CFLAG, e.g. ssp or some -mfpu option or something similar.
And for some packages, we intentionally pass our CFLAGS at all, e.g. linux. So
then we'd need to find a workaround for those packages again...

 We could of course try the add a poisoning option to CFLAGS somewhere in the
beginning of a cycle and see how far we get, and revert if necessary. But I'm
afraid it's a lot of work for relatively little gain.


>> Is there a recommendation for the case that the package allows either way?
> 
> I don't really have a good suggestion. We tend to fix those issues on a
> case by case basis, with no well defined "best practice".

 I think the best practice is to pass things in the environment and make an
upstreamable patch that changes CFLAGS assignments into ?= and/or +=.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
