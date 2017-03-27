From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Mar 2017 00:03:46 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add generic genimage
 script
In-Reply-To: <1486967858.369675.1490648815951.JavaMail.zimbra@savoirfairelinux.com>
References: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
 <20170327164730.16271-2-etienne.phelip@savoirfairelinux.com>
 <2b9a89f7-a56a-1b20-4b84-7952978203b5@mind.be>
 <1486967858.369675.1490648815951.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <33fe47eb-33cd-22a5-2e46-9677a0093540@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-17 23:06, ?tienne Ph?lip wrote:
> Hello Arnout!
> 
> ----- Le 27 Mar 17, ? 16:40, Arnout Vandecappelle arnout at mind.be a ?crit :
> 
>> Hi Phelip,
>>
>> Nice to see yet another contribution from Savoir-faire!
>>
>> On 27-03-17 18:47, Phelip Etienne wrote:
>>> This script is a wrapper for the genimage tool used by most boards.
>>> The board postimage script can now call this script instead of invoking
>>> genimage command themselves.
>>
>> Looks good except for some small comments below. It would have been nice,
>> however, if you had included a patch in this series that completely removes one
>> of the post-image scripts. Almost all of them can be removed completely,
>> raspberrypi is one of the exceptions...
> 
> Good, since you seem to agree with the proposed changes, I will respin
> a new patch series addressing your comments, as well as applying the
> change to all other boards using genimage.

 I had one more idea for the script: perhaps it's better to use an explicit
option for the config argument, e.g. --genimage-cfg=... . Remember that the same
argument list is used for the post-build, post-fakeroot and post-image scripts.
So relying on the order of arguments is difficult if several scripts are used.
Look at the a20_olinuxino scripts for examples.


> In the meantime, I plan to add a Kconfig entry to specify a list of
> space separated genimage config files and make Buildroot call the
> wrapper automatically (after the post-image script), for each config

 Hm, before or after the post-image script? It's possible that the post-image
script generates something used by genimage (e.g. some postprocessing of the
kernel or bootloader image; cfr. firefly-rk3288), but it's also possible that
the post-image script does something with the result of genimage (e.g. writing
the bootloader to the start of the image, cfr. odroidc2, or writing the image to
an SD card).

> file. Do you think I should add this Kconfig/Makefile addition
> in a future series, or directly in this one?

 Well, if you first convert all defconfigs to the generic genimage script, and
then convert them again to use the new Kconfig option, that generates a lot of
useless churn. So if you have the patience, I think it's better to now post an
RFC series that also introduces the new Kconfig option and then converts one or
two defconfigs to show how it goes.

 Regards,
 Arnout

> 
> Thanks,
> --Etienne
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
