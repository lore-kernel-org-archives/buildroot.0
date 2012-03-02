From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Mar 2012 21:50:14 +0000
Subject: [Buildroot] [PATCH] target-finalize: Also copy .so files if
	BR2_HAVE_DEVFILES is enabled
In-Reply-To: <20120301084831.26403240@skate>
References: <201203010030.08802.arnout@mind.be>
 <1330563031-20637-1-git-send-email-arnout@mind.be>
 <20120301084831.26403240@skate>
Message-ID: <201203022150.15339.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 07:48:31 Thomas Petazzoni wrote:
> So maybe all packages should always install the .so file (be it a
> symbolic link or the libc.so linker script), and then:
> 
>  * When BR2_HAVE_DEVFILES is not set, we get rid of those .so symbolic
>    links
> 
>  * When BR2_HAVE_DEVFILES is set, we keep them
> 
> That's just a proposal here, other options would be fine with me as
> well. It's just that the fact most packages already install the .so
> symlink and we re-do it in target-finalize when BR2_HAVE_DEVFILES is
> set looks confusing.

 Removing the .so symlinks seems a bit too much work and too much risk for 
what it is bringing.

 It wouldn't be a bad idea though to only copy over files if they don't 
exist yet.  However, I considered that not to be worth the effort.  Even
if you have 1000 shared libraries installed, overwriting those symlinks
will take you less than a second - in any case much less than the equally
redundant copying of the corresponding .a archives :-)

 In fact, since we're starting to use rsync more and more, we could rely
on its filtering rules to select the .a, .la and .so files for us.

 I would whip up a patch, but I'm too tired now :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
