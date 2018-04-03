From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Apr 2018 19:16:48 +0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <1921303459.1361912.1522761193893.JavaMail.zimbra@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
 <20180402171955.0d091a53@windsurf>
 <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
 <1161707464.1293262.1522727390996.JavaMail.zimbra@datacom.ind.br>
 <f2ec92c2-da52-5532-05a9-35e89737427b@mind.be>
 <1921303459.1361912.1522761193893.JavaMail.zimbra@datacom.ind.br>
Message-ID: <cf372869-db80-e86c-4127-9d43d4c6dbc5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-18 15:13, Carlos Santos wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "buildroot" <buildroot@buildroot.org>
>> Sent: Tuesday, April 3, 2018 9:21:39 AM
>> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package
> 
>> On 03-04-18 05:49, Carlos Santos wrote:
>>>> From: "Arnout Vandecappelle" <arnout@mind.be>
>>>> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Carlos Santos"
>>>> <casantos@datacom.ind.br>
>>>> Cc: "buildroot" <buildroot@buildroot.org>
>>>> Sent: Monday, April 2, 2018 5:18:58 PM
>>>> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package
>>>
>>>> On 02-04-18 17:19, Thomas Petazzoni wrote:
>>>>> Hello,
>>>>>
>>>>> On Mon, 27 Nov 2017 08:41:31 -0200, Carlos Santos wrote:
>>>> [snip]
>>>>>> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
>>>>>> new file mode 100644
>>>>>> index 0000000000..8e64c85188
>>>>>> --- /dev/null
>>>>>> +++ b/package/libvirt/Config.in
>>>>>> @@ -0,0 +1,44 @@
>>>>>> +config BR2_PACKAGE_LIBVIRT
>>>>>> +	bool "libvirt"
>>>>>> +	depends on !BR2_PACKAGE_NETCAT
>>>>>
>>>>> Why do we need this if you select nmap-ncat below ?
>>>>
>>>> Because libvirt calls the 'nc' executable with the ncat command line arguments,
>>>> so it needs the nc -> ncat symlink, which is not created when netcat is
>>>> installed.
>>>>
>>>> However, this makes me think: wouldn't it be easier to patch libvirt to call
>>>> ncat instead of nc?
>>>
>>> No, because it would be necessary to modify virt-manager, which runs
>>> on a separate machine. It accesses the KVM host (built with Buildroot)
>>> via ssh, and invokes nc to communicate with libvirtd by means of a
>>> unix domain socket.
>>>
>>> Notice that virt-manager is smarter than the ordinary bear: it checks
>>> which syntax the "nc" command on the remote machine recognizes and
>>> invokes it with the suitable parameters. So forcing it to use ncat
>>> would prevent it from managing KVM hosts running Debian/Ubuntu.

 virt-manager could be patched however to try 'ncat' in addition to (or instead
of) 'nc'. That would solve the problem with the symlink and you could have
parallel netcat and nmap-netcat instalations (if you would want that for
whatever reason...).

>>
>> OK, but if virt-manager supports both GNU netcat and nmap-ncat, then why does
>> libvirt depend on nmap-ncat and not netcat? In other words: why not
>>
>> 	select BR2_PACKAGE_NMAP if !BR2_PACKAGE_NETCAT
>> 	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT
>>
>> (We could even use busybox nc, but it's not very likely that virt-manager is OK
>> with that, and even so it's impossible to detect in Buildroot if busybox nc is
>> enabled or not.)
> 
> The "nc" commands provided by netcat and busybox are not sufficient
> because they don't support unix domain sockets.

 OK. It's a bit hard to follow with all these different netcat versions :-) So
which is the other netcat supported by virt-manager? Is there a fifth one?

 Anyway, if nmap-netcat is the only supported one, then this really is the right
thing to do. It would be good to add a comment above the "depends on
!BR2_PACKAGE_NETCAT" to explain that though.


> Moreover, these configuration tricks make the Config.in file harder
> to read and understand. I still believe that my original approach[1]
> was better. It would allow us to add some "BR2_HAS_MODERN_NC" config,
> selected by netcat-openbsd and ncat, and make libvirt depend on it.

 So you think it's an improvement that if you want libvirt, you first have to go
and select nmap-ncat? I find the current structure much more user friendly.
Perhaps it could use an additional

comment "libvirt is incompatible with netcat"
	depends on all the libvirt dependencies
	depends on BR2_PACKAGE_NETCAT


 Regards,
 Arnout

> 
> 1. https://patchwork.ozlabs.org/patch/820503/
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
