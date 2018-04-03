From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Apr 2018 14:21:39 +0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <1161707464.1293262.1522727390996.JavaMail.zimbra@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
 <20180402171955.0d091a53@windsurf>
 <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
 <1161707464.1293262.1522727390996.JavaMail.zimbra@datacom.ind.br>
Message-ID: <f2ec92c2-da52-5532-05a9-35e89737427b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-18 05:49, Carlos Santos wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Sent: Monday, April 2, 2018 5:18:58 PM
>> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package
> 
>> On 02-04-18 17:19, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Mon, 27 Nov 2017 08:41:31 -0200, Carlos Santos wrote:
>> [snip]
>>>> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
>>>> new file mode 100644
>>>> index 0000000000..8e64c85188
>>>> --- /dev/null
>>>> +++ b/package/libvirt/Config.in
>>>> @@ -0,0 +1,44 @@
>>>> +config BR2_PACKAGE_LIBVIRT
>>>> +	bool "libvirt"
>>>> +	depends on !BR2_PACKAGE_NETCAT
>>>
>>> Why do we need this if you select nmap-ncat below ?
>>
>> Because libvirt calls the 'nc' executable with the ncat command line arguments,
>> so it needs the nc -> ncat symlink, which is not created when netcat is
>> installed.
>>
>> However, this makes me think: wouldn't it be easier to patch libvirt to call
>> ncat instead of nc?
> 
> No, because it would be necessary to modify virt-manager, which runs
> on a separate machine. It accesses the KVM host (built with Buildroot)
> via ssh, and invokes nc to communicate with libvirtd by means of a
> unix domain socket.
> 
> Notice that virt-manager is smarter than the ordinary bear: it checks
> which syntax the "nc" command on the remote machine recognizes and
> invokes it with the suitable parameters. So forcing it to use ncat
> would prevent it from managing KVM hosts running Debian/Ubuntu.

 OK, but if virt-manager supports both GNU netcat and nmap-ncat, then why does
libvirt depend on nmap-ncat and not netcat? In other words: why not

	select BR2_PACKAGE_NMAP if !BR2_PACKAGE_NETCAT
	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT

(We could even use busybox nc, but it's not very likely that virt-manager is OK
with that, and even so it's impossible to detect in Buildroot if busybox nc is
enabled or not.)

 Regards,
 Arnout

> 
> Notice also that the libvirt package noes not even build/install
> virt-manager, since it is a GUI tool. Such improvement is left
> as an exercise for the reader. :-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
