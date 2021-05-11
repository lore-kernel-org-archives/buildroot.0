From: Christian Stewart <christian@paral.in>
Date: Tue, 11 May 2021 12:33:48 -0700
Subject: [Buildroot] [PATCH v1 3/3] package/genuinetools-img: new host
 and target package
In-Reply-To: <87tun9o6ve.fsf@dell.be.48ers.dk>
References: <20210503023305.161122-1-christian@paral.in>
 <20210503023305.161122-3-christian@paral.in>
 <CA+h8R2oJ8b48NdAOMLtKhAyV-KUp4uvHuyZ1eF8jDX_rw=WNrw@mail.gmail.com>
 <20210504203105.GR2137340@scaer>
 <CA+h8R2pgbLNd7yWnnPCrTGhs0fqwj6yvhndH6p4Nwy9sSaTWbw@mail.gmail.com>
 <87tun9o6ve.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2r5P=m2rZeUtxVW9TcDXmJfmi21yr6GKhNDyB6vVNMsRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, all,

On Tue, May 11, 2021 at 4:19 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>  >> $(eval $(oci-image-package))

>  > Yes, the "download" step would use host "img pull" to download the OCI
>  > image, and then "img save" to store it as a .tar.gz, (which we can
>  > then hash as a downloaded tar.gz file).
>
>  > The .tar.gz can be loaded into Docker with "docker load < the-image.tar.gz"
>
>  > The image-package helper could just download the image + save it (to
>  > images dir, optionally).
>
> So you would end up with a tar file for each container image in the
> rootfs? Is that a desirable setup? Containers often share image layers,
> so a single tar.gz of N containers is normally quite a bit smaller and
> more efficient than N individual .tar.gz files.

This could be one approach, but it really comes down to adding an easy
way to request a "img pull" into buildroot cache (dl/ dir) w/ hashes
checking. This then followed by "img save" from the same host package
to store the .tar somewhere, as you've described.

> What I do is basically just:
> docker save -o docker.tar <container1> <container2> .. <containerN>
>
> And then a single docker load at runtime.

This works. For my SkiffOS project I'm planning to store these in a
separate partition and/or run a small Go program to generate the
docker/ state tree ahead of time on persistent media with the images
pre-loaded.

Best regards,
Christian Stewart
