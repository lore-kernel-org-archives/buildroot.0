From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 May 2014 21:14:44 +0200
Subject: [Buildroot] [PATCH] infra: relax the check on
	BR2_TOOLCHAIN_BUILDROOT_VENDOR
In-Reply-To: <20140506195920.697ab409@free-electrons.com>
References: <1399393667-15009-1-git-send-email-arnout@mind.be>
 <20140506195920.697ab409@free-electrons.com>
Message-ID: <536934A4.6010206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/14 19:59, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
> 
> On Tue,  6 May 2014 18:27:47 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> 65c2400f introduced BR2_TOOLCHAIN_BUILDROOT_VENDOR and a check that it
>> is not empty or 'unknown'. However, when a .config file from before
>> that commit exists, this makes it impossible to run *config in order
>> to set a value. Catch-22.
>>
>> To break the cycle, remove the check when running one of the config
>> targets.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  package/Makefile.in | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index c34a3bf..da8b768 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -26,7 +26,8 @@ else
>>  TARGET_VENDOR = buildroot
>>  endif
>>  
>> -# Sanity checks
>> +# Sanity checks - but not when we try to reconfigure
>> +ifeq ($(filter menuconfig xconfig gconfig nconfig config defconfig oldconfig silentoldconfig %_defconfig,$(MAKECMDGOALS)),)
> 
> What about using $(noconfig_targets) here, like is done in the main
> Makefile?

 D'oh, silly me. This patch is not necessary.

 I still have http://patchwork.ozlabs.org/patch/316667/ rebased on top of
master, and that patch reads .config even for the *config targets.

 So I've marked this patch as Not Applicable in patchwork.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
