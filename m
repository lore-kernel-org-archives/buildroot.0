From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Aug 2013 19:03:55 +0200
Subject: [Buildroot] make clean behavior
In-Reply-To: <20130827104112.0c916be5@skate>
References: <CAAXf6LVsXF29Z9cZCSmZqMX8zVms0ANfgo33tHf8NiU57LY8QQ@mail.gmail.com>
 <20130827104112.0c916be5@skate>
Message-ID: <521CDBFB.7080107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/27/13 10:41, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 27 Aug 2013 10:19:02 +0200, Thomas De Schampheleire wrote:
>
>> Is it intentional that 'make clean' is different depending on having a
>> .config file?
>>
>> With .config there is a full clean:
>>
>> rm -rf buildroot/output/host/usr/powerpc-buildroot-linux-gnu/sysroot
>> buildroot/output/target buildroot/output/images buildroot/output/host
>> buildroot/output/stamps buildroot/output/build
>> buildroot/output/toolchain buildroot/output/staging
>> buildroot/output/legal-info
>>
>>
>> but if you remove .config (and thus symbol BR2_HAVE_DOT_CONFIG) you
>> only have a partial clean:
>>
>> rm -rf /repo/tdescham/reborn/buildroot-ppc/output/build
>> /repo/tdescham/reborn/buildroot-ppc/output/staging
>>
>>
>> Suppose you accidentally removed your .config, then you cannot easily
>> get a clean buildroot env anymore. The behavior is caused due to the
>> definition of variables like TARGET_DIR being inside a 'ifeq
>> ($(BR2_HAVE_DOT_CONFIG),y)' statement.
>>
>> I would propose to make sure that 'clean' works in all cases, by
>> moving the relevant variable definitions outside this if statement.
>
> This has also annoyed me a few times, and I don't quite see why 'make
> clean' should have a different behavior between the has .config case
> and the !has .config case.

  Unfortunately, $(HOST_DIR) and therefore $(STAGING_DIR) (which is 
actually stupid to remove since it is under $(HOST_DIR) depend on 
BR2_HOST_DIR, so you'll need to take special action in the case when 
there is no .config.

  But otherwise I agree.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
