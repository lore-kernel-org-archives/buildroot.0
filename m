From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 10:05:54 +0100
Subject: [Buildroot] [PATCH v3 6/6] Makefile: export PATH
In-Reply-To: <20140131093347.5c3bcbae@skate>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-7-git-send-email-s.martin49@gmail.com>
 <20140131093347.5c3bcbae@skate>
Message-ID: <52F0AD72.8020301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/14 09:33, Thomas Petazzoni wrote:
> Dear Samuel Martin,
> 
> On Thu, 30 Jan 2014 21:38:53 +0100, Samuel Martin wrote:
>> This can be useful for:
>> - package using custom build system that are not aware that the host
>>   tree is in $(O)/host/;
>> - post-{build,image} scripts, in case some host-tools were specifically
>>   built to be used by these scripts.
>>
>> Note that, this patch only exports the PATH variables; cleaning up
>> all the explicit PATH declarations leading some commands could be done
>> in a followup patch.
> 
> So with this patch, passing PATH in all the package infrastructures
> (cmake, autotools, python) becomes unnecessary?
> 
> I must say I am not entirely sure we want to globally export PATH.
> Packages using custom build system should use TARGET_MAKE_ENV and
> HOST_MAKE_ENV, post-build and post-image script have HOST_DIR defined
> in their environment I believe.
> 
> But this is not a strong opinion, I'd just like to see
> arguments/opinions from others on this specific change (the other
> changes in the series, I'm happy with them on the principle, they are
> just a few remaining details to sort out).

 I'm really fine with exporting it globally. It avoids mistakes, because
we will always use the things that we build ourselves - we can't be in a
situation any more that some steps use the system tool and other steps
use the host tool (well, we still can because of missing dependencies,
but the risk is smaller). It also removes the need for things like
setting $(TAR) explicitly (not that we should immediately remove that
one, but we don't have to add it in the future whenever we add another
host-or-system utility).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
