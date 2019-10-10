From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 09:56:52 +0200
Subject: [Buildroot] [PATCH 4/4] package/selinux-python: always build
 sepolgen
In-Reply-To: <20191010092619.2c0a6f0b@windsurf>
References: <20191009220641.24605-1-arnout@mind.be>
 <20191009220641.24605-4-arnout@mind.be> <20191010092619.2c0a6f0b@windsurf>
Message-ID: <7a945931-ca28-45c1-17ba-6a50f5a192d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/2019 09:26, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 10 Oct 2019 00:06:41 +0200
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
> 
>> The selinux-python package has two suboptions, audit2allow and sepolgen.
>> If neither of them is selected, nothing gets installed, which is not so
>> nice. Since audit2allow selects sepolgen, sepolgen will always be
>> installed if anything is installed. Therefore, it makes no sense to have
>> a separate option for sepolgen.
> 
> That does not take into account the fact that our Buildroot package
> does not install everything that selinux-python provides.

 Yes, I wasn't too sure about this patch. I should have marked it as RFC.

> selinux-python provides:
> 
>  - audit2allow, a bunch of Python tools that use the sepolgen Python
>    module, provided by the same package
> 
>  - chcat, a standalone Python that uses libselinux + semanage (it seems)
> 
>  - semanage, a Python tool that uses sepolicy and provides the seobject
>    module used by chcat
> 
>  - sepolgen, a Python module used by audit2allow
> 
>  - sepolicy, a Python module used by semanage
> 
> As you can see, there's much more than audit2allow and sepolgen in this
> package, even though those additional things are not installed today.

 On the other hand, the way it is now is a bit stupid too...

 If we ever add these other options, we could still revert this patch. But
nobody felt the need to add them in the 5 years that selinux exists in Buildroot...

 Maybe we could make sepolgen default y, and perhaps even hide it (but keep the
option). Then there would be no need to revert it in the future (just add a
prompt again and keep the default y).

 But anyway, I don't care that much :-) I mainly wanted to remove the redundant
depends in the suboptions.

 Regards,
 Arnout


> 
> Therefore, I think it makes sense to keep separate options for the
> different components, especially because it maps with the top-level
> directories of selinux-python:
> 
> $ ls
> audit2allow  chcat  COPYING  Makefile  semanage  sepolgen  sepolicy  VERSION
> 
> Best regards,
> 
> Thomas
> 
