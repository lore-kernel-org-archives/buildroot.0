From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 13:51:26 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <20210528113959.GB2788252@scaer>
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
Message-ID: <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 13:39, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-05-27 22:49 +0200, Arnout Vandecappelle spake thusly:
>> On 26/05/2021 22:48, Yann E. MORIN wrote:
>>> On 2021-05-21 09:41 -0500, Matthew Weber via buildroot spake thusly:
>>>> Upstream bug: (deferred fix)
>>>> https://trac.nginx.org/nginx/ticket/1897?cversion=0&cnum_hist=2
>>> So, basically, upstream refused to fix that bug [...]
> [--SNIP--]
>>> If so, maybe we could then tweak the unit to make use of it, instead of
>>> the sleep workaround?
>>  I think there was one useful comment on the Ubuntu bug [1]:
>>>>>
>> As far as I can tell, this daemonization is not needed for the systemd service
>> use-case. The service should be Type=simple, and 'daemon off'. The standard file
>> handles get redirected by systemd anyway, and non-stop upgrade cannot be used in
>> this case either. (See:
>> http://nginx.org/en/docs/faq/daemon_master_process_off.html )
>> <<<
>>  So I rather think we should go for that solution.
> 
> Indeed, that seems an even better solution, and probably an actual fix.

 Unfortunately, not so easy in practice. "daemon off" means a change in the
configuration file, which is typically going to be modified by the user. Also,
it's something that comes from nginx itself, so we'd have to patch the one that
gets installed by nginx (and that one will probably be overwritten anyway in an
overlay).

 Also, daemon off should only be done in systemd; sysvinit still wants nginx to
daemonize! So it's conditional patching, and we don't like that... Well, I guess
it can be done post-install with a sed script that inserts an aditional line at
the beginning of the file.


 Regards,
 Arnout
