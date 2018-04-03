From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 3 Apr 2018 00:49:51 -0300 (BRT)
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
 <20180402171955.0d091a53@windsurf>
 <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
Message-ID: <1161707464.1293262.1522727390996.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Monday, April 2, 2018 5:18:58 PM
> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package

> On 02-04-18 17:19, Thomas Petazzoni wrote:
>> Hello,
>> 
>> On Mon, 27 Nov 2017 08:41:31 -0200, Carlos Santos wrote:
> [snip]
>>> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
>>> new file mode 100644
>>> index 0000000000..8e64c85188
>>> --- /dev/null
>>> +++ b/package/libvirt/Config.in
>>> @@ -0,0 +1,44 @@
>>> +config BR2_PACKAGE_LIBVIRT
>>> +	bool "libvirt"
>>> +	depends on !BR2_PACKAGE_NETCAT
>> 
>> Why do we need this if you select nmap-ncat below ?
> 
> Because libvirt calls the 'nc' executable with the ncat command line arguments,
> so it needs the nc -> ncat symlink, which is not created when netcat is
> installed.
> 
> However, this makes me think: wouldn't it be easier to patch libvirt to call
> ncat instead of nc?

No, because it would be necessary to modify virt-manager, which runs
on a separate machine. It accesses the KVM host (built with Buildroot)
via ssh, and invokes nc to communicate with libvirtd by means of a
unix domain socket.

Notice that virt-manager is smarter than the ordinary bear: it checks
which syntax the "nc" command on the remote machine recognizes and
invokes it with the suitable parameters. So forcing it to use ncat
would prevent it from managing KVM hosts running Debian/Ubuntu.

Notice also that the libvirt package noes not even build/install
virt-manager, since it is a GUI tool. Such improvement is left
as an exercise for the reader. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
