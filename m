From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 12 Mar 2014 10:14:01 +0000
Subject: [Buildroot] [PATCH] pcsc-lite: not available for static builds
In-Reply-To: <5320320C.3050705@imgtec.com>
References: <1394453433-18449-1-git-send-email-Vincent.Riera@imgtec.com>
 <871ty8qs2j.fsf@dell.be.48ers.dk> <5320320C.3050705@imgtec.com>
Message-ID: <53203369.70701@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2014 10:08 AM, Vicente Olivert Riera wrote:
> On 03/11/2014 10:38 PM, Peter Korsgaard wrote:
>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>>>>> writes:
>>
>>   > This package requires dlopen and checks for it in the configure
>> phase.
>>   > If it's not present, then the build process is stopped.
>>
>>   > Fixes:
>>   >
>> http://autobuild.buildroot.net/results/34b/34b83c3ea4a8aac6aeda225e5859bd318b13a676/
>>
>>
>>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>   > ---
>>   >  package/pcsc-lite/Config.in |    4 ++++
>>   >  1 files changed, 4 insertions(+), 0 deletions(-)
>>
>>   > diff --git a/package/pcsc-lite/Config.in
>> b/package/pcsc-lite/Config.in
>>   > index aab42e8..24981bd 100644
>>   > --- a/package/pcsc-lite/Config.in
>>   > +++ b/package/pcsc-lite/Config.in
>>   > @@ -2,6 +2,7 @@ config BR2_PACKAGE_PCSC_LITE
>>   >      bool "pcsc-lite"
>>   >      depends on BR2_TOOLCHAIN_HAS_THREADS
>>   >      depends on BR2_USE_MMU # fork()
>>   > +    depends on !BR2_PREFER_STATIC_LIB
>>
>> This dependency should also be propagated to the reverse dependencies
>> of pcsc-lite.
>
> Have you done this, or do you want I submit patches for it?

Forget it, I have seen the commit.
>
>>   >      help
>>   >        Middleware to access smart card using SCard API (PC/SC).
>>
>>   > @@ -31,3 +32,6 @@ endif
>>   >  comment "pcsc-lite needs a toolchain w/ threads"
>>   >      depends on BR2_USE_MMU
>>   >      depends on !BR2_TOOLCHAIN_HAS_THREADS
>>   > +
>>   > +comment "pcsc-lite needs a toolchain w/ dynamic library"
>>   > +    depends on BR2_PREFER_STATIC_LIB
>>
>> We normally merge all the toolchain dependency options together, E.G.:
>>
>> comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
>>          depends on BR2_USE_MMU
>>          depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
>>
>> Committed with these changes, thanks.
>>
>
>


-- 
Vincent
