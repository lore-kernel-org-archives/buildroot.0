From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Mar 2012 15:29:36 +0000
Subject: [Buildroot] Kernel and buildroot in 1MB
In-Reply-To: <1330600410.23056.YahooMailNeo@web132105.mail.ird.yahoo.com>
References: <4F4EC83C.7090208@yahoo.co.uk> <20120301085010.1cec8907@skate>
 <1330600410.23056.YahooMailNeo@web132105.mail.ird.yahoo.com>
Message-ID: <201203031529.36487.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 11:13:30 bifferos wrote:
> > That said, it's probably quite difficult these days to build a system
> > for which the kernel+root filesystem fits within 1 MB, as your e-mail
> > topic seems to suggest.
> 
> I wouldn't say it's difficult.  I'm using such a system right now to do 
> something useful and, it's actually about 800K (kernel + initrd) system.  
> I wrote up some notes here: 
> https://sites.google.com/site/bifferboard/Home/boards-with-1mb-flash/buildroot

 Impressive...  But what a complex way of doing things!  You can actually:

- configure buildroot to download the 3.3-rc1 kernel
- configure buildroot to use your custom kernel config
- run 'make linux-menuconfig' to tweak it if necessary
- run 'make linux-update-defconfig' to store it back to the original file
- configure buildroot to use the files.tgz tree as the skeleton of the
  target filesystem
- if necessary, remove redundant files in a post-build script
- configure buildroot to pack the rootfs in the kernel as an initrd
- save the buildroot config with 'make savedefconfig' for easy distribution

 Hey, it's so easy that I've created the necessary files for you!  A patch
will follow this mail.  After applying it, run 'make bifferboard_defconfig'
followed by 'make' and you should get a working system.  It's still 972K,
because I didn't strip the busybox config too much.  But it doesn't contain
a libc.so.  It does still contain a non-working ldconfig and getconf, 
though.  I wonder BTW what either of them is doing on a system that doesn't
have HAVE_DEVFILES enabled...

 If my patch gives you a working bifferboard, can you reply to it with an
Acked-by: statement (using your real name please)?  Then we can include
it in buildroot.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
