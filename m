From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2020 21:25:49 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <CAMRc=MdXOK1qScv+b3vr-b9gr9Nwb0Yv=CqdtiCNF6UMM2niMg@mail.gmail.com>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651> <20201030091929.18f77130@windsurf.home>
 <CAMRc=MexG_jDoNuuVzRmNqHD56yYJmwzq43JgGo38equmPiqzQ@mail.gmail.com>
 <20201030101559.0a1fb98c@windsurf.home>
 <CAMRc=MfwZVv10O2DsQitxDsXdpXRSC29VpvqTkC81CkOBUFoLQ@mail.gmail.com>
 <20201030103450.57c772b3@windsurf.home>
 <CAMRc=Mfmk7Bb+eEJ8ikeBfMRir0eBAj7z53eqDK=f-XJqEN5Cg@mail.gmail.com>
 <20201030114153.4e47cdf8@windsurf.home>
 <CAMRc=MdXOK1qScv+b3vr-b9gr9Nwb0Yv=CqdtiCNF6UMM2niMg@mail.gmail.com>
Message-ID: <854f8b3d-20bd-769a-ee3d-3639529a5fc0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/2020 11:53, Bartosz Golaszewski wrote:
> On Fri, Oct 30, 2020 at 11:41 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Fri, 30 Oct 2020 11:16:04 +0100
>> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>>>> Well, that is an issue. An application that builds with 1.6 may not
>>>> build with 1.4, so they are not compatible API-wise, and therefore
>>>> having libgpiod.mk fall back to 1.4 automatically when the kernel
>>>> headers are too old is going to potentially break applications that use
>>>> 1.6-specific APIs.
>>>
>>> Versioning of libgpiod just follows the regular MAJOR.MINOR.BUGFIX
>>> scheme. Major releases break API. Minor releases don't break API but
>>> (may) introduce new features. Bugfix releases don't change API. I
>>> think this is the standard for most libraries. So far no buildroot
>>> package even depends on libgpiod so this could only affect out-of-tree
>>> users. I'm not sure what the policy here is @buildroot though.
>>
>> This is perfectly OK. Where it clashes is when a new MAJOR.MINOR
>> release drops support for kernels older than 5.5, which is a
>> super-recent kernel version. This prevents from simply updating to the
>> latest 1.6 release in all situations, causing a compatibility problem
>> that is quite annoying to handle.
>>
> 
> In that case I would advise to keep v1.4 exclusively in buildroot -
> just like we do in meta-openembedded.

 But that brings us back to the other problem: any package that relies on the
new API in 1.6 can't be built.

 I think the only *real* solution for that is to introduce a libgpiod16 package
if people actually start to use the new APIs. But then we probably end up with
two copies of libgpiod (1.4 and 1.6) because some packages use don't require the
new APIs...

 So, this reliance on 5.5 kernel headers is really putting limitations to your
downstream users.


 Regards,
 Arnout
