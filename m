From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Oct 2012 13:44:36 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAAXf6LXDkFmh6KLGdU=kG7ijaKhZB7i+kR2=xggbbChapjidzA@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
 <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
 <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
 <506D5218.2060401@mind.be>
 <CAAXf6LXDkFmh6KLGdU=kG7ijaKhZB7i+kR2=xggbbChapjidzA@mail.gmail.com>
Message-ID: <506D76A4.8040803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/12 12:56, Thomas De Schampheleire wrote:
> On Thu, Oct 4, 2012 at 11:08 AM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>>   That said, if you (temporarily) do need a mixed 32/64-bit system, I think
>> this approach is the most appropriate: make two separate buildroot builds,
>> and merge them together at the end.  The merge can be done in the post-build
>> script.  The post-build script could even call the'make' for the other part
>>   of the system...  The tricky part is that the libraries from the 'slave'
>> environment will have to be moved into a multilib directory (i.e. lib32 or
>> lib64).
>>
>>   I don't immediately see a need for changes in the buildroot infrastructure.
>>
>
> The downside with this approach is that there will be a lot of
> duplicate builds. You only need 32-bit versions of the libraries. All
> the rest of userspace would be 64-bit only. To achieve that, you'd
> have two separate defconfigs, one with only libraries, 32-bit, and one
> with everything, 64-bit.
> However, still with that configuration a lot is duplicated: all the
> host builds like host-automake, host-autoconf, ... would be created in
> each buildroot instance.
>
> I like following approaches better:
> - 64-bit kernel, entire 32-bit userspace
> - 64-bit kernel, mostly 64-bit userspace, but selected libraries built
> only in 32-bit (e.g. using a local.mk-like file to specify)

  Actually, you can put the following in local.mk:

$(BUILD_DIR)/foo-$(FOO_VERSION)/.stamp_configured: TARGET_CFLAGS = $(TARGET_CFLAGS) -m32

(and similarly for .stamp_built etc.)

> - 64-bit kernel, 64-bit applications, 64+32bit libraries (true multilib).

  That would probably mean you need to do something like the host-pkg
infrastructure.


> In all of these cases, you will probably need to look into the
> toolchain extraction, as you'll need the correct sysroot lib
> directories (possibly multiple).

  And you either have to make it depend on an external toolchain that has
to be multilib (so you somehow have to check that the external toolchain is
indeed multilib), or you have to add the possibility to generate a multilib
buildroot / ct-ng toolchain.

  I think the toolchain aspect is the biggest problem.  Toolchains are already
the biggest mess in buildroot, I'd hate to add to their complexity.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
