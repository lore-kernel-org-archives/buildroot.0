From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 3 Apr 2018 21:47:54 -0300 (BRT)
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <cf372869-db80-e86c-4127-9d43d4c6dbc5@mind.be>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
 <20180402171955.0d091a53@windsurf>
 <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
 <1161707464.1293262.1522727390996.JavaMail.zimbra@datacom.ind.br>
 <f2ec92c2-da52-5532-05a9-35e89737427b@mind.be>
 <1921303459.1361912.1522761193893.JavaMail.zimbra@datacom.ind.br>
 <cf372869-db80-e86c-4127-9d43d4c6dbc5@mind.be>
Message-ID: <1344854712.1508490.1522802874264.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Tuesday, April 3, 2018 2:16:48 PM
> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package

[trimming the text in order to keep it readable]

> On 03-04-18 15:13, Carlos Santos wrote:
>>> From: "Arnout Vandecappelle" <arnout@mind.be>
>>> To: "Carlos Santos" <casantos@datacom.ind.br>
>>> Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "buildroot"
>>> <buildroot@buildroot.org>
>>> Sent: Tuesday, April 3, 2018 9:21:39 AM
>>> Subject: Re: [Buildroot] [PATCH 3/3] libvirt: new package

>>>> Notice that virt-manager is smarter than the ordinary bear: it checks
>>>> which syntax the "nc" command on the remote machine recognizes and
>>>> invokes it with the suitable parameters. So forcing it to use ncat
>>>> would prevent it from managing KVM hosts running Debian/Ubuntu.
> 
> virt-manager could be patched however to try 'ncat' in addition to (or instead
> of) 'nc'. That would solve the problem with the symlink and you could have
> parallel netcat and nmap-netcat instalations (if you would want that for
> whatever reason...).

We don't have control over virt-manager. It is a Python script
runing on a remote machine which can even run a different OS. It
accesses the KVM host (the machine running our Buildroot-built OS)
using a command line like this one:

   ssh -l johnny -- host.example.com sh -c 'if 'nc' -q 2>&1 | grep "requires an argument" >/dev/null 2>&1; then ARG=-q0;else ARG=;fi;'nc' $ARG -U /var/run/libvirt/libvirt-sock'

Then it communicates with libvirtd through the tunnel composed by
the socket created by ssh and the redirected stdout/stdin created
by nc.

The search for "requires an argument" detects netcat-openbsd
(Debian/Ubuntu).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
