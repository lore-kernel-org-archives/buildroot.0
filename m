From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 02:22:52 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
In-Reply-To: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
References: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
Message-ID: <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 10:49, Michael Walle wrote:
> Hi,
> 
> there was a discussion (and rejected patches) [1] about adding support for
> buildroot config fragments. The conclusion was that this should not be part of
> buildroot and should stay external.

 With "stay external", the idea was not that it would be handled in external.mk,
but rather that you have a script that merges the defconfigs to a temporary file
and the calls 'make defconfig BR2_DEFCONFIG=...' on it.


> But an integration would need unconditonal
> inclusion of the external.mk. The last mail about this subject was in July [2].
> Are there any news on this topic?

 Nobody ever posted a patch :-)

 But I can already tell you that you won't be able to just move the include
outside of the conditional: it can go up over the definition of the package
infras, and it can't go down over the target-finalize: $(PACKAGES) rule. So it
has to stay where it is, and the conditional has to be split up.

 It should be analyzed then what the effect is of including package .mk files
when the package infra is not defined.


 Regards,
 Arnout

> 
> [1] http://patchwork.ozlabs.org/patch/641840/
> [2] http://lists.busybox.net/pipermail/buildroot/2016-July/167059.html
> 
> -michael
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
