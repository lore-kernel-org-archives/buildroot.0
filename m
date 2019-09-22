From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Sep 2019 16:58:26 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
Message-ID: <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 15:13, Fran?ois Perrad wrote:
> Le sam. 21 sept. 2019 ? 21:53, Romain Naour <romain.naour@smile.fr> a
> ?crit :
> 
>> Hello,
>>
>> My colleague Jeremy Rosen did a presentation at All Systems Go conferences
>> about
>> building container images using Buildroot:
>>
>> https://www.youtube.com/watch?v=-CVuBLDpulo

 Really interesting talk, thanks for pointing this out!


>> It would be interesting to discuss with the community about building such
>> container images like light container or systemd's portable services.
>>
>> It's probably a topic for the next Buildroot Meeting :)
>>
>>
> It seems easy to create a Docker image artifact from a rootfs created by
> Buildroot
> 
>     $ cat Dockerfile
>     FROM scratch
>     ADD rootfs.tar /
> 
>     $ docker build --tag br:my_proj .
>     Sending build context to Docker daemon  4.233MB
>     Step 1/2 : FROM scratch
>      --->
>     Step 2/2 : ADD rootfs.tar /
>      ---> 60cb2207066c
>     Successfully built 60cb2207066c
>     Successfully tagged br:my_proj

 Does this also work if the tarball is cross-compiled for a different
architecture? Probably it does, and it just SIGILLs when you try to run the
container...

> 
>     $ docker images
>     REPOSITORY          TAG                 IMAGE ID            CREATED
>         SIZE
>     br                  my_proj             60cb2207066c         2 minutes
> ago      1.74MB
> 
>     $ docker save -o br_my_proj.tar br:my_proj
>     $ ls -1
>     br_my_proj.tar
>     Dockerfile
>     rootfs.tar
> 
> But, it could be nice to add "Docker image" as an option in "Filesystem
> images" choice.

 Yeah, except unfortunately docker security sucks, so on most distros you need
sudo to run any docker command, even 'docker build'.

 So, it would be nice if we could generate the OCI image without docker.

 Something was said about this in the questions of Je?re?my's presentation, but
there was no clear answer.

 Regards,
 Arnout
