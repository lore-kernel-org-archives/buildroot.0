From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 22 Sep 2019 17:47:56 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
Message-ID: <CAFvCimUFmzHwau7FSp99ki1UOMS+g+c_v8cmgqR+nQAw54MN8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey all, I'm glad you liked my talk :)

Here are a couple of other notes that might be of more interest to the
buildroot community in general...
* There Is no tool I could find from the container world that actually
build an image from scratch, they all are based on debian/redhat, this is
not good and they don't really have an answer
  As a side-note, be carefull when you talk about building images with
container people. It usually means the step of transforming files into a
filesystem/disk image, not the compilation phase.
* There was a talk about "rootless containers" i.e containers that are able
to build other container images without being root, using a suid binary or
talking to a root-owned daemon. Apparently nobody
  had heard of fakeroot and they didn't know it was actually possible to
build an image without loopback-mounting images. (
https://www.youtube.com/watch?v=e_daVOwB7ok)
* WRT portable services specifically, the only think that buildroot doesn't
really do yet is being able to put .service files in images that do not use
systemd as an init system. (which made perfect sense until portable
services were introduces in v240)

I'll be in Lyon if you want to discuss this some more...

Cheers
J?r?my

Le dim. 22 sept. 2019 ? 16:58, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 22/09/2019 15:13, Fran?ois Perrad wrote:
> > Le sam. 21 sept. 2019 ? 21:53, Romain Naour <romain.naour@smile.fr> a
> > ?crit :
> >
> >> Hello,
> >>
> >> My colleague Jeremy Rosen did a presentation at All Systems Go
> conferences
> >> about
> >> building container images using Buildroot:
> >>
> >> https://www.youtube.com/watch?v=-CVuBLDpulo
>
>  Really interesting talk, thanks for pointing this out!
>
>
> >> It would be interesting to discuss with the community about building
> such
> >> container images like light container or systemd's portable services.
> >>
> >> It's probably a topic for the next Buildroot Meeting :)
> >>
> >>
> > It seems easy to create a Docker image artifact from a rootfs created by
> > Buildroot
> >
> >     $ cat Dockerfile
> >     FROM scratch
> >     ADD rootfs.tar /
> >
> >     $ docker build --tag br:my_proj .
> >     Sending build context to Docker daemon  4.233MB
> >     Step 1/2 : FROM scratch
> >      --->
> >     Step 2/2 : ADD rootfs.tar /
> >      ---> 60cb2207066c
> >     Successfully built 60cb2207066c
> >     Successfully tagged br:my_proj
>
>  Does this also work if the tarball is cross-compiled for a different
> architecture? Probably it does, and it just SIGILLs when you try to run the
> container...
>
> >
> >     $ docker images
> >     REPOSITORY          TAG                 IMAGE ID            CREATED
> >         SIZE
> >     br                  my_proj             60cb2207066c         2
> minutes
> > ago      1.74MB
> >
> >     $ docker save -o br_my_proj.tar br:my_proj
> >     $ ls -1
> >     br_my_proj.tar
> >     Dockerfile
> >     rootfs.tar
> >
> > But, it could be nice to add "Docker image" as an option in "Filesystem
> > images" choice.
>
>  Yeah, except unfortunately docker security sucks, so on most distros you
> need
> sudo to run any docker command, even 'docker build'.
>
>  So, it would be nice if we could generate the OCI image without docker.
>
>  Something was said about this in the questions of Je?re?my's
> presentation, but
> there was no clear answer.
>
>  Regards,
>  Arnout
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190922/3fbf84fd/attachment.html>
