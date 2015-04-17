From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 21:44:01 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <1429263209-13127-1-git-send-email-vorel@jablocom.com>
References: <1429263209-13127-1-git-send-email-vorel@jablocom.com>
Message-ID: <55316281.6080506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 11:33, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> I fixed things which were reported and keep it as a package. This is for first start.
> 
>> # FOO_KCONFIG_FILE is required
>> ifndef $(2)_KCONFIG_FILE
>> $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
>> endif
> 
>>  Oh, now I see that Yann's patch to convert this to ifeq hasn't been applied
>> yet... So yes in that case the custom check should stay.
> Ok. Could you send me a link to the patch?

http://patchwork.ozlabs.org/patch/459378/


[snip]
>> I plan further improvements:
>> * Allow to use different versions
>> There are stable releases, snapshot based on current linux-next and some
>> archived versions based on linux-next. Although it's recommended to use the
>> latest stable version, some people prefer / need different version.

 I don't know if that is so important. If you really need that, you can still
use OVERRIDE_SRCDIR or copy it to BR2_EXTERNAL under a different name or add a
patch in BR2_GLOBAL_PATCH_DIR.

> 
>> * Version check
>> For kernel versions older than 3.0 version backports-3.14 is needed,
>> kernels < 2.6.26 aren't supported.

 Ah, that is a reason to allow versions! But then I'd limit it to three
versions, selectable with a choice: stable (default), next, and old (3.14).

 I don't think a check of the kernel version is needed. There are also
dependencies in a bunch of other modules packages and those don't do a
dependency check either. You can anyway only do that check while building
(because you need to have the kernel source to extract the version), and usually
the modules package already does a check itself.

> 
>> * Custom patches
>> Ekvivalent of BR2_LINUX_KERNEL_PATCH.

 That's kind of superseded by BR2_GLOBAL_PATCH_DIR.

> 
>> * Custom repository version
>> Ekvivalent of BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION.

 That one would be useful, so a fourth version in the choice.


 Regards,
 Arnout

> Any comments?
> 
> Kind regards,
> Petr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
