From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jul 2015 16:49:27 +0200
Subject: [Buildroot] [PATCH] package/eudev: add libselinux dependency
In-Reply-To: <20150730154833.416d5073@free-electrons.com>
References: <1438262864-6073-1-git-send-email-romain.naour@openwide.fr>
 <20150730154833.416d5073@free-electrons.com>
Message-ID: <55BA3977.80905@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 30/07/2015 15:48, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Thu, 30 Jul 2015 15:27:44 +0200, Romain Naour wrote:
>> Disable libselinux support with musl toolchains which doesn't have
>> struct mallinfo.
>>
>> selinux-util.c: In function ?mac_selinux_init?:
>> selinux-util.c:70:25: error: storage size of ?before_mallinfo? isn?t known
>>          struct mallinfo before_mallinfo, after_mallinfo;
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Thanks for the patch, however I am not sure this is really the right
> fix. mallinfo() is only used to display some statistics about the heap
> consumption of the SELinux database, so it could be disabled.
> 
> So the right fix would be to add a configure.ac check for mallinfo(),
> and if available, use it, and if not, remove this useless debug message.
> 
> Like in configure.ac:
> 
> AC_CHECK_FUNCS([mallinfo])
> 
> and then use #ifdef HAVE_MALLINFO in the code.

Ok, I'll try that.
It's true that my patch is a bit rude... ;-)

> 
> Now the question is whether something like that would be accepted
> upstream. If eudev accepts its own patches that are not in systemd,
> then I'd say yes. If however they are really only a copy of the udev
> sources from systemd, we would have to get this upstream in systemd,
> which has no chance to happen.

I don't know, I'm adding Anthony G. Basile in Cc.
Anthony, what do you think about Thomas's proposal ?

Best regards,
Romain

> 
> Thomas
> 
