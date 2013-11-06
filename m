From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Nov 2013 00:20:41 +0100
Subject: [Buildroot] [PATCH] gcc: use generic infrastructure for patches
In-Reply-To: <20131107001343.7f90de1c@skate>
References: <527AB58A.9050506@mind.be>
 <1383778795-15262-1-git-send-email-arnout@mind.be>
 <20131107001343.7f90de1c@skate>
Message-ID: <527ACEC9.1030507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/13 00:13, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
>
> On Wed,  6 Nov 2013 23:59:55 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>
>>   package/gcc/gcc-final/4.2.2-avr32-2.1.5          | 1 +
>>   package/gcc/gcc-final/4.3.6                      | 1 +
>>   package/gcc/gcc-final/4.4.7                      | 1 +
>>   package/gcc/gcc-final/4.5.4                      | 1 +
>>   package/gcc/gcc-final/4.6.4                      | 1 +
>>   package/gcc/gcc-final/4.7.3                      | 1 +
>>   package/gcc/gcc-final/4.8-arc                    | 1 +
>>   package/gcc/gcc-final/4.8.2                      | 1 +
>
> The only problem that I see with this symbolic link based solution is
> that we will have to remember to add/update the three symbolic each
> time we do a gcc version bump. If we forget to do so, then the build
> will go on silently, but without having applied the patches.
>
> I don't say this problem is a show-stopper, but it's a drawback of this
> symbolic link solution, IMO.

  I'm hoping that the separate source/build directories will be merged 
soon, so that this won't be necessary anymore :-)

>
>>   define HOST_GCC_APPLY_POWERPC_PATCH
>> -	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
>> +	if [ -e package/gcc/$(GCC_VERSION)/powerpc-link-with-math-lib.patch.conditional ]; then \
>> +		support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional; \
>> +	fi
>
> Why was adding the condition necessary?

  Read the rest of the thread: otherwise, apply-patches.sh will error out 
because package/gcc/some-snapshot-directory doesn't exist.

  Granted, I could have tested for the directory instead of the patch 
existence.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
