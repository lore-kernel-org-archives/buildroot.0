From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Jun 2018 10:45:49 +0300
Subject: [Buildroot] Docker missing statistics
In-Reply-To: <CAM27=5itBcZ_H=CEzVUA2Ow8sfOztB76ekEeWZfMEn2y9MjYpA@mail.gmail.com>
References: <CAM27=5itBcZ_H=CEzVUA2Ow8sfOztB76ekEeWZfMEn2y9MjYpA@mail.gmail.com>
Message-ID: <20180628074549.k6juats7vknrs577@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Roy,

On Thu, Jun 28, 2018 at 10:19:11AM +0300, Roy Arav wrote:
> I am running buildroot on raspberry Pi3 and I fail to see docker statistics.
> I can see CPU statistics but not memory nor network statistics.
> 
> Notes:
> 1. When running docker info I see the following warnings
> WARNING: No memory limit support
> WARNING: No swap limit support
> WARNING: No kernel memory limit support
> WARNING: No oom kill disable support

You need to enable memory control group (MEMCG) related kernel configuration 
options, and probably a few others. See 
https://github.com/moby/moby/issues/4250 . Note that CONFIG_MEMCG_KMEM is only 
for kernels older than 4.6. Newer kernels provide other config symbols for the 
same functionality.

This is not directly related to Buildroot though.

baruch

> 2.  I ran the following check script
> https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh
> and the result is that there are 2 kernel flags missing
> CONFIG_CGROUP_HUGETLB=y
> CONFIG_AUFS_FS=y
> 
> 3. I tried adding them and two more flags that I thought they might depend
> on:
> CONFIG_HUGETLBFS=y
> CONFIG_HUGETLB_PAGE=y
> 
> But from some reason they are not shown during runtime.
> 
> Any ideas?
> Thanks
> Roy

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
