From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 08:18:43 +0200
Subject: [Buildroot] [PATCH 12/12] toolchain: improve mudflap support
In-Reply-To: <1377671731-28656-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377671731-28656-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <521EE7C3.3050003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/13 08:35, Thomas Petazzoni wrote:
> The mudflap library is only useful if one uses the -fmudflap gcc
> option, to do more checks on pointers/arrays, which is typically not
> the case.
>
> This commit:
>
>   * Adds an option to enable/disable mudflap support at the gcc
>     level. By default, it is disabled, which saves a little bit of
>     build time.
>
>   * Adds a way for the external toolchain backend to tell whether
>     mudflap is supported or not by the external toolchain.
>
>   * Adds a global BR2_TOOLCHAIN_HAS_MUDFLAP hidden option, that
>     indicates whether the toolchain (internal or external) supports
>     mudflap.
>
>   * Adds a global BR2_ENABLE_MUDFLAP in "Build options" that allows the
>     user to build all packages with mudflap support. It depends on
>     BR2_TOOLCHAIN_HAS_MUDFLAP.
>
> WARNING WARNING: this currently doesn't result into a working system,
> even with just Busybox. Busybox init crashes with "/sbin/init: symbol
> lookup error: /lib/libmudflapth.so.0: undefined symbol:
> main". According to
> http://gcc.gnu.org/ml/gcc-help/2008-03/msg00165.html  it is caused by
> -Wl,--gc-sections (which is used by Busybox), but even after removing
> it, it still doesn't work. I don't personaly have much interest in
> mudflap support, so as I couldn't get it to work easily, my suggestion
> would be to drop support for it entirely, unless someone steps up to
> fix this issue.

  I would drop the option to enable -fmudflap globally, but keep the 
option to build mudflap support in the internal toolchain. As you wrote 
in another mail, mudflap is a debugging tool and not really a hardening 
tool like SSP.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
