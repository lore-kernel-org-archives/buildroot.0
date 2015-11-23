From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 23 Nov 2015 04:22:41 -0200
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <CABLs7GWjDFQcjaEnXV=Di5UYin4iNcA6DL-sy-t3=wh5Ck5KdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-11-19 21:15 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
>>       x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/3d36403ba80089faea5dd06bc7e4414d593bbfc1/
>
> Classical musl build issue. Interestingly, Alpine Linux has a package
> for conntrack-tools, but they don't seem to do anything special for
> musl. See
> http://git.alpinelinux.org/cgit/aports/tree/main/conntrack-tools.
>

Actually, they do. In APKBUILD, line 32, '-D_GNU_SOURCE' is forced
into CFLAGS to guarantee the GNU version of certain structures (e.g.
struct tcphdr) gets exposed by the musl headers, which works around
the missing '#define _GNU_SOURCE' in 'src/helpers/rpc.c'.

I've sent a patch to fix that in Buildroot, but instead of mimicking
the solution from the Alpine Linux package, I've decided to include a
patch for the conntrack-tools source file 'src/helpers/rpc.c' that
simply adds the necessary definition. That patch has been submitted
upstream as well.

Regards,
Rodrigo
