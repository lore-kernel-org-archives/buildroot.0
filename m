From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Sep 2012 07:56:49 +0200
Subject: [Buildroot] [PATCH 5/9] firefox: installing default extensions
 needs host-unzip dependency
In-Reply-To: <504FD1C6.6090109@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-6-git-send-email-stefan.froberg@petroprogram.com>
 <504FBA20.9010602@mind.be> <504FD1C6.6090109@petroprogram.com>
Message-ID: <505175A1.4070103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 02:05, Stefan Fr?berg wrote:
> 12.9.2012 1:24, Arnout Vandecappelle kirjoitti:
>> On 09/05/12 16:29, Stefan Fr?berg wrote:
[snip]
>>> +# No point of doing optimized build for host version,
>>> +# so we build host version without any x86 specific asm stuff
>>> +define HOST_UNZIP_BUILD_CMDS
>>> +    (cd $(@D); \
>>> +    sed -i -e 's/CFLAGS="-O -Wall/&   -DNO_LCHMOD/' unix/Makefile ; \
>>
>>   This isn't needed anymore with the patch above, right?
>>
>
> That -DNO_LCHMOD is needed. I remember build process starting
> complaining about it.

  Sorry, I meant that you could add the -DNO_LCHMOD to CFLAGS in
the $(MAKE) call below.

>>> +    $(MAKE) -f unix/Makefile linux_noasm )
>>> +endef
>>> +
>>> +define HOST_UNZIP_INSTALL_CMDS
>>> +    (cd $(@D); \
>>> +    $(MAKE) prefix=$(HOST_DIR)/usr install )
>>
>>   We normally use $(MAKE) -C $(@D) instead of cd $(@D)
>>
>>> +endef
>>> +
>>> +# If you do have busybox installed in your target (like most do)
>>> +# and if you have by accident also enabled unzip support in
>>> +# your busybox configuration file, then guess what happens
>>> +# after insallation of the real unzip application ?
>>> +#
>>> +# Yep, UNZIP_INSTALL_TARGET_CMDS will happily
>>> +# write to your unzip ->   /bin/busybox symlink
>>> +# and overwrite your busybox ... :-(
>>> +#
>>> +# That's why I included this as an primitive safety mechanism.
>>> +# Improvement are wellcome
>>
>>   AFAIK, install removes a symlink before installing, so busybox
>> itself shouldn't be overwritten.  To make sure the full unzip is
>> installed instead of the busybox unzip, you do:
>>
>
> But when I chrooted inside target system after building
> it just spew unzip version stuff out and it had overwrited my busybox
> binary.

  I haven't tried it, it's just that no other package does this.
For sure, not building/installing unzip when busybox is selected
(which it is by default) is not a good idea.


[snip]
> Have you had time to check firefox patch #9 ? The gnash patch ?

  Not yet, coming up.


> I have somehow managed to broke my sytem config
> (maybe some change I recently made to mesa3d package)
> and now I can't build it anymore.
> :-(
>
> It start's complaining about missing
>   -lselinux, security library used by Fedora that gnash  is not even
> using ...
> :-(

  That smells like there's a configure script that is trying to use
some host libraries...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
