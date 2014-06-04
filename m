From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Jun 2014 00:29:43 +0200
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
In-Reply-To: <20140604204505.GA19703@arch.cereza>
References: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
 <5386131B.6090809@mind.be> <20140604204505.GA19703@arch.cereza>
Message-ID: <538F9DD7.6020102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/14 22:45, Ezequiel Garcia wrote:
> Hello Arnout,
> 
> On 28 May 06:47 PM, Arnout Vandecappelle wrote:
> [..]
>>>
>>> The path specified can be a cpio archive or a directory, just like
>>> the kernel config. The path is specified w.r.t. BRs topdir, and made
>>> absolute since the kernel builds in another directory.
>>
>>  This patch does nothing more than update the kernel config. Since you can
>> already supply a custom kernel config, I don't think there is much added value
>> to moving these options to the buildroot config.
>>
>>  The only feature you add is that the patch can be relative to the buildroot
>> directory. Not enough to be relevant, IMHO, especially since the patch adds
>> non-negligible complexity.
>>
> 
> Our software stack includes a kernel with an appended initramfs to take care
> of software upgrade and find, check and switch to the "real" rootfs. Both
> the initramfs and rootfs are Buildroot-based, but each of them with their
> own configuration and history (in separate git repos).
> 
> Hence we came up with this solution: the initramfs would live in a different
> repo, and after it's built we use this new option to append it in the kernel.
> 
> Maybe you have a better idea, and there's a cleaner way to accomplish this
> with Buildroot?

 Use a custom kernel config, and code the path to the external initramfs in that
custom kernel config instead of in the buildroot config. You can use
$(BASE_DIR)/../initramfs-output-dir if you want to avoid absolute paths in the
config.

 Actually, in your case the easiest solution would be to build the kernel
together with the initramfs-buildroot and use the initramfs rootfs instead of
the cpio one. In the real-rootfs-buildroot you don't need to build a kernel.

 Or am I missing something?

 Regards,
 Arnout

> 
> Thanks for the feedback!
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
