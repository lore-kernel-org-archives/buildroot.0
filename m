From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Mar 2015 00:21:51 +0100
Subject: [Buildroot] [PATCH 4/7] package/perf: build outside kernel tree
In-Reply-To: <1426714983-24803-4-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
 <1426714983-24803-4-git-send-email-steven@uplinklabs.net>
Message-ID: <550B5A0F.7080904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/15 22:43, Steven Noonan wrote:
> This is necessary for introducing patches.

 Although I think it's really messy to build perf within the the linux source
like we do now, your proposed approach has some showstopper drawbacks.

- It doesn't work for LINUX_OVERRIDE_SRCDIR or BR2_LINUX_KERNEL_CUSTOM_LOCAL.

- Any custom patches to the kernel are not taken into account, and I believe
perf uses the private headers so there's a risk there.

- It requires an expensive second extract of the entire kernel.


 As an alternative, you could copy in just the perf stuff from the linux source
as a POST_EXTRACT_HOOK.

 Or you could apply the patches on the kernel sources instead of on the perf
directory. But that would be a bit more complicated.

 Or you could add a LINUX_POST_PATCH_HOOK to apply the perf patches. I'm not
entirely sure if that would work though.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
