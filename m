From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Apr 2017 21:35:18 +0200
Subject: [Buildroot] [PATCH 2/3] package/xenomai: build obstack support
 conditionally
In-Reply-To: <20170415174201.30459-2-romain.naour@gmail.com>
References: <20170415174201.30459-1-romain.naour@gmail.com>
 <20170415174201.30459-2-romain.naour@gmail.com>
Message-ID: <dad28562-4ff2-59b6-63c2-1cc308e632a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-04-17 19:42, Romain Naour wrote:
> The configure script check whether the underlying libc provides for
> native obstack support, only building Xenomai replacement code if not.
> This as been tested against uClibc 1.0.22, and common glibc releases.
> 
> Backport the patch provided by uptream.
> 
> Add XENOMAI_AUTORECONF=YES since the patch modify configure.ac.
> 
> [1] http://xenomai.org/pipermail/xenomai/2017-April/037272.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...plate-build-obstack-support-conditionally.patch | 280 +++++++++++++++++++++
>  package/xenomai/xenomai.mk                         |   3 +
>  2 files changed, 283 insertions(+)
>  create mode 100644 package/xenomai/0002-boilerplate-build-obstack-support-conditionally.patch
> 
> diff --git a/package/xenomai/0002-boilerplate-build-obstack-support-conditionally.patch b/package/xenomai/0002-boilerplate-build-obstack-support-conditionally.patch
> new file mode 100644
> index 0000000..bca568e
> --- /dev/null
> +++ b/package/xenomai/0002-boilerplate-build-obstack-support-conditionally.patch
> @@ -0,0 +1,280 @@
> +From 4c593544d2ff39ba6631cc3fa0b91493973674d4 Mon Sep 17 00:00:00 2001
> +From: Philippe Gerum <rpm@xenomai.org>
> +Date: Fri, 14 Apr 2017 18:28:36 +0200
> +Subject: [PATCH] boilerplate: build obstack support conditionally
> +
> +If the underlying *libc does not support obstacks, build a private
> +implementation, otherwise fully rely on the native support.
> +
> +This fixes a long-standing issue building replacement code for the
> +native obstack support, which ended up breaking builds over uClibc
> +1.0.21 and later.  See https://patchwork.ozlabs.org/patch/745792/.

 You forgot to add you Sob.

 Regards,
 Arnout

> +---
> + configure.ac                  |   4 ++
> + include/boilerplate/obstack.h |  12 +++--
> + lib/boilerplate/Makefile.am   |   5 +-
> + lib/boilerplate/obstack.c     | 111 +++++++-----------------------------------
> + 4 files changed, 34 insertions(+), 98 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
