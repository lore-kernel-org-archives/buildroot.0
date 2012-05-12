From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 16:43:48 +0200
Subject: [Buildroot] [PATCH 2/3] gettext: Rename BR2_PACKAGE_LIBINTL to
 BR2_PACKAGE_GETTEXT_NEEDS_BINARIES
In-Reply-To: <CAHXCMM+SrrkJjjv3p1ZwyOSBX_U=GWYxcsCc577rCGqx=OZrXg@mail.gmail.com>
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <1336475958-5714-2-git-send-email-s.martin49@gmail.com>
 <4FAD86B2.50204@mind.be>
 <CAHXCMM+SrrkJjjv3p1ZwyOSBX_U=GWYxcsCc577rCGqx=OZrXg@mail.gmail.com>
Message-ID: <4FAE7724.5010608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 00:45, Samuel Martin wrote:
> Hi Arnout,
>
> Thx for the review.
>
> 2012/5/11 Arnout Vandecappelle<arnout@mind.be>:
>> On 05/08/12 13:19, Samuel Martin wrote:
[snip]
>>> +comment "libintl requires a toolchain with locale/i18n support"
>>> +       depends on BR2_PACKAGE_GETTEXT&&    !BR2_ENABLE_LOCALE
>>
>>
>>   You just removed libintl, so you shouldn't add a comment about it.
>
> Because now libintl comes with gettext, there is no explicit target
> for libintl anymore.
> I add the comment about libintl because the build of packages
> depending on libintl failed
> if I enabled gettext, but disable locale/i18n support.
>
>> I'm also not sure where this comes from.  If gettext/libintl requires
>> ENABLE_LOCALE, why did it work before?  Or didn't it work before, and
>> should there in fact be a 'depends on BR2_ENABLE_LOCALE' in the gettext
>> package (and everything that selects it)?
>
> When I tested these patches, with similar configs, the unique diff was
> BR2_ENABLE_LOCALE enabled or not,
> I got both libgettextlib and libintl installed in the staging dir.
> when I enabled BR2_ENABLE_LOCALE,
> whereas there was only libgettextlib installed if BR2_ENABLE_LOCALE
> was disabled.
> I cannot explain me either, hope there is some gettext guru around here...

  I just tried with the following defconfig and without these patches,
and I do get both libgettextlib and libintl on the target.

BR2_powerpc=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
(BR2_ENABLE_LOCALE is not set)

[snip]
>>   Why does libidn need the gettext binaries?  If this is just a mechanical
>> update of a dependency that was in fact incorrect, why is it just for
>> libidn and not for the 20-ish other packages that select
>> BR2_PACKAGE_GETTEXT?
>>
>>   In fact for this one I had a quick check in the source code, and I can't
>> find a reference to the gettext binaries.  So I doubt it is needed.
>>
> Actually, I followed some basic logic:
> Before this patch series:
> "a package depending on: gettext&&  libintl,  did not need gettext binaries";
> this can also be rephrase:
> "a package depending on: gettext&&  !libintl,  may need gettext binaries".
>
> After apply this patch, because I invert (and rename) the libintl
> logic, these sentences become:
> "a package depending on: gettext&&  !need_gettext_binaries,  did not
> need gettext binaries";
> or:
> "a package depending on: gettext&&  need_gettext_binaries,  (may) need
> gettext binaries".
>
> I was just enforcing the eventuality that a package may need gettext binaries.
>
> Hope this makes things clearer.

  Indeed.  Sorry I wasn't paying attention :-)

  Although most likely these two packages don't need the gettext binaries on
the target, it's safer to keep the old behaviour.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
