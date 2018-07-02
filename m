From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 18:17:44 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <5b39a10cb58a5_77672afb147106f8137e1@ultri5.mail>
References: <6113136f-de40-361e-659e-b49dc35db530@konsulko.com>
 <5b39a10cb58a5_77672afb147106f8137e1@ultri5.mail>
Message-ID: <20180702161744.GA2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-07-02 00:50 -0300, Ricardo Martincoski spake thusly:
> On Sun, Jul 01, 2018 at 06:28 AM, Leon Anavi wrote:
> > On 1.07.2018 12:22, Yann E. MORIN wrote:
> >> On 2018-06-30 21:11 +0200, Yann E. MORIN spake thusly:
> >>> On 2018-06-30 21:03 +0300, Leon Anavi spake thusly:
> >> [--SNIP--]
> >>>> Thank you for the feedback. I have experienced this issue while building
> >>>> branch master on Ubuntu 16.04. As discussed in the IRC channel on Friday
> >>>> the same issue has been reproduced in the CI, Job #78257653 triggered by
> >>>> Thomas Petazzoni: https://gitlab.com/buildroot.org/buildroot/-/jobs/78257653
> >> Could you please provide a bit more details on your buildsystem: what is
> >> the filesystem you use to build?
> > 
> > The filesystem of my build machine is ext4. More details about the
> > Ubuntu version:
> > 
> > Distributor ID:??? Ubuntu
> > Description:??? Ubuntu 16.04.4 LTS
> > Release:??? 16.04
> > Codename:??? xenial
> 
> I reproduced the error here:
> system: Ubuntu 18.04 LTS
> filesystem: ext4
> commit: 78af2a6362 (the same from the CI build mentioned above)
> wrapped error message:
> Copying files into the device: __populate_fs: Could not allocate block in ext2
> filesystem while writing file "busybox"

I also was ultimately able toreproduce on my machine.

What pwuzzles me is that a did a build that was successful. Then I
cleaned and did a rebuilt form scratch and it failed. And the failing
file is never the same, which leads me to think it depends a lot of the
order of files as returned by readdir()...

And in any way, the size is already approaching the limit, so it does
make sense to increase it.

> From the CI url mentioned above it seems the same occurs also in the GitLab
> runners, so I started a few builds. Note: please trust the log and ignore the
> job status, all jobs failed when uploading artifacts, probably my mistake in the
> hacked .gitlab-ci.yml.
> 
> 2018.05                 [1] ok
> 2018.05                 [2] ok
> 2018.05-140-g8b0fd3cb49 [3] fail
> 2018.05-240-g43ebb35e9b [4] fail
> 2018.05-340-g9f26e91cc5 [5] fail
> 2018.05-440-gc0d19a2083 [6] fail
> 2018.05-505-g78af2a6362 [7] fail
> 2018.05-559-g855295b658 [8] fail
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/71910855
> [2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670469
> [3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670740
> [4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671047
> [5] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671078
> [6] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671235
> [7] https://gitlab.com/buildroot.org/buildroot/-/jobs/78257653
> [8] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670542

OK, so what is weird is that we all noticed different failing files or
directories (busybox for Ricardo, shm for me, others for Leon), while
the Gitlab-CI runners all failed on nfs_check, whether on Ricardo's or
the main Buildroot jobs...

Anyway, as I said; let's increase the size.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
