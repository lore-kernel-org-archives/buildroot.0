From: Sean Perry <shaleh@speakeasy.net>
Date: Thu, 07 Aug 2008 19:04:44 -0700
Subject: [Buildroot] efficient usb plug in notification
In-Reply-To: <2590773a0808062026p25ed61c7v23377da3849ad661@mail.gmail.com>
References: <64180.1218043142@speakeasy.net>
	<2590773a0808062026p25ed61c7v23377da3849ad661@mail.gmail.com>
Message-ID: <489BA9BC.7080300@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher Taylor wrote:
>> You can replace /sbin/hotplug with a shell script/program of your choice.
>> This gets called by the kernel for every plug event. Just have your version
>> of hotplug react to the plug events you care about. Then you "just" need to
>> figure out how to interact between the hotplug script and your user space
>> libraries, programs, etc.
>>
> 
> Given the power concerns that we have, this may be the best idea.
> I'll have to look into what's passed to the hotplug script/program and
> see if we can get all the information from that.  Thanx so much for
> this tip!
> 
> I'm moderately familiar with udev/dbus/hal but I have some
> reservations about using them due to the extra cycles taken up.
> 
> This hotplyg approach seems promising for power conscious platforms
> assuming it provides enough information.   A named pipe to our
> application should solve this problem.
> 

Everything comes in via the environment, so look there. Should have 
everything you need.

mdev just adds a /dev/$node and then calls a script with 
$MDEV=/dev/$node. Definitely not enough info and it depends on the 
device actually have an entry in /dev -- the usb devices I use do not.

I had our custom hotplug script call mdev when it is done so all of the 
device nodes get created correctly.
