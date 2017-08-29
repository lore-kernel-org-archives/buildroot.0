From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Aug 2017 23:24:19 +0200
Subject: [Buildroot] [PATCH 2/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <trinity-8f575ef2-2fac-4332-b16e-a4c7bd66652a-1504006025728@3c-app-gmx-bs19>
References: <trinity-8f575ef2-2fac-4332-b16e-a4c7bd66652a-1504006025728@3c-app-gmx-bs19>
Message-ID: <20170829212419.GC3338@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2017-08-29 13:27 +0200, Jan Schmidt spake thusly:
> I was looking for a way to customize the root file system in the
> way, that all except /var is read only. And /var is at a separate
> partition which will be enlarged at the first start to the
> maximum size of the storage media. (I'm using RPi 3)
> 
> I'm using BR 2017.02.1. The above patch seems not to be included
> yet. And I didn't fount any discussion about accepting the patch.
> Is there a other way to solve my issue?

At first, I was very puzzled about what patch this was refering to. ANd
it truns out it was something I wrote almost 4 years ago... Damn, time
flies...

Anyway, back on topic: no, that was not accepted at all, see the
discussion in the thread:
    https://patchwork.ozlabs.org/patch/306631/

So, the best option for you is that you do something like:

  - only generate a tarball out of Buildroot,
  - provide a post-image script that:
    - extract the tarball into ${TMP_ROOT_DIR}
    - generate an ext2 (or other writable FS) out of ${TMP_ROOT_DIR}/var
    - remove ${TMP_ROOT_DIR}/var/*
    - tweak ${TMP_ROOT_DIR}/etc/fstab to add the mountpoint for /var
    - create the readonly root fs with out of ${TMP_ROOT_DIR}/

Note that the post-image script should run under fakeroot, and Buildroot
does not guarantee that, so your script would probalby need to start
with something like:

    if [ $(id -u) -ne 0 ]; then
        fakeroot "${0}" "${@}"
        exit ${?}
    fi

which would ensure that the script runs under fakeroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
