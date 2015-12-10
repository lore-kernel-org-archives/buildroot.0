From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 21:17:44 +0100
Subject: [Buildroot] Add config to nfsd to set number of threads
In-Reply-To: <5669D3BF.2070207@gmx.de>
References: <5669D3BF.2070207@gmx.de>
Message-ID: <20151210201744.GC3597@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2015-12-10 20:34 +0100, Andreas Ehmanns spake thusly:
> Dear All,
> actually the nfs-utils package provides an NFS server together with an init
> script. The number of threads the NFS server shall use is hard-coded in the
> init script. The attached patch moves this parameter to a config file under
> /etc which is read by the init script.

The idea is OK with me. However, I have a few comments...

> Additionally the return value of the init script in case of an not existing
> file has been changed from 0 to 2 to indicate an error condition.

We don't care about the value of the exit status of a SysV init script.
Whether it returns 0, 1, 2 or whatever else is completely ignored by
/sbin/init .

> From f1eae31bb357587c3491a1b45891dda8c6c0dbff Mon Sep 17 00:00:00 2001
> From: Andreas Ehmanns <universeii@gmx.de>
> Date: Thu, 10 Dec 2015 15:51:23 +0100
> Subject: [PATCH 1/1] Make number of nfsd threads configurable
> 
> Signed-off-by: Andreas Ehmanns <universeii@gmx.de>
> ---
>  package/nfs-utils/S60nfs       | 13 ++++++++-----
>  package/nfs-utils/nfs-utils.mk |  2 ++
>  package/nfs-utils/nfsd.conf    |  8 ++++++++
>  3 files changed, 18 insertions(+), 5 deletions(-)
>  create mode 100644 package/nfs-utils/nfsd.conf
> 
> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
> index ec7c909..ddc472e 100755
> --- a/package/nfs-utils/S60nfs
> +++ b/package/nfs-utils/S60nfs
> @@ -3,10 +3,13 @@
>  # nfs           This shell script takes care of starting and stopping
>  #               the NFS services. Stolen from RedHat FC5.
>  
> -[ -x /usr/sbin/rpc.statd ] || exit 0
> -[ -x /usr/sbin/rpc.nfsd ] || exit 0
> -[ -x /usr/sbin/rpc.mountd ] || exit 0
> -[ -x /usr/sbin/exportfs ] || exit 0
> +[ -x /usr/sbin/rpc.statd ] || exit 2
> +[ -x /usr/sbin/rpc.nfsd ] || exit 2
> +[ -x /usr/sbin/rpc.mountd ] || exit 2
> +[ -x /usr/sbin/exportfs ] || exit 2

Do we really need to check for those files? nfs-utils has no config
option for any of those progs, only for: rpc.lockd and rpc.rquotad, but
we're not using them in this init script.

This means that we can assume that all the utilities above *are*
installed when the init script is.

> +[ -r /etc/nfsd.conf ] || exit 2
> +. /etc/nfsd.conf

Two comments about that:

  - move the file to /etc/default/nfsd
  - do not make it mandatory and just provide defaults
  - use a variable to store the path
  - no need to prefix the variable with 'NFSD'

(yes, that's four comments! ;-) )

So, what about:

    CFG_FILE=/etc/default/nfsd

    NR_THREADS=2
    if [ -f "${CFG_FILE}" ]; then
        . "${CFG_FILE}"
    fi

>  mkdir -p /var/lock/subsys
>  mkdir -p /run/nfs/sm
> @@ -25,7 +28,7 @@ start() {
>  	echo "done"
>  
>  	printf "Starting NFS daemon: "
> -	rpc.nfsd 2
> +	rpc.nfsd $NFSD_NR_OF_THREADS

I have a preference for using ${foo} when expanding variables, so;

    rpc.nfsd ${NR_THREADS}

>  	echo "done"
>  
>  	printf "Starting NFS mountd: "
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 30f12fd..a26c626 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -51,6 +51,8 @@ endif
>  define NFS_UTILS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>  		$(TARGET_DIR)/etc/init.d/S60nfs
> +	$(INSTALL) -m 644 package/nfs-utils/nfsd.conf \
> +		$(TARGET_DIR)/etc/nfsd.conf
>  endef
>  
>  define NFS_UTILS_INSTALL_INIT_SYSTEMD
> diff --git a/package/nfs-utils/nfsd.conf b/package/nfs-utils/nfsd.conf
> new file mode 100644
[--SNIP--]

That file is no longer needed now that there is a default in the script.
Just let the user provide one via a rootfs overlay or a post-install
script.

Care to resubmit a proper patch with the above fixed, please? Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
