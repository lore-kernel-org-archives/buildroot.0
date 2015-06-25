From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 01:06:10 +0200
Subject: [Buildroot] B3+external kernel: not quite sure how to make
 these pieces fit ...
In-Reply-To: <07f701d0af37$5492bff0$fdb83fd0$@novadsp.com>
References: <066601d0aeb0$e445c840$acd158c0$@novadsp.com>
 <558B1B96.8070701@mind.be> <07f701d0af37$5492bff0$fdb83fd0$@novadsp.com>
Message-ID: <558C8962.9080003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 13:08, g4 at novadsp.com wrote:
> Arnout, apologies. Outlook simply replied to you and not the list.
> 
>>  Looks like your external toolchain is not installed correctly. Can 
>> you run
>> ~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-
>> gnueabihf-gcc  -v
> 
> I will bow to superior knowledge here but it does produce a booting,
> running, kernel.

 I asked because the error you reported is based on this piece of code:

EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d
' '` ; \
if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
        echo "External toolchain uses the unsuported OABI" ; \
        exit 1 ; \
fi ; \

[snip]
> Target: arm-linux-gnueabihf

 ... but it does end in eabihf, so why doesn't this condition match?

 Could you modify toolchain/helpers.mk to echo the value of EXT_TOOLCHAIN_TARGET
in the command above?


[snip]
>>  Or to be safe, just select the Linaro 2014.09 toolchain as to be 
>> downloaded and installed.
> 
> Yes but working kernel trumps all ...

 It is not required to build the kernel with the same toolchain as userspace.


>>  You'll have to run 'make -C <linux_dir> INSTALL_MOD_PATH=$1 
>> modules_install'
>> from a post-build script. Or else, install the modules in some staging 
>> directory and copy them to the target directory in the post-build script.
>>
>>  Or alternatively, just build it in buildroot with 
>> BR2_LINUX_KERNEL_CUSTOM_LOCAL=y.
> 
> This last is promising. So you suggest cloning kernel repo in the buildroot
> tree? 

 No, I suggest letting buildroot build the kernel using the checked-out kernel
source code you have in another directory. _CUSTOM_LOCAL refers to a source tree.


 Regards,
 Arnout

> 
> Someone else must have had this problem? 
> 
> Thank you.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
