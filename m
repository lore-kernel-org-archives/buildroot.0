From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 15:12:52 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
Message-ID: <20210528131252.GF2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-05-28 13:51 +0200, Arnout Vandecappelle spake thusly:
> On 28/05/2021 13:39, Yann E. MORIN wrote:
> > On 2021-05-27 22:49 +0200, Arnout Vandecappelle spake thusly:
> >> On 26/05/2021 22:48, Yann E. MORIN wrote:
> >>> On 2021-05-21 09:41 -0500, Matthew Weber via buildroot spake thusly:
> >>>> Upstream bug: (deferred fix)
> >>>> https://trac.nginx.org/nginx/ticket/1897?cversion=0&cnum_hist=2
> >>> So, basically, upstream refused to fix that bug [...]
> > [--SNIP--]
> >>> If so, maybe we could then tweak the unit to make use of it, instead of
> >>> the sleep workaround?
> >>  I think there was one useful comment on the Ubuntu bug [1]:
> >>>>>
> >> As far as I can tell, this daemonization is not needed for the systemd service
> >> use-case. The service should be Type=simple, and 'daemon off'. The standard file
> >> handles get redirected by systemd anyway, and non-stop upgrade cannot be used in
> >> this case either. (See:
> >> http://nginx.org/en/docs/faq/daemon_master_process_off.html )
> >> <<<
> >>  So I rather think we should go for that solution.
> > 
> > Indeed, that seems an even better solution, and probably an actual fix.
> 
>  Unfortunately, not so easy in practice. "daemon off" means a change in the
> configuration file, which is typically going to be modified by the user. Also,
> it's something that comes from nginx itself, so we'd have to patch the one that
> gets installed by nginx (and that one will probably be overwritten anyway in an
> overlay).
> 
>  Also, daemon off should only be done in systemd; sysvinit still wants nginx to
> daemonize! So it's conditional patching, and we don't like that... Well, I guess
> it can be done post-install with a sed script that inserts an aditional line at
> the beginning of the file.

Well, except for the overlay issue, it seems to be pretty easy to do;

    diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
    index e93e802fd3..411d686cdd 100644
    --- a/package/nginx/nginx.mk
    +++ b/package/nginx/nginx.mk
    @@ -314,6 +314,10 @@ endef
     define NGINX_INSTALL_INIT_SYSTEMD
     	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
     		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
    +	mkdir -p $(TARGET_DIR)/etc/systemd/system/nginx.d
    +	$(SED) '1idaemon off;' $(TARGET_DIR)/etc/nginx.conf
    +	printf '[Service]\nType=simple\n' \
    +		>$(TARGET_DIR)/etc/systemd/system/nginx.d/buildroot-no-daemon.conf
     endef
     
     define NGINX_INSTALL_INIT_SYSV

But of course, is a user provides their daemon-using config file, they'd
be out of luck...

In the end, maybe the sleep-based workaround is just good-enough?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
