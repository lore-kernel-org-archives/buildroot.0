From: Esben Haabendal <esben@geanix.com>
Date: Mon, 23 Sep 2019 10:10:52 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <b40aa877-9deb-7052-0e26-0970708f9fd9@mind.be> (Arnout
 Vandecappelle's message of "Mon, 23 Sep 2019 09:49:26 +0200")
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
 <87y2ygw5ql.fsf@dell.be.48ers.dk> <87pnjr5ue3.fsf@geanix.com>
 <b40aa877-9deb-7052-0e26-0970708f9fd9@mind.be>
Message-ID: <87lfuf5t6b.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> writes:

> On 23/09/2019 09:44, Esben Haabendal wrote:
>> Peter Korsgaard <peter@korsgaard.com> writes:
>> 
>>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>>
>>> Hi,
>>>
>>>  >  Does this also work if the tarball is cross-compiled for a different
>>>  > architecture? Probably it does, and it just SIGILLs when you try to run the
>>>  > container...
>>>
>>> Yes. Even easier is just
>>>
>>> docker import output/images/rootfs.tar <myproject:mytag>
>>>
>>>  >  Yeah, except unfortunately docker security sucks, so on most distros you need
>>>  > sudo to run any docker command, even 'docker build'.
>>>
>>>  >  So, it would be nice if we could generate the OCI image without docker.
>>>
>>> I believe you can do similar with E.G. buildah:
>>>
>>> https://github.com/containers/buildah
>>>
>>> But you anyway need buildah/docker/.. to then finally do something with
>>> the docker image afterwards, so perhaps just documenting the 'docker
>>> import' oneliner is enough and not try to do it Buildroot.
>> 
>> Sorry for the duplicate comment about buildah.
>> 
>> To do something with an OCI image build with buildah, you should
>> consider using podman (https://github.com/containers/libpod), as it also
>> can be used without root priveleges, so should be feasible on shared
>> servers.
>
>  I may be wrong, but as I understand it, all these tools actually call docker
> under the hood.

You are wrong.  Buildah and Podman does not call docker in any way.

> They can be used without root privileges because they are
> installed with all the necessary suid bits and caps and stuff.

No suid bit.

> However, AFAIU, you can't build and install them as non-root and then
> create an image with it.

System must be configured to allow normal users to run unprivileged
containers (sysctl kernel.unprivileged_userns_clone=1).  Setting this
naturally requires privileges.

>  umoci was the only tool I found that seemed to *really* not require
>  root.

I suspect that there might some restrictions on what is possible when
using umoci as an unprivileged user (see
https://umo.ci/quick-start/rootless/).

/Esben
