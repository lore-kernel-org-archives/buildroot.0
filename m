From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 22:43:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: remove SysV and
 utmp compatibility feature
In-Reply-To: <20200717234312.17995-1-nolange79@gmail.com>
References: <20200717234312.17995-1-nolange79@gmail.com>
Message-ID: <20200718204319.GP18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-18 01:43 +0200, Norbert Lange spake thusly:
> Systemd enabled compatibility with SysV services and utmp
> by default, none of which is needed for buildroot as the packages
> will install only the files for the chosen init system.

At first, I thought that we may want users to be able to use their dusty
init script, carefully crafted over decades of patient tweaking and
twitching, especially fr out-of-tree packages (br2-extermal).

However, it turns out that this is not possible: systemd requires both
/etc/init.d *and* /etc/rc.d to exist to provide SysV emulation. And as
Thomas said, /etc/rc.d does not exist in Buildroot.

As such, SysV support has never been functional in Buildroot, and we
can't easily make it so.

So, applied to master.

However, this patch again does too many things: disable sysv support and
disable utmp support.

I've split the two in two commits, expanded the two comit logs, and
applied to master. Thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2:
> -   Just disable those options as implied by Thomas Petazzoni
> ---
>  package/systemd/systemd.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9ca9b8ae0a..f1795f476f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -22,6 +22,9 @@ SYSTEMD_PROVIDES = udev
>  
>  SYSTEMD_CONF_OPTS += \
>  	-Drootlibdir='/usr/lib' \
> +	-Dsysvinit-path= \
> +	-Dsysvrcnd-path= \
> +	-Dutmp=false \
>  	-Dblkid=true \
>  	-Dman=false \
>  	-Dima=false \
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
