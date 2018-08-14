From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 22:47:17 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <20180726171524.479-1-m.niestroj@grinn-global.com>
References: <20180726171524.479-1-m.niestroj@grinn-global.com>
Message-ID: <20180814224717.02d57e06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

Once again, thanks for this work!

On Thu, 26 Jul 2018 19:15:23 +0200, Marcin Niestroj wrote:
> When using uclibc libdevmapper.so was calling dm_task_get_info_base()
> function recursively, leading to segmentation fault. This was
> happening because uclibc linker loader just takes first existing
> 'dm_task_get_info' (which is 'dm_task_get_info_base') symbol in elf
> binary, instead of default version.
> 
> Add upstreamable lvm2 patch [1], which introduces
> --enable-symvers[=STYLE] switch. Use that switch to disable symbol
> versions, as we do not plan to support binaries compiled against
> old libdevmapper library.
> 
> [1] https://www.redhat.com/archives/dm-devel/2018-July/msg00187.html
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v2 -> v3: none

I have added a reference to the Buildroot bug report being fixed by
this, and I've applied to master.

Two questions:

 (1) Could you try to push this forward in terms of upstreaming
     acceptance ? I know you have submitted the patch, but I looked
     today and apparently you haven't received any feedback.

 (2) It would be nicer if the availability of symbol versioning could
     be auto-detected. Is there a compile-time test that can be done to
     verify if symbol versioning is available ? This would perhaps help
     make the patch even more acceptable upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
