From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 23:17:18 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/unscd: new package
In-Reply-To: <20151130224457.4baa3ab6@free-electrons.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <1448287096-18606-2-git-send-email-rdkehn@yahoo.com>
 <20151130224457.4baa3ab6@free-electrons.com>
Message-ID: <565CCAEE.7070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-11-15 22:44, Thomas Petazzoni wrote:
> Dear Doug Kehn,
> 
> On Mon, 23 Nov 2015 07:58:15 -0600, Doug Kehn wrote:
> 
>> diff --git a/package/unscd/Config.in b/package/unscd/Config.in
>> new file mode 100644
>> index 0000000..1639bca
>> --- /dev/null
>> +++ b/package/unscd/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_UNSCD
>> +	bool "unscd"
>> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>> +	depends on !BR2_GLIBC_NSCD
> 
> I think you should leave this BR2_GLIBC_NSCD thing on the side for now.
> Just make unscd a normal package, and don't worry about nscd coming
> from glibc: there is anyway no mechanism in Buildroot today to install
> the nscd coming from the toolchain.
> 
>> +UNSCD_POST_EXTRACT_HOOKS += UNSCD_EXTRACT_DEBIAN
>> +
>> +define UNSCD_APPLY_DEBIAN_PATCHES
>> +	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches
>> +endef
>> +
>> +UNSCD_POST_PATCH_HOOKS += UNSCD_APPLY_DEBIAN_PATCHES
> 
> This doesn't work because the patches don't end with an extension that
> is recognized by our apply-patch script. So all what you see is:
> 
>>>> unscd 0.51 Patching
> support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/unscd-0.51 /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches
> Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/change_invalidate_request_info_output, skipping
> Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/support_large_numbers_in_config, skipping

 Uh, that shouldn't happen, since 7caf464 everything in the series file should
be applied regardless of name...

> 
> which makes the entire dance around applying the Debian patches useless.
> 
> Unfortunately, fixing this requires fixing our apply-patches script.

 Which I did :-)


 Regards,
 Arnout

> Generally speaking, I am not super happy with all the logic we need to
> add in various packages to get them to apply the Debian patches. But
> Debian packages vary quite a bit in the way the patches are organized,
> so I don't know if it's doable to fix.
> 
> BTW any reason to not use the upstream version, at
> http://busybox.net/~vda/unscd/nscd-0.52.c, which is higher than 0.51 ?
> 
> Can you look into this patching issue (or alternatively use 0.52 with
> no patches) and send an updated version ?
> 
> Thanks !
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
