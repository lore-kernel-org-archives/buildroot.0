From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 16:46:04 +0100
Subject: [Buildroot] [PATCH v2 04/17] uclibc: add patches to simplify
 Thumb handling
In-Reply-To: <1458335299-27409-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56ED743C.9070500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 22:08, Thomas Petazzoni wrote:
> This commit adds a number of patches to uClibc that radically
> simplifies the Thumb handling. uClibc currently has three options that
> you need to toggle on Thumb configurations depending on the specific
> ARM CPU being targeted.
>
> However, it turns out that none of those options are necessary:
>
>   - USE_BX can simply be guessed by looking at the ARM core being
>     used. The bx instruction is available for all ARM cores >=
>     ARMv4T. This is exactly what glibc is doing.
>
>   - USE_LDREXSTREX can also be guessed by looking at the ARM core being
>     used: whenever you have Thumb2, ldrex/strex is available.
>
>   - COMPILE_IN_THUMB becomes useless, since all it does is passing
>     -mthumb. But just like the uClibc config options to set
>     --march=<foo> have been removed a long time ago, there's no need to
>     -have an option to pass -mthumb.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Upstream status? Knowing Waldemar's lightning reflexes, we will probably just 
bump the uClibc version rather than having these patches in Buildroot :-)

  Regards,
  Arnout

> ---
>   .../0001-arm-remove-use-of-USE_BX-option.patch     | 53 ++++++++++++++++++++++
>   package/uclibc/0002-arm-remove-USE_BX-option.patch | 40 ++++++++++++++++
>   .../0003-arm-remove-use-of-USE_LDREXSTREX.patch    | 49 ++++++++++++++++++++
>   .../uclibc/0004-arm-remove-USE_LDREXSTREX.patch    | 34 ++++++++++++++
>   .../uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch  | 43 ++++++++++++++++++
>   5 files changed, 219 insertions(+)
>   create mode 100644 package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
>   create mode 100644 package/uclibc/0002-arm-remove-USE_BX-option.patch
>   create mode 100644 package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
>   create mode 100644 package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
>   create mode 100644 package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
