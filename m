From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 24 Jul 2015 11:21:35 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <20150724091742.669aaf4a@free-electrons.com>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
 <20150724091742.669aaf4a@free-electrons.com>
Message-ID: <1437729695.20708.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-07-24 at 09:17 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 23 Jul 2015 08:38:24 +0200, J?rg Krause wrote:
> > Bump version, update hash and update patch.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> This patch series is causing a number of build failures, such as:
> 
>   http://autobuild.buildroot.org/results/33f/33f1849c6d1441d856583587
> 2281e33a980aba6f/build-end.log
> 
> /home/peko/autobuild/instance-2/output/host/usr/bfin-buildroot-linux
> -uclibc/sysroot/usr/lib/libtirpc.so: undefined reference to 
> `_authdes_seccreate'
> 
> Can you have a look?

Sure. The problem is that with version 0.3.0 it was possible to disable
auth DES optionally [1]. This was reverted in version 0.3.2 for
backward compatibility with older glibc's. With commit
060b63865c58c716dc94c5987ab19b90899aa340 authdes_create() is defined by
default in rpc_soc.c, which in return calls the undefined
authdes_seccreate().

My suggestion would be to remove authdes_create() in rpc_soc.c.

Best regards
J?rg Krause


[1] Add configure option to disable DES authentication
http://www.spinics.net/lists/linux-nfs/msg48357.html
