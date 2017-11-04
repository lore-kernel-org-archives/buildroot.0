From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 22:13:07 +0100
Subject: [Buildroot] [PATCH v2] util-linux: security bump to version 2.31
In-Reply-To: <232020389.16019836.1509500098756.JavaMail.zimbra@datacom.ind.br>
References: <1509446871-25076-1-git-send-email-casantos@datacom.ind.br>
 <87zi87ezym.fsf@dell.be.48ers.dk>
 <232020389.16019836.1509500098756.JavaMail.zimbra@datacom.ind.br>
Message-ID: <d99d0654-6124-b1cf-b11e-fbedb04e5d59@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-17 02:34, Carlos Santos wrote:
>> From: "Peter Korsgaard" <peter@korsgaard.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: buildroot at buildroot.org
>> Sent: Tuesday, October 31, 2017 8:04:33 PM
>> Subject: Re: [PATCH v2] util-linux: security bump to version 2.31
> 
>>>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
>>
>>> Fix CVE-2016-2779: runuser in util-linux allows local users to escape to
>>> the parent session via a crafted TIOCSTI ioctl call, which pushes
>>> characters to the terminal's input buffer.
>>
>>> The new experimental "su --pty" feature has been implemented to fix this
>>> issue. The feature is not enabled by default and the new command line
>>> option --pty is necessary.
>>
>>> Add rfkill, a command for enabling and disabling wireless devices. This
>>> implementation is based upon, and backward compatible with, the original
>>> rfkill from Johannes Berg and Marcel Holtmann, currently provided by the
>>> standalone "rfkill" package.
>>
>> Do you know if there's any reason to prefer this version over our
>> existing rfkill package? The fact that it isn't available on nommu
>> probably means we cannot get rid of the separate package, but we may
>> want to add it to UTIL_LINUX_DEPENDENCIES so the util-linux version
>> "wins".
> 
> I think this one is preferable because util-linux is actively maintained
> while the original rfkill seems to be abandoned (the last commit in its
> git repository is from Jan 8 2015).
> 
> How many nommu architectures does Buildroot support? The only boards I
> found without BR2_USE_MMU were qemu_{arm_versatile,xtensa_lx60}_nommu,
> which obviously do not even have RF radios to turn on/off.

stm32f429_disco_defconfig and stm32f469_disco_defconfig are NOMMU. I don't think
these two have RF, but STM32L4 Discovery boards do have Wifi, Bluetooth, NFC and
900 MHz radio. Probably not supported by rfkill however :-)

 Anyway, if anybody needs it, the MMU requirement of libsmartcols could be
removed. It is only there for the pager functionality which is not used by
either libsmartcols or rfkill, but just happens to be linked into the .so file...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
