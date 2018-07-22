From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Jul 2018 23:24:24 +0200
Subject: [Buildroot] 
 =?utf-8?b?562U5aSNOiBwYXRjaDogZml4IHdyb25nIHN5c3Jv?=
 =?utf-8?q?ot_path_when_given_rsdk_toolchain?=
In-Reply-To: <14A4BC6FC7AB3340A49D24D6ACB7BED930633B@RS-MBS02.realsil.com.cn>
References: <14A4BC6FC7AB3340A49D24D6ACB7BED930620C@RS-MBS02.realsil.com.cn>
 <20180719153240.25e67cd9@windsurf>
 <14A4BC6FC7AB3340A49D24D6ACB7BED930633B@RS-MBS02.realsil.com.cn>
Message-ID: <c6e54e61-fe51-262b-5c15-0df59f373a0e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-18 10:21, ??? wrote:
> Hi Thomas,
> 
> Thanks for reminding, I'm tweaking my work environment to use git-send-email, it takes a while.
> I uploaded the toolchain to Google drive for your test, here is the link:
> https://drive.google.com/open?id=1vkrGPUWbzIGMWMZb8DypyK1VIynnbqnn
> And a defconfig for your reference:
> https://drive.google.com/open?id=1J8ksyWcyXEBfEy0EKrMuH1Zyiif25HrR
> 
> In shell you can mimic the buildroot find toolchain sysroot as this:
> 
> $ readlink -f $(LANG=C ..../rsdk-6.4.1-5281-EL-4.9-u1.0-m32fut-180611/bin/rsdk-linux-gcc -print-file-name=libc.a)|sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::'

 libc.a is in mips-linux-uclibc/lib/libc.a. The problem is that the libc.a is
allowed to reside in a subdirectory of lib (the ([^/]*/)? part of the regex).
Since the regex is greedy, it will match the 'libc/' part for the lib* bit, and
'lib/' for the additional subdirectory.

 Anchoring with a / sounds like a good idea to me. Especially since just below,
the toolchain_find_libdir macro *does* anchor at a /.

 Regards,
 Arnout

> 
> Regards
> Shawn Chen
> 
> -----????-----
> ???: Thomas Petazzoni [mailto:thomas.petazzoni at bootlin.com] 
> ????: 2018?7?19? 21:33
> ???: ???
> ??: buildroot at buildroot.org; Thomas De Schampheleire
> ??: Re: [Buildroot] patch: fix wrong sysroot path when given rsdk toolchain
> 
> Hello Shawn,
> 
> Thanks for your patch, and for contributing to Buildroot!
> 
> On Thu, 19 Jul 2018 09:10:03 +0000, ??? wrote:
> 
>> The attachment is a patch that fixes a Realtek toolchain that has a
>> sysroot path of ?mips-linux-uclibc?, this causes the buildroot
>> recognizes the sysroot as ?mips-linux-uc? by the sed operation, and
>> then the external toolchain setup is failed. Adding a ?/? in the sed
>> re expression avoids the wrong substitution, other toolchains like
>> linaro arm toolchain are tested ok to ensure no side effect is
>> induced, please help review and apply this patch, thanks.
> 
> Would it be possible to get access to this Realtek toolchain? I'd like
> to check the behavior, and understand a bit more the issue, because it
> looks a bit suspicious/strange.
> 
> The sed expression is supposed to replace:
> 
>   /path/to/sysroot/usr/lib/libc.a
> 
> by:
> 
>   /path/to/sysroot/
> 
> So I don't quite see how the ending "libc" in mips-linux-uclibc can
> affect this.
> 
> Also, for your next patches, could you send them with the patch
> description in the commit log (currently your commit log is just
> "IPCSDK-6460", which is not very useful) ? Also, they should be sent
> with "git send-email", so that the patch is inline.
> 
> Thanks a lot!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
