From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Feb 2016 23:13:52 +0100
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <1456414403.4586.63.camel@synopsys.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
 <20160225142622.47b2841a@free-electrons.com>
 <1456414403.4586.63.camel@synopsys.com>
Message-ID: <56CF7CA0.7080801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 16:33, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Thu, 2016-02-25 at 14:26 +0100, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 25 Feb 2016 12:58:05 +0000, Lada Trimasova wrote:
>>
>>> I used CentOS 5.7, gcc 4.9.2, glibc 2.5.
[snip explanation of why this combination of gcc 4.9 with glibc 2.5 is broken]
> That's why with older host glibc we need to pass "-fgnu89-inline"
> flag to compiler.

 I think you can basically say your host toolchain is broken: it fails to
compile valid programs, because glibc doesn't satisfy the -std=gnu99 option.

> And now I think we may even consider adding it
> to the top-level HOST_CFLAGS instead of fixing problem on per-package
> basis.

 Since this is an issue with your toolchain, I think you should fix it globally
(not just for buildroot) by setting CFLAGS_FOR_BUILD=-fgnu89-inline in your
environment.


 Note: installing your own glibc (somewhere outside of /usr/lib) is possible,
but awkward.

 Regards,
 Arnout

> 
> Any thoughts?
> 
> And indeed we now have to determine last glibc version that relies on
> C89 inline semantics.
> 
> -Alexey
> 
> P.S. Just in case that article was of great help:
> http://stackoverflow.com/questions/2722276/multiple-definition-of-inline-function
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
