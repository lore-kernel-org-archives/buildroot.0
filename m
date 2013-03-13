From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 21:18:17 +0100
Subject: [Buildroot] [PATCH 3 of 3] oprofile 0.9.8: fix compilation on
 powerpc
In-Reply-To: <CAAXf6LXsr5Jw4=q8M=oZRbaiLnOzokt_svb2dmiKqvw1oGzwHw@mail.gmail.com>
References: <patchbomb.1363111853@BEANTN0L019720>
 <e866a53b0e64b92f119b.1363111856@BEANTN0L019720>
 <069B5A25F9844945B625ADE7258AC94C06200429@4rf-nz-orion.local.4rf.com>
 <CAAXf6LXsr5Jw4=q8M=oZRbaiLnOzokt_svb2dmiKqvw1oGzwHw@mail.gmail.com>
Message-ID: <5140DF09.3030705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 17:14, Thomas De Schampheleire wrote:
> Hi Reuben,
>
> On Tue, Mar 12, 2013 at 9:20 PM, Reuben Dowle <reuben.dowle@4rf.com> wrote:
[snip]
>>> -OPROFILE_DEPENDENCIES = popt binutils
>>> +OPROFILE_DEPENDENCIES = popt binutils libpfm4
>>
>> I think this dependency is only needed for powerpc. So something like:
>>
>> OPROFILE_DEPENDENCIES = popt binutils
>> ifeq ($(BR2_powerpc),y)
>> OPROFILE_DEPENDENCIES += libpfm4
>> Endif
>>
>> Might be better?
>
> As far as I understand, these dependencies are only used for
> build-time ordering. This means that libfm4, *if selected in the
> config* will be built before oprofile.

  Nope. If libpfm4 is a dependency, it will be built even if you haven't 
configured it. So libpfm4 will be built unnecessarily.

  Regards,
  Arnout

> However, if libpfm4 is not
> selected, and you're not on powerpc, you can still build oprofile.
> The only benefit from the suggested code above, I think, is that on
> non-powerpc targets the unnecessary ordering of oprofile / libpfm4 is
> not enforced, but I think this will hardly give an impact on build
> time.
>
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
