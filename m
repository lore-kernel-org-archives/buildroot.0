From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 14:57:55 -0300
Subject: [Buildroot] [PATCH] package/eudev: tweak initscript
In-Reply-To: <20141020175408.GJ3742@free.fr>
References: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020175408.GJ3742@free.fr>
Message-ID: <54454D23.3060608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 02:54 PM, Yann E. MORIN wrote:

> Hmmm... This exit won't do much: it exits a sub-shell, so the initscript
> will still continue...

I've focused on fixing the one problem, i didn't audit the whole script.

>> -        udevadm trigger --action=add
>> -        udevadm settle
>> +        udevadm trigger --type=subsystems --action=add
>> +        udevadm trigger --type=devices --action=add
>> +        udevadm settle --timeout=10
> 
> Why did you add a timeout, and not explain it?
> 
> Also, are 10 seconds really enough? What happens if a device takes
> longer than 10s to initialise (and it is needed to boot, like a slow
> USB mass-storage) ?

It just seems prudent to avoid a stall, but yeah forgot to mention it,
it's the usual practice in many distros.
You've got rootwait & friends for that, remember this is post mount-root
so it doesn't matter there. And if you're doing initramfs then
switching/pivoting to some other root, well, you're scripting it, you
should take care of it there since you're doing the mount.
Regards.
