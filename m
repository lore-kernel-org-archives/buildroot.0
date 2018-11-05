From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Nov 2018 16:25:07 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <20181104122638.7103719d@windsurf>
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 <20181104114514.523365ee@windsurf> <20181104122638.7103719d@windsurf>
Message-ID: <19d8f97c-f90d-9a44-6b2b-ad2132aa69af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/11/18 12:26, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 4 Nov 2018 11:45:14 +0100, Thomas Petazzoni wrote:
> 
>> We briefly discussed this patch during the Buildroot Developers
>> meeting, and setting VPATH clearly cannot be the right solution, it's a
>> big hack. A better solution needs to be found :)
> 
> Looking at http://autobuild.buildroot.net/?reason=traceroute% gives
> some interesting details:
> 
>  - Until May 2018, the problem was happening with external toolchains.
> 
>  - Then, there's a big gap, with no traceroute failures at all
> 
>  - Since September 11, 2018, the problem started happening again, but
>    this time around, only with internal toolchains

 It's due to host-make, which was merged on September 8. You can trivially
reproduce by doing "make host-make traceroute" with any toolchain. The
traceroute build system overrides MAKE with make from path:

Make.rules:20:MAKE = make --no-print-directory -r


 Funnily enough, on my laptop (which has make 4.2.1 so it normally doesn't
encounter the issue), if I do "make host-make traceroute" I end up with a
different error:

make[2]: *** [Makefile:80: libsupp] Segmentation fault (core dumped)
make[1]: *** [package/pkg-generic.mk:232:
/home/arnout/src/buildroot/output/build/traceroute-2.1.0/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

 I guess that that is completely unrelated though.

 Regards,
 Arnout

> 
> I looked at the commits on September 10/11, but couldn't spot anything
> that looks obviously related. It is also not clear why the problem
> disappeared on May 2018. However, back then, it was happening only on
> Matt Weber build machine. Since September, with the internal
> toolchains, it is happening on apparently all autobuilder machines.
> 
> Weird.
> 
> Thomas
> 
