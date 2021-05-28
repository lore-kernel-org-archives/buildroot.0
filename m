From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 15:24:03 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <20210528131252.GF2788252@scaer>
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
 <20210528131252.GF2788252@scaer>
Message-ID: <3879e8a9-c21d-6381-2348-ae1d291ba63c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 15:12, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-05-28 13:51 +0200, Arnout Vandecappelle spake thusly:
>> On 28/05/2021 13:39, Yann E. MORIN wrote:
>>> On 2021-05-27 22:49 +0200, Arnout Vandecappelle spake thusly:
>>>> On 26/05/2021 22:48, Yann E. MORIN wrote:
>>>>> On 2021-05-21 09:41 -0500, Matthew Weber via buildroot spake thusly:
>>>>>> Upstream bug: (deferred fix)
>>>>>> https://trac.nginx.org/nginx/ticket/1897?cversion=0&cnum_hist=2
>>>>> So, basically, upstream refused to fix that bug [...]
>>> [--SNIP--]
>>>>> If so, maybe we could then tweak the unit to make use of it, instead of
>>>>> the sleep workaround?
>>>>  I think there was one useful comment on the Ubuntu bug [1]:
>>>>>>>
>>>> As far as I can tell, this daemonization is not needed for the systemd service
>>>> use-case. The service should be Type=simple, and 'daemon off'. The standard file
>>>> handles get redirected by systemd anyway, and non-stop upgrade cannot be used in
>>>> this case either. (See:
>>>> http://nginx.org/en/docs/faq/daemon_master_process_off.html )
>>>> <<<
>>>>  So I rather think we should go for that solution.
>>>
>>> Indeed, that seems an even better solution, and probably an actual fix.
>>
>>  Unfortunately, not so easy in practice. "daemon off" means a change in the
>> configuration file, which is typically going to be modified by the user. Also,
>> it's something that comes from nginx itself, so we'd have to patch the one that
>> gets installed by nginx (and that one will probably be overwritten anyway in an
>> overlay).
>>
>>  Also, daemon off should only be done in systemd; sysvinit still wants nginx to
>> daemonize! So it's conditional patching, and we don't like that... Well, I guess
>> it can be done post-install with a sed script that inserts an aditional line at
>> the beginning of the file.
> 
> Well, except for the overlay issue, it seems to be pretty easy to do;

 I only arrived at the sed idea when I had already written all the rest and
didn't bother to remove my previous thinking.

> 
>     diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
>     index e93e802fd3..411d686cdd 100644
>     --- a/package/nginx/nginx.mk
>     +++ b/package/nginx/nginx.mk
>     @@ -314,6 +314,10 @@ endef
>      define NGINX_INSTALL_INIT_SYSTEMD
>      	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
>      		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
>     +	mkdir -p $(TARGET_DIR)/etc/systemd/system/nginx.d
>     +	$(SED) '1idaemon off;' $(TARGET_DIR)/etc/nginx.conf
>     +	printf '[Service]\nType=simple\n' \
>     +		>$(TARGET_DIR)/etc/systemd/system/nginx.d/buildroot-no-daemon.conf

 The service file is ours, so we can simply edit it directly.

>      endef
>      
>      define NGINX_INSTALL_INIT_SYSV
> 
> But of course, is a user provides their daemon-using config file, they'd
> be out of luck...
> 
> In the end, maybe the sleep-based workaround is just good-enough?

 I think if the daemon off works, it's a better solution.

 For the user-provided config file: we can make it explicit in the release
notes. The effect will be that systemd detects that nginx isn't forking and
kills it off after a few seconds, so the user will notice pretty quickly.


 I'm thinking (adding Peter in Cc) that we should maybe do better on the release
notes. Yocto (ever our example) puts a (now very long) "Migrating to a Newer
Yocto Project Release" [1] directly in their documentation with a description of
every release. We do have an upgrading section, but maybe we should put any
caveats directly in there instead of trying to compile them at release time in
the CHANGES file.

 Regards,
 Arnout

[1] https://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#migration
