From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Sep 2019 18:46:28 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <CAFvCimUFmzHwau7FSp99ki1UOMS+g+c_v8cmgqR+nQAw54MN8w@mail.gmail.com>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
 <CAFvCimUFmzHwau7FSp99ki1UOMS+g+c_v8cmgqR+nQAw54MN8w@mail.gmail.com>
Message-ID: <7cad605e-a88e-7ab9-d77b-c4520faa4a99@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 17:47, J?r?my ROSEN wrote:
> Hey all, I'm glad you liked my talk :)
> 
> Here are a couple of other notes that might be of more interest to the
> buildroot community in general...
> * There Is no tool I could find from the container world that actually
> build an image from scratch, they all are based on debian/redhat, this is
> not good and they don't really have an answer
>   As a side-note, be carefull when you talk about building images with
> container people. It usually means the step of transforming files into a
> filesystem/disk image, not the compilation phase.
> * There was a talk about "rootless containers" i.e containers that are able
> to build other container images without being root, using a suid binary or
> talking to a root-owned daemon. Apparently nobody
>   had heard of fakeroot and they didn't know it was actually possible to
> build an image without loopback-mounting images. (
> https://www.youtube.com/watch?v=e_daVOwB7ok)

 Your talk was a lot more interesting :-)

 But the one thing I took away from it is the pointer to umoci [1]. That tool
seems to be capable of creating an OCI image without running docker. E.g. 'umoci
add-layer' seems to add a tarball as a layer to an image.

> * WRT portable services specifically, the only think that buildroot doesn't
> really do yet is being able to put .service files in images that do not use
> systemd as an init system. (which made perfect sense until portable
> services were introduces in v240)

 Yeah, that would require a disconnect between the init system and the package
that provides it. But it's starting to diverge a lot from Buildroot's purpose
(creating full OS images).

 Note BTW that you'll often still need systemd as a library during the build,
which is also something we don't support at the moment.

 Regards,
 Arnout

[1] ttps://github.com/openSUSE/umoci

> 
> I'll be in Lyon if you want to discuss this some more...
> 
> Cheers
> J?r?my
> 
> Le dim. 22 sept. 2019 ? 16:58, Arnout Vandecappelle <arnout@mind.be> a
> ?crit :
> 
>>
>>
>> On 22/09/2019 15:13, Fran?ois Perrad wrote:
>>> Le sam. 21 sept. 2019 ? 21:53, Romain Naour <romain.naour@smile.fr> a
>>> ?crit :
>>>
>>>> Hello,
>>>>
>>>> My colleague Jeremy Rosen did a presentation at All Systems Go
>> conferences
>>>> about
>>>> building container images using Buildroot:
>>>>
>>>> https://www.youtube.com/watch?v=-CVuBLDpulo
>>
>>  Really interesting talk, thanks for pointing this out!
>>
>>
>>>> It would be interesting to discuss with the community about building
>> such
>>>> container images like light container or systemd's portable services.
>>>>
>>>> It's probably a topic for the next Buildroot Meeting :)
>>>>
>>>>
>>> It seems easy to create a Docker image artifact from a rootfs created by
>>> Buildroot
>>>
>>>     $ cat Dockerfile
>>>     FROM scratch
>>>     ADD rootfs.tar /
>>>
>>>     $ docker build --tag br:my_proj .
>>>     Sending build context to Docker daemon  4.233MB
>>>     Step 1/2 : FROM scratch
>>>      --->
>>>     Step 2/2 : ADD rootfs.tar /
>>>      ---> 60cb2207066c
>>>     Successfully built 60cb2207066c
>>>     Successfully tagged br:my_proj
>>
>>  Does this also work if the tarball is cross-compiled for a different
>> architecture? Probably it does, and it just SIGILLs when you try to run the
>> container...
>>
>>>
>>>     $ docker images
>>>     REPOSITORY          TAG                 IMAGE ID            CREATED
>>>         SIZE
>>>     br                  my_proj             60cb2207066c         2
>> minutes
>>> ago      1.74MB
>>>
>>>     $ docker save -o br_my_proj.tar br:my_proj
>>>     $ ls -1
>>>     br_my_proj.tar
>>>     Dockerfile
>>>     rootfs.tar
>>>
>>> But, it could be nice to add "Docker image" as an option in "Filesystem
>>> images" choice.
>>
>>  Yeah, except unfortunately docker security sucks, so on most distros you
>> need
>> sudo to run any docker command, even 'docker build'.
>>
>>  So, it would be nice if we could generate the OCI image without docker.
>>
>>  Something was said about this in the questions of Je?re?my's
>> presentation, but
>> there was no clear answer.
>>
>>  Regards,
>>  Arnout
>>
> 
> 
