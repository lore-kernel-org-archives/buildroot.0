From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:11:51 +0100
Subject: [Buildroot] libdrm: buildroot patchstack - static linking
In-Reply-To: <20191205215234.7058f6df@gmx.net>
References: <20191205215234.7058f6df@gmx.net>
Message-ID: <20191205221151.214db463@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 5 Dec 2019 21:54:53 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> some progress on up-streaming the buildroot libdrm patch stack:
> 
>  - 0001-Add-ARM-support-into-xf86drm.h.patch
>    https://gitlab.freedesktop.org/mesa/drm/merge_requests/31
>    Acked, but with one further question 'why not catch-all __ARM_ARCH?'
>    Thomas - you touched the patch and added the comment, any further input?

Well, my comment explains it all: ldrex/strex only exist on ARM >= v6,
but __ARM_ARCH is true for all ARM ISAs, including ARMv4 and ARMv5,
which Buildroot supports, but don't provide ldrex/strex.

>  - 0004-meson.build-enable-static-build.patch
>    declined https://gitlab.freedesktop.org/mesa/drm/merge_requests/28
>    'Closing the MR, but feel free to reopen if it turns out someone has
>    a real need for this'
> 
>    Anyone out there using libdrm static linking?

But what is the cost for upstream to use the correct library() Meson
macro/function instead of shared_library() ? It is shorter, and does
the job. I'm not sure why upstream is reluctant to merge this.

>  - 0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>    folded into previous one https://gitlab.freedesktop.org/mesa/drm/merge_requests/27
>    and declined

So, they basically say they don't want to support static linking at all?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
